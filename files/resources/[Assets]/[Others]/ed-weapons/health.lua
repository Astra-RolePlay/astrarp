Citizen.CreateThread(function()
    while true do
    local health = GetEntityHealth(GetPlayerPed(-1))
    Citizen.Wait(0)
DrawTxt(1.200, 0.50, 0.0,1.0,0.50,"~w~Health ~r~".. health .."~w~", 255,255,255,255)
    end
end)

function DrawTxt(x,y ,width,height,scale, text, r,g,b,a)
    SetTextFont(2)
    SetTextProportional(0)
    SetTextScale(0.7, 0.7)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(2, 0, 0, 0, 255)
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(0.16, 0.80)
end