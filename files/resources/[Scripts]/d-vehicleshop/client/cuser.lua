function Notify(text, length, type)
    if Config.DPhone == true then
        TriggerEvent("d-notification", text, length, type)
    else
        if Config.framework == "esx" then
            ESX.ShowNotification(text)
        elseif Config.framework == "qb" then
            QBCore.Functions.Notify(text, type)
        end
    end
end

RegisterNetEvent("vehicleshop:notify")
AddEventHandler("vehicleshop:notify", function(text, length, type)
    Notify(text, length, type)
end)

GetFuel = function(veh)
    return exports[Config.LegacyFuelResourceName]:GetFuel(veh)
end

SuccessfullPurchse = function(vehicle_name, vehicle_label, vehicle_price, vehicle_plate, job)

end

showMenu = function()
    local v = inspot
    if Config.Sell.enabled == true then
        DrawText3D(v.x, v.y, v.z, _U("vehicletext", Config.uikey, Config.secondKey), 2)
    else
        DrawText3D(v.x, v.y, v.z, _U("vehicletext2", Config.uikey), 1)
    end
    if (IsControlJustReleased(1, Keys[Config.uikey])) then -- E
        if v.id ~= Vehicleshop.openid then
            dprint("Load new")
            TriggerServerEvent("vehicleshop:load", Source, true, v.id)
            Vehicleshop.openid = v.id
        else
            Vehicleshop.loadCategories()
        end
        Vehicleshop.setup()
    elseif (IsControlJustReleased(1, Keys[Config.secondKey])) and Config.Sell.enabled == true then -- H
        Vehicleshop.sellui.load()
    end
end
