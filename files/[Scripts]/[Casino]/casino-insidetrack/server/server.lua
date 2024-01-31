
local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateCallback("insidetrack:server:getbalance", function(source, cb)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local Chips = Player.Functions.GetItemByName("casino_redchip")
    local minAmount = 100
    if Chips ~= nil then 
        if Chips.amount >= minAmount then
            Chips = Chips 
        else
            return TriggerClientEvent('QBCore:client:closeBetsNotEnough', src)
        end
    else
        return TriggerClientEvent('QBCore:client:closeBetsZeroChips', src)
    end
end)

RegisterServerEvent("insidetrack:server:placebet", function(bet)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local Chips = Player.Functions.GetItemByName("casino_redchip")
    if Chips ~= nil then 
        if Chips.amount >= bet then
            Player.Functions.RemoveItem("casino_redchip", bet)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['casino_redchip'], "remove", bet)
            TriggerClientEvent('QBCore:Notify', src, bet.." kırmızı jeton bahsi koydun")
        else
            return TriggerClientEvent('QBCore:client:closeBetsNotEnough', src)
        end
    else
        return TriggerClientEvent('QBCore:client:closeBetsZeroChips', src)
    end
end) 

RegisterServerEvent("insidetrack:server:winnings", function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player ~= nil then
        if Player.Functions.AddItem('casino_redchip', amount, nil, {["quality"] = 100}) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["casino_redchip"], "add", amount)
            TriggerClientEvent('QBCore:Notify', src, amount.." kırmızı jeton kazandın!")
        else
            TriggerClientEvent('QBCore:Notify', src, 'Çok fazla kırmızı jetonun var', 'error')
        end
    end
end) 

