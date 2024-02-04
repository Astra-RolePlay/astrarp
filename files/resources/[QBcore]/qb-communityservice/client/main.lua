local isSentenced = false
local communityServiceFinished = false
local actionsRemaining = 0
local availableActions = {}
local disable_actions = false
local vassour_net = nil
local spatula_net = nil

local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	PlayerData = QBCore.Functions.GetPlayerData()
	TriggerEvent("qb-kamu:inCommunityService", PlayerData.metadata.communityservice)
end)

function FillActionTable(last_action)
	while #availableActions < 5 do
		local service_does_not_exist = true

		local random_selection = Config.ServiceLocations[math.random(1,#Config.ServiceLocations)]

		for i = 1, #availableActions do
			if random_selection.coords.x == availableActions[i].coords.x and random_selection.coords.y == availableActions[i].coords.y and random_selection.coords.z == availableActions[i].coords.z then
				service_does_not_exist = false
			end
		end

		if last_action ~= nil and random_selection.coords.x == last_action.coords.x and random_selection.coords.y == last_action.coords.y and random_selection.coords.z == last_action.coords.z then
			service_does_not_exist = false
		end

		if service_does_not_exist then
			table.insert(availableActions, random_selection)
		end
	end
end

RegisterNetEvent('qb-kamu:inCommunityService')
AddEventHandler('qb-kamu:inCommunityService', function(actions_remaining)
	if isSentenced or actions_remaining == 0 then
		return
	end
	actionsRemaining = tonumber(actions_remaining)
	FillActionTable()
	ChangeClothes()
	SetEntityCoords(PlayerPedId(), Config.ServiceLocation)
	isSentenced = true
	communityServiceFinished = false

	while actionsRemaining > 0 and not communityServiceFinished do
		local playerPed = PlayerPedId()
		local mesafe = #(GetEntityCoords(playerPed) - Config.ServiceLocation)
		if mesafe > 45 then
			if IsPedInAnyVehicle(playerPed, false) then
				ClearPedTasksImmediately(playerPed)
			end
			SetEntityCoords(playerPed, Config.ServiceLocation)
			TriggerServerEvent('qb-kamu:extendService')
			actionsRemaining = actionsRemaining + Config.ServiceExtensionOnEscape
			QBCore.Functions.Notify("Kamu cezasından kaçmaya çalıştığın için zorla geri getirildin ve ekstra 5 cezaya daha çarptırıldın")
		end
		Citizen.Wait(20000)
	end

	TriggerServerEvent('qb-kamu:finishCommunityService', QBCore.Key)

	isSentenced = false
end)

RegisterNetEvent('qb-kamu:finishCommunityService')
AddEventHandler('qb-kamu:finishCommunityService', function(source)
	local src = source
	communityServiceFinished = true
	isSentenced = false
    actionsRemaining = 0
	QBCore.Functions.Notify("Kamu cezan sonlandı artık özgürsün!")
	TriggerEvent("illenium-appearance:client:reloadSkin",src)
end)

Citizen.CreateThread(function()
	while true do
		local time = 3000
		if actionsRemaining > 0 and isSentenced then
			time = 1
			draw2dText("~b~".. QBCore.Shared.Round(actionsRemaining) .."~s~ Tane Daha Çöp Toplaman Veya Bahçe Düzenlemesi Yapman Lazım.", { 0.70, 0.955 } )
			DrawAvailableActions()
			DisableViolentActions()

			local pCoords = GetEntityCoords(PlayerPedId())

			for i = 1, #availableActions do
				local distance = GetDistanceBetweenCoords(pCoords, availableActions[i].coords, true)

				if distance < 1.5 then
					QBCore.Functions.DrawText3D(pCoords.x,pCoords.y,pCoords.z, "[E] Temizle")

					if(IsControlJustReleased(1, 38))then
						-- disable_actions = true
						tmp_action = availableActions[i]
						RemoveAction(tmp_action)
						FillActionTable(tmp_action)	
						if (tmp_action.type == "cleaning") then
							local broomModel = `prop_tool_broom`
                            RequestModel(broomModel)
                            while not HasModelLoaded(broomModel) do
                                Wait(1)
                            end
                            BroomObject = CreateObject(broomModel, 1.0, 1.0, 1.0, 1, 1, 0)
                            local bone1 = GetPedBoneIndex(PlayerPedId(), 28422)
                            AttachEntityToEntity(BroomObject, PlayerPedId(), bone1, -0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
                            isWorking = true
                            QBCore.Functions.Progressbar("work_electric", "Temizliyorsun..", math.random(5000, 10000), false, true, {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,

                            }, {
                                animDict = "anim@amb@drug_field_workers@rake@male_a@base",
                                anim = "base",
                                flags = 9,

                                Prop = "prop_tool_broom",
                                PropBone = 28422,
                                PropPlacement = {-0.0100, 0.0400, -0.0300, 0.0, 0.0, 0.0},

                            }, {}, {}, function()
                                Shown = false
                                inDistance = false
                                isWorking = false
                                DeleteEntity(BroomObject) -- Removes the Broom From Hands
                                StopAnimTask(PlayerPedId(), "anim@amb@drug_field_workers@rake@male_a@base", "base", 1.0)

								-- disable_actions = false	
								TriggerServerEvent('qb-kamu:completeService')
								actionsRemaining = actionsRemaining - 1

                            end, function()
                                isWorking = false
                                StopAnimTask(PlayerPedId(), "anim@amb@drug_field_workers@rake@male_a@base", "base", 1.0)
                                ClearPedTasks(PlayerPedId())
								Shown = false
                                inDistance = false
                                isWorking = false
                                DeleteEntity(BroomObject) -- Removes the Broom From Hands
                                StopAnimTask(PlayerPedId(), "anim@amb@drug_field_workers@rake@male_a@base", "base", 1.0)

                            end, "fa-solid fa-broom")
						end

						if (tmp_action.type == "gardening") then
							local cSCoords = GetOffsetFromEntityInWorldCoords(GetPlayerPed(PlayerId()), 0.0, 0.0, -5.0)
							local spatulaspawn = CreateObject(`bkr_prop_coke_spatula_04`, cSCoords.x, cSCoords.y, cSCoords.z, 1, 1, 1)
							local netid = ObjToNet(spatulaspawn)

							TaskStartScenarioInPlace(PlayerPedId(), "world_human_gardener_plant", 0, false)
							AttachEntityToEntity(spatulaspawn,GetPlayerPed(PlayerId()),GetPedBoneIndex(GetPlayerPed(PlayerId()), 28422),-0.005,0.0,0.0,190.0,190.0,-50.0,1,1,0,1,0,1)
							spatula_net = netid

							Citizen.Wait(14000)
							disable_actions = false
							DetachEntity(NetToObj(spatula_net), 1, 1)
							DeleteEntity(NetToObj(spatula_net))
							spatula_net = nil
							ClearPedTasks(PlayerPedId())
						end

						if actionsRemaining == 0 then
							QBCore.Functions.Notify("Kamu cezanı tamamladın", "success")
						end

					end
				end
			end
		end
		Citizen.Wait(time)
	end
end)

function RemoveAction(action)
	local action_pos = -1

	for i=1, #availableActions do
		if action.coords.x == availableActions[i].coords.x and action.coords.y == availableActions[i].coords.y and action.coords.z == availableActions[i].coords.z then
			action_pos = i
		end
	end

	if action_pos ~= -1 then
		table.remove(availableActions, action_pos)
	end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function DrawAvailableActions()
	for i = 1, #availableActions do
		DrawMarker(21, availableActions[i].coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, 0.5, 0.5, 50, 50, 204, 100, false, true, 2, true, false, false, false)
	end
end

function DisableViolentActions()
	local playerPed = PlayerPedId()

	if disable_actions == true then
		DisableAllControlActions(0)
	end

	RemoveAllPedWeapons(playerPed, true)

	DisableControlAction(2, 37, true) -- disable weapon wheel (Tab)
	DisablePlayerFiring(playerPed,true) -- Disables firing all together if they somehow bypass inzone Mouse Disable
    DisableControlAction(0, 106, true) -- Disable in-game mouse controls
    DisableControlAction(0, 140, true)
	DisableControlAction(0, 141, true)
	DisableControlAction(0, 142, true)

	if IsDisabledControlJustPressed(2, 37) then --if Tab is pressed, send error message
		SetCurrentPedWeapon(playerPed,`WEAPON_UNARMED`,true) -- if tab is pressed it will set them to unarmed (this is to cover the vehicle glitch until I sort that all out)
	end

	if IsDisabledControlJustPressed(0, 106) then --if LeftClick is pressed, send error message
		SetCurrentPedWeapon(playerPed,`WEAPON_UNARMED`,true) -- If they click it will set them to unarmed
	end
end

function draw2dText(text, pos)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextScale(0.45, 0.45)
	SetTextColour(255, 255, 255, 255)
	SetTextDropShadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()

	BeginTextCommandDisplayText('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(table.unpack(pos))
end

function ChangeClothes(type)
    local PlayerPed = PlayerPedId()
    Citizen.Wait(1000)
        if GetEntityModel(PlayerPedId()) == 1885233650 then
            for k, v in pairs(Config.Clothes.male) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
            SetPedPropIndex(PlayerPed, 0, 145, 1, true)
        else
            for k, v in pairs(Config.Clothes.female) do
                SetPedComponentVariation(PlayerPed, v["component_id"], v["drawable"], v["texture"], 0)
            end
            SetPedPropIndex(PlayerPed, 0, 144, 1, true)
        end

    Citizen.Wait(1000)
    ClearPedTasks(PlayerPed)
end