drugBaseName = "grape"
drugProcessedName = "wine"
local QBCore = exports["qb-core"]:GetCoreObject()
drugPerPrice = 500
-- Üzüm SATMA

RegisterNetEvent("ude-uzum:weedSell")
AddEventHandler(
    "ude-uzum:weedSell",
    function(weedAmount)
        local src = source
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.Functions.GetItemByName(Config.drugProcessedName).amount >= tonumber(weedAmount) then
            Player.Functions.RemoveItem(Config.drugProcessedName, tonumber(weedAmount))
            Citizen.Wait(500)
            local drugPrice = tonumber(Config.drugPerPrice) * tonumber(weedAmount)
            Player.Functions.AddMoney('cash', drugPrice, "Bank deposit")
            TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.drugProcessedName], "remove", tonumber(weedAmount))
        else
            TriggerClientEvent("QBCore:Notify", source, "Üzerinde belirttiğin kadar ürün yok!", "error")
        end
    end
)

-- Üzüm ISLEME

RegisterNetEvent("ude-uzum:processWeed")
AddEventHandler(
    "ude-uzum:processWeed",
    function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
        if xPlayer.Functions.GetItemByName(Config.drugBaseName).amount >= 4 then
            xPlayer.Functions.RemoveItem(Config.drugBaseName, 4)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.drugBaseName], "remove", 4)
            Citizen.Wait(500)
            xPlayer.Functions.AddItem(Config.drugProcessedName, 1)
            TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[Config.drugProcessedName], "add", 1)
        else
            TriggerClientEvent("QBCore:Notify", source, "En az 4 adet Üzüm otu getirmelisin!", "error")
        end
    end
)

-- Üzüm TOPLAMA

RegisterNetEvent("ude-uzum:gatherWeed")
AddEventHandler(
    "ude-uzum:gatherWeed",
    function()
        local xPlayer = QBCore.Functions.GetPlayer(source)
        xPlayer.Functions.AddItem(drugBaseName, 1)
        TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[drugBaseName], "add", 1)
    end
)
