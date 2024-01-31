local oneSync = false
local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function()
	if GetConvar("onesync") ~= 'off' then
		oneSync = true
	end
end)

-------------------------- VARS

local Webhook = 'https://discord.com/api/webhooks/1171213314664177704/5xjrC3uKtiYW7n6ELw1eq7x4BHfB9staULghe-Ty9IAsmhImEAW0-78r-uLRVt1FNjUP'
local staffs = {}
local FeedbackTable = {}

-------------------------- NEW FEEDBACK

RegisterNetEvent("ed-report:NewFeedback")
AddEventHandler("ed-report:NewFeedback", function(data)
	local identifierlist = ExtractIdentifiers(source)
	local newFeedback = {
		feedbackid = #FeedbackTable+1,
		playerid = source,
		identifier = identifierlist.license:gsub("license2:", ""),
		subject = data.subject,
		information = data.information,
		category = data.category,
		concluded = false,
		discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
	}

	FeedbackTable[#FeedbackTable+1] = newFeedback

	TriggerClientEvent("ed-report:NewFeedback", -1, newFeedback)

	if Webhook ~= '' then
		newFeedbackWebhook(newFeedback)
	end
end)

-------------------------- FETCH FEEDBACK

RegisterNetEvent("ed-report:FetchFeedbackTable")
AddEventHandler("ed-report:FetchFeedbackTable", function()
	local staff = hasPermission(source)
	if staff then
		staffs[source] = true
		TriggerClientEvent("ed-report:FetchFeedbackTable", source, FeedbackTable, staff, oneSync)
	end
end)

-------------------------- ASSIST FEEDBACK

RegisterNetEvent("ed-report:AssistFeedback")
AddEventHandler("ed-report:AssistFeedback", function(feedbackId, canAssist)
	if staffs[source] then
		if canAssist then
			local id = FeedbackTable[feedbackId].playerid
			if GetPlayerPing(id) > 0 then
				local ped = GetPlayerPed(id)
				local playerCoords = GetEntityCoords(ped)
				local pedSource = GetPlayerPed(source)
				local identifierlist = ExtractIdentifiers(source)
				local assistFeedback = {
					feedbackid = feedbackId,
					discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
				}

				SetEntityCoords(pedSource, playerCoords.x, playerCoords.y, playerCoords.z)
				QBCore.Functions.Notify("Yardımcı Olunuyor. Geri Bildirim ID #"..feedbackId.."", "inform")
				QBCore.Functions.Notify("Yektkili Yanınıza Geldi.", "inform")

				if Webhook ~= '' then
					assistFeedbackWebhook(assistFeedback)
				end
			else
				QBCore.Functions.Notify("Oyuncu artık sunucuda değil!", "error")
			end
			if not FeedbackTable[feedbackId].concluded then
				FeedbackTable[feedbackId].concluded = "assisting"
			end
			TriggerClientEvent("ed-report:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)
		end
	end
end)

-------------------------- CONCLUDE FEEDBACK

RegisterNetEvent("ed-report:FeedbackConclude")
AddEventHandler("ed-report:FeedbackConclude", function(feedbackId, canConclude)
	if staffs[source] then
		local feedback = FeedbackTable[feedbackId]
		local identifierlist = ExtractIdentifiers(source)
		local concludeFeedback = {
			feedbackid = feedbackId,
			discord = "<@"..identifierlist.discord:gsub("discord:", "")..">"
		}

		if feedback then
			if feedback.concluded ~= true or canConclude then
				if canConclude then
					if FeedbackTable[feedbackId].concluded == true then
						FeedbackTable[feedbackId].concluded = false
					else
						FeedbackTable[feedbackId].concluded = true
					end
				else
					FeedbackTable[feedbackId].concluded = true
				end
				TriggerClientEvent("ed-report:FeedbackConclude", -1, feedbackId, FeedbackTable[feedbackId].concluded)

				if Webhook ~= '' then
					concludeFeedbackWebhook(concludeFeedback)
				end
			end
		end
	end
end)

-------------------------- HAS PERMISSION

function hasPermission(id)
	local staff = false

	if Config.QBCore then
		if QBCore.Functions.HasPermission(source, 'god') or QBCore.Functions.HasPermission(source, 'admin') or QBCore.Functions.HasPermission(source, 'mod') or IsPlayerAceAllowed(source, 'command') then
			staff = true
		end
	else
		for i, a in ipairs(Config.AdminList) do
	        for x, b in ipairs(GetPlayerIdentifiers(id)) do
	            if string.lower(b) == string.lower(a) then
	                staff = true
	            end
	        end
	    end
	end

	return staff
end

-------------------------- IDENTIFIERS

function ExtractIdentifiers(id)
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
        xbl = "",
        live = ""
    }

    for i = 0, GetNumPlayerIdentifiers(id) - 1 do
        local playerID = GetPlayerIdentifier(id, i)

        if string.find(playerID, "steam") then
            identifiers.steam = playerID
        elseif string.find(playerID, "ip") then
            identifiers.ip = playerID
        elseif string.find(playerID, "discord") then
            identifiers.discord = playerID
        elseif string.find(playerID, "license") then
            identifiers.license = playerID
        elseif string.find(playerID, "xbl") then
            identifiers.xbl = playerID
        elseif string.find(playerID, "live") then
            identifiers.live = playerID
        end
    end

    return identifiers
end

-------------------------- NEW FEEDBACK WEBHOOK

function newFeedbackWebhook(data)
	if data.category == 'player_report' then
		category = 'Oyuncu Raporlama'
	elseif data.category == 'question' then
		category = 'Soru'
	else
		category = 'Hata'
	end

	local information = {
		{
			["color"] = Config.NewFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Log',
			},
			["title"] = 'Yeni Rapor #'..data.feedbackid,
			["description"] = '**Kategori:** '..category..'\n**Soru:** '..data.subject..'\n**Açıklama:** '..data.information..'\n\n**ID:** '..data.playerid..'\n**Identifier:** '..data.identifier..'\n**Discord:** '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- ASSIST FEEDBACK WEBHOOK

function assistFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.AssistFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Log',
			},
			["description"] = '**Geri Bildirim #'..data.feedbackid..'** tarafından destekleniyor '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end

-------------------------- CONCLUDE FEEDBACK WEBHOOK

function concludeFeedbackWebhook(data)
	local information = {
		{
			["color"] = Config.ConcludeFeedbackWebhookColor,
			["author"] = {
				["icon_url"] = Config.IconURL,
				["name"] = Config.ServerName..' - Log',
			},
			["description"] = '**Geri Bildirim #'..data.feedbackid..'** tarafından sonuçlandırılmıştır '..data.discord,
			["footer"] = {
				["text"] = os.date(Config.DateFormat),
			}
		}
	}
	PerformHttpRequest(Webhook, function(err, text, headers) end, 'POST', json.encode({username = Config.BotName, embeds = information}), {['Content-Type'] = 'application/json'})
end