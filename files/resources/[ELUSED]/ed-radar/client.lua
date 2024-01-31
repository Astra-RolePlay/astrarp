
PlayerJob = nil

QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    PlayerJob = QBCore.Functions.GetPlayerData().job.name
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job.name
end)

Citizen.CreateThread(function()
    while true do
        Wait(0)
        for k,v in pairs(Config.RadarKordinat) do
            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local dist = #(coords - vector3(Config.RadarKordinat[k].x, Config.RadarKordinat[k].y, Config.RadarKordinat[k].z))
            if PlayerJob ~= 'police' and PlayerJob ~= 'ambulance' and PlayerJob ~= 'sheriff' and PlayerJob ~= 'saspp' then
                if dist < 25 then
                    radarSpeed()
                end
            end
        end
    end
end)

function radarSpeed()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local speed = GetEntitySpeed(driver)
    local kmhspeed = math.ceil(speed*3.6)
    local twospeed = kmhspeed
    local forbiddenSpeed = 0
    local money = 0

    for k,v in pairs(Config.Limits) do
        if kmhspeed > k and twospeed <= k+29 then
            forbiddenSpeed = k
            money = v.money
            break
        end
    end

	if driver == ped then
		if forbiddenSpeed ~= 0 then
			if not oneNotify then
				QBCore.Functions.Notify("[EDS] Hız Limiti: "..forbiddenSpeed.."/"..kmhspeed.." - Kesilen Ceza: $"..money, 'error', 7500)
				TriggerServerEvent('ed-radar:server:ceza', money)
				oneNotify = true
			end
			Wait(8000)
			oneNotify = false
		end
	end
end
