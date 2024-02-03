local show3DText = false

RegisterNetEvent("pixel_antiCL:show")
AddEventHandler("pixel_antiCL:show", function()
    if show3DText then
        show3DText = false
    else
        show3DText = true
        if Config.AutoDisableDrawing then
            if tonumber(Config.AutoDisableDrawing) then
                Citizen.Wait(Config.AutoDisableDrawingTime)
            else
                Citizen.Wait(15000)
            end
            show3DText = false
        end
    end
end)

RegisterNetEvent("pixel_anticl")
AddEventHandler("pixel_anticl", function(id, crds, identifier, reason)
    Display(id, crds, identifier, reason)
end)

function Display(id, crds, identifier, reason)
    local displaying = true
    Citizen.CreateThread(function()
        while displaying do
            Wait(5)
            local pcoords = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(crds.x,crds.y,crds.z, pcoords.x, pcoords.y, pcoords.z, true) < 15.0 then
                DrawText3DSecond(crds.x, crds.y, crds.z+0.15, "Player Left Game")
                DrawText3D(crds.x, crds.y, crds.z, "ID: " .. id .. " (" .. identifier .. ")\nReason: " .. reason)
                UdeMarker3D(crds.x,crds.y,crds.z+0.50)
            else
                Citizen.Wait(2000)
            end
        end
    end)
    Citizen.CreateThread(function()
        Wait(Config.DrawingTime)
        displaying = false
    end)
end

 
function DrawText3DSecond(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(Config.AlertTextColor.r, Config.AlertTextColor.g, Config.AlertTextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    -- local factor = (string.len(text)) / 250
    -- DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end

function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.45, 0.45)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 250
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end


function UdeMarker3D(x,y,z)
    DrawMarker(2,x,y,z,0.0,0.0,0.0,0.0,0.0,0.0,0.3,0.3,0.3,100,0,254,150,0,0,0,0,0,0,0)
end