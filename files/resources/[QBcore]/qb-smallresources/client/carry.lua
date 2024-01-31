local QBCore = exports['qb-core']:GetCoreObject()
local carryingBackInProgress = false



 RegisterCommand('omuzla', function()
 	local player, distance = QBCore.Functions.GetClosestPlayer()
 	if IsPedInAnyVehicle(PlayerPedId(), 0) then
 	if waypoint then SetWaypointOff() SetNewWaypoint(waypoint.x, waypoint.y) end
 	else
 		if player ~= -1 and distance < 1.5 then
 		TriggerEvent("kucakla-on-off")
 		else
 		 QBCore.Functions.Notify('Yakınında kimse yok!', 'error')
 		end
 	end
 end, false)
 RegisterKeyMapping('omuzla', 'Kisi omuzlama', 'keyboard', 'Y')

RegisterNetEvent('kucakla-on-off')
AddEventHandler('kucakla-on-off', function()
	local closestPlayer = GetClosestPlayer(2)
		

	if closestPlayer ~= nil then
		QBCore.Functions.Progressbar("accessing_atm", "İşlem gerçekleştiriliyor", 300, false, true, {
			disableMovement = false,
			disableCarMovement = false,
			disableMouse = false,
			disableCombat = true,
		
		}, {}, {}, {}, function() -- Done
		if not carryingBackInProgress then
			carryingBackInProgress = true
			local player = PlayerPedId()	
			lib = 'missfinale_c2mcs_1'
			anim1 = 'fin_c2_mcs_1_camman'
			lib2 = 'nm'
			anim2 = 'firemans_carry'
			distans = 0.15
			distans2 = 0.27
			height = 0.63
			spin = 0.0		
			length = 100000
			controlFlagMe = 49
			controlFlagTarget = 33
			animFlagTarget = 1
			closestPlayer = GetClosestPlayer(2)
			if closestPlayer ~= nil then
				target = GetPlayerServerId(closestPlayer)
				local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
				local xped = GetPlayerPed(closestPlayer)
				if not IsPedInAnyVehicle(targetPed, false) and IsEntityVisible(xped) then
				TriggerServerEvent('cmg2_animations:sync', closestPlayer, lib,lib2, anim1, anim2, distans, distans2, height,target,length,spin,controlFlagMe,controlFlagTarget,animFlagTarget)
				end
			end
		else
			carryingBackInProgress = false
			ClearPedSecondaryTask(PlayerPedId())
			DetachEntity(PlayerPedId(), true, false)
			local closestPlayer = GetClosestPlayer(3)
			target = GetPlayerServerId(closestPlayer)
			TriggerServerEvent("cmg2_animations:stop",target)
		end
		end, function()
			QBCore.Functions.Notify("Iptal edildi!", "error")
		end)
	end
end)

RegisterNetEvent("hastane:tedavi:kucak:kapat")
AddEventHandler("hastane:tedavi:kucak:kapat", function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
	local closestPlayer = GetClosestPlayer(3)
	target = GetPlayerServerId(closestPlayer)
	TriggerServerEvent("cmg2_animations:stop", target)
end)

RegisterNetEvent('cmg2_animations:syncTarget')
AddEventHandler('cmg2_animations:syncTarget', function(target, animationLib, animation2, distans, distans2, height, length,spin,controlFlag)
	local playerPed = PlayerPedId()
	local targetPed = GetPlayerPed(GetPlayerFromServerId(target))
	carryingBackInProgress = true

	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	if spin == nil then spin = 180.0 end
	AttachEntityToEntity(PlayerPedId(), targetPed, 0, distans2, distans, height, 0.5, 0.5, spin, false, false, false, false, 2, false)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation2, 8.0, -8.0, length, controlFlag, 0, false, false, false)
end)

RegisterNetEvent('cmg2_animations:syncMe')
AddEventHandler('cmg2_animations:syncMe', function(animationLib, animation,length,controlFlag,animFlag)
	local playerPed = PlayerPedId()
	RequestAnimDict(animationLib)

	while not HasAnimDictLoaded(animationLib) do
		Citizen.Wait(10)
	end
	-- Wait(500)
	if controlFlag == nil then controlFlag = 0 end
	TaskPlayAnim(playerPed, animationLib, animation, 8.0, -8.0, length, controlFlag, 0, false, false, false)

	Citizen.Wait(length)
end)

RegisterNetEvent('cmg2_animations:cl_stop')
AddEventHandler('cmg2_animations:cl_stop', function()
	carryingBackInProgress = false
	ClearPedSecondaryTask(PlayerPedId())
	DetachEntity(PlayerPedId(), true, false)
end)

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer(radius)
    local players = GetPlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local ply = PlayerPedId()
    local plyCoords = GetEntityCoords(ply, 0)

    for index,value in ipairs(players) do
        local target = GetPlayerPed(value)
        if(target ~= ply) then
            local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
            local distance = GetDistanceBetweenCoords(targetCoords['x'], targetCoords['y'], targetCoords['z'], plyCoords['x'], plyCoords['y'], plyCoords['z'], true)
            if(closestDistance == -1 or closestDistance > distance) then
                closestPlayer = value
                closestDistance = distance
            end
        end
    end

	if closestDistance <= radius then
		return closestPlayer
	else
		return nil
	end
end
