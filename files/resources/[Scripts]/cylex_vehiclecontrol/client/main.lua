CreateThread(function()
    state = false
    isFrameworkReady()
    Wait(1000)

    RegisterNUICallback("close", function(data, cb)
        openMenu(false)
    end)

    RegisterNetEvent('cylex_vehiclecontrol:client:openMenu', function()
        openMenu(true)
    end)
end)