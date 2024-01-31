local QBCore = exports['qb-core']:GetCoreObject()
local lastVehicles = {}
local isClear = false


RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	local PlayerJob = QBCore.Functions.GetPlayerData().job.name
	if PlayerJob == 'police' or PlayerJob == 'sheriff' or PlayerJob == "state" or PlayerJob == "parkranger" or PlayerJob == "gtf" or PlayerJob == 'ambulance' or PlayerJob == 'sasp' or PlayerJob == 'fbi' or PlayerJob == 'parkranger' or PlayerJob == 'lsfd' or PlayerJob == 'adalet' or PlayerJob == 'doj2' or PlayerJob == 'kriyus' or PlayerJob == 'sheriff2' or PlayerJob == 'marshal' then
		isClear = true
	end
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function()
	local PlayerJob = QBCore.Functions.GetPlayerData().job.name
	if PlayerJob == 'police' or PlayerJob == 'sheriff' or PlayerJob == "state" or PlayerJob == "parkranger" or PlayerJob == "gtf" or PlayerJob == 'ambulance' or PlayerJob == 'sasp' or PlayerJob == 'fbi' or PlayerJob == 'parkranger' or PlayerJob == 'lsfd' or PlayerJob == 'adalet' or PlayerJob == 'doj2' or PlayerJob == 'kriyus' or PlayerJob == 'sheriff2' or PlayerJob == 'marshal' then
		isClear = true
	else
		isClear = false
	end
end)

local notifIn = false
local notifOut = false

CreateThread(function()
	if Config['SAFEZONE'] then
		-- for k, v in pairs(Config['zone']) do
		-- 	blip = AddBlipForRadius(v.x, v.y, v.z, v.radio)
		-- 	SetBlipHighDetail(blip, true)
		-- 	SetBlipColour(blip, 2)
		-- 	SetBlipAlpha (blip, 128)
		-- end
	end
	while true do
		local sleep = 1000
		local player = PlayerPedId()
		local plyCoords = GetEntityCoords(player)
		for k, v in pairs(Config["zone"]) do
			local dist = #(plyCoords - vector3(v.x, v.y, v.z))
			if dist <= v.radio then
				sleep = 5
				if not isClear or v.name == "Hastane" then
					if dist <= v.radio then
						if not notifIn then
							notifIn = true
							notifOut = false
						end
					else
						if not notifOut then
							notifOut = true
							notifIn = false
						end
					end
					if notifIn then
						DisableControlAction(2, 37, true)
						DisableControlAction(0, 106, true)
						DisableControlAction(0, 44, true)
						DisableControlAction(0, 140, true)
						DisableControlAction(0, 25, true)
						DisablePlayerFiring(player, true)
						N_0x4757f00bc6323cfe(-1553120962, 0.0)
						veh = GetGamePool('CVehicle')
						SetCurrentPedWeapon(player, GetHashKey("WEAPON_UNARMED"), true) 
						for k,v in pairs(veh) do
							SetEntityNoCollisionEntity(v, PlayerPedId(), true)
						end
					end
				end
			end
		end
		Wait(sleep)
	end
end)

CreateThread(function()
    while true do
        Wait(100)
        DisableControlAction(1, 140, true)
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
    end
end)

-- CreateThread(function()
-- 	while true do
-- 		Wait(180000)
-- 		for vehicle in EnumerateVehicles() do
-- 			if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then
-- 				if modelName ~= "JOURNEY" then
-- 					SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
-- 					SetEntityAsMissionEntity(vehicle, false, false) 
-- 					DeleteVehicle(vehicle)
-- 					if (DoesEntityExist(vehicle)) then 
-- 						DeleteVehicle(vehicle) 
-- 					end
-- 				end
-- 			end
-- 		end
-- 	end
-- end)

-- local entityEnumerator = {
--     __gc = function(enum)
--       if enum.destructor and enum.handle then
--         enum.destructor(enum.handle)
--       end
--       enum.destructor = nil
--       enum.handle = nil
--     end
-- }
  
-- local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
-- return coroutine.wrap(function()
--     local iter, id = initFunc()
--     if not id or id == 0 then
--     disposeFunc(iter)
--     return
--     end
    
--     local enum = {handle = iter, destructor = disposeFunc}
--     setmetatable(enum, entityEnumerator)
    
--     local next = true
--     repeat
--     coroutine.yield(id)
--     next, id = moveFunc(iter)
--     until not next
    
--     enum.destructor, enum.handle = nil, nil
--     disposeFunc(iter)
-- end)
-- end

-- function EnumerateObjects()
-- return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
-- end

-- function EnumeratePeds()
-- return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
-- end

-- function EnumerateVehicles()
-- return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
-- end

-- function EnumeratePickups()
-- return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
-- end