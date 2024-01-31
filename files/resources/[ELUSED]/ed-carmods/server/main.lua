local QBCore = exports['qb-core']:GetCoreObject()

-- ITEM CHECKS --
AddEventHandler('onResourceStart', function(r) if GetCurrentResourceName() ~= r then return end
	local itemcheck = true
	--Check crafting recipes and their ingredients
	if Config.Crafting then
		for k, v in pairs(Crafting) do for i = 1, #v do for l, b in pairs(v[i]) do if l ~= "amount" and l ~= "job" then
			if not QBCore.Shared.Items[l] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..l.."^7'") itemcheck = false end
			for j in pairs(b) do if not QBCore.Shared.Items[j] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..j.."^7'") itemcheck = false end	end	end	end	end
		end
	end
	-- Check Stores for missing items
	if Config.Stores then
		for k,v in pairs(Stores) do
			for i = 1, #v.items do if not QBCore.Shared.Items[v.items[i].name] then print("^5Debug^7: ^3onResourceStart^7: ^2Missing Item from ^4Shared^7.^4Items^7: '^6"..v.items[i].name.."^7'") itemcheck = false end end
		end
	end
	--Success message if all there.
	if Config.Debug and itemcheck then print("^5Debug^7: ^3onResourceStart^7: ^2All items found in the shared^7!") end
end)

RegisterNetEvent('ed-carmods:RemoveItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
end)

--========================================================== Engines
RegisterNetEvent('ed-carmods:server:removeSuspension', function(level, current)
    local Player = QBCore.Functions.GetPlayer(source)
	if level ~= nil then
		Player.Functions.RemoveItem("suspension"..level+1, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["suspension"..level+1], "remove", 1)
	end
	if current ~= -1 then
		Player.Functions.AddItem("suspension"..current+1, 1, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["suspension"..current+1], "add", 1)
	end
end)

for i = 1, 4 do
	QBCore.Functions.CreateUseableItem("suspension"..i, function(source, item) TriggerClientEvent("ed-carmods:client:applySuspension", source, i-1) end)
end

--========================================================== Engines
RegisterNetEvent('ed-carmods:server:removeEngines', function(level, current)
    local Player = QBCore.Functions.GetPlayer(source)
	if level ~= nil then
		Player.Functions.RemoveItem("engine"..level+1, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["engine"..level+1], "remove", 1)
	end
	if current ~= -1 then
		Player.Functions.AddItem("engine"..current+1, 1, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["engine"..current+1], "add", 1)
	end
end)

for i = 1, 4 do
	QBCore.Functions.CreateUseableItem("engine"..i, function(source, item) TriggerClientEvent("ed-carmods:client:applyEngine", source, i-1) end)
end
--========================================================== Brakes
RegisterNetEvent('ed-carmods:server:removeBrakes', function(level, current)
    local Player = QBCore.Functions.GetPlayer(source)
	if level ~= nil then
		Player.Functions.RemoveItem("brakes"..level+1, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["brakes"..level+1], "remove", 1)
	end
	if current ~= -1 then
		Player.Functions.AddItem("brakes"..current+1, 1, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["brakes"..current+1], "add", 1)
	end
end)

for i = 1, 3 do
	QBCore.Functions.CreateUseableItem("brakes"..i, function(source, item) TriggerClientEvent("ed-carmods:client:applyBrakes", source, i-1) end)
end
--========================================================== Transmission
RegisterNetEvent('ed-carmods:server:removeTransmission', function(level, current)
    local Player = QBCore.Functions.GetPlayer(source)
	if level ~= nil then
		Player.Functions.RemoveItem('transmission'..level+1, 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["transmission"..level+1], "remove", 1)
	end
	if current ~= -1 then
		Player.Functions.AddItem('transmission'..current+1, 1, false, {["quality"] = nil})
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items["transmission"..current+1], "add", 1)
	end
end)

for i = 1, 3 do
	QBCore.Functions.CreateUseableItem("transmission"..i, function(source, item) TriggerClientEvent("ed-carmods:client:applyTransmission", source, i-1) end)
end
--========================================================== Armour
RegisterNetEvent('ed-carmods:server:removeArmour', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('car_armor', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['car_armor'], "remove", 1)
end)

RegisterNetEvent('ed-carmods:server:giveArmour', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('car_armor', 1, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['car_armor'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("car_armor", function(source, item) TriggerClientEvent('ed-carmods:client:applyArmour', source) end)
--========================================================== Turbo
RegisterNetEvent('ed-carmods:server:removeTurbo', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('turbo', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['turbo'], "remove", 1)
end)

RegisterNetEvent('ed-carmods:server:giveTurbo', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('turbo', 1, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['turbo'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("turbo", function(source, item) TriggerClientEvent("ed-carmods:client:applyTurbo", source) end)
--========================================================== BulletProof Tires
RegisterNetEvent('ed-carmods:server:removeBulletProof', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('bprooftires', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bprooftires'], "remove", 1)
end)

RegisterNetEvent('ed-carmods:server:giveBulletProof', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('bprooftires', 1, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['bprooftires'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("bprooftires", function(source, item) TriggerClientEvent("ed-carmods:client:applyBulletProof", source) end)
--========================================================== Drift Tires
RegisterNetEvent('ed-carmods:server:removeDrift', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('drifttires', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drifttires'], "remove", 1)
end)

RegisterNetEvent('ed-carmods:server:giveDrift', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('drifttires', 1, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['drifttires'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("drifttires", function(source, item) TriggerClientEvent("ed-carmods:client:applyDrift", source) end)
--========================================================== NOS
RegisterNetEvent('ed-carmods:server:removeNOS', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('nos', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nos'], "remove", 1)
end)
RegisterNetEvent('ed-carmods:server:giveNOS', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('noscan', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['noscan'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("nos", function(source, item) TriggerClientEvent("ed-carmods:client:applyNOS", source) end)
--========================================================== Headlights & Underglow
RegisterNetEvent('ed-carmods:server:removeXenon', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('headlights', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['headlights'], "remove", 1)
end)

RegisterNetEvent('ed-carmods:server:giveXenon', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.AddItem('headlights', 1, false, {["quality"] = nil})
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['headlights'], "add", 1)
end)

QBCore.Functions.CreateUseableItem("headlights", function(source, item) TriggerClientEvent("ed-carmods:client:applyXenons", source) end)

QBCore.Functions.CreateUseableItem("underglow_controller", function(source, item) TriggerClientEvent('ed-carmods:client:neonMenu', source) end)

--========================================================== Toolbox
QBCore.Functions.CreateUseableItem("toolbox", function(source, item) TriggerClientEvent('ed-carmods:client:Menu', source) end)

--========================================================== REPAIR
QBCore.Functions.CreateUseableItem("mechanic_tools", function(source, item) TriggerClientEvent('ed-carmods:client:Repair:Check', source) end)

--========================================================== Seats
QBCore.Functions.CreateUseableItem("seat", function(source, item) TriggerClientEvent('ed-carmods:client:Seat:Check', source) end)

--========================================================== Interior
QBCore.Functions.CreateUseableItem("internals", function(source, item) TriggerClientEvent('ed-carmods:client:Interior:Check', source) end)

--========================================================== Exterior
QBCore.Functions.CreateUseableItem("externals", function(source, item) TriggerClientEvent('ed-carmods:client:Exterior:Check', source) end)

--========================================================== Rims
QBCore.Functions.CreateUseableItem("rims", function(source, item) TriggerClientEvent('ed-carmods:client:Rims:Check', source) end)

--========================================================== Exhaust
QBCore.Functions.CreateUseableItem("exhaust", function(source, item) TriggerClientEvent('ed-carmods:client:Exhaust:Check', source) end)

--========================================================== Horn
QBCore.Functions.CreateUseableItem("horn", function(source, item) TriggerClientEvent('ed-carmods:client:Horn:Check', source) end)

--========================================================== Paints
QBCore.Functions.CreateUseableItem("paintcan", function(source, item) TriggerClientEvent('ed-carmods:client:Paints:Check', source) end)

--========================================================== Livery
QBCore.Functions.CreateUseableItem("livery", function(source, item) TriggerClientEvent('ed-carmods:client:Livery:Check', source) end)

--========================================================== Tire Smoke
QBCore.Functions.CreateUseableItem("tires", function(source, item) TriggerClientEvent('ed-carmods:client:Tires:Check', source) end)

--========================================================== Skirts
QBCore.Functions.CreateUseableItem("skirts", function(source, item) TriggerClientEvent('ed-carmods:client:Skirts:Check', source) end)

--========================================================== Spoiler
QBCore.Functions.CreateUseableItem("spoiler", function(source, item) TriggerClientEvent('ed-carmods:client:Spoilers:Check', source) end)

--========================================================== Roof
QBCore.Functions.CreateUseableItem("roof", function(source, item) TriggerClientEvent('ed-carmods:client:Roof:Check', source) end)

--========================================================== Roof
QBCore.Functions.CreateUseableItem("rollcage", function(source, item) TriggerClientEvent('ed-carmods:client:RollCage:Check', source) end)

--========================================================== Hood
QBCore.Functions.CreateUseableItem("hood", function(source, item) TriggerClientEvent('ed-carmods:client:Hood:Check', source) end)

--========================================================== Bumpers
QBCore.Functions.CreateUseableItem("bumper", function(source, item) TriggerClientEvent('ed-carmods:client:Bumpers:Check', source) end)

--========================================================== Plates
QBCore.Functions.CreateUseableItem("customplate", function(source, item) TriggerClientEvent('ed-carmods:client:Plates:Check', source) end)

--========================================================== Cleaning Car
QBCore.Functions.CreateUseableItem("cleaningkit", function(source, item) TriggerClientEvent('ed-carmods:client:cleanVehicle', source, true) end)

--========================================================== Windowtint

RegisterNetEvent('ed-carmods:server:removeTintSupplies', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('tint_supplies', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tint_supplies'], "remove", 1)
end)

QBCore.Functions.CreateUseableItem("tint_supplies", function(source, item) TriggerClientEvent('ed-carmods:client:Windows:Check', source) end)

--========================================================== REPAIRS

QBCore.Functions.CreateUseableItem("ducttape", function(source, item) TriggerClientEvent("ed-carmods:quickrepair", source) end)

RegisterNetEvent('ed-carmods:server:removeTape', function()
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('ducttape', 1)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ducttape'], "remove", 1)
end)
--========================================================== REPAIRS

QBCore.Functions.CreateCallback('ed-carmods:repairCost',function(source, cb, data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	print(json.encode(data))
	if data.part == Loc[Config.Lan]["repair"].engine then
		local item = Player.Functions.GetItemByName(Config.RepairEngine)
		if item ~= nil and item.amount >= tonumber(data.cost) then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].body then
		local item = Player.Functions.GetItemByName(Config.RepairBody)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].radiator then
		local item = Player.Functions.GetItemByName(Config.RepairRadiator)
		if item ~= nil and item.amount >= tonumber(data.cost) then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
		local item = Player.Functions.GetItemByName(Config.RepairAxle)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].brakes then
		local item = Player.Functions.GetItemByName(Config.RepairBrakes)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].clutch then
		local item = Player.Functions.GetItemByName(Config.RepairClutch)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	elseif data.part == Loc[Config.Lan]["repair"].tank then
		local item = Player.Functions.GetItemByName(Config.RepairFuel)
		if item ~= nil and item.amount >= data.cost then cb(true)
		else cb(false) end
	end
end)

RegisterServerEvent('ed-carmods:ItemRemove', function(data)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if data.part == Loc[Config.Lan]["repair"].engine then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairEngine], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairEngine, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].body then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairBody], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairBody, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].radiator then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairRadiator], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairRadiator, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].driveshaft then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairAxle], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairAxle, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].brakes then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairBrakes], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairBrakes, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].clutch then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairClutch], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairClutch, data.cost)
	elseif data.part == Loc[Config.Lan]["repair"].tank then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[Config.RepairFuel], "remove", data.cost)
		Player.Functions.RemoveItem(Config.RepairFuel, data.cost)
	end
end)