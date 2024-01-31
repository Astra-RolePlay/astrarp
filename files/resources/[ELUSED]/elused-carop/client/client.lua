RegisterNetEvent("delall")
AddEventHandler("delall", function ()
    if Config.alerts then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 30 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(15000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 15 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(5000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 10 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(1000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 5 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(1000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 4 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(1000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 3 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(1000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 2 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
        Citizen.Wait(1000)
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Araçlar 1 Saniye İçersinde Silinicektir Eğer Aracınızın İçinde Değilseniz Aracınız Çekilcektir.' }
        })
    end
    Citizen.Wait(1000) 
    for vehicle in EnumerateVehicles() do            
        if (not IsPedAPlayer(GetPedInVehicleSeat(vehicle, -1))) then 
            if Config.OnlyWipeBroken == true then
                if GetVehicleEngineHealth(vehicle) <= 100.0 then
                    SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
                    SetEntityAsMissionEntity(vehicle, false, false) 
                    DeleteVehicle(vehicle)
                    if Config.UseESX then
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                    DeleteVehicle(vehicle) 
                    if Config.UseESX then
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                    if (DoesEntityExist(vehicle)) then 
                        DeleteVehicle(vehicle) 
                        if Config.UseESX then
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                        DeleteVehicle(vehicle)
                        if Config.UseESX then 
                            ESX.Game.DeleteVehicle(vehicle)
                        end
                        DeleteEntity(vehicle)
                    end
                end
            else
                SetVehicleHasBeenOwnedByPlayer(vehicle, false) 
                SetEntityAsMissionEntity(vehicle, false, false) 
                DeleteVehicle(vehicle)
                if Config.UseESX then
                    ESX.Game.DeleteVehicle(vehicle)
                end
                DeleteEntity(vehicle)
                DeleteVehicle(vehicle) 
                if Config.UseESX then
                    ESX.Game.DeleteVehicle(vehicle)
                end
                DeleteEntity(vehicle)
                if (DoesEntityExist(vehicle)) then 
                    DeleteVehicle(vehicle) 
                    if Config.UseESX then
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                    DeleteVehicle(vehicle)
                    if Config.UseESX then 
                        ESX.Game.DeleteVehicle(vehicle)
                    end
                    DeleteEntity(vehicle)
                end
            end
            if Config.use10msdelay then
                Citizen.Wait(10)
            end
        end
    end
    if Config.DoneNotify then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(202, 45, 45, 1); border-radius: 3px;"><i class="fas fa-car-crash"></i> {0}:<br> {1}</div>',
            args = { 'FPS OPTIMIZASYONU', 'Kullanılmayan Araçlar Silinmiştir IYI ROLLER' }
        })
    end
end)
