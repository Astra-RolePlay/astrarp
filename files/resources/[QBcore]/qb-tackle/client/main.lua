local isTackling = false
local isGettingTackled = false
local lastTackleTime = 0
local isRagdoll = false

local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	while true do
		local time = 250
		if isRagdoll then
			time = 1
			SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		end
		Citizen.Wait(time)
	end
end)

RegisterNetEvent('qb-tackle:getTackled')
AddEventHandler('qb-tackle:getTackled', function(target)
	isGettingTackled = true
	isRagdoll = true
	Citizen.Wait(4000)
	isRagdoll = false
	Citizen.Wait(4000)
	isGettingTackled = false
end)

RegisterNetEvent('qb-tackle:playTackle') 
AddEventHandler('qb-tackle:playTackle', function()
	local playerPed = PlayerPedId()

	if IsEntityPlayingAnim(playerPed, "swimming@first_person@diving", "dive_run_fwd_-45_loop", 3) then
		ClearPedSecondaryTask(playerPed)
	else
		QBCore.Shared.RequestAnimDict('swimming@first_person@diving', function() -- animasyon oynatma
			TaskPlayAnim(playerPed, 'swimming@first_person@diving', 'dive_run_fwd_-45_loop', 8.0, -8, -1, 49, 0, 0, 0, 0)
			seccount = 3
			while seccount > 0 do
				Citizen.Wait(100)
				seccount = seccount - 1
			end
			ClearPedSecondaryTask(playerPed)
			SetPedToRagdoll(playerPed, 150, 150, 0, 0, 0, 0) 
		end)
	end	

	isRagdoll = true
	Citizen.Wait(500)
	isRagdoll = false
	Citizen.Wait(3000)
	isTackling = false
end)

-- Main thread
Citizen.CreateThread(function()
	while true do
		time = 1000
		if not IsPedInAnyVehicle(PlayerPedId()) then
			time = 1
			if IsControlPressed(0, 21) and IsControlPressed(0, 22) and IsControlPressed(0, 38) and not isTackling and GetGameTimer() - lastTackleTime > 5 * 1000 then
				local closestPlayer, distance = QBCore.Functions.GetClosestPlayer()
				if distance ~= -1 and distance <= 1.2 and not isTackling and not isGettingTackled and not IsPedInAnyVehicle(GetPlayerPed(closestPlayer)) then
					isTackling = true
					lastTackleTime = GetGameTimer()

					TriggerServerEvent('qb-tackle:tryTackle', GetPlayerServerId(closestPlayer))
				end
			end
		end
		Citizen.Wait(time)
	end
end)