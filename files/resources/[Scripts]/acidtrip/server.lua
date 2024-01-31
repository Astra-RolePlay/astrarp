local QBCore = exports['qb-core']:GetCoreObject()	

QBCore.Functions.CreateUseableItem("lsd", function(source, item, time)
    TriggerClientEvent("kfzeu:Acid", source)
end)

RegisterNetEvent('acid:sil', function()
	local Player = QBCore.Functions.GetPlayer(source)
	if not Player then return end
	Player.Functions.RemoveItem('lsd', 1)
end)