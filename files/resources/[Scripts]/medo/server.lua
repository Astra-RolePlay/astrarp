RegisterCommand('me', function(source, args, rawCommand)
    local message = table.concat(args, ' ')
    TriggerClientEvent('3dme:shareDisplay', -1, message, source)
end, false)

RegisterCommand('do', function(source, args, rawCommand)
    local message = table.concat(args, ' ')
    TriggerClientEvent('3dme:shareDisplayDo', -1, message, source)
end, false)

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, source)
    TriggerClientEvent('3dme:shareDisplay', -1, text, source)
end)

RegisterServerEvent('3dme:shareDisplayDo')
AddEventHandler('3dme:shareDisplayDo', function(text, source)
    TriggerClientEvent('3dme:shareDisplayDo', -1, text, source)
end)
