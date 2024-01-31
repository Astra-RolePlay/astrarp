QBCore = exports["qb-core"]:GetCoreObject()

QBCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    TriggerClientEvent("ed-truthordare:openNUI", source)
end)

RegisterServerEvent("ed-truthordare:server:send", function(soru, bolum, secenek, ply)
    local Player = QBCore.Functions.GetPlayer(source)
	local name = Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname
    -- TriggerClientEvent('chat:addMessage', ply, {
    --     template = '<div class="chat-message ooc">{0}</div>',
    --     args = {name..' ('..secenek..') ('..bolum..'): '..soru}
    -- })
    -- TriggerClientEvent('chat:chatDo', name, secenek, bolum, soru)
end)