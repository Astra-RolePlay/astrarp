local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	Wait(1000)
	TriggerServerEvent("ed-report:FetchFeedbackTable")
end)

-------------------------- VARS

local oneSync = false
local staff = false
local FeedbackTable = {}
local canFeedback = true
local timeLeft = Config.FeedbackCooldown

-------------------------- COMMANDS

RegisterCommand(Config.FeedbackClientCommand, function(source, args, rawCommand)
	if canFeedback then
		FeedbackMenu(false)
	else
		QBCore.Functions.Notify(Config.FeedbackCooldown.." Dakikada bir rapor gönderebilirsiniz.", "error")
	end
end, false)

RegisterCommand(Config.FeedbackAdminCommand, function(source, args, rawCommand)
	if staff then
		FeedbackMenu(true)
	end
end, false)

-------------------------- MENU

function FeedbackMenu(showAdminMenu)
	SetNuiFocus(true, true)
	if showAdminMenu then
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
		SendNUIMessage({
			action = "OpenAdminFeedback",
		})
	else
		SendNUIMessage({
			action = "ClientFeedback",
		})
	end
end

-------------------------- EVENTS

RegisterNetEvent('ed-report:NewFeedback')
AddEventHandler('ed-report:NewFeedback', function(newFeedback)
	if staff then
		FeedbackTable[#FeedbackTable+1] = newFeedback
		QBCore.Functions.Notify("[Yeni Rapor] Birisinin yardıma ihtiyacı var!", "inform")
		SendNUIMessage({
			action = "updateFeedback",
			FeedbackTable = FeedbackTable
		})
	end
end)

RegisterNetEvent('ed-report:FetchFeedbackTable')
AddEventHandler('ed-report:FetchFeedbackTable', function(feedback, admin, oneS)
	FeedbackTable = feedback
	staff = admin
	oneSync = oneS
end)

RegisterNetEvent('ed-report:FeedbackConclude')
AddEventHandler('ed-report:FeedbackConclude', function(feedbackID, info)
	local feedbackid = FeedbackTable[feedbackID]
	feedbackid.concluded = info

	SendNUIMessage({
		action = "updateFeedback",
		FeedbackTable = FeedbackTable
	})
end)

-------------------------- ACTIONS

RegisterNUICallback("action", function(data)
	if data.action ~= "concludeFeedback" then
		SetNuiFocus(false, false)
	end

	if data.action == "newFeedback" then
		QBCore.Functions.Notify("Raporunuz başarıyla gönderildi!", "success")
		
		local feedbackInfo = {subject = data.subject, information = data.information, category = data.category}
		TriggerServerEvent("ed-report:NewFeedback", feedbackInfo)

		local time = Config.FeedbackCooldown * 60
		local pastTime = 0
		canFeedback = false

		while (time > pastTime) do
			Citizen.Wait(1000)
			pastTime = pastTime + 1
			timeLeft = time - pastTime
		end
		canFeedback = true
	elseif data.action == "assistFeedback" then
		if FeedbackTable[data.feedbackid] then
			if oneSync then
				TriggerServerEvent("ed-report:AssistFeedback", data.feedbackid, true)
			else
				local playerFeedbackID = FeedbackTable[data.feedbackid].playerid
				local playerID = GetPlayerFromServerId(playerFeedbackID)
				local playerOnline = NetworkIsPlayerActive(playerID)
				if playerOnline then
					SetEntityCoords(PlayerPedId(), GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerFeedbackID))))
					TriggerServerEvent("ed-report:AssistFeedback", data.feedbackid, true)
				else
					QBCore.Functions.Notify("Oyuncu artık sunucuda değil!", "error")
				end
			end
		end
	elseif data.action == "concludeFeedback" then
		local feedbackID = data.feedbackid
		local canConclude = data.canConclude
		local feedbackInfo = FeedbackTable[feedbackID]
		if feedbackInfo then
			if feedbackInfo.concluded ~= true or canConclude then
				TriggerServerEvent("ed-report:FeedbackConclude", feedbackID, canConclude)
				QBCore.Functions.Notify("#"..feedbackID.." Rapor başarılıyla tamamlandı.", "success")
			end
		end
	end
end)