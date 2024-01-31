local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-kamu:finishCommunityService')
AddEventHandler('qb-kamu:finishCommunityService', function(key)
	local src = source 
		local xPlayer = QBCore.Functions.GetPlayer(src)
		if xPlayer then
			xPlayer.Functions.SetMetaData("communityservice", 0)
			TriggerClientEvent('qb-kamu:finishCommunityService', xPlayer.PlayerData.source)
		end
end)

RegisterServerEvent('qb-kamu:sendToCommunityService')
AddEventHandler('qb-kamu:sendToCommunityService', function(player, count, key)
	local src = source 
		local xPlayer = QBCore.Functions.GetPlayer(src)
		if xPlayer.PlayerData.job.name == "police" then
		local tPlayer = QBCore.Functions.GetPlayer(player)
		TriggerClientEvent("qb-kamu:inCommunityService", player, count)
		tPlayer.Functions.SetMetaData("communityservice", count)
		end
end)

RegisterServerEvent('qb-kamu:completeService')
AddEventHandler('qb-kamu:completeService', function(source)
	local src = source
		local xPlayer = QBCore.Functions.GetPlayer(src)
		if xPlayer then
			xPlayer.Functions.SetMetaData("communityservice", xPlayer.PlayerData.metadata["communityservice"] - 1)
		end
end)

RegisterServerEvent('qb-kamu:extendService') -- Alandan Uzaklaşınca Kamu Arttırma
AddEventHandler('qb-kamu:extendService', function()
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if xPlayer then
		xPlayer.Functions.SetMetaData("communityservice", xPlayer.PlayerData.metadata["communityservice"] + Config.ServiceExtensionOnEscape)
	end
end)

QBCore.Commands.Add("kamu", "Bir Oyuncuyuya Kamu Cezası Ver", {{name="id", help="Oyuncu ID"}, {name="miktar", help="Verilecek Komu Cezası Miktarı"}}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	local src = source
	local xPlayer = QBCore.Functions.GetPlayer(src)
	if xPlayer.PlayerData.job.name == "police" then
		local tPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if tPlayer then
			local count = tonumber(args[2])
			TriggerClientEvent("qb-kamu:inCommunityService", tPlayer.PlayerData.source, count)
			tPlayer.Functions.SetMetaData("communityservice", count)
			TriggerClientEvent("QBCore:Notify", src, "Oyuncuya "..count.." kamu cezası kesildi")
			TriggerEvent('DiscordBot:ToDiscord', 'pceza', 'Kamu Cezası Verdi! Adet: '..count, src, tonumber(args[1]))
		else
			TriggerClientEvent("QBCore:Notify", src, "Oyuncu bulunamadı.", "error")
		end
	end
end)

QBCore.Commands.Add("kamuiptal", "Bir Oyuncunın Kamu Cezasını İptal Et", {{name="id", help="Oyuncu ID"}}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	local xPlayer = QBCore.Functions.GetPlayer(source)
	if xPlayer.PlayerData.job.name == "police" then
		local tPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
		if tPlayer then
			tPlayer.Functions.SetMetaData("communityservice", 0)
			TriggerClientEvent('qb-kamu:finishCommunityService', tPlayer.PlayerData.source)
			TriggerClientEvent("QBCore:Notify", source, "Oyuncunun kamu cezası iptal edildi.")
			TriggerEvent('DiscordBot:ToDiscord', 'pceza', 'Kamu Cezası İptal Etti!', source, tonumber(args[1]))
		else
			TriggerClientEvent("QBCore:Notify", source, tPlayer.. "ID`li oyuncu bulunamadı.", "error")
		end
	end
end)