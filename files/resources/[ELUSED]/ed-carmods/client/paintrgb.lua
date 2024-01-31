local QBCore = exports['qb-core']:GetCoreObject()
--========================================================== Paint

local spraying = false

RegisterNetEvent('ed-carmods:client:RGBApply', function(data)
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local vehicle = getClosest(coords)

	if data.hex then r, g, b = HexTorgb(data.hex) else
	if data.r >= 255 then r = 255 elseif data.r <= 0 then r = 0 else r = data.r end
		if data.g >= 255 then g = 255 elseif data.g <= 0 then g = 0 else g = data.g end
		if data.b >= 255 then b = 255 elseif data.b <= 0 then b = 0 else b = data.b end
	end
	RequestNamedPtfxAsset("scr_recartheft")
	while not HasNamedPtfxAssetLoaded("scr_recartheft") do Citizen.Wait(10) end
	UseParticleFxAssetNextCall("scr_recartheft")
	local spraycan = CreateObject(`ng_proc_spraycan01b`,0.0, 0.0, 0.0,true, false, false)
	AttachEntityToEntity(spraycan, ped, GetPedBoneIndex(ped, 57005), 0.072, 0.041, -0.06, 33.0, 38.0, 0.0, true, true, false, true, 1, true)
	playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_wall_loop_lamar", 6000, 8)
	Wait(1000)
	playAnim("switch@franklin@lamar_tagging_wall", "lamar_tagging_exit_loop_lamar", 6000, 8)
	Wait(1000)
	SetParticleFxNonLoopedColour(r / 255, g / 255, b / 255)
	SetParticleFxNonLoopedAlpha(1.0)
	local canCoords = GetEntityCoords(spraycan)
	local spray = StartNetworkedParticleFxNonLoopedAtCoord("scr_wheel_burnout", canCoords.x, canCoords.y, canCoords.z+0.5, 0.0, 0.0, GetEntityHeading(ped), 0.2, 0.0, 0.0, 0.0)
	local colorPrimary, colorSecondary = GetVehicleColours(vehicle)

	-- Set car to white/base coat
	if data.select == "pri" then
		SetVehicleCustomPrimaryColour(vehicle, 1.0, 1.0, 1.0)
		SetVehicleColours(vehicle, data.finish, colorSecondary)
	elseif data.select == "sec" then
		SetVehicleCustomSecondaryColour(vehicle, 1.0, 1.0, 1.0)
		SetVehicleColours(vehicle, colorPrimary, data.finish)
	end

	spraying = true
	local rd,gd,bd = table.unpack({255, 255, 255}) --Base Coat Numbers

    while spraying do
        while rd ~= r or gd ~= g or bd ~= b do
            if rd ~= r then rd = rd - 1 end
            if gd ~= g then gd = gd - 1 end
            if bd ~= b then bd = bd - 1 end
            if data.select == "pri" then SetVehicleCustomPrimaryColour(vehicle, rd, gd, bd)
            elseif data.select == "sec" then SetVehicleCustomSecondaryColour(vehicle, rd, gd, bd) end
			Wait(10)
        end
        spraying = false
        Wait(10)
    end
    spraying = false
	updateCar(vehicle)
	SetVehicleModKit(vehicle, 0)
	qblog("`paintcan - "..QBCore.Shared.Items["paintcan"].label.." - {"..r..", "..g..", "..b.."}` installed [**"..trim(GetVehicleNumberPlateText(vehicle)).."**]")
	if Config.CosmeticRemoval then TriggerServerEvent("ed-carmods:RemoveItem", 'paintcan', 1) TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items['paintcan'], "remove", 1)
	else TriggerEvent("ed-carmods:client:rgbORhex") end
	emptyHands(ped)
end)

RegisterNetEvent('ed-carmods:client:RGBPicker', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local vehicle = getClosest(coords)
	local r, g, b = GetVehicleCustomPrimaryColour(vehicle)
	local priCol = "[<span style='color:#"..rgbToHex(GetVehicleCustomPrimaryColour(vehicle)):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> "..r.." "..g.." "..b.." </span>]"
	local r, g, b = GetVehicleCustomSecondaryColour(vehicle)
	local secCol = "[<span style='color:#"..rgbToHex(GetVehicleCustomSecondaryColour(vehicle)):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> "..r.." "..g.." "..b.." </span>]"
	if DoesEntityExist(vehicle) then
		local dialog = exports['qb-input']:ShowInput({
			header = 	"<center>"..Loc[Config.Lan]["paintrgb"].rgb
						.."<br><br>- "..Loc[Config.Lan]["paint"].primary.." -<br>"..priCol
						.."<br>- "..Loc[Config.Lan]["paint"].secondary.." -<br>"..secCol,
			inputs = {
				{ type = 'number', name = 'Red', text = 'R' },
				{ type = 'number', name = 'Green', text = 'G' },
				{ type = 'number', name = 'Blue', text = 'B' },
				{ type = 'radio', name = 'select', text = Loc[Config.Lan]["paintrgb"].select,
					options = { { value = "pri", text = Loc[Config.Lan]["paint"].primary },
								{ value = "sec", text = Loc[Config.Lan]["paint"].secondary } } },
				{ type = 'radio', name = 'finish', text = Loc[Config.Lan]["paintrgb"].finish,
					options = { { value = "147", text = Loc[Config.Lan]["paint"].classic },
								{ value = "12", text = Loc[Config.Lan]["paint"].matte },
								{ value = "120", text = Loc[Config.Lan]["paintrgb"].chrome } } } } })
		if dialog then
			local r, g, b = table.unpack({(tonumber(dialog.Red) or 0), (tonumber(dialog.Green) or 0), (tonumber(dialog.Blue) or 0)})
			if r > 255 then r = 255 end
			if g > 255 then g = 255 end
			if b > 255 then b = 255 end
			if not dialog.Red or not dialog.Green or not dialog.Blue then return TriggerEvent("ed-carmods:client:RGBPicker") end
			TriggerEvent('ed-carmods:client:RGBApply', { finish = tonumber(dialog.finish), select = dialog.select, r = r, g = g, b = b })
		end
    end
end)

RegisterNetEvent('ed-carmods:client:HEXPicker', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local vehicle = getClosest(coords)
	local priCol = "[ #<span style='color:#"..rgbToHex(GetVehicleCustomPrimaryColour(vehicle)):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'>"..rgbToHex(GetVehicleCustomPrimaryColour(vehicle)):upper().." </span>]"
	local secCol = "[ #<span style='color:#"..rgbToHex(GetVehicleCustomSecondaryColour(vehicle)):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'>"..rgbToHex(GetVehicleCustomSecondaryColour(vehicle)):upper().." </span>]"
	if DoesEntityExist(vehicle) then
		local dialog = exports['qb-input']:ShowInput({
			header = 	"<center>"..Loc[Config.Lan]["paintrgb"].hex
						.."<br><br>- "..Loc[Config.Lan]["paint"].primary.." -<br>"..priCol
						.."<br>- "..Loc[Config.Lan]["paint"].secondary.." -<br>"..secCol,
			submitText = "Onayla",
			inputs = {
				{ type = 'text', name = 'hex', text = '#' },
				{ type = 'radio', name = 'select', text = Loc[Config.Lan]["paintrgb"].select,
					options = { { value = "pri", text = Loc[Config.Lan]["paint"].primary },
								{ value = "sec", text = Loc[Config.Lan]["paint"].secondary } } },
				{ type = 'radio', name = 'finish', text = Loc[Config.Lan]["paintrgb"].finish,
					options = { { value = "147", text = Loc[Config.Lan]["paint"].classic },
								{ value = "12", text = Loc[Config.Lan]["paint"].matte },
								{ value = "120", text = Loc[Config.Lan]["paintrgb"].chrome } } } } })
		if dialog then
			if not dialog.hex then return TriggerEvent("ed-carmods:client:HEXPicker") end
			if dialog.hex then
				local hex = dialog.hex:gsub("#","")
				while string.len(hex) < 6 do hex = hex.."0"	Wait(10) end
				local r, g, b = HexTorgb(hex)
				TriggerEvent('ed-carmods:client:RGBApply', { finish = tonumber(dialog.finish), select = dialog.select, r = r, g = g, b = b })
			end
		end
    end
end)

RegisterNetEvent('ed-carmods:client:rgbORhex', function()
	local ped = PlayerPedId()
	local coords = GetEntityCoords(ped)
	local vehicle = getClosest(coords)
	if not inCar() then return end
	if DoesEntityExist(vehicle) then
		local r,g,b = GetVehicleCustomPrimaryColour(vehicle)
			priRGBCol = Loc[Config.Lan]["paint"].primary..": [<span style='color:#"..rgbToHex(r, g, b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> "..r.." "..g.." "..b.." </span>]<br>"
			priHexCol = Loc[Config.Lan]["paint"].primary..": [ #<span style='color:#"..rgbToHex(r,g,b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'>"..rgbToHex(r, g, b):upper().." </span>]<br>"
		local r,g,b = GetVehicleCustomSecondaryColour(vehicle)
			secRGBCol = Loc[Config.Lan]["paint"].secondary..": [<span style='color:#"..rgbToHex(r, g, b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'> "..r.." "..g.." "..b.." </span>]"
			secHexCol = Loc[Config.Lan]["paint"].secondary..": [ #<span style='color:#"..rgbToHex(r,g,b):upper().."; text-shadow: -1px 0 black, 0 1px black, 1px 0 black, 0 -1px black, 0em 0em 0.5em white, 0em 0em 0.5em white'>"..rgbToHex(r, g, b):upper().." </span>]"
		local PaintMenu = {}
		PaintMenu[#PaintMenu+1] = { icon = "paintcan", header = Loc[Config.Lan]["paint"].menuheader, text = Loc[Config.Lan]["paintrgb"].customheader, isMenuHeader = true }
		PaintMenu[#PaintMenu+1] = { icon = "fas fa-circle-arrow-left", header = "", txt = string.gsub(Loc[Config.Lan]["common"].ret, "⬅️ ", ""), params = { event = "ed-carmods:client:Paints:Check" } }
		PaintMenu[#PaintMenu+1] = { header = Loc[Config.Lan]["paintrgb"].hex, text = priHexCol..secHexCol, params = { event = "ed-carmods:client:HEXPicker" }, }
		PaintMenu[#PaintMenu+1] = { header = Loc[Config.Lan]["paintrgb"].rgb, text = priRGBCol..secRGBCol, params = { event = "ed-carmods:client:RGBPicker" }, }
		exports['qb-menu']:openMenu(PaintMenu)
	end
end)