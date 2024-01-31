QBCore = exports['qb-core']:GetCoreObject()

local onlinePlayers, forceDraw = {}, false
local localIsLoggedIn = false

CreateThread(function()
    while not localIsLoggedIn do
        Wait(500)
        if LocalPlayer.state.isLoggedIn then
            TriggerServerEvent("showid:add-id")
            while true do
                Wait(5)
                if IsControlPressed(0, Config.key) or forceDraw then
                    for k, v in pairs(GetNeareastPlayers()) do
                        local x, y, z = table.unpack(v.coords)
                        Draw3DText(x, y, z + 1.0, v.playerId, 0.9)
                       Draw3DText(x, y, z + 1.08, v.topText, 0.5)
                    end
                end
            end
            return
        end
    end
end)


RegisterCommand('id', function()
    -- TriggerServerEvent("idbakla")
    if not forceDraw then
        forceDraw = not forceDraw
        Wait(10000)
        forceDraw = false
    end
end)

RegisterNetEvent('idgosterla')
AddEventHandler('idgosterla', function()
    if not forceDraw then
        forceDraw = not forceDraw
        Wait(10000)
        forceDraw = false
    end
end)


RegisterNetEvent('idkapatla')
AddEventHandler('idkapatla', function()
    forceDraw = false
end)

CreateThread(function()

    while true do
        Wait(500)
        if LocalPlayer.state.isLoggedIn then
            localIsLoggedIn = true
            return
        end
    end

end)

RegisterNetEvent('showid:client:add-id')
AddEventHandler('showid:client:add-id', function(identifier, playerSource)
    if playerSource then
        onlinePlayers[playerSource] = identifier
    else
        onlinePlayers = identifier
    end
end)


function Draw3DText(x, y, z, text, newScale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    if onScreen then
        local dist = GetDistanceBetweenCoords(GetGameplayCamCoords(), x, y, z, 1)
        local scale = newScale * (1 / dist) * (1 / GetGameplayCamFov()) * 100
        SetTextScale(scale, scale)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(255, 255, 255, 255)
        SetTextDropShadow(0, 0, 0, 0, 255)
        SetTextDropShadow()
        SetTextEdge(4, 0, 0, 0, 255)
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end

function GetNeareastPlayers()
    local playerPed = PlayerPedId()
    local players_clean = {}
    local playerCoords = GetEntityCoords(playerPed)
    if IsPedInAnyVehicle(playerPed, false) then
        local playersId = tostring(GetPlayerServerId(PlayerId()))
        table.insert(players_clean, {topText = onlinePlayers[playersId], playerId = playersId, coords = playerCoords} )
    else
        local players, _ = GetPlayersInArea(playerCoords, Config.drawDistance)
        for i = 1, #players, 1 do
            local playerServerId = GetPlayerServerId(players[i])
            local player = GetPlayerFromServerId(playerServerId)
            local ped = GetPlayerPed(player)
            if IsEntityVisible(ped) then
                for x, identifier in pairs(onlinePlayers) do 
                    if x == tostring(playerServerId) then
                        table.insert(players_clean, {topText = identifier:upper(), playerId = playerServerId, coords = GetEntityCoords(ped)})
                    end
                end
            end
        end
    end
   
    return players_clean
end

function GetPlayersInArea(coords, area)
	local players, playersInArea = GetPlayers(), {}
	local coords = vector3(coords.x, coords.y, coords.z)
	for i=1, #players, 1 do
		local target = GetPlayerPed(players[i])
		local targetCoords = GetEntityCoords(target)

		if #(coords - targetCoords) <= area then
			table.insert(playersInArea, players[i])
		end
	end
	return playersInArea
end

function GetPlayers()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)
        if DoesEntityExist(ped) then
            table.insert(players, player)
        end
    end
    return players
end