local QBCore = exports[Config.Core]:GetCoreObject()


QBCore.Functions.CreateCallback("ed-sokaksanat:server:checkmoneyforitem", function(source, cb, item)
    local Player = QBCore.Functions.GetPlayer(source)
    local PlayerMoney = Player.Functions.GetMoney("cash")
    local Cost = 0

    if item == "begging_guitar" then 
        Cost = Config.GuitarPrice
    elseif item == "begging_box" then 
        Cost = Config.BoxPrice
    end

    if Player and PlayerMoney >= Cost then 
        Player.Functions.RemoveMoney("cash", Cost)
        Player.Functions.AddItem(item, 1)
        TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "add")
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "Yeterli Paranız Yok!", 'error')
    end
end)

QBCore.Functions.CreateCallback("ed-sokaksanat:server:checkbeggingguitar", function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local RequiredItem = Player.Functions.GetItemByName("begging_guitar")

    if RequiredItem then 
        cb(true)
    else
        cb(false)
        TriggerClientEvent('QBCore:Notify', source, "Çalacak Gitarınız Yok!", 'error')
    end
end)

RegisterNetEvent("ed-sokaksanat:server:giverewardmoney", function()
    local Player = QBCore.Functions.GetPlayer(source)
    if Player then 
        Player.Functions.AddMoney("cash", math.random(Config.RewardMin, Config.RewardMax))
    end
end)

QBCore.Functions.CreateUseableItem('begging_box', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("ed-sokaksanat:client:beggingboxspawn", source)
    end
end)