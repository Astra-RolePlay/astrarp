local redZoneActive = {}

RegisterServerEvent('ed-redzone:server:enableBucket')
AddEventHandler('ed-redzone:server:enableBucket', function()
    local playerId = source
    redZoneActive[playerId] = true
end)

RegisterServerEvent('ed-redzone:server:disableBucket')
AddEventHandler('ed-redzone:server:disableBucket', function()
    local playerId = source
    redZoneActive[playerId] = false
end)

RegisterServerEvent('ed-redzone:server:checkStatus')
AddEventHandler('ed-redzone:server:checkStatus', function()
    local playerId = source
    local isInRedZone = redZoneActive[playerId] or false
    TriggerClientEvent('ed-redzone:client:updateStatus', playerId, isInRedZone)
end)
