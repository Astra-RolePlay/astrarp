local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('badge:open')
AddEventHandler('badge:open', function(ID, targetID, type)
	local Player = QBCore.Functions.GetPlayer(ID)

	local data = {
		name = Player.PlayerData.charinfo.firstname.." "..Player.PlayerData.charinfo.lastname,
		rank = Player.PlayerData.job.grade.name,
		csi = Player.PlayerData.metadata.callsign
		
	}

	TriggerClientEvent('badge:open', targetID, data)
	TriggerClientEvent( 'badge:shot', targetID, source )
end)

QBCore.Functions.CreateUseableItem('badge', function(source, item)
    TriggerClientEvent('badge:openPD', source, true)
end)