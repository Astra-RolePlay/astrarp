QBCore = exports['qb-core']:GetCoreObject()
onlinePlayers = {}

RegisterServerEvent('showid:add-id')
AddEventHandler('showid:add-id', function()
	local src = source
    TriggerClientEvent("showid:client:add-id", src, onlinePlayers)
	local Player =  QBCore.Functions.GetPlayer(src)
    local topText = Player.PlayerData.citizenid
    onlinePlayers[tostring(source)] = topText
    TriggerClientEvent("showid:client:add-id", -1, topText, tostring(src))
end)

AddEventHandler('playerDropped', function(reason)
    onlinePlayers[tostring(source)] = nil
end)

QBCore.Commands.Add('id', 'ID', {}, false, function(source, args)
    local src = source
    TriggerClientEvent('QBCore:Notify', src,  "ID : " ..src.. "", "info", 5000)
end)

