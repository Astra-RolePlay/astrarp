local dragStatus, playerData = {}, {}
dragStatus.isDragged = false
local tirman = 0
local poliskelepceledi = false
local oyuncukelepceledi = false
local benkelepceledim = false
local isDead = false
local sistemAktif = true
local PlayerData = {}

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    firstLogin()
end)

function firstLogin()
    PlayerData = QBCore.Functions.GetPlayerData()
    oyuncukelepceledi = PlayerData.metadata["kelepce"]
    poliskelepceledi = PlayerData.metadata["pkelepce"]
end

-- Meslek Update
RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerData.job = job
end)

CreateThread(function()
    while QBCore == nil do Wait(1) end
    while true do
        local time = 1000
        if poliskelepceledi or oyuncukelepceledi then
            time = 1
            local playerPed = PlayerPedId()
            if not IsPedRagdoll(playerPed) then
                if not IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) then   
                    loadAnimDict('mp_arresting')
                    TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, 8.0, -1, 49, 0, 0, 0, 0)

                end

                if IsPedClimbing(playerPed) then
                    tirman = tirman + 1
                    if tirman > 40 then
                        SetPedToRagdoll(playerPed, 2000, 2000, 0, 0, 0, 0)
                        Wait(2000)
                    end
                else
                    tirman = 0
                end
            end
        end 
        Wait(time)
    end
end)  

CreateThread(function()
    while true do
        local time = 1000
        if poliskelepceledi or oyuncukelepceledi then
            time = 1
            local playerPed = PlayerPedId()
            DisablePlayerFiring(playerPed, true)

            DisableControlAction(0, 24, true) -- Attack
			DisableControlAction(0, 257, true) -- Attack 2
			DisableControlAction(0, 25, true) -- Aim
			DisableControlAction(0, 263, true) -- Melee Attack 1

			DisableControlAction(0, 45, true) -- Reload
			DisableControlAction(0, 22, true) -- Jump
			DisableControlAction(0, 44, true) -- Cover
			DisableControlAction(0, 37, true) -- Select Weapon
			DisableControlAction(0, 23, true) -- Also 'enter'?
            DisableControlAction(0, 75, true) -- Also 'enter'?

			DisableControlAction(0, 288, true) -- Disable phone
			DisableControlAction(0, 289, true) -- Inventory
			DisableControlAction(0, 170, true) -- Animations
			DisableControlAction(0, 167, true) -- Job

			DisableControlAction(0, 26, true) -- Disable looking behind
			DisableControlAction(0, 73, true) -- Disable clearing animation
			DisableControlAction(0, 206, true) -- Disable clearing animation
			DisableControlAction(0, 205, true) -- Disable clearing animation
			DisableControlAction(2, 199, true) -- Disable pause screen

			DisableControlAction(0, 59, true) -- Disable steering in vehicle
			DisableControlAction(0, 71, true) -- Disable driving forward in vehicle
			DisableControlAction(0, 72, true) -- Disable reversing in vehicle

			DisableControlAction(2, 36, true) -- Disable going stealth

			DisableControlAction(0, 264, true) -- Disable melee
			DisableControlAction(0, 257, true) -- Disable melee
			DisableControlAction(0, 140, true) -- Disable melee
			DisableControlAction(0, 141, true) -- Disable melee
			DisableControlAction(0, 142, true) -- Disable melee
			DisableControlAction(0, 143, true) -- Disable melee
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
        end
        Wait(time)
    end
end) 

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(0)
    end
end

-- Polis Kelepçeleme
RegisterNetEvent("ed-kelepce:polis-kelepce-tak-client")
AddEventHandler("ed-kelepce:polis-kelepce-tak-client", function()
    if sistemAktif then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 1.5 then
                    local targetPlayerPed = GetPlayerServerId(closestPlayer)  
                    QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                        if not data.kelepce and not data.pkelepce then
                            playerPed = PlayerPedId()
                            kordinat()
                            TriggerServerEvent("ed-kelepce:polis-kelepce-tak-takilan", targetPlayerPed, playerlocation, playerheading, playerCoords)
                            Wait(200)
                            handcuffSound()
                            loadAnimDict("mp_arresting")
                            Citizen.Wait(250)
                            TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
                            Citizen.Wait(250)
                            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 5, "handcuff", 0.3)
                            Citizen.Wait(1000)
                            ClearPedTasks(PlayerPedId())
                            
                            TriggerServerEvent("ed-kelepce:polis-kelepce-tak-takan")
                        else
                            QBCore.Functions.Notify('Kişi Zaten Kelepçeli!')
                        end
                    end, targetPlayerPed)
                else
                    QBCore.Functions.Notify('Yakında Kimse Yok!')
                end
            else
                QBCore.Functions.Notify('Üstünüzde Kelepçe Yok!')
            end
        end, "pkelepce")
    end
end)

RegisterNetEvent("ed-kelepce:polis-kelepce-tak-yakin-oyuncu-client")
AddEventHandler("ed-kelepce:polis-kelepce-tak-yakin-oyuncu-client", function(playerlocation, playerheading, playerCoords, takan)
    local playerPed = PlayerPedId()
    TriggerEvent("chat:forceClose")
    konumaldir(playerPed, playerlocation, playerheading, playerCoords)
    
    Wait(4550)
    loadAnimDict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)  -- Eller Arakada Kelepçeli Anim
    poliskelepceledi = true
    poliskelepceledi = true

end) 

RegisterNetEvent("ed-kelepce:client:anim-cancel")
AddEventHandler("ed-kelepce:client:anim-cancel", function()
    Wait(5300)
    ClearPedTasksImmediately(PlayerPedId())
end)

-- Polis Kelepçe çöz
RegisterNetEvent("ed-kelepce:polis-kelepce-coz-client")
AddEventHandler("ed-kelepce:polis-kelepce-coz-client", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 1.5 then
                local targetPlayerPed = GetPlayerServerId(closestPlayer)  
                QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                    if data.pkelepce then
                        playerPed = PlayerPedId()
                        kordinat()
                        TriggerServerEvent("ed-kelepce:polis-kelepce-coz-takilan", targetPlayerPed, playerlocation, playerheading, playerCoords)
                        uncuffSound()
                        loadAnimDict('mp_arresting')
                        TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
                        TriggerServerEvent("ed-kelepce:polis-kelepce-coz-takan")
                        Wait(6000)
                        ClearPedTasksImmediately(playerPed)
                    elseif data.kelepce then
                        QBCore.Functions.Notify('Elinizdeki Anahtar Bu Kelepçenin Değil!')
                    elseif not data.pkelepce or not data.kelepce then
                        QBCore.Functions.Notify('Kişi Zaten Kelepçeli Değil!')
                    end
                end, targetPlayerPed)
            else
                QBCore.Functions.Notify('Yakında Kimse Yok!')
            end
        else
            QBCore.Functions.Notify('Üstünüzde Anahtar Yok!')
        end 
    end, "pkelepceanahtar")
end)

RegisterNetEvent("ed-kelepce:polis-kelepce-coz-yakin-oyuncu-client")
AddEventHandler("ed-kelepce:polis-kelepce-coz-yakin-oyuncu-client", function(playerlocation, playerheading, playerCoords)
    local playerPed = PlayerPedId()
    konumaldir(playerPed, playerlocation, playerheading, playerCoords)
    loadAnimDict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Wait(6000)
    poliskelepceledi = false
    ClearPedTasksImmediately(playerPed)
end) 

-- Normal Kelepçeleme
RegisterNetEvent("ed-kelepce:kelepce-tak-client")
AddEventHandler("ed-kelepce:kelepce-tak-client", function()
  if sistemAktif then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
            if HasItem then
                local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
                if closestPlayer ~= -1 and closestDistance <= 1.5 then
                    local targetPlayerPed = GetPlayerServerId(closestPlayer)  
                    QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                        if not data.kelepce and not data.pkelepce then
                            playerPed = PlayerPedId()
                            kordinat()
                            TriggerServerEvent("ed-kelepce:kelepce-tak-takilan", targetPlayerPed, playerlocation, playerheading, playerCoords)
                            Wait(200)
                            handcuffSound()
                            loadAnimDict("mp_arrest_paired")
                            TaskPlayAnim(playerPed, 'mp_arrest_paired', 'cop_p2_back_right', 8.0, -8,3750, 2, 0, 0, 0, 0) -- Kelepce Takma
                            TriggerServerEvent("ed-kelepce:kelepce-tak-takan")
                            benkelepceledim = true
                        else
                            QBCore.Functions.Notify('Kişi Zaten Kelepçeli!')
                        end
                    end, targetPlayerPed)
                else
                    QBCore.Functions.Notify('Yakında Kimse Yok!')
                end
            else
                QBCore.Functions.Notify('Üstünüzde Kelepçe Yok!')
            end 
        end, "kelepce")
    end
end)

RegisterNetEvent("ed-kelepce:kelepce-tak-yakin-oyuncu-client")
AddEventHandler("ed-kelepce:kelepce-tak-yakin-oyuncu-client", function(playerlocation, playerheading, playerCoords, takan)
    local playerPed = PlayerPedId()
    TriggerEvent("chat:forceClose")
    konumaldir(playerPed, playerlocation, playerheading, playerCoords)

    loadAnimDict("mp_arrest_paired")
    TaskPlayAnim(PlayerPedId(), 'mp_arrest_paired', 'crook_p2_back_right', 8.0, -8, 3750 , 2, 0, 0, 0, 0) -- Kelepçelenme Anim
    Wait(5000)
    loadAnimDict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)  -- Eller Arakada Kelepçeli Anim
    oyuncukelepceledi = true

end) 

-- Normal Kelepçe çöz
RegisterNetEvent("ed-kelepce:kelepce-coz-client")
AddEventHandler("ed-kelepce:kelepce-coz-client", function()
    QBCore.Functions.TriggerCallback('QBCore:HasItem', function(HasItem)
        if HasItem then
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
            if closestPlayer ~= -1 and closestDistance <= 1.5 then
                local targetPlayerPed = GetPlayerServerId(closestPlayer)  
                QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                    if data.kelepce and benkelepceledim then
                        playerPed = PlayerPedId()
                        kordinat()
                        TriggerServerEvent("ed-kelepce:kelepce-coz-takilan", targetPlayerPed, playerlocation, playerheading, playerCoords)
                        uncuffSound()
                        loadAnimDict('mp_arresting')
                        TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'a_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
                        TriggerServerEvent("ed-kelepce:kelepce-coz-takan")
                        Wait(6000)
                        ClearPedTasksImmediately(playerPed)

                    elseif not data.pkelepce and not data.kelepce then
                        QBCore.Functions.Notify('Kişi Zaten Kelepçeli Değil!')
                    elseif data.pkelepce or not benkelepceledim then
                        QBCore.Functions.Notify('Elinizdeki Anahtar Bu Kelepçenin Değil!')
                    end
                end, targetPlayerPed)
            else
                QBCore.Functions.Notify('Yakında Kimse Yok!')
            end
        else
            QBCore.Functions.Notify('Üstünüzde Anahtar Yok!')
        end
    end, "kelepceanahtar")
end)

RegisterNetEvent("ed-kelepce:kelepce-coz-yakin-oyuncu-client")
AddEventHandler("ed-kelepce:kelepce-coz-yakin-oyuncu-client", function(playerlocation, playerheading, playerCoords)
    playerPed = PlayerPedId()
    konumaldir(playerPed, playerlocation, playerheading, playerCoords)
    loadAnimDict('mp_arresting')
    TaskPlayAnim(PlayerPedId(), 'mp_arresting', 'b_uncuff', 8.0, -8,-1, 2, 0, 0, 0, 0)
    Wait(6000)
    oyuncukelepceledi = false
    ClearPedTasksImmediately(playerPed)
 
end) 

-- Kelepçeli Oyuncuyu Taşı
RegisterNetEvent("ed-kelepce:tasi")
AddEventHandler("ed-kelepce:tasi", function()
    if sistemAktif then
        local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 1.5 then
            local targetPlayerPed = GetPlayerServerId(closestPlayer) 
            QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                if data.pkelepce or data.kelepce or data.isDead or data.inLastStand then
                    TriggerServerEvent("ed-kelepce:tasi-target-server", targetPlayerPed)
                end
            end, targetPlayerPed) 
        end  
    end
end)

RegisterNetEvent('ed-kelepce:tasi-target-client')
AddEventHandler('ed-kelepce:tasi-target-client', function(copId)
    dragStatus.isDragged = not dragStatus.isDragged
    dragStatus.CopId = copId
    
    local playerPed = PlayerPedId()
    if dragStatus.isDragged then
        targetPed = GetPlayerPed(GetPlayerFromServerId(dragStatus.CopId))

        if not IsPedSittingInAnyVehicle(targetPed) then
            AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        else
            dragStatus.isDragged = false
            DetachEntity(playerPed, true, false)
        end

        if IsPedDeadOrDying(targetPed, true) then
            dragStatus.isDragged = false
            DetachEntity(playerPed, true, false)
        end
    else
        DetachEntity(playerPed, true, false)
    end
end)

-- Araç İçine Koyma
RegisterNetEvent("ed-kelepce:arac")
AddEventHandler("ed-kelepce:arac", function()
    if sistemAktif then
        local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 3.0 then
            local targetPlayerPed = GetPlayerServerId(closestPlayer)
            QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                if data.pkelepce or data.kelepce then
                    TriggerServerEvent("ed-kelepce:arac-ici-koy-server", targetPlayerPed, "normal")
                end
            end, targetPlayerPed) 
        end  
    end
end)

RegisterNetEvent('ed-kelepce:arac-ici-koy-client')
AddEventHandler('ed-kelepce:arac-ici-koy-client', function(type)
    if (type == "dead" and isDead or inLastStand) or (type == "normal" and not isDead) then
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        if not IsPedSittingInAnyVehicle(playerPed) then
            local arac, akordinat = QBCore.Functions.GetClosestVehicle(coords)
            if akordinat < 5 then
                if DoesEntityExist(arac) then
                    local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(arac)

                    for i=maxSeats - 1, 0, -1 do
                        if IsVehicleSeatFree(arac, i) then
                            freeSeat = i
                            break
                        end
                    end

                    if freeSeat then
                        TriggerEvent("ed-kucak:yaralibindir")
                        TaskWarpPedIntoVehicle(playerPed, arac, freeSeat)
                        dragStatus.isDragged = false
                    end
                end
            end
        else
            ClearPedSecondaryTask(playerPed)
            SetEntityCoords(playerPed, coords.x, coords.y, coords.z + 1)
        end
    end
end)

-- Chat Komutları
RegisterNetEvent("ed-kelepce:client:tasi")
AddEventHandler("ed-kelepce:client:tasi", function()
    TriggerEvent("ed-kelepce:tasi")
end) 

RegisterNetEvent("ed-kelepce:client:arac")
AddEventHandler("ed-kelepce:client:arac", function()
    TriggerEvent("ed-kelepce:arac")
end) 

RegisterNetEvent("ed-kelepce:client:ybindir")
AddEventHandler("ed-kelepce:client:ybindir", function()
    if sistemAktif then
        local playerPed = PlayerPedId()
        if not IsPedInAnyVehicle(playerPed) then
            local closestPlayer, closestDistance = QBCore.Functions.GetClosestPlayer()
            local targetPlayerPed = GetPlayerServerId(closestPlayer)
            QBCore.Functions.TriggerCallback('ed-kelepce:target-kontrol', function(data)
                if data.isDead or data.inLastStand then
                    if closestPlayer ~= -1 and closestDistance <= 3.0 then
                        ClearPedSecondaryTask(playerPed)
                        TriggerServerEvent("ed-kelepce:arac-ici-koy-server", GetPlayerServerId(closestPlayer), "normal") 
                    end 
                end
            end, targetPlayerPed)
        else
          QBCore.Functions.Notify("Araç İçindeki İken Bu İşlemi Gerçekleştiremezsin") 
        end
    end
end)

function uncuffSound()
    Wait(700)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1.5, 'uncuff', 1.0)
end

function handcuffSound()
    Wait(100)
    TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 1.5, 'handcuff', 1.0)
end

function kordinat()
    playerheading = GetEntityHeading(playerPed)
    playerlocation = GetEntityForwardVector(playerPed)
    playerCoords = GetEntityCoords(playerPed)
end

function konumaldir(playerPed, playerlocation, playerheading, playerCoords)
    SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true) -- unarm player
    local x, y, z = table.unpack(playerCoords + playerlocation * 0.95)
    SetEntityCoords(PlayerPedId(), x, y, z - 1.0)
    SetEntityHeading(PlayerPedId(), playerheading)
end 