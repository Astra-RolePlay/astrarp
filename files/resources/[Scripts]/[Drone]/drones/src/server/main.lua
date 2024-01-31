local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("Drones:Buy")
AddEventHandler('Drones:Buy', function(drone)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if xPlayer.Functions.RemoveMoney(Config.BankAccountName, drone.price) then
    	TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Drone başarı ile satın alındı')
    	xPlayer.Functions.AddItem(drone.name, 1)
    	TriggerClientEvent("Drones:CloseUI", src)
    else
    	TriggerClientEvent("QBCore:Notify", xPlayer.PlayerData.source, 'Bu droneyi satın alabilmek için bankanızda yeterli para yok')
    end
end)

RegisterServerEvent("Drones:Disconnect")
AddEventHandler('Drones:Disconnect', function(drone, drone_data, pos)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    TriggerClientEvent('Drones:DropDrone', xPlayer.PlayerData.source, drone, drone_data, pos)
end)

RegisterServerEvent("Drones:Back")
AddEventHandler('Drones:Back', function(drone_data)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    xPlayer.Functions.AddItem(drone_data.name, 1)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_1', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_1', 1, xPlayer.Functions.GetItemByName("drone_flyer_1").slot)
    local drone_data = Config.Drones[1]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_2', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_2', 1, xPlayer.Functions.GetItemByName("drone_flyer_2").slot)
    local drone_data = Config.Drones[2]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_3', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_3', 1, xPlayer.Functions.GetItemByName("drone_flyer_3").slot)
    local drone_data = Config.Drones[3]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_4', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_4', 1, xPlayer.Functions.GetItemByName("drone_flyer_4").slot)
    local drone_data = Config.Drones[4]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_5', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_5', 1, xPlayer.Functions.GetItemByName("drone_flyer_5").slot)
    local drone_data = Config.Drones[5]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_6', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_6', 1, xPlayer.Functions.GetItemByName("drone_flyer_6").slot)
    local drone_data = Config.Drones[6]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)

QBCore.Functions.CreateUseableItem('drone_flyer_7', function(playerId)
    local xPlayer = QBCore.Functions.GetPlayer(playerId)
    xPlayer.Functions.RemoveItem('drone_flyer_7', 1, xPlayer.Functions.GetItemByName("drone_flyer_7").slot)
    local drone_data = Config.Drones[7]
    TriggerClientEvent('Drones:UseDrone', xPlayer.PlayerData.source, drone_data)
end)