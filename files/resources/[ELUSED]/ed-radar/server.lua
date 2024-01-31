function radarSpeed()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)
    local driver = GetPedInVehicleSeat(vehicle, -1)
    local plate = GetVehicleNumberPlateText(vehicle)
    local speed = GetEntitySpeed(driver)
    local kmhspeed = math.ceil(speed * 3.6)
    local twospeed = kmhspeed
    local forbiddenSpeed = 0
    local money = 0

    for k, v in pairs(Config.Limits) do
        if kmhspeed > k and twospeed <= k + 29 then
            forbiddenSpeed = k
            money = v.money
            break
        end
    end

    if driver == ped then
        if forbiddenSpeed ~= 0 then
            if not oneNotify then
                QBCore.Functions.Notify("[EDS] Hız Limiti: " .. forbiddenSpeed .. "/" .. kmhspeed .. " - Kesilen Ceza: $" .. money, 'error', 7500)
                TriggerServerEvent('ed-radar:server:ceza', money)
                oneNotify = true
            end
            Wait(8000)
            oneNotify = false
        end
    end
end
