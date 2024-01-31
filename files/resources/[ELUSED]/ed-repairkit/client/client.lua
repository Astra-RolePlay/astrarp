local QBCore = exports['qb-core']:GetCoreObject()

function CleanVehicle(veh)
    TriggerEvent('animations:client:EmoteCommandStart', {"temizle"})
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("cleaning_vehicle", "Araç Temizleniyor.", math.random(10000, 20000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		QBCore.Functions.Notify("Araç başarılı bir şekilde temizlendi.", "success")
		SetVehicleDirtLevel(veh, 0.1)
		SetVehicleUndriveable(veh, false)
		WashDecalsFromVehicle(veh, 1.0)
		TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items[Config.CleaningKitItem], "remove")
        TriggerServerEvent('ed-repairkit:RemoveItem', Config.CleaningKitItem)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		QBCore.Functions.Notify("İptal edildi.", "error")
	end)
end

local function isPedDrivingAVehicle()
	local ped = PlayerPedId()
	vehicle = GetVehiclePedIsIn(ped, false)
	if IsPedInAnyVehicle(ped, false) then
		if GetPedInVehicleSeat(vehicle, -1) == ped then
			local class = GetVehicleClass(vehicle)
			if class ~= 15 and class ~= 16 and class ~=21 and class ~=13 then
				return true
			end
		end
	end
	return false
end

RegisterNetEvent('ed-repairkit:AdminKit', function()
	if isPedDrivingAVehicle() then
		local ped = PlayerPedId()
		vehicle = GetVehiclePedIsIn(ped, false)
		SetVehicleDirtLevel(vehicle)
		SetVehicleUndriveable(vehicle, false)
		WashDecalsFromVehicle(vehicle, 1.0)
        QBCore.Functions.Notify("Araç tamir edildi.", "success")
		SetVehicleFixed(vehicle)
		healthBodyLast=1000.0
		healthEngineLast=1000.0
		healthPetrolTankLast=1000.0
		SetVehicleEngineOn(vehicle, true, false )
		return
	else
		QBCore.Functions.Notify("Araç içinde değilsin!", "error")
	end
end)

RegisterNetEvent("ed-repairkit:CleaningKit")
AddEventHandler("ed-repairkit:CleaningKit", function()
	local veh = QBCore.Functions.GetClosestVehicle()
	if veh ~= nil and veh ~= 0 then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehpos = GetEntityCoords(veh)
		if #(pos - vehpos) < 3.0 and not IsPedInAnyVehicle(ped) then
			CleanVehicle(veh)
		end
	end
end)

RegisterNetEvent("ed-repairkit:RepairKit")
AddEventHandler("ed-repairkit:RepairKit", function()
	local ply = PlayerPedId()
	local coords = GetEntityCoords(ply)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 2.5) then
		local vehicle 	= GetClosestVehicle(coords.x, coords.y, coords.z, 2.5, 0, 71)
		local vehicleheading = GetEntityHeading(vehicle)
	
		if DoesEntityExist(vehicle) then
			TriggerEvent('animations:client:EmoteCommandStart', {"tamir"})
			FreezeEntityPosition(ply, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
            exports['qb-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Progressbar("repair_kit", "Motor Tamir Ediliyor.", 10000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_ped",
                            flags = 49,
                        }, {}, {}, function() -- Done
                            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RepairKitItem], "remove")
                            TriggerServerEvent('ed-repairkit:RemoveItem', Config.RepairKitItem)
                            SetVehicleEngineHealth(vehicle, 700.0)
                            SetVehiclePetrolTankHealth(vehicle, 700.0)
                            QBCore.Functions.Notify("Aracın motoru tamir edildi.", "success")
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        end, function() -- Cancel
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            QBCore.Functions.Notify("İşlem iptal edildi.", "error")
                    end)
                else
                    FreezeEntityPosition(ply, false)
                    SetVehicleDoorShut(vehicle, 4, false)
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Araç tamir edilemedi.", "error")
                end
            end, 2, 20)
		end
	else
        QBCore.Functions.Notify("Yakında araç yok.", "error")
	end	
end)

RegisterNetEvent("ed-repairkit:AdvancedRepairKit")
AddEventHandler("ed-repairkit:AdvancedRepairKit", function()
	local ply = PlayerPedId()
	local coords = GetEntityCoords(ply)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 2.5) then
		local vehicle 	= GetClosestVehicle(coords.x, coords.y, coords.z, 2.5, 0, 71)
		local vehicleheading = GetEntityHeading(vehicle)
	
		if DoesEntityExist(vehicle) then
			TriggerEvent('animations:client:EmoteCommandStart', {"tamir"})
			FreezeEntityPosition(ply, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
            exports['qb-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Progressbar("advanced_repair_kit", "Araç Tamir Ediliyor.", 10000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_ped",
                            flags = 49,
                        }, {}, {}, function() -- Done
                            TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.AdvancedRepairKitItem], "remove")
                            TriggerServerEvent('ed-repairkit:RemoveItem', Config.AdvancedRepairKitItem)
                            SetVehicleFixed(vehicle)
                            SetVehicleDirtLevel(veh, 0.1)
                            SetVehicleUndriveable(veh, false)
                            WashDecalsFromVehicle(veh, 1.0)
                            QBCore.Functions.Notify("Aracın tamir edildi.", "success")
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        end, function() -- Cancel
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            QBCore.Functions.Notify("İşlem iptal edildi.", "error")
                    end)
                else
                    FreezeEntityPosition(ply, false)
                    SetVehicleDoorShut(vehicle, 4, false)
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Araç tamir edilemedi.", "error")
                end
            end, 4, 20)
		end
	else
        QBCore.Functions.Notify("Yakında araç yok.", "error")
	end	
end)


RegisterNetEvent("ed-repairkit:Repair")
AddEventHandler("ed-repairkit:Repair", function()
	local ply = PlayerPedId()
	local coords = GetEntityCoords(ply)

	if IsAnyVehicleNearPoint(coords.x, coords.y, coords.z, 2.5) then
		local vehicle 	= GetClosestVehicle(coords.x, coords.y, coords.z, 2.5, 0, 71)
		local vehicleheading = GetEntityHeading(vehicle)
	
		if DoesEntityExist(vehicle) then
			TriggerEvent('animations:client:EmoteCommandStart', {"tamir"})
			FreezeEntityPosition(ply, true)
			SetVehicleDoorOpen(vehicle, 4, false, false)
            Wait(1000)
            exports['qb-ui']:Circle(function(success)
                if success then
                    QBCore.Functions.Progressbar("advanced_repair_kit", "Araç Tamir Ediliyor.", 10000, false, true, {
                        disableMovement = false,
                        disableCarMovement = false,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mini@repair",
                            anim = "fixing_a_ped",
                            flags = 49,
                        }, {}, {}, function() -- Done
                            SetVehicleFixed(vehicle)
                            SetVehicleDirtLevel(veh, 0.1)
                            SetVehicleUndriveable(veh, false)
                            WashDecalsFromVehicle(veh, 1.0)
                            QBCore.Functions.Notify("Aracın tamir edildi.", "success")
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                        end, function() -- Cancel
                            FreezeEntityPosition(ply, false)
                            SetVehicleDoorShut(vehicle, 4, false)
                            TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                            QBCore.Functions.Notify("İşlem iptal edildi.", "error")
                    end)
                else
                    FreezeEntityPosition(ply, false)
                    SetVehicleDoorShut(vehicle, 4, false)
                    TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                    QBCore.Functions.Notify("Araç tamir edilemedi.", "error")
                end
            end, 2, 20)
		end
	else
        QBCore.Functions.Notify("Yakında araç yok.", "error")
	end	
end)

RegisterNetEvent("ed-repairkit:Cleaning")
AddEventHandler("ed-repairkit:Cleaning", function()
	local veh = QBCore.Functions.GetClosestVehicle()
	if veh ~= nil and veh ~= 0 then
		local ped = PlayerPedId()
		local pos = GetEntityCoords(ped)
		local vehpos = GetEntityCoords(veh)
		if #(pos - vehpos) < 3.0 and not IsPedInAnyVehicle(ped) then
			CleanVehicleV2(veh)
		end
	end
end)

function CleanVehicleV2(veh)
    TriggerEvent('animations:client:EmoteCommandStart', {"temizle"})
	local ped = PlayerPedId()
	QBCore.Functions.Progressbar("cleaning_vehicle", "Araç Temizleniyor.", math.random(10000, 20000), false, true, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {}, {}, {}, function() -- Done
		QBCore.Functions.Notify("Araç başarılı bir şekilde temizlendi.", "success")
		SetVehicleDirtLevel(veh, 0.1)
		SetVehicleUndriveable(veh, false)
		WashDecalsFromVehicle(veh, 1.0)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
	end, function() -- Cancel
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
		QBCore.Functions.Notify("İptal edildi.", "error")
	end)
end