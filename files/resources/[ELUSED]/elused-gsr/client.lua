local hasShot = false
local ignoreShooting = false
local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ped = PlayerPedId()
        if IsPedShooting(ped) then
            local currentWeapon = GetSelectedPedWeapon(ped)
            for _,k in pairs(Config.weaponChecklist) do
                if currentWeapon == k then
                    ignoreShooting = true
                    break
                end
            end
            
            if not ignoreShooting then
                TriggerServerEvent('GSR:SetGSR', timer)
                hasShot = true
                ignoreShooting = false
                Citizen.Wait(Config.gsrUpdate)
            end
			ignoreShooting = false
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(2000)
        if Config.waterClean and hasShot then
            ped = PlayerPedId()
            if IsEntityInWater(ped) then
                QBCore.Functions.Notify("Barut izini temizlemeye başladın, sudan sakın ayrılma..")
                Wait(100)
                QBCore.Functions.Progressbar("lundgsr", "Barut Temizleniyor..", Config.waterCleanTime, false, false, {
                    disableMovement = false,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = false,
                }, {}, {}, {}, function() -- Done
            		if IsEntityInWater(ped) then
                    	hasShot = false
                    	TriggerServerEvent('GSR:Remove')
                        QBCore.Functions.Notify("Üstündeki tüm barut izlerini temizledin.","success")
                    else
                        QBCore.Functions.Notify("Sudan çok erken ayrıldığın için barut izlerin temizlenmedi..", "error")
                    end
                end)
				Citizen.Wait(Config.waterCleanTime)
            end
        end
    end
end)

function status()
    if hasShot then
        QBCore.Functions.TriggerCallback('GSR:Status', function(cb)
            if not cb then
                hasShot = false
            end
        end)
    end
end

function updateStatus()
    status()
    SetTimeout(Config.gsrUpdateStatus, updateStatus)
end

Citizen.CreateThread(function()
    while true do
    SetPedSuffersCriticalHits(PlayerPedId(), false)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_advancedrifle"), 0.25000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_assaultrifle"), 0.44000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_assaultsmg"), 0.3)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_bat"), 0.33000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_battleaxe"), 0.3)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_carbinerifle_mk2"), 0.4)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_combatpdw"), 0.38000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_combatpistol"), 0.25000)
    Wait(0)       
    N_0x4757f00bc6323cfe(GetHashKey("weapon_compactrifle"), 0.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_crowbar"), 0.42000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_flashlight"), 0.4)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_gusenberg"), 0.25000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_heavypistol"), 0.2)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_knife"), 0.5)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_knuckle"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_machinepistol"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_microsmg"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_nightstick"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_pistol"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_pistol_mk2"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_pistol50"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_poolcue"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_revolver"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_smg"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_smg_mk2"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_snspistol"), 0.0)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_stungun"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_switchblade"), 0.27000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_glock22"), 1.37000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_glock17"), 1.37000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_m9"), 1.37000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_appistol"), 1.37000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_glock18c"), 1.97000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_m4"), 1.07000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_scarh"), 1.07000)
    Wait(0)
    N_0x4757f00bc6323cfe(GetHashKey("weapon_pumpshotgun"), 0)
    Wait(0)
    end
end)
