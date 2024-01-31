local QBCore = exports["qb-core"]:GetCoreObject()

local function findVehFromPlateAndLocate(plate)
	local gameVehicles = QBCore.Functions.GetVehicles()
	for i = 1, #gameVehicles do
		local vehicle = gameVehicles[i]
		if DoesEntityExist(vehicle) then
			if QBCore.Functions.GetPlate(vehicle) == plate then
				local vehCoords = GetEntityCoords(vehicle)
				SetNewWaypoint(vehCoords.x, vehCoords.y)
				return true
			end
		end
	end
end

RegisterNUICallback("npwd:qb-garage:getVehicles", function(_, cb)
	TriggerServerEvent("npwd:qb-garage:getVehicles")
	RegisterNetEvent("npwd:qb-garage:sendVehicles", function(vehicles)
		for _, v in pairs(vehicles) do
			local type = GetVehicleClassFromName(v.model)
			if type == 15 or type == 16 then
				v.type = "aircraft"
			elseif type == 14 then
				v.type = "boat"
			elseif type == 13 or type == 8 then
				v.type = "bike"
			else
				v.type = "car"
			end
		end

		cb({ status = "ok", data = vehicles })
	end)
end)

RegisterNUICallback("npwd:qb-garage:requestWaypoint", function(data, cb)
	local plate = data.plate
	if findVehFromPlateAndLocate(plate) then
		QBCore.Functions.Notify("Your vehicle has been marked", "success")
	else
		QBCore.Functions.Notify("This vehicle cannot be located", "error")
	end
	cb({})
end)

RegisterNuiCallback("npwd:qb-garage:valetVehicle", function(data, cb)
	local coords = QBCore.Functions.GetCoords(PlayerPedId())
	local ret, coordsTemp, heading = GetClosestVehicleNodeWithHeading(coords.x, coords.y, coords.z, 1, 3.0, 0)
	local retval, coordsSide = GetPointOnRoadSide(coordsTemp.x, coordsTemp.y, coordsTemp.z)
	-- coordsSide vector3 location  / heading float
	print(data.vehicle.model .. 'spawned')
    print(data.vehicle.state)
	print(data.vehicle.plate)
	if data.vehicle.state == 'garaged' then
		QBCore.Functions.SpawnVehicle(data.vehicle.model, function(veh)
			QBCore.Functions.TriggerCallback('qb-garage:server:GetVehicleProperties', function(properties)
				QBCore.Functions.SetVehicleProperties(veh, properties)
				SetVehicleNumberPlateText(veh, data.vehicle.plate)
				exports['ed-fuel']:SetFuel(veh, data.vehicle.fuel)
				SetEntityAsMissionEntity(veh, true, true)
				SetEntityHeading(veh, heading)
				TriggerServerEvent('qb-garage:server:updateVehicleState', 0, data.vehicle.plate, "Out")
				TriggerServerEvent('qb-vehiclekeys:server:AcquireVehicleKeys', data.vehicle.plate)
				SetVehicleEngineOn(veh, true, true, false)
			end, data.vehicle.plate)
		end, coordsSide, true)
	else
		QBCore.Functions.Notify("Arac zaten disarida!", "error")
	end

	cb({})
end)
