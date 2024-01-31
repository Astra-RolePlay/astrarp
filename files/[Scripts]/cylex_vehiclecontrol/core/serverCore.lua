Core = nil
local callF = pcall
local SQLType = "mysql-async"
Cylex = {}

-- Cylex.ServerCBs = {}

-- RegisterServerEvent('cylex_development:server:triggerCallback', function(name, ...)
--     local src = source

--     Cylex.TriggerCallback(name, src, function(...)
--         TriggerClientEvent('cylex_development:client:triggerCallback', src, name, ...)
--     end, ...)
-- end)

-- Cylex.TriggerCallback = function(name, source, cb, ...)
--     if not Cylex.ServerCBs[name] then return end
--     Cylex.ServerCBs[name](source, cb, ...)
-- end

-- Cylex.CreateCallback = function(name, cb)
--     Cylex.ServerCBs[name] = cb
-- end

function getFramework()
    local timeout = 5000
    if Framework == "qb" then 
        local success, error = callF(function()
            Core = exports['qb-core']:GetCoreObject()
        end)
        if not success then 
            while Core == nil and timeout > 0 do
                TriggerEvent('QBCore:GetObject', function(obj) Core = obj end)
                timeout = timeout - 50
                Wait(25)
            end
            if timeout <= 0 then return false end
        end
    else
        local success, error = callF(function()
            Core = exports['es_extended']:getSharedObject()
        end)
        if not success then
            while Core == nil and timeout > 0 do
                TriggerEvent('esx:getSharedObject', function(obj) Core = obj end)
                timeout = timeout - 50
                Wait(25)
            end
            if timeout <= 0 then return false end
        end
    end
    return Core
end

function isFrameworkReady()
    while not Core do Wait(100) end
    while next(Core) == nil do Wait(100) end
    while next(Cylex) == nil do Wait(100) end
    while Cylex.Call == nil do Wait(100) end
end


CreateThread(function()
    local success, error = callF(function()
        exports.ghmattimysql:execute("SELECT NULL LIMIT 0")
    end)

    if success then
        SQLType = "ghmattimysql"
    end
    
    local success, error = callF(function()
        exports.oxmysql:query_async("SELECT NULL LIMIT 0")
    end)

    if success then
        SQLType = "oxmysql"
    end
    
    local text = 'SELECT charinfo FROM players WHERE citizenid = @citizenid'
    local params = {
        ["@citizenid"] = "STJ97300"
    }
    
    function Cylex.select(text, params)
        local callback = promise:new()
        if SQLType == "oxmysql" then
            local sql = exports.oxmysql:query_async(text, params)
            callback:resolve(sql)
        end
        if SQLType == "ghmattimysql" then
            local sql = exports.ghmattimysql:executeSync(text, params)
            callback:resolve(sql)
        end
        if SQLType == "mysql-async" then
            local sql = MySQL.Sync.fetchAll(text, params)
            callback:resolve(sql)
        end
        return Citizen.Await(callback)
    end
end)

--Cylex.Call["GetPlayer"](src)
CreateThread(function()
    Core = getFramework()
    if not Core then return print(GetCurrentResourceName(), " FRAMEWORK IS INVALID! CHANGE IT!") end

    Cylex.Call = function(tag, ...)
        return Cylex[tag][Framework](...)
    end
    Cylex.GetPlayer = {
        ['esx'] = function(src)
            return Core.GetPlayerFromId(src)
        end,
        ['qb'] = function(src)
            return Core.Functions.GetPlayer(src)
        end,
    }
        
    Cylex.GetFirstname = {
        ['esx'] = function(player)
            local text = 'SELECT firstname FROM users WHERE identifier = @identifier'
            local params = {
                ["@identifier"] = player.identifier
            }
            local data = Cylex.select(text, params)[1]
            local firstname = "Firstname"
            if data and data.firstname then 
                firstname = data.firstname
            end
            return firstname
        end,
        ['qb'] = function(player)
            return player.PlayerData.charinfo['firstname']
        end,
    }
    Cylex.GetLastname = {
        ['esx'] = function(player)
            local text = 'SELECT lastname FROM users WHERE identifier = @identifier'
            local params = {
                ["@identifier"] = player.identifier
            }
            local data = Cylex.select(text, params)[1]
            local lastname = "Lastname"
            if data and data.lastname then 
                lastname = data.lastname
            end
            return lastname
        end,
        ['qb'] = function(player)
            return player.PlayerData.charinfo['lastname']
        end,
    }
    Cylex.GetItem = {
        ['esx'] = function(player, itemName)
            return player.getInventoryItem(itemName)
        end,
        ['qb'] = function(player, itemName)
            return player.Functions.GetItemByName(itemName)
        end,
    }

    Cylex.AddItem = {
        ['esx'] = function(player, name, amount)
            return player.addInventoryItem(name, amount)
        end,
        ['qb'] = function(player, name, amount, info)
            if not Core.Shared.Items[name] then return print('NO ITEM FOUND!', name) end
            TriggerClientEvent('inventory:client:ItemBox', player.PlayerData.source, Core.Shared.Items[name], "add", amount)
            return player.Functions.AddItem(name, amount, info)
        end,
    }
    Cylex.RemoveItem = {
        ['esx'] = function(player, name, amount)
            return player.removeInventoryItem(name, amount)
        end,
        ['qb'] = function(player, name, amount, info)
            if not Core.Shared.Items[name] then return print('NO ITEM FOUND!', name) end
            TriggerClientEvent('inventory:client:ItemBox', player.PlayerData.source, Core.Shared.Items[name], "remove", amount)
            return player.Functions.RemoveItem(name, amount, info)
        end,
    }

    Cylex.AddMoney = {
        ['esx'] = function(player, moneytype, amount)
            if moneytype == "cash" then
                return player.addMoney(amount)
            else
                return player.addAccountMoney(moneytype, amount)
            end
        end,
        ['qb'] = function(player, moneytype, amount, reason)
            return player.Functions.AddMoney(moneytype, amount, reason)
        end,
    }
    Cylex.RemoveMoney = {
        ['esx'] = function(player, moneytype, amount)
            if moneytype == "cash" then
                return player.removeMoney(amount)
            else
                return player.removeAccountMoney(moneytype, amount)
            end
        end,
        ['qb'] = function(player, moneytype, amount, reason)
            return player.Functions.RemoveMoney(moneytype, amount, reason)
        end,
    }

    Cylex.GetCash = {
        ['esx'] = function(player)
            return player.getAccount("money").money
        end,
        ['qb'] = function(player)
            return player.PlayerData.money['cash']
        end,
    }
    Cylex.GetBank = {
        ['esx'] = function(player)
            return player.getAccount("bank").money
        end,
        ['qb'] = function(player)
            return player.PlayerData.money['bank']
        end,
    }
    Cylex.Notify = {
        ['esx'] = function(player, msg, type)
            return TriggerClientEvent('esx:showNotification', player.source, msg, type)
        end,
        ['qb'] = function(player, msg, type)
            return TriggerClientEvent('QBCore:Notify', player.PlayerData.source, msg, type)
        end,
    }
end)