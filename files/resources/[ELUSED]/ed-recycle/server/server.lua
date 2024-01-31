local QBCore = exports['qb-core']:GetCoreObject()

local BinItems = {
    "bottle",
    "can",
    "sandwich",
    "water_bottle",
    "cleaningkit",
    "fish",
}


RegisterServerEvent('ed-recycle:giveitem')
AddEventHandler('ed-recycle:giveitem', function(src)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player then 
        local randomItem = math.random(1, #BinItems)
        local giveItems = BinItems[randomItem]     
        if Player.Functions.AddItem(giveItems, 1) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[giveItems], "add", 1)
            QBCore.Functions.Notify(src, "1 Adet ".. QBCore.Shared.Items[giveItems].label.." Buldun!", "success")
        else
            QBCore.Functions.Notify(src, "Bulduğun Eşyayı Alamadın Çünkü Fazla Ağırsın!", "error")
        end
    end
end)
