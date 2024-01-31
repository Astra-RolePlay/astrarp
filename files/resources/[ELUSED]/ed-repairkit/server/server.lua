local QBCore = exports['qb-core']:GetCoreObject()	

QBCore.Commands.Add("fix", "Aracı tamir eder (Admin)", {}, false, function(source)
    TriggerClientEvent('ed-repairkit:AdminKit', source)
end, "admin")

QBCore.Functions.CreateUseableItem(Config.RepairKitItem, function(source, item)
    TriggerClientEvent("ed-repairkit:RepairKit", source)
end)

QBCore.Functions.CreateUseableItem(Config.AdvancedRepairKitItem, function(source, item)
    TriggerClientEvent("ed-repairkit:AdvancedRepairKit", source)
end)

QBCore.Functions.CreateUseableItem(Config.CleaningKitItem, function(source, item)
    TriggerClientEvent("ed-repairkit:CleaningKit", source)
end)

RegisterNetEvent('ed-repairkit:RemoveItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
end)

if GetCurrentResourceName() ~= "ed-repairkit" then
    print("Error: Change the resource name to \"ed-repairkit\" or it won't work!")
end
