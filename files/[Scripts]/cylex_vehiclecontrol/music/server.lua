RegisterServerEvent('musicplayer:server:playSong', function(pos, muzikAdi, link, serverId, mp3, net)
    TriggerClientEvent("musicplayer:client:playSong", -1, pos, muzikAdi, link, serverId, mp3, net)
end)

RegisterServerEvent('musicplayer:server:stopSong', function(muzikAdi)
    TriggerClientEvent("musicplayer:client:stopSong", -1, muzikAdi)
end)

RegisterServerEvent('musicplayer:server:pauseSong', function(muzikAdi)
    TriggerClientEvent("musicplayer:client:pauseSong", -1, muzikAdi)
end)

RegisterServerEvent('musicplayer:server:resumeSong', function(muzikAdi)
    TriggerClientEvent("musicplayer:client:resumeSong", -1, muzikAdi)
end)

AddEventHandler('playerDropped', function(source)
    local src = source
    TriggerClientEvent("musicplayer:client:stopSong", -1, tostring(src))
end)