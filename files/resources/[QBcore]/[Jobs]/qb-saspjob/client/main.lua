-- Variables
QBCore = exports['qb-core']:GetCoreObject()
isHandcuffed = false
cuffType = 1
isEscorted = false
PlayerJob = {}
local DutyBlips = {}

-- Functions
local function CreateDutyBlips(playerId, playerLabel, playerJob, playerLocation)
    local ped = GetPlayerPed(playerId)
    local blip = GetBlipFromEntity(ped)
    if not DoesBlipExist(blip) then
        if NetworkIsPlayerActive(playerId) then
            blip = AddBlipForEntity(ped)
        else
            blip = AddBlipForCoord(playerLocation.x, playerLocation.y, playerLocation.z)
        end
        SetBlipSprite(blip, 1)
        ShowHeadingIndicatorOnBlip(blip, true)
        SetBlipRotation(blip, math.ceil(playerLocation.w))
        SetBlipScale(blip, 0.6)
        if playerJob == "sasp" then
            SetBlipColour(blip, 38)
        else
            SetBlipColour(blip, 5)
        end
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString(playerLabel)
        EndTextCommandSetBlipName(blip)
        DutyBlips[#DutyBlips+1] = blip
    end

    if GetBlipFromEntity(PlayerPedId()) == blip then
        -- Ensure we remove our own blip.
        RemoveBlip(blip)
    end
end

-- Events
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local player = QBCore.Functions.GetPlayerData()
    PlayerJob = player.job
    isHandcuffed = false
    TriggerServerEvent("sheriff:server:SetHandcuffStatus", false)
    TriggerServerEvent("sheriff:server:UpdateCurrentCops")

    if player.metadata.tracker then
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = 13,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    else
        local trackerClothingData = {
            outfitData = {
                ["accessory"] = {
                    item = -1,
                    texture = 0
                }
            }
        }
        TriggerEvent('qb-clothing:client:loadOutfit', trackerClothingData)
    end

    if PlayerJob and PlayerJob.name ~= "sasp" then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    TriggerServerEvent("sheriff:server:SetHandcuffStatus", false)
    TriggerServerEvent("sheriff:server:UpdateCurrentCops")
    isHandcuffed = false
    isEscorted = false
    PlayerJob = {}
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    if DutyBlips then
        for _, v in pairs(DutyBlips) do
            RemoveBlip(v)
        end
        DutyBlips = {}
    end
end)

RegisterNetEvent("QBCore:Client:SetDuty", function(newDuty)
    PlayerJob.onduty = newDuty
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    if JobInfo.name ~= "sasp" then
        if DutyBlips then
            for _, v in pairs(DutyBlips) do
                RemoveBlip(v)
            end
        end
        DutyBlips = {}
    end
    PlayerJob = JobInfo
end)

RegisterNetEvent('sheriff:client:sendBillingMail', function(amount)
    SetTimeout(math.random(2500, 4000), function()
        local gender = Lang:t('info.mr')
        if QBCore.Functions.GetPlayerData().charinfo.gender == 1 then
            gender = Lang:t('info.mrs')
        end
        local charinfo = QBCore.Functions.GetPlayerData().charinfo
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = Lang:t('email.sender'),
            subject = Lang:t('email.subject'),
            message = Lang:t('email.message', {value = gender, value2 = charinfo.lastname, value3 = amount}),
            button = {}
        })
    end)
end)

RegisterNetEvent('sheriff:client:policeAlert', function(coords, text)
    local street1, street2 = GetStreetNameAtCoord(coords.x, coords.y, coords.z)
    local street1name = GetStreetNameFromHashKey(street1)
    local street2name = GetStreetNameFromHashKey(street2)
    QBCore.Functions.Notify({text = text, caption = street1name.. ' ' ..street2name}, 'sasp')
    PlaySound(-1, "Lose_1st", "GTAO_FM_Events_Soundset", 0, 0, 1)
    local transG = 250
    local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blip2 = AddBlipForCoord(coords.x, coords.y, coords.z)
    local blipText = Lang:t('info.blip_text', {value = text})
    SetBlipSprite(blip, 60)
    SetBlipSprite(blip2, 161)
    SetBlipColour(blip, 1)
    SetBlipColour(blip2, 1)
    SetBlipDisplay(blip, 4)
    SetBlipDisplay(blip2, 8)
    SetBlipAlpha(blip, transG)
    SetBlipAlpha(blip2, transG)
    SetBlipScale(blip, 0.7)
    SetBlipScale(blip2, 2.0)
    SetBlipAsShortRange(blip, false)
    SetBlipAsShortRange(blip2, false)
    PulseBlip(blip2)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString(blipText)
    EndTextCommandSetBlipName(blip)
    while transG ~= 0 do
        Wait(180 * 4)
        transG = transG - 1
        SetBlipAlpha(blip, transG)
        SetBlipAlpha(blip2, transG)
        if transG == 0 then
            RemoveBlip(blip)
            return
        end
    end
end)

RegisterNetEvent('sheriff:client:SendToJail', function(time)
    TriggerServerEvent("sheriff:server:SetHandcuffStatus", false)
    isHandcuffed = false
    isEscorted = false
    ClearPedTasks(PlayerPedId())
    DetachEntity(PlayerPedId(), true, false)
    TriggerEvent("prison:client:Enter", time)
end)

RegisterNetEvent('sheriff:client:SendPoliceEmergencyAlert', function()
    local Player = QBCore.Functions.GetPlayerData()
    
    TriggerServerEvent('sheriff:server:policeAlert', Lang:t('info.officer_down', {lastname = Player.charinfo.lastname, callsign = Player.metadata.callsign}))
    TriggerServerEvent('hospital:server:ambulanceAlert', Lang:t('info.officer_down', {lastname = Player.charinfo.lastname, callsign = Player.metadata.callsign}))
end)

-- Threads
CreateThread(function()
    for _, station in pairs(Config.Locations["stations"]) do
        local blip = AddBlipForCoord(station.coords.x, station.coords.y, station.coords.z)
        SetBlipSprite(blip, 60)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 29)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(station.label)
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    for _, prison in pairs(Config.Locations["prison"]) do
        local blip = AddBlipForCoord(prison.coords.x, prison.coords.y, prison.coords.z)
        SetBlipSprite(blip, 189)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 1)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(prison.label)
        EndTextCommandSetBlipName(blip)
    end
end)

CreateThread(function()
    for _, sherifff in pairs(Config.Locations["sherifff"]) do
        local blip = AddBlipForCoord(sherifff.coords.x, sherifff.coords.y, sherifff.coords.z)
        SetBlipSprite(blip, 60)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.8)
        SetBlipColour(blip, 28)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(sherifff.label)
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    -- Clothes
	exports['qb-target']:AddBoxZone("PD_1C", vector3(461.52, -997.74, 30.69), 5.2, 5.4, { name="PD_1C", heading = 0, debugPoly=false, minZ=26.29, maxZ = 30.29, }, 
	{ options = { { event = "illenium-appearance:client:openClothingShopMenu", icon = "fas fa-tshirt", label = "Kıyafet Dükkanı", job = "sasp" }, },
	  distance = 2.0
	})

	exports['qb-target']:AddBoxZone("PD_2C", vector3(362.31, -1593.37, 25.45), 4.4, 3.8, { name="PD_2C", heading = 320, debugPoly=false, minZ=21.05, maxZ = 25.05, }, 
	{ options = { { event = "illenium-appearance:client:openClothingShopMenu", icon = "fas fa-tshirt", label = "Kıyafet Dükkanı", job = "sasp" }, },
	  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("PD_3C", vector3(853.79, -1312.56, 28.24), 4.6, 3.4, { name="PD_3C", heading = 0, debugPoly=false, minZ=27.24, maxZ = 27.84, }, 
	{ options = { { event = "illenium-appearance:client:openClothingShopMenu", icon = "fas fa-tshirt", label = "Kıyafet Dükkanı", job = "sasp" }, },
	  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("PD_4C", vector3(1840.41, 3679.91, 34.19), 5.0, 4.6, { name="PD_4C", heading = 30, debugPoly=false, minZ=33.09, maxZ = 33.79, }, 
	{ options = { { event = "illenium-appearance:client:openClothingShopMenu", icon = "fas fa-tshirt", label = "Kıyafet Dükkanı", job = "sasp" }, },
	  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("PD_5C", vector3(-438.46, 6010.28, 37.0), 4.2, 4.8, { name="PD_5C", heading = 45, debugPoly=false, minZ=35.90, maxZ = 36.50, }, 
	{ options = { { event = "illenium-appearance:client:openClothingShopMenu", icon = "fas fa-tshirt", label = "Kıyafet Dükkanı", job = "sasp" }, },
	  distance = 2.0
	})

end)

local tekneSpawn = false
RegisterCommand("ptekne", function()
    local PlayerData = QBCore.Functions.GetPlayerData()
	if not tekneSpawn then
		if PlayerData.job.name == "sasp" then
			local PlayerPed = PlayerPedId()
			if IsPedSwimming(PlayerPed) then
				tekneSpawn = true
				local sayi = 5
				while sayi > 0 do
					QBCore.Functions.Notify('Araç '..sayi..' Saniye Sonra Çıkarılacak!')
					sayi = sayi - 1
					Citizen.Wait(1000)
				end

				local coords = GetEntityCoords(PlayerPed)
				QBCore.Functions.SpawnVehicle("smallboat", function(vehicle)
					QBCore.Functions.Notify('Araç Çıkarıldı!')
					SetVehRadioStation(vehicle, "OFF")
					TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
					TriggerEvent('vehiclekeys:client:SetOwner', QBCore.Functions.GetPlate(vehicle))
				end, {x=coords.x + 1, y=coords.y + 1, z=coords.z + 1, h= 90.0 }, true)
				tekneSpawn = false
			else
				QBCore.Functions.Notify('Suda Olman Lazım!', 'error')
			end
        else
            QBCore.Functions.Notify('Polis Değilsin!', 'error')
		end
	end
end)

RegisterCommand('mesai', function()
	TriggerServerEvent("QBCore:ToggleDuty")
end)

RegisterCommand('pdepo', function()
	local plyPed = PlayerPedId()
    plyVeh = GetVehiclePedIsIn(plyPed, false)
	if GetVehicleClass(plyVeh) == 18 then
		TriggerEvent("inventory:client:SetCurrentStash", "Polis-"..QBCore.Functions.GetPlayerData().citizenid, QBCore.Key)
		TriggerServerEvent("inventory:server:OpenInventory", "stash", "Polis-"..QBCore.Functions.GetPlayerData().citizenid,  {
			maxweight = 1000000,
			slots = 20,
		})
	else
		QBCore.Functions.Notify("Polis Aracında Olmalısın!", "error")
	end
end)


CreateThread(function()
	for _,v in pairs(Config.Peds) do
		RequestModel(v.model)
		while not HasModelLoaded(v.model) do Wait(1) end
		v.handle = CreatePed(4, v.model, v.coords.x, v.coords.y, v.coords.z-1.0, v.heading, false, false)
		SetPedFleeAttributes(v.handle, 0, 0)
		SetPedDropsWeaponsWhenDead(v.handle, false)
		SetPedDiesWhenInjured(v.handle, false)
		SetEntityInvincible(v.handle , true)
		FreezeEntityPosition(v.handle, true)
		SetBlockingOfNonTemporaryEvents(v.handle, true)
		if v.anim.type == 1 then
			TaskStartScenarioInPlace(v.handle, v.anim.name, 0, true)
		elseif v.anim.type == 2 then
			RequestAnimDict(v.anim.dict)
			TaskPlayAnim(v.handle, v.anim.dict, v.anim.name, 8.0, 1, -1, 49, 0, false, false, false)
		end
	end
end)