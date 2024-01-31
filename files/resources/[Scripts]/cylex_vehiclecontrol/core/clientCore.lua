Core = nil
local callF = pcall
Cylex = {}
-- Cylex.ServerCBs = {}
-- RegisterNetEvent('cylex_development:client:triggerCallback', function(name, ...)
--     if Cylex.ServerCBs[name] then
--         Cylex.ServerCBs[name](...)
--         Cylex.ServerCBs[name] = nil
--     end
-- end)

-- Cylex.TriggerCallback = function(name, cb, ...)
--     Cylex.ServerCBs[name] = cb
--     TriggerServerEvent('cylex_development:server:triggerCallback', name, ...)
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
    -- Wait(5000)
end

--Cylex.Call["GetPlayer"](src)
CreateThread(function()
    Core = getFramework()
    if not Core then return print(GetCurrentResourceName(), " FRAMEWORK IS INVALID! CHANGE IT!") end
    Cylex.Call = function(tag, ...)
        return Cylex[tag][Framework](...)
    end

    local function getAccountESX(data, type)
        for k,v in ipairs(data.accounts) do
            if v.name == type then
                return v.money
            end
        end
        return 0
    end
    
    Cylex.GetPlayerData = {
        ['esx'] = function()
            while Core.GetPlayerData().job == nil do 
                Wait(100)
            end
            return Core.GetPlayerData()
        end,
        ['qb'] = function()
            while Core.Functions.GetPlayerData().job == nil do 
                Wait(100)
            end
            return Core.Functions.GetPlayerData()
        end,
    }
    Cylex.GetCash = {
        ['esx'] = function()
            local data = Cylex.GetPlayerData[Framework]()
            local money = getAccountESX(data, "money")
            return money
        end,
        ['qb'] = function()
            local data = Cylex.GetPlayerData[Framework]()
            return data.money['cash']
        end,
    }
    Cylex.GetBank = {
        ['esx'] = function()
            local data = Cylex.GetPlayerData[Framework]()
            local money = getAccountESX(data, "bank")
            return money
        end,
        ['qb'] = function()
            local data = Cylex.GetPlayerData[Framework]()
            return data.money['bank']
        end,
    }
end)
