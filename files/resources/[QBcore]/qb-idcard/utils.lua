sh = {}

sh.debug = function(str)
    if (cfg and cfg.debug) or not cfg then
        if IsDuplicityVersion() then
            print('[^1sh-scripts^0] - [^1Debug^0]: '..str)
        else
            print('[sh-scripts] - [Debug]: '..str)
        end
    end
end

if cfg.locale and cfg.locales then
    local locales = cfg.locales[cfg.locale]
    setmetatable(locales, {__index = function(self, key)
        return "Error: Missing translation for \""..key.."\""
    end})

    sh._t = function(key)
        return locales[key]
    end
end

dt = function(table, nb)
    if nb == nil then
		nb = 0
	end

    if type(table) == 'table' then
		local s = ''
		for i = 1, nb + 1, 1 do
			s = s .. "    "
		end

		s = '{\n'
		for k,v in pairs(table) do
			if type(k) ~= 'number' then k = '"'..k..'"' end
			for i = 1, nb, 1 do
				s = s .. "    "
			end
			s = s .. '['..k..'] = ' .. dt(v, nb + 1) .. ',\n'
		end

		for i = 1, nb, 1 do
			s = s .. "    "
		end

		return s .. '}'
	else
		return tostring(table)
    end
end

sh.dt = function(table, w)
    if w then return dt(table) else print(dt(table)) end
end

if not IsDuplicityVersion() then --client
    sh.notification = function(type, str, length)
        SetNotificationTextEntry('STRING')
        AddTextComponentString(str)
        DrawNotification(0, 1)
    end

    RegisterNetEvent('sh:client:notification')
    AddEventHandler('sh:client:notification', function(...)
        sh.notification(...)
    end)

    sh.serverCallbacks = {}

    sh.triggerCallback = function(name, cb, ...)
        sh.serverCallbacks[name] = cb
        TriggerServerEvent('sh:server:triggerCallback', name, ...)
    end

    RegisterNetEvent('sh:client:triggerCallback', function(name, ...)
        if sh.serverCallbacks[name] then
            sh.serverCallbacks[name](...)
            sh.serverCallbacks[name] = nil
        end
    end)

    sh.registerKeyMap = function(data, cb, cb2)
        RegisterCommand('+sh_'..data.command, function()
            local response = true
            if not (data.useWhileFrontendMenu and data.useWhileFrontendMenu or false) and IsPauseMenuActive() then response = false end
            if not (data.useWhileNuiFocus and data.useWhileNuiFocus or false) and IsNuiFocused() then response = false end
            if cb then cb(response) end
        end)
        RegisterCommand('-sh_'..data.command, function()
            if cb2 then cb2() end
        end)
        if data.key:match('mouse') or data.key:match('iom') then
            RegisterKeyMapping('+sh_'..data.command, data.description, 'mouse_button', data.key:lower())
        else
            RegisterKeyMapping('+sh_'..data.command, data.description, 'keyboard', data.key:lower())
        end
    end

    sh.drawText3D = function(x, y, z, str, length, r, g, b, a)
        local onScreen, _x, _y = World3dToScreen2d(x, y, z)
        if onScreen then
            local factor = #str / 370
            if length then
                factor = #str / length
            end
            SetTextScale(0.30, 0.30)
            SetTextFont(4)
            SetTextProportional(1)
            SetTextColour(r or 255, g or 255, b or 255, a or 215)
            SetTextEntry('STRING')
            SetTextCentre(1)
            AddTextComponentString(str)
            DrawText(_x, _y)
            DrawRect(_x, _y + 0.0120, 0.006 + factor, 0.024, 0, 0, 0, 155)
        end
    end
    
    sh.addBlip = function(coords, sprite, scale, color, str, cb)
        local blip = AddBlipForCoord(coords)
        SetBlipSprite(blip, sprite)
        SetBlipColour(blip, color)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, scale)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(str)
        EndTextCommandSetBlipName(blip)
        if cb then cb(blip) else return blip end
    end
    
    sh.drawBusySpinner = function(str)
        SetLoadingPromptTextEntry('STRING')
        AddTextComponentSubstringPlayerName(str)
        ShowLoadingPrompt(3)
    end
    
    sh.loadAnimDict = function(dict, cb)
        if not HasAnimDictLoaded(dict) then
            RequestAnimDict(dict)
    
            while not HasAnimDictLoaded(dict) do
                Wait(1)
            end
        end
    
        if cb then cb() end
        Wait(10)
        RemoveAnimDict(dict)
    end
    
    sh.loadPtfxAsset = function(asset, cb)
        if not HasNamedPtfxAssetLoaded(asset) then
            RequestNamedPtfxAsset(asset)
    
            while not HasNamedPtfxAssetLoaded(asset) do
                Wait(1)
            end
        end
    
        if cb then cb() end
        Wait(10)
        RemovePtfxAsset(asset)
    end
    
    sh.loadAnimSet = function(set, cb)
        if not HasAnimSetLoaded(set) then
            RequestAnimSet(set)
    
            while not HasAnimSetLoaded(asset) do
                Wait(1)
            end
        end
    
        if cb then cb() end
        Wait(10)
        RemoveAnimSet(asset)
    end
    
    sh.requestModel = function(model, cb)
        model = type(model) == 'number' and model or GetHashKey(model)
        if model and IsModelValid(model) then
            if not HasModelLoaded(model) then
                RequestModel(model)
    
                while not HasModelLoaded(model) do
                    Wait(0)
                end
    
                if cb then cb(true) end
                Wait(100)
                SetModelAsNoLongerNeeded(model)
            else
                if cb then cb(true) end
                Wait(10)
                SetModelAsNoLongerNeeded(model)
            end
        else
            print('Model('..model..') is not valid!')
            if cb then cb(false) end
        end
    end

    sh.spawnObject = function(model, coords, isLocal, cb)
        model = type(model) == 'number' and model or GetHashKey(model)
    
        sh.requestModel(model)
        Wait(10)
        local obj = CreateObject(model, coords.x, coords.y, coords.z, not isLocal, true, false)
        SetEntityAsMissionEntity(obj, true, false)
        SetModelAsNoLongerNeeded(model)

        if DoesEntityExist(obj) then
            if cb then cb(obj) else return obj end
        end
    end

    sh.spawnPed = function(model, coords, heading, isLocal, cb)
        model = type(model) == 'number' and model or GetHashKey(model)
    
        sh.requestModel(model)
        Wait(10)
        local ped = CreatePed(0, model, coords.x, coords.y, coords.z, heading, not isLocal, false) 
        SetEntityAsMissionEntity(ped, true, false)
        SetModelAsNoLongerNeeded(model)

        if DoesEntityExist(ped) then
            if cb then cb(ped) else return ped end
        end
    end

    sh.spawnVehicle = function(model, coords, heading, isLocal, cb)
        model = type(model) == 'number' and model or GetHashKey(model)
    
        sh.requestModel(model)
        Wait(10)
        local vehicle = CreateVehicle(model, coords.x, coords.y, coords.z, heading, not isLocal, true)
        local timeout = 0
        if isLocal then
            local networkId = NetworkGetNetworkIdFromEntity(vehicle)
            SetNetworkIdCanMigrate(networkId, true)
        end

        SetEntityAsMissionEntity(vehicle, true, false)
        SetVehicleHasBeenOwnedByPlayer(vehicle, true)
        SetVehicleNeedsToBeHotwired(vehicle, false)
        SetVehicleDirtLevel(vehicle, 0.0)
        SetVehicleModKit(vehicle, 0)	
        SetVehRadioStation(vehicle, 'OFF')
        SetModelAsNoLongerNeeded(model)
        RequestCollisionAtCoord(coords.x, coords.y, coords.z)

        repeat
            Citizen.Wait(0)
            timeout = timeout + 1
        until (HasCollisionLoadedAroundEntity(vehicle) or timeout > 2000)

        if DoesEntityExist(vehicle) then
            if cb then cb(vehicle) else return vehicle end
        end
    end

    sh.deleteObject = function(object, cb)
        SetEntityAsMissionEntity(object, false, true)
        DeleteObject(object)
        if cb then cb() else return end
    end
    
    sh.deleteVehicle = function(vehicle, cb)
        SetEntityAsMissionEntity(vehicle, false, true)
        DeleteVehicle(vehicle)
        if cb then cb() else return end
    end
    
    sh.deletePed = function(ped, cb)
        SetEntityAsMissionEntity(ped, false, true)
        DeletePed(ped)
        if cb then cb() else return end
    end

    function sh.getVehicles()
        return GetGamePool('CVehicle')
    end
    
    function sh.getObjects()
        return GetGamePool('CObject')
    end
    
    function sh.getPlayers()
        return GetActivePlayers()
    end
    
    function sh.getPeds(ignoreList)
        local pedPool = GetGamePool('CPed')
        local ignoreList = ignoreList or {}
        local peds = {}
        for i = 1, #pedPool, 1 do
            local found = false
            for j = 1, #ignoreList, 1 do
                if ignoreList[j] == pedPool[i] then
                    found = true
                end
            end
            if not found then
                peds[#peds + 1] = pedPool[i]
            end
        end
        return peds
    end
    
    function sh.getClosestPed(coords, ignoreList)
        local ped = PlayerPedId()
        if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
        else
            coords = GetEntityCoords(ped)
        end
        local ignoreList = ignoreList or {}
        local peds = sh.getPeds(ignoreList)
        local closestDistance = -1
        local closestPed = -1
        for i = 1, #peds, 1 do
            local pedCoords = GetEntityCoords(peds[i])
            local distance = #(pedCoords - coords)
    
            if closestDistance == -1 or closestDistance > distance then
                closestPed = peds[i]
                closestDistance = distance
            end
        end
        return closestPed, closestDistance
    end
    
    function sh.getClosestPlayer(coords)
        local ped = PlayerPedId()
        if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
        else
            coords = GetEntityCoords(ped)
        end
        local closestPlayers = sh.getPlayersFromCoords(coords)
        local closestDistance = -1
        local closestPlayer = -1
        for i = 1, #closestPlayers, 1 do
            if closestPlayers[i] ~= PlayerId() and closestPlayers[i] ~= -1 then
                local pos = GetEntityCoords(GetPlayerPed(closestPlayers[i]))
                local distance = #(pos - coords)
    
                if closestDistance == -1 or closestDistance > distance then
                    closestPlayer = closestPlayers[i]
                    closestDistance = distance
                end
            end
        end
        return closestPlayer, closestDistance
    end
    
    function sh.getPlayersFromCoords(coords, distance)
        local players = sh.getPlayers()
        local ped = PlayerPedId()
        if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
        else
            coords = GetEntityCoords(ped)
        end
        local distance = distance or 5
        local closePlayers = {}
        for _, player in pairs(players) do
            local target = GetPlayerPed(player)
            local targetCoords = GetEntityCoords(target)
            local targetdistance = #(targetCoords - coords)
            if targetdistance <= distance then
                closePlayers[#closePlayers + 1] = player
            end
        end
        return closePlayers
    end
    
    function sh.getClosestVehicle(coords)
        local ped = PlayerPedId()
        local vehicles = GetGamePool('CVehicle')
        local closestDistance = -1
        local closestVehicle = -1
        if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
        else
            coords = GetEntityCoords(ped)
        end
        for i = 1, #vehicles, 1 do
            local vehicleCoords = GetEntityCoords(vehicles[i])
            local distance = #(vehicleCoords - coords)
    
            if closestDistance == -1 or closestDistance > distance then
                closestVehicle = vehicles[i]
                closestDistance = distance
            end
        end
        return closestVehicle, closestDistance
    end
    
    function sh.getClosestObject(coords)
        local ped = PlayerPedId()
        local objects = GetGamePool('CObject')
        local closestDistance = -1
        local closestObject = -1
        if coords then
            coords = type(coords) == 'table' and vec3(coords.x, coords.y, coords.z) or coords
        else
            coords = GetEntityCoords(ped)
        end
        for i = 1, #objects, 1 do
            local objectCoords = GetEntityCoords(objects[i])
            local distance = #(objectCoords - coords)
            if closestDistance == -1 or closestDistance > distance then
                closestObject = objects[i]
                closestDistance = distance
            end
        end
        return closestObject, closestDistance
    end
else --server
    sh.serverCallbacks = {}

    sh.registerCallback = function(name, cb)
        sh.serverCallbacks[name] = cb
    end
    
    sh.triggerCallback = function(name, src, cb, ...)
        if sh.serverCallbacks[name] then
            sh.serverCallbacks[name](src, cb, ...)
        else
            sh.debug('This callback(^2'..name..'^0) is not registered!')
        end
    end

    RegisterNetEvent('sh:server:triggerCallback', function(name, ...)
        local src = source
    
        sh.triggerCallback(name, src, function(...)
            TriggerClientEvent('sh:client:triggerCallback', src, name, ...)
        end, ...)
    end)

    -- sh.sql = {}
    -- sh.sql.async = {}
    -- sh.sql.sync = {}

    -- CreateThread(function()
    --     while not MySQL do Wait(10) end

    --     -- oxmysql
    --     sh.sql.async.fetchAll = MySQL.query
    --     sh.sql.async.fetchScalar = MySQL.scalar
    --     sh.sql.async.fetchSingle = MySQL.single
    --     sh.sql.async.insert = MySQL.insert
    --     sh.sql.async.execute = MySQL.update

    --     sh.sql.sync.fetchAll = MySQL.query.await
    --     sh.sql.sync.fetchScalar = MySQL.scalar.await
    --     sh.sql.sync.fetchSingle = MySQL.single.await
    --     sh.sql.sync.insert = MySQL.insert.await
    --     sh.sql.sync.execute = MySQL.update.await

    --     -- -- mysql-async
    --     -- sh.sql.async.fetchAll = MySQL.Async.fetchAll
    --     -- sh.sql.async.fetchScalar = MySQL.Async.fetchScalar
    --     -- sh.sql.async.fetchSingle = MySQL.Async.fetchSingle
    --     -- sh.sql.async.insert = MySQL.Async.insert
    --     -- sh.sql.async.execute = MySQL.Async.execute

    --     -- sh.sql.sync.fetchAll = MySQL.Sync.fetchAll
    --     -- sh.sql.sync.fetchScalar = MySQL.Sync.fetchScalar
    --     -- sh.sql.sync.fetchSingle = MySQL.Sync.fetchSingle
    --     -- sh.sql.sync.insert = MySQL.Sync.insert
    --     -- sh.sql.sync.execute = MySQL.Sync.execute
    -- end)

    sh.notification = function(src, type, str, length)
        TriggerClientEvent('sh:client:notification', src, type, str, length)
    end

    sh.getIdentifiers = function(src, identifiertypes)
        local identifiers = GetPlayerIdentifiers(src)
        local response = {}
        if identifiertypes then
            if type(identifiertypes) == 'table' then
                for _, type in pairs(identifiertypes) do
                    for _, identifier in pairs(identifiers) do
                        if string.find(identifier, type) then
                            response[type] = identifier
                        end
                    end
                end
            else
                for _, identifier in pairs(identifiers) do
                    if string.find(identifier, identifiertypes) then
                        return identifier
                    end
                end
            end
        else
            for _, identifier in pairs(identifiers) do
                if string.find(identifier, 'steam') then
                    return identifier
                end
            end
        end
        return response
    end
    
    local sanitize = function(str)
        if str then
            local replacements = {
                ['&' ] = '&amp;',
                ['<' ] = '&lt;',
                ['>' ] = '&gt;',
                ['\n'] = '<br/>'
            }
    
            return str:gsub('[&<>\n]', replacements):gsub(' +', function(s) return ' '..('&nbsp;'):rep(#s-1) end)
        else
            return nil
        end
    end
    
    local logColors = {
        ['default'] = 16711680,
        ['blue'] = 25087,
        ['green'] = 762640,
        ['white'] = 16777215,
        ['black'] = 0,
        ['orange'] = 16743168,
        ['lightgreen'] = 65309,
        ['yellow'] = 15335168,
        ['pink'] = 16711900,
        ['red'] = 16711680,
        ['cyan'] = 65535,
    }
    sh.sendLog = function(webhookURL, color, str)
        if webhookURL and webhookURL ~= '' then
            local headers = {
                ['Content-Type'] = 'application/json'
            }
            local data = {
                ["username"] = 'sh-logs',
                ["avatar_url"] = 'https://raw.githubusercontent.com/SH-Scripts/logo/main/logo.png',
                ["embeds"] = {{
                    ["title"] = 'sh-store.tebex.io',
                    ["url"] = 'https://sh-store.tebex.io/',
                    ["color"] = logColors[color] and logColors[color] or logColors['default'],
                    ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ")
                }},
                ["footer"] = {
                    ["text"] = 'sh-store.tebex.io',
                    ["icon_url"] = 'https://raw.githubusercontent.com/SH-Scripts/logo/main/logo.png'
                }
            }
            data['embeds'][1]['description'] = str
            PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(data), headers)
        else
            sh.debug('Webhook URL is empty!')
        end
    end
    
    sh.sendSelfLog = function(src, webhookURL, color, str)
        if webhookURL and webhookURL ~= '' then
            if src then
                local name = sanitize(GetPlayerName(src))
                local identifiers = sh.getIdentifiers(src, {'steam', 'discord'})
                local text = '**Steam**: '..identifiers['steam']
                if identifiers['discord'] then
                    text = text..'\n**Discord**: <@'..identifiers['discord']:sub(9)..'>\n'
                end
                local headers = {
                    ['Content-Type'] = 'application/json'
                }
                local data = {
                    ["username"] = 'sh-logs',
                    ["avatar_url"] = 'https://raw.githubusercontent.com/SH-Scripts/logo/main/logo.png',
                    ["embeds"] = {{
                        ["title"] = 'sh-store.tebex.io',
                        ["url"] = 'https://sh-store.tebex.io/',
                        ["author"] = {
                            ["name"] = '#'..src..' - '..name,
                            ["url"] = 'https://sh-store.tebex.io/',
                        },
                        ["color"] = logColors[color] ~= nil and logColors[color] or logColors['default'],
                        ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                        ["footer"] = {
                            ["text"] = 'sh-store.tebex.io',
                            ["icon_url"] = 'https://raw.githubusercontent.com/SH-Scripts/logo/main/logo.png'
                        }
                    }}
                }
                data['embeds'][1]['description'] = text..''..str
                PerformHttpRequest(webhookURL, function(err, text, headers) end, 'POST', json.encode(data), headers)
            end
        else
            sh.debug('Webhook URL is empty!')
        end
    end
end