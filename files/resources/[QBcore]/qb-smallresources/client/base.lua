Citizen.CreateThread(function()
    while true do
    Citizen.Wait(0)
        -- Yumruk hasarı
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.2)
        --Boşta Kamera Modu
        InvalidateIdleCam()
        N_0x9e4cfff989258472()
        -- R tuşuyla dipçik atmayı engeller
        local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end
        -- Otomatik kask takmayı kapatma
        SetPedConfigFlag(PlayerPedId(), 35, false)
        -- Polis araçlarında silah verme olayını kapatır
        id = PlayerId()
        DisablePlayerVehicleRewards(id)
        -- Kadın karakterin canının az olmasını engeller
        if GetEntityMaxHealth(GetPlayerPed(-1)) ~= 200 then
            SetEntityMaxHealth(GetPlayerPed(-1), 200)
            SetEntityHealth(GetPlayerPed(-1), 200)
        end
        -- Shift spam engelleme
        DisableControlAction(1, 140, true)
        if not IsPlayerTargettingAnything(PlayerId()) then
            DisableControlAction(1, 141, true)

            DisableControlAction(1, 142, true)
        end
    end
end)
