local QBCore = exports['qb-core']:GetCoreObject()

local spawned

local function KnoesDevelopment(notifType, message, title)
	if Config.Framework.Notifications == 'qb' then
		if notifType == 1 then
			QBCore.Functions.Notify(message, 'success')
		elseif notifType == 2 then
			QBCore.Functions.Notify(message, 'primary')
		elseif notifType == 3 then
			QBCore.Functions.Notify(message, 'error')
		end
	elseif Config.Framework.Notifications == 'okok' then
		if notifType == 1 then
			exports['okokNotify']:Alert(title, message, 3000, 'success')
		elseif notifType == 2 then
			exports['okokNotify']:Alert(title, message, 3000, 'info')
		elseif notifType == 3 then
			exports['okokNotify']:Alert(title, message, 3000, 'error')
		end
	elseif Config.Framework.Notifications == 'mythic' then
		if notifType == 1 then
			exports['mythic_notify']:DoHudText('success', message)
		elseif notifType == 2 then
			exports['mythic_notify']:DoHudText('inform', message)
		elseif notifType == 3 then
			exports['mythic_notify']:DoHudText('error', message)
		end
    elseif Config.Framework.Notifications == 'tnj' then
        if notifType == 1 then
            exports['tnj-notify']:Notify(message, 'success', 3000)
		elseif notifType == 2 then
            exports['tnj-notify']:Notify(message, 'primary', 3000)
		elseif notifType == 3 then
            exports['tnj-notify']:Notify(message, 'error', 3000)
		end
	elseif Config.Framework.Notifications == 'chat' then
        TriggerEvent('chatMessage', message)
	end
end

local function SpawnPeds()
    local PedHash = Config.IllegalMedical.PedModel
    RequestModel(PedHash)
    while not HasModelLoaded(PedHash) do
        Citizen.Wait(1)
    end
    local PedCoords = Config.IllegalMedical.Coords
    spawned = CreatePed(3, PedHash, PedCoords.x, PedCoords.y, PedCoords.z - 1, PedCoords.w, false, true)
    local model = spawned
    TaskStartScenarioInPlace(model, "WORLD_HUMAN_STAND_IMPATIENT", 0, true)
    FreezeEntityPosition(model, true)
    SetEntityInvincible(model, true)
    SetBlockingOfNonTemporaryEvents(model, true)
end

local function LoadAnim(ad)
    while not HasAnimDictLoaded(ad) do
        RequestAnimDict(ad)
        Citizen.Wait(1)
    end
end

local function GetClosestHug(coords)
    coords = coords
    local ecoords = GetEntityCoords(spawned)
    local dist = #(coords-ecoords)
    if dist < 2 then
        return spawned
    end
end

CreateThread(function()
    SpawnPeds()
    local alreadyEnteredZone = false
    local text = ' <b>[E] </b> Sarıl'
    while true do
        Citizen.Wait(3)
        local ped = PlayerPedId()
        local inZone = false
        local EntityCoords = GetEntityCoords(ped)
        local model = GetClosestHug(EntityCoords)
        local spawn = GetEntityCoords(model)
        local ehead = GetEntityHeading(model)
        local dist = #(EntityCoords-vector3(spawn.x, spawn.y, spawn.z))
        if dist <= 1.5 then
            inZone = true
            if IsControlJustReleased(0, 38) then
                LoadAnim("mp_ped_interaction")
                local newcoords = GetEntityForwardVector(model) * 0.4 + vector3(spawn.x, spawn.y, spawn.z-1)
                SetEntityCoords(ped, newcoords)
                SetEntityHeading(ped, ehead-180)
                FreezeEntityPosition(ped, true)
                TaskPlayAnim(ped, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
                TaskPlayAnim(model, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
                TriggerServerEvent('hud:server:RelieveStress', 100) -- Relieve Stress
                TriggerServerEvent("ed-buyukanne:server:hug", spawn)
                Citizen.Wait(5000)
                FreezeEntityPosition(ped, false)
                TriggerServerEvent("ed-buyukanne:server:idle", spawn)
                TriggerServerEvent('ed-buyukanne:server:SetResourceCooldown')
            end
        else
            Citizen.Wait(5000)
        end
        if inZone and not alreadyEnteredZone then
            alreadyEnteredZone = true
            if Config.Framework.DrawText.Type == 'qb-core' then
                exports['qb-core']:DrawText(text, Config.Framework.DrawText.Position)
            elseif Config.Framework.DrawText.Type == 'okok' then
                exports['okokTextUI']:Open(text, 'lightgrey', Config.Framework.DrawText.Position)
            end
        end
        if not inZone and alreadyEnteredZone then
            alreadyEnteredZone = false
            if Config.Framework.DrawText.Type == 'qb-core' then
                exports['qb-core']:HideText()
            elseif Config.Framework.DrawText.Type == 'okok' then
                exports['okokTextUI']:Close()
            end
        end
    end
end)

Citizen.CreateThread(function()
    if Config.Framework.Debug == true then
        print('Knoes Development| PED Activated')
    end
    if Config.Framework.Target == 'qb-target' then
        exports['qb-target']:AddBoxZone("ConstantDevelopmentIllegalMedical", Config.IllegalMedicalTarget.Coords, Config.IllegalMedicalTarget.Width, Config.IllegalMedicalTarget.Length, {
            name = "ConstantDevelopmentIllegalMedical",
            heading = Config.IllegalMedicalTarget.Heading,
            debugPoly = Config.IllegalMedicalTarget.DebugPoly,
            minZ = Config.IllegalMedicalTarget.minZ,
            maxZ = Config.IllegalMedicalTarget.maxZ,
        }, {
            options = {
                {
                    num = 1,
                    type = "client",
                    event = "ed-buyukanne:client:MedicalAidInjuries",
                    icon = Config.IllegalMedicalTarget.InjuryTargetIcon,
                    label = Config.IllegalMedicalTarget.InjuryTargetLabel,
                },
                {
                    num = 2,
                    icon = Config.IllegalMedicalTarget.TargetIcon,
                    label = Config.IllegalMedicalTarget.TargetLabel,
                    canInteract = function()
                        if Config.IllegalMedicalTarget.CanInteractLimit then
                            if QBCore.Functions.GetPlayerData().metadata.isdead or QBCore.Functions.GetPlayerData().metadata.inlaststand then
                                TriggerEvent('ed-buyukanne:client:MedicalAid')
                            else
                                KnoesDevelopment(3, "Sen ölmedin", Config.IllegalMedical.OkOkNotificationTitle)
                            end
                        elseif not Config.IllegalMedicalTarget.CanInteractLimit then
                            TriggerEvent('ed-buyukanne:client:MedicalAid')
                        end
                    end,
                }
            },
            distance = Config.IllegalMedicalTarget.TargetDistance
        })
        if Config.Framework.Debug == true then
            print('Knoes Development| Target Activated')
        end
    elseif Config.Framework.Target == 'qtarget' then
        exports['qtarget']:AddBoxZone("ConstantDevelopmentIllegalMedical", Config.IllegalMedicalTarget.Coords, Config.IllegalMedicalTarget.Width, Config.IllegalMedicalTarget.Length, {
            name = "ConstantDevelopmentIllegalMedical",
            heading = Config.IllegalMedicalTarget.Heading,
            debugPoly = Config.IllegalMedicalTarget.DebugPoly,
            minZ = Config.IllegalMedicalTarget.minZ,
            maxZ = Config.IllegalMedicalTarget.maxZ,
        }, {
            options = {
                {
                    num = 1,
                    type = "client",
                    event = "ed-buyukanne:client:MedicalAidInjuries",
                    icon = Config.IllegalMedicalTarget.InjuryTargetIcon,
                    label = Config.IllegalMedicalTarget.InjuryTargetLabel,
                },
                {
                    num = 2,
                    icon = Config.IllegalMedicalTarget.TargetIcon,
                    label = Config.IllegalMedicalTarget.TargetLabel,
                    canInteract = function()
                        if Config.IllegalMedicalTarget.CanInteractLimit then
                            if QBCore.Functions.GetPlayerData().metadata.isdead or QBCore.Functions.GetPlayerData().metadata.inlaststand then
                                TriggerEvent('ed-buyukanne:client:MedicalAid')
                            else
                                KnoesDevelopment(3, "You aren\'t Dead...", Config.IllegalMedical.OkOkNotificationTitle)
                            end
                        elseif not Config.IllegalMedicalTarget.CanInteractLimit then
                            TriggerEvent('ed-buyukanne:client:MedicalAid')
                        end
                    end,
                }
            },
            distance = Config.IllegalMedicalTarget.TargetDistance
        })
        if Config.Framework.Debug == true then
            print('Knoes Development| Target Activated')
        end
    end
end)

RegisterNetEvent('ed-buyukanne:client:hug', function(coords)
    local model = GetClosestHug(coords)
    TaskPlayAnim(model, "mp_ped_interaction", "kisses_guy_a", 8.00, -8.00, 5000, 51, 0.00, 0, 0, 0)
end)

RegisterNetEvent('ed-buyukanne:client:idle', function(coords)
    local model = GetClosestHug(coords)
    TaskPlayAnim(model, "amb@world_human_aa_smoke@male@idle_a", "idle_c", 8.00, -8.00, -1, 51, 0.00, 0, 0, 0)
end)

RegisterNetEvent("ed-buyukanne:client:MedicalAid", function()
    QBCore.Functions.Progressbar('ConstantDevelopmentIllegalGrandmaMedical', Config.IllegalMedical.PedName..' sana yardım ediyor...', math.random(2500, 10000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        if Config.IllegalMedical.Minigame.Enabled == true then
            if Config.IllegalMedical.Minigame.PSUI then
                exports['qb-ui']:Circle(function(success)
                    if success then
                    TriggerServerEvent("ed-buyukanne:server:MedicalAid")
                    else
                        KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                    end
                end, math.random(3, 6), math.random(10, 25))
            elseif Config.IllegalMedical.Minigame.QBCoreSkillBar then
                local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                Skillbar.Start({
                    duration = math.random(1000, 3000),
                    pos = math.random(10, 30),
                    width = math.random(10, 20),
                }, function()
                    TriggerServerEvent("ed-buyukanne:server:MedicalAid")
                end, function()
                    KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                end)
            elseif Config.IllegalMedical.Minigame.QBCoreNPInspiredLock then
                local seconds = math.random(3, 6)
                local Circles = math.random(5, 10)
                local success = exports['qb-lock']:StartLockPickCircle(Circles, seconds)
                if success then
                    TriggerServerEvent("ed-buyukanne:server:MedicalAid")
                else
                    KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                end
            end
        elseif Config.IllegalMedical.Minigame.Enabled == false then
            TriggerServerEvent("ed-buyukanne:server:MedicalAid")
        end
    end, function()
        KnoesDevelopment(3, "Hala oturmadın, ben de sana yardım etmeyi bıraktım...", Config.IllegalMedical.OkOkNotificationTitle)
    end)
end)

RegisterNetEvent("ed-buyukanne:client:MedicalAidInjuries", function()
    QBCore.Functions.Progressbar('ConstantDevelopmentIllegalGrandmaMedical', Config.IllegalMedical.PedName..' sana yardım ediyor...', math.random(2500, 10000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {}, {}, {}, function()
        if Config.IllegalMedical.Minigame.Enabled == true then
            if Config.IllegalMedical.Minigame.PSUI then
                exports['qb-ui']:Circle(function(success)
                    if success then
                        TriggerServerEvent("ed-buyukanne:server:MedicalAidInjuries")
                    else
                        KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                    end
                end, math.random(3, 6), math.random(10, 25))
            elseif Config.IllegalMedical.Minigame.QBCoreSkillBar then
                local Skillbar = exports['qb-skillbar']:GetSkillbarObject()
                Skillbar.Start({
                    duration = math.random(2500, 6000),
                    pos = math.random(10, 30),
                    width = math.random(10, 20),
                }, function()
                    TriggerServerEvent("ed-buyukanne:server:MedicalAidInjuries")
                end, function()
                    KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                end)
            elseif Config.IllegalMedical.Minigame.QBCoreNPInspiredLock then
                local seconds = math.random(5, 10)
                local Circles = math.random(3, 6)
                local success = exports['qb-lock']:StartLockPickCircle(Circles, seconds)
                if success then
                    TriggerServerEvent("ed-buyukanne:server:MedicalAidInjuries")
                else
                    KnoesDevelopment(3, "Mücadelemde başarısız oldun ve benden sana yardım etmemi mi bekliyorsun? Deli misin...", Config.IllegalMedical.OkOkNotificationTitle)
                end
            end
        elseif Config.IllegalMedical.Minigame.Enabled == false then
            TriggerServerEvent("ed-buyukanne:server:MedicalAidInjuries")
        end
    end, function()
        KnoesDevelopment(3, "Hala oturmadın, ben de sana yardım etmeyi bıraktım...", Config.IllegalMedical.OkOkNotificationTitle)
    end)
end)