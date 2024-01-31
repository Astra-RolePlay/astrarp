local QBCore = exports['qb-core']:GetCoreObject() 

local function hasLockpick() 
    for k, pick in ipairs(Config.Lockpicks) do
        --print(pick)
        if QBCore.Functions.HasItem(pick) then
            return true
        end
    end
    return false
end

--- Create trader joes
CreateThread(function()
    for i,machineType in pairs(Config.VendingMachines) do
        
        local options = {}
        if Config.AllowTheft then
            options[1] = {
                type = 'client',
                icon = "fas fa-unlock",
                label = "Maymuncukla",
                event = 'ed-vending:client:lockpick',
                params = {
                    machineInventory = machineType.inventory
                },
                canInteract = function() return hasLockpick() end
            }
        end

        for j, item in pairs(machineType.inventory) do
            if QBCore.Shared.Items[item.name] then
                local price = Config.DefaultPrice
                if item.price then
                    price = item.price
                end
                options[#options+1] = {
                    type = 'client',
                    icon = "fas fa-cash-register",
                    label = QBCore.Shared.Items[item.name].label.. ' $' ..price,
                    event = 'ed-vending:client:buy',
                    params = {
                        item = item
                    }
                }
            else
                print(item.name.. " seems to be missing from your items.lua")
            end
        end

        exports['qb-target']:AddTargetModel(machineType.props, {
            options = options,
            distance = 2.0
        })
    end

    if Config.UseVendingInteractionLocations then
        for i, machine in pairs(Config.VendingInteractionLocations) do
            local options = {}
            for j, item in pairs(machine.inventory) do
                if QBCore.Shared.Items[item.name] then
                    local price = Config.DefaultPrice
                    if item.price then
                        price = item.price
                    end
                    options[#options+1] = {
                        type = 'client',
                        icon = "fas fa-cash-register",
                        label = QBCore.Shared.Items[item.name].label.. ' $' ..price,
                        event = 'ed-vending:client:buy',
                        params = {
                            item = item
                        }
                    }
                else
                    print(item.name.. " seems to be missing from your items.lua")
                end
            end
            exports['qb-target']:AddBoxZone(
                "cw-vending-machine-"..i,
                machine.coords,
                2.0,
                2.0,
                {
                    name = 'vending-machine-interaction',
                    heading = 0,
                    debugPoly = false,
                    minZ = machine.coords.z - 1.7,
                    maxZ = machine.coords.z + 1.7,
                },
                {
                    options = options,
                    distance = 2.0
                }
            )
        end
    end
end)

RegisterNetEvent('ed-vending:client:buy', function(data)
    local item = data.params.item
    TriggerEvent('animations:client:EmoteCommandStart', {"dispenser"})
    TriggerServerEvent('ed-vending:server:attemptPurchase', item) 
end)

local machineItems = {}


local function callCops()
    local coordinates = GetEntityCoords(PlayerPedId())
    local s1, s2 = GetStreetNameAtCoord(coordinates.x, coordinates.y, coordinates.z)
    local street1 = GetStreetNameFromHashKey(s1)
    local street2 = GetStreetNameFromHashKey(s2)
    local streetLabel = street1
    if street2 ~= nil then
        streetLabel = streetLabel .. " " .. street2
    end
    TriggerServerEvent("ed-vending:server:callCops", coordinates,  streetLabel)
end

local function lockpickFinish(success)
    local callChance = math.random(0,100)
    if callChance > 50 then
        callCops()
    end
    if success then
        TriggerEvent('animations:client:EmoteCommandStart', {"doktor"})
        TriggerServerEvent('ed-vending:server:steal', machineItems)
        QBCore.Functions.Notify('Makineye başarıyla maymuncukladınız!', "success", 2500)
        Wait(4000)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
    else
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerEvent('animations:client:EmoteCommandStart', {"lanetolsun"})
        if usingAdvanced then
            if math.random(1, 100) < 5 then
                TriggerServerEvent('ed-vending:server:removeAdvancedLockpick')
            end
        else
            if math.random(1, 100) < 10 then
                TriggerServerEvent("qb-houserobbery:server:removeLockpick")
            end
        end

        QBCore.Functions.Notify("Makineyi Maymuncuklayamadınız!", "error", 2500)
    end
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(100)
    end
end

RegisterNetEvent('ed-vending:client:lockpick', function(data)
    machineItems = data.params.machineInventory
    TriggerEvent('animations:client:EmoteCommandStart', {"kzorla2"})
    exports['qb-ui']:Circle(function(success)
        if success then
            lockpickFinish(success)
        else
            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            TriggerServerEvent('ed-vending:server:removeLockpick', source)
            Wait(500)
            TriggerEvent('ed-vending:client:failed')
        end
    end, math.random(15,20), 8)
end)

RegisterNetEvent('ed-vending:client:success', function(item)
    QBCore.Functions.Notify(QBCore.Shared.Items[item.name].label..' Satın Aldın!', 'success')
end)

RegisterNetEvent('ed-vending:client:failed', function()
    TriggerEvent('animations:client:EmoteCommandStart', {"lanetolsun"})
    QBCore.Functions.Notify('Makineyi Maymuncuklayamadınız!', 'error')
    
end)

RegisterNUICallback('callcops', function(_, cb)
    TriggerEvent("police:SetCopAlert")
    cb('ok')
end)
