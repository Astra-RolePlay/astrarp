local QBCore = exports["qb-core"]:GetCoreObject()


-- Üzüm SATMA

RegisterNetEvent("ude-uzum:weedSell", function(itemAmount)

    print("Miktar: "..itemAmount)
    print("Item: " .. Config.drugProcessedName)
    print("PerPrice:"..Config.drugPerPrice)



    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local totalPrice = (tonumber(itemAmount) * Config.drugPerPrice)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local dist
    if #(playerCoords - Config.SellPedLocation) < 2 then
        dist = #(playerCoords - Config.SellPedLocation)
    end
    if dist > 5 then return end
    if Player.Functions.RemoveItem(Config.drugProcessedName, tonumber(itemAmount)) then
        Player.Functions.AddMoney('cash', totalPrice, 'uzum satis')
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.drugProcessedName], 'remove')
    else
        TriggerClientEvent('QBCore:Notify', src, "Belirtilen miktarda esya bulunamadi.", 'error')
    end
end)


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

