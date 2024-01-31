local kmh = 3.6
local mph = 2.23693629
local carspeed = 0

local driftmode = true -- aç/kapa drift
local speed = kmh -- mph olarakda ayarlanıla biliyor
local drift_speed_limit = 300.0 
local toggle = 118 -- Numpad 9

Citizen.CreateThread(function()

	while true do

		Citizen.Wait(1)

		if IsControlJustPressed(1, 118) then

			driftmode = not driftmode

			if driftmode then
				TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^2Kemerini Sıkı Bağla Drift Moduna Geçtin.')
			else
				TriggerEvent("chatMessage", 'DRIFT', { 255,255,255}, '^1Araç Standart Sürüş Modunda.')
			end
		end

		if driftmode then

			if IsPedInAnyVehicle(GetPed(), false) then

				CarSpeed = GetEntitySpeed(GetCar()) * speed

				if GetPedInVehicleSeat(GetCar(), -1) == GetPed() then

					if CarSpeed <= drift_speed_limit then  

						if IsControlPressed(1, 21) then
		
							SetVehicleReduceGrip(GetCar(), true)
		
						else
		
							SetVehicleReduceGrip(GetCar(), false)
		
						end
					end
				end
			end
		end
	end
end)


-- Function
function GetPed() return GetPlayerPed(-1) end
function GetCar() return GetVehiclePedIsIn(GetPlayerPed(-1),false) end