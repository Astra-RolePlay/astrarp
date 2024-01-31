local QBCore = exports['qb-core']:GetCoreObject()

local isDead = false
local aktif = false
local tip = ""
local oyuncu = ""
local targetId = 0

local animasyonlar = {
    ["kucak"] = {
        ["oyuncu1"] = {
            ["dic"] = "missfinale_c2mcs_1",
			["anim"] = "fin_c2_mcs_1_camman",
			["flag"] = 49,
        },
        ["oyuncu2"] = {
            ["dic"] = "nm",
			["anim"] = "firemans_carry",
			["flag"] = 33,
        }
    },
    ["rehin"] = {
        ["oyuncu1"] = {
            ["dic"] = "anim@gangops@hostage@",
			["anim"] = "perp_idle",
			["flag"] = 49,
        },
        ["oyuncu2"] = {
            ["dic"] = "anim@gangops@hostage@",
			["anim"] = "victim_idle",
			["flag"] = 49,
        }
    }
}

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

RegisterNetEvent('ed-kucakla:kucaklabeni')
AddEventHandler('ed-kucakla:kucaklabeni', function()
    TriggerEvent("ed-kucakla:kontrol", "kucak")
end)

local bussy = true
RegisterNetEvent('ed-kucakla:kontrol')
AddEventHandler('ed-kucakla:kontrol', function(xtip)
    if bussy then
        bussy = false
        local playerPed = PlayerPedId()
        if not IsEntityAttached(playerPed) then
            QBCore.Functions.Notify('İşlem Gerçekleştiriliyor!', "primary", 2300)
            if not aktif then Citizen.Wait(2500) end
            if targetId == 0 then
                local player, distance = QBCore.Functions.GetClosestPlayer()
                targetId =  GetPlayerServerId(player)
                local playerServerId = GetPlayerFromServerId(targetId)
                local targetPed = GetPlayerPed(playerServerId)
                local model = GetEntityModel(targetPed)
                if (distance == -1 or distance > 3.0) or not IsEntityVisible(targetPed) then -- or (model ~= 1885233650 and model ~= -1667301416)
                    QBCore.Functions.Notify('Yakınlarda oyuncu yok!', 'error')
                    bussy = true
                    return
                end
            end
            if not aktif then 
                oyuncu = "oyuncu1"
                tip = xtip
                local anim = animasyonlar[tip]["oyuncu1"]
                if tip == "kucak" then
                    loadAnimDict(anim.dic)
                    TaskPlayAnim(playerPed, anim.dic, anim.anim, 8.0, -8.0, -1, anim.flag, 0, false, false, false)
                    QBCore.Functions.Notify('[X] ile Kucakladığın Oyuncuyu Bırakabilirsin', "primary", 2500)
                elseif tip == "rehin" then
                    local _, hash = GetCurrentPedWeapon(playerPed)
                    if GetWeapontypeGroup(hash) ~= 416676503 then
                        QBCore.Functions.Notify('Kişiyi rehin Almak için silahının olması lazım!', 'error')
                        bussy = true
                        return
                    end
                    QBCore.Functions.Notify('Oyuncu Rehin Alınıyor!')
                    loadAnimDict(anim.dic)
                    TaskPlayAnim(playerPed, anim.dic, anim.anim, 8.0, -8.0, -1, anim.flag, 0, false, false, false)
                end
                TriggerServerEvent("ed-kucakla:server:oyuncu-2-anim", targetId, tip)
                aktif = true
            else
                QBCore.Functions.Notify('Oyuncu Bırakılıyor!')
                if tip == "rehin" then
                    TriggerServerEvent("ed-kucakla:server:rehin-birak", targetId, "birak")
                    rehineBirak("oyuncu1")
                else
                    TriggerServerEvent("ed-kucakla:server:anim-iptal", targetId)
                    animIptal()
                end
            end
        end
        bussy = true
    end
end)

RegisterNetEvent('ed-kucakla:client:anim-iptal')
AddEventHandler('ed-kucakla:client:anim-iptal', function()
    animIptal()
end)

function animIptal()
    aktif = false
    targetId = 0
    local playerPed = PlayerPedId()
    ClearPedSecondaryTask(playerPed)
    if IsEntityAttached(playerPed) then
        DetachEntity(playerPed, true, false)
    end
end

RegisterNetEvent('ed-kucakla:client:oyuncu-2-anim')
AddEventHandler('ed-kucakla:client:oyuncu-2-anim', function(xtip, oyuncu1)
    if not aktif then
        local playerPed = PlayerPedId()
        local playerServerId = GetPlayerFromServerId(oyuncu1)
        local targetPed = GetPlayerPed(playerServerId)
        oyuncu = "oyuncu2"
        tip = xtip
        local anim = animasyonlar[tip][oyuncu]
        if tip == "kucak" then
            loadAnimDict(anim.dic)
            AttachEntityToEntity(playerPed, targetPed, 0, 0.20, 0.15, 0.63, 0.5, 0.5, 5.0, false, false, false, false, 2, false)
            TaskPlayAnim(playerPed, anim.dic, anim.anim, 8.0, -8.0, -1, anim.flag, 0, false, false, false)
        elseif tip == "rehin" then
            loadAnimDict(anim.dic)
            AttachEntityToEntity(playerPed, targetPed, 0, -0.24, 0.11, 0.0, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
            TaskPlayAnim(playerPed, anim.dic, anim.anim, 8.0, -8.0, -1, anim.flag, 0, false, false, false)
        end
        aktif = true
    end
end)

local lastNotifTime = GetGameTimer()
Citizen.CreateThread(function()
    while true do
        local time = 1000
        if aktif then
            time = 1
            local playerPed = PlayerPedId()
            local anim = animasyonlar[tip][oyuncu]
            if not IsEntityPlayingAnim(PlayerPedId(), anim.dic, anim.anim, 3) then
                TaskPlayAnim(playerPed, anim.dic, anim.anim, 8.0, -8.0, -1, anim.flag, 0, false, false, false)
            end

            DisablePlayerFiring(playerPed, true)
            SetPedCanPlayGestureAnims(playerPed, false)
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 257, true) -- Attack 2
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- Melee Attack 1
            DisableControlAction(0, 56, true) -- F9
            DisableControlAction(0, 45, true) -- Reload
            DisableControlAction(0, 22, true) -- Jump
            DisableControlAction(0, 44, true) -- Cover
            DisableControlAction(0, 37, true) -- Select Weapon
            DisableControlAction(0, 288,  true) --F1
            DisableControlAction(0, 289, true) -- F2
            DisableControlAction(0, 167, true) -- F6
            DisableControlAction(0, 73, true) -- Disable clearing animation
            DisableControlAction(0, 47, true)  -- Disable weapon
            DisableControlAction(0, 264, true) -- Disable melee
            DisableControlAction(0, 257, true) -- Disable melee
            DisableControlAction(0, 140, true) -- Disable melee
            DisableControlAction(0, 141, true) -- Disable melee
            DisableControlAction(0, 142, true) -- Disable melee
            DisableControlAction(0, 143, true) -- Disable melee

            if oyuncu == "oyuncu2" or tip == "rehin" then
                DisableControlAction(0, 23, true) -- enter
                DisableControlAction(0, 170, true) -- F3
                DisableControlAction(2, 199, true) -- Disable pause screen
                DisableControlAction(0, 59, true) -- Disable steering in vehicle
                DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
                DisableControlAction(0, 72, true) -- Disable reversing in vehicle
                DisableControlAction(0, 75, true)  -- Disable exit vehicle
                DisableControlAction(0, 301, true)  -- Disable exit vehicle
                DisableControlAction(27, 75, true) -- Disable exit vehicle
            end

            DisableControlAction(0, 73, true)
            if oyuncu == "oyuncu1" and IsDisabledControlJustPressed(0,73) then --x
                if tip == "rehin" then
                    TriggerServerEvent("ed-kucakla:server:rehin-birak", targetId, "birak")
                    rehineBirak("oyuncu1")
                else
                    TriggerServerEvent("ed-kucakla:server:anim-iptal", targetId)
                    animIptal()
                end
            end

            if oyuncu == "oyuncu1" and tip == "rehin" then
                -- SetFollowPedCamViewMode(4)
                local playerCoords = GetEntityCoords(playerPed)
                if GetGameTimer() > lastNotifTime then
                    lastNotifTime = GetGameTimer() + 10000
                    QBCore.Functions.Notify("[X] Serbest Bırak, [H] Öldür", "error", 9000)
                end
                if IsDisabledControlJustPressed(0,74) then --kill 
                    local ammo = GetAmmoInPedWeapon(playerPed, GetSelectedPedWeapon(playerPed))
                    if ammo > 0 then
                        TriggerServerEvent("ed-kucakla:server:rehin-birak", targetId, "oldur")
                        rehineOldur("oyuncu1")
                    else
                        QBCore.Functions.Notify("Silahında Mermi Yok!", "error")
                    end
                end
            end
        end
        Citizen.Wait(time)
    end
end)

RegisterNetEvent('ed-kucakla:client:rehin-birak')
AddEventHandler('ed-kucakla:client:rehin-birak', function(rehintip)
    if rehintip == "birak" then
        rehineBirak("oyuncu2")
    else
        rehineOldur("oyuncu2")
    end
end)

function rehineBirak(oyuncu)
    animIptal()
    local playerPed = PlayerPedId()
    if oyuncu == "oyuncu1" then
        loadAnimDict("reaction@shove")
        TaskPlayAnim(playerPed, "reaction@shove", "shove_var_a", 8.0, -8.0, -1, 120, 0, false, false, false)
    else
        loadAnimDict("reaction@shove")
        TaskPlayAnim(playerPed, "reaction@shove", "shoved_back", 8.0, -8.0, -1, 0, 0, false, false, false)
    end
end

function rehineOldur(oyuncu)
    animIptal()
    local playerPed = PlayerPedId()
    if oyuncu == "oyuncu1" then
        loadAnimDict("anim@gangops@hostage@")
        TaskPlayAnim(playerPed, "anim@gangops@hostage@", "perp_fail", 8.0, -8.0, -1, 168, 0, false, false, false)
        SetPedShootsAtCoord(playerPed, 0.0, 0.0, 0.0, 0)
    else
        loadAnimDict("anim@gangops@hostage@")
        TaskPlayAnim(playerPed, "anim@gangops@hostage@", "victim_fail", 8.0, -8.0, -1, 0, 0, false, false, false)
        Citizen.Wait(1000)
        SetEntityHealth(playerPed, 0)
    end
end