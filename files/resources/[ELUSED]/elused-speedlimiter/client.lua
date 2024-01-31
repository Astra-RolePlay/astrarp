Citizen.CreateThread(function()

    while true do

		sleep = 1000

        local playerPed = PlayerPedId()

        local vehicle = GetVehiclePedIsIn(playerPed)



        if IsPedInAnyVehicle(playerPed) then

			sleep = 0

            local vehModel = GetEntityModel(vehicle)

            if ELUSED.Limits[vehModel] then

                SetEntityMaxSpeed(vehicle, ELUSED.Limits[vehModel]/3.6)

            end

        end



        Citizen.Wait(sleep)

    end

end)
