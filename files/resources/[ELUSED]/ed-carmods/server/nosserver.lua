local QBCore = exports['qb-core']:GetCoreObject()

local VehicleNitrous = { }
local nosColour = { }

AddEventHandler('onResourceStart', function(resource) if GetCurrentResourceName() ~= resource then return end
	TriggerEvent("ed-carmods:GetNosUpdate")
	TriggerEvent("ed-carmods:GetNosColourUpdate")
end)

--These events sync the VehicleNitrous table with the server, making them able to be synced with the players
RegisterNetEvent('ed-carmods:server:LoadNitrous', function(Plate)
	VehicleNitrous[Plate] = { hasnitro = 1, level = 100 }
	TriggerClientEvent('ed-carmods:client:LoadNitrous',-1, Plate)
	TriggerEvent('ed-carmods:database:LoadNitro', Plate)
end)

RegisterNetEvent('ed-carmods:server:UnloadNitrous', function(Plate)
	VehicleNitrous[Plate] = nil
	TriggerClientEvent('ed-carmods:client:UnloadNitrous', -1, Plate)
	TriggerEvent('ed-carmods:database:UnloadNitro', Plate)
end)

RegisterNetEvent('ed-carmods:server:UpdateNitroLevel', function(Plate, level)
	VehicleNitrous[Plate] = { hasnitro = 1, level = level }
	TriggerClientEvent('ed-carmods:client:UpdateNitroLevel', -1, Plate, level)
end)

--Event called on script start to grab Database info about nos
RegisterNetEvent("ed-carmods:GetNosUpdate", function()
	local result = MySQL.Sync.fetchAll('SELECT * FROM player_vehicles WHERE hasnitro = ?', {1})
	if result and result[1] then
		for _, v in pairs(result) do
			if Config.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous^7[^6"..tostring(v["plate"]).."^7] = { ^2level ^7= ^6"..tonumber(v["noslevel"]).."^7, ^2hasnitro ^7= ^6"..tostring(v["hasnitro"]).."^7 }") end
			VehicleNitrous[v["plate"]] = { hasnitro = v["hasnitro"], level = tonumber(v["noslevel"]), }
		end
		if Config.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2VehicleNitrous Results Found^7: ^6"..#result.."^7") end
	else if Config.Debug then print("^5Debug^7: ^3GetNosUpdate^7: ^2Checked Database and found no vehicles with NOS^7") end end
end)

--Callback to send Database info to Client
QBCore.Functions.CreateCallback('ed-carmods:GetNosLoaded', function(source, cb) cb(VehicleNitrous) end)

--Database interactions
RegisterNetEvent('ed-carmods:database:LoadNitro', function(Plate) MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ?, hasnitro = ? WHERE plate = ?', {100, true, Plate}) end)
RegisterNetEvent('ed-carmods:database:UnloadNitro', function(plate) MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ?, hasnitro = ? WHERE plate = ?', {0, false, plate}) end)
RegisterNetEvent('ed-carmods:database:UpdateNitroLevel', function(plate, level) MySQL.Async.execute('UPDATE player_vehicles SET noslevel = ? WHERE plate = ?', {level, plate}) end)

--Syncing stuff
RegisterNetEvent('ed-carmods:server:SyncPurge', function(netId, enabled) TriggerClientEvent('ed-carmods:client:SyncPurge', -1, netId, enabled) end)
RegisterNetEvent('ed-carmods:server:SyncTrail', function(netId, enabled) TriggerClientEvent('ed-carmods:client:SyncTrail', -1, netId, enabled) end)
RegisterNetEvent('ed-carmods:server:SyncFlame', function(netId, scale) TriggerClientEvent('ed-carmods:client:SyncFlame', -1, netId, scale) end)

QBCore.Functions.CreateUseableItem("noscolour", function(source, item) TriggerClientEvent("ed-carmods:client:NOS:rgbORhex", source) end)

--Event called on script start to grab Database info about nos
RegisterNetEvent("ed-carmods:GetNosColourUpdate", function()
	local result = MySQL.Sync.fetchAll("SELECT `nosColour`, `plate` FROM `player_vehicles` WHERE 1")
	if result and result[1] then
		for _, v in pairs(result) do
			if v["nosColour"] then
				json.decode(v["nosColour"])
				local newColour = json.decode(v["nosColour"])
				if Config.Debug then print("^5Debug^7: ^3nosColour^7[^6"..tostring(v["plate"]).."^7] = { ^2RBG^7: ^6"..newColour[1].."^7, ^6"..newColour[2].."^7, ^6"..newColour[3].." ^7}") end
				nosColour[v["plate"]] = newColour
			end
		end
	end
end)

--Callback to send Database info to Client
QBCore.Functions.CreateCallback('ed-carmods:GetNosColour', function(source, cb) cb(nosColour) end)

-- This event is to make it so every car's purge colour is synced
-- If you change the colour of the purge on a car, everyone who gets in THAT car will spray this colour
RegisterNetEvent('ed-carmods:server:ChangeColour', function(Plate, newColour)
	nosColour[Plate] = newColour -- Update server side
	TriggerClientEvent('ed-carmods:client:ChangeColour', -1, Plate, newColour) -- Sync the colour per car between players
	TriggerEvent('ed-carmods:database:ChangeColour', Plate, newColour) -- Update Database with new colour
end)

RegisterNetEvent('ed-carmods:database:ChangeColour', function(plate, newColour)
	if Config.Debug then print("Update Purge Colour") end
	MySQL.Async.execute('UPDATE player_vehicles SET nosColour = ? WHERE plate = ?', { json.encode(newColour), plate })
end)