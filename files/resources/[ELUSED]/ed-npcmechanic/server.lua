local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.RequiredItem, function(source)
    TriggerClientEvent("knoes-mechanic", source)
end)

RegisterServerEvent('knoes-mechanic:bill')
AddEventHandler('knoes-mechanic:bill', function()
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
	if Player.PlayerData.money["cash"] >= Config.Price then
		Player.Functions.RemoveMoney("cash", Config.Price)
	else
		Player.Functions.RemoveMoney("bank", Config.Price)
	end
end)