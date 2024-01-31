QBCore = exports['qb-core']:GetCoreObject()
VehicleStatus = {}

local ClosestPlate = nil
local PlayerJob = {}
local onDuty = false
local effectTimer = 0
local openingDoor = false

-- zone check
local isInsideDutyZone = false
local isInsideStashZone = false
local isInsideGarageZone = false
local isInsideVehiclePlateZone = false
local plateZones = {}
local plateTargetBoxID = 'plateTarget_'
local dutyTargetBoxID = 'dutyTarget'
local stashTargetBoxID = 'stashTarget'


-- Exports

local function GetVehicleStatusList(plate)
    local retval = nil
    if VehicleStatus[plate] ~= nil then
        retval = VehicleStatus[plate]
    end
    return retval
end

local function GetVehicleStatus(plate, part)
    local retval = nil
    if VehicleStatus[plate] ~= nil then
        retval = VehicleStatus[plate][part]
    end
    return retval
end

local function SetVehicleStatus(plate, part, level)
    TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
end

exports('GetVehicleStatusList', GetVehicleStatusList)
exports('GetVehicleStatus', GetVehicleStatus)
exports('SetVehicleStatus', SetVehicleStatus)


-- Functions

local function DeleteTarget(id)
    if Config.UseTarget then
        exports['qb-target']:RemoveZone(id)
    else
        if Config.Targets[id] and Config.Targets[id].zone then
            Config.Targets[id].zone:destroy();
        end
    end

    Config.Targets[id] = nil
end

-- local function RegisterDutyTarget()
--     local coords = Config.Locations['duty']
--     local boxData = Config.Targets[dutyTargetBoxID] or {}

--     if boxData and boxData.created then
--         return
--     end

--     if PlayerJob.type ~= 'mechanic' then
--         return
--     end

--     local label = Lang:t('labels.sign_in')
--     if onDuty then
--         label = Lang:t('labels.sign_off')
--     end

--     if Config.UseTarget then
--         exports['qb-target']:AddBoxZone(dutyTargetBoxID, coords, 1.5, 1.5, {
--             name = dutyTargetBoxID,
--             heading = 0,
--             debugPoly = false,
--             minZ = coords.z - 1.0,
--             maxZ = coords.z + 1.0,
--         }, {
--             options = {{
--                 type = "server",
--                 event = "QBCore:ToggleDuty",
--                 label = label,
--             }},
--             distance = 2.0
--         })

--         Config.Targets[dutyTargetBoxID] = {created = true}
--     else
--         local zone = BoxZone:Create(coords, 1.5, 1.5, {
--             name = dutyTargetBoxID,
--             heading = 0,
--             debugPoly = false,
--             minZ = coords.z - 1.0,
--             maxZ = coords.z + 1.0,
--         })
--         zone:onPlayerInOut(function (isPointInside)
--             if isPointInside then
--                 exports['qb-core']:DrawText("[E] " .. label, 'left')
--             else
--                 exports['qb-core']:HideText()
--             end

--             isInsideDutyZone = isPointInside
--         end)

--         Config.Targets[dutyTargetBoxID] = {created = true, zone = zone}
--     end
-- end

-- local function RegisterStashTarget()
--     local coords = Config.Locations['stash']
--     local boxData = Config.Targets[stashTargetBoxID] or {}

--     if boxData and boxData.created then
--         return
--     end

--     if PlayerJob.type ~= 'mechanic' then
--         return
--     end

--     if Config.UseTarget then
--         exports['qb-target']:AddBoxZone(stashTargetBoxID, coords, 1.5, 1.5, {
--             name = stashTargetBoxID,
--             heading = 0,
--             debugPoly = false,
--             minZ = coords.z - 1.0,
--             maxZ = coords.z + 1.0,
--         }, {
--             options = {{
--                 type = "client",
--                 event = "qb-mechanicjob:client:target:OpenStash",
--                 label = Lang:t('labels.o_stash'),
--             }},
--             distance = 2.0
--         })

--         Config.Targets[stashTargetBoxID] = {created = true}
--     else
--         local zone = BoxZone:Create(coords, 1.5, 1.5, {
--             name = stashTargetBoxID,
--             heading = 0,
--             debugPoly = false,
--             minZ = coords.z - 1.0,
--             maxZ = coords.z + 1.0,
--         })
--         zone:onPlayerInOut(function (isPointInside)
--             if isPointInside then
--                 exports['qb-core']:DrawText(Lang:t('labels.o_stash'), 'left')
--             else
--                 exports['qb-core']:HideText()
--             end

--             isInsideStashZone = isPointInside
--         end)

--         Config.Targets[stashTargetBoxID] = {created = true, zone = zone}
--     end
-- end

local function RegisterGarageZone()
    local coords = Config.Locations['vehicle']
    local vehicleZone = BoxZone:Create(vector3(coords.x, coords.y, coords.z), 5, 15, {
        name = 'vehicleZone',
        heading = 340.0,
        minZ = coords.z - 1.0,
        maxZ = coords.z + 5.0,
        debugPoly = false
    })

    vehicleZone:onPlayerInOut(function (isPointInside)
        if isPointInside and onDuty then
            local inVehicle = IsPedInAnyVehicle(PlayerPedId())
            if inVehicle then
                exports['qb-core']:DrawText(Lang:t('labels.h_vehicle'), 'left')
            else
                exports['qb-core']:DrawText(Lang:t('labels.g_vehicle'), 'left')
            end
        else
            exports['qb-core']:HideText()
        end

        isInsideGarageZone = isPointInside
    end)
end

function DestroyVehiclePlateZone(id)
    if plateZones[id] then
        plateZones[id]:destroy()
        plateZones[id] = nil
    end
end

function RegisterVehiclePlateZone(id, plate)
    local coords = plate.coords
    local boxData = plate.boxData
    local plateZone = BoxZone:Create(vector3(coords.x, coords.y, coords.z), boxData.length, boxData.width, {
        name = plateTargetBoxID .. id,
        heading = boxData.heading,
        minZ = coords.z - 1.0,
        maxZ = coords.z + 3.0,
        debugPoly = boxData.debugPoly
    })

    plateZones[id] = plateZone

    plateZone:onPlayerInOut(function (isPointInside)
        if isPointInside and onDuty then
            if plate.AttachedVehicle then
                exports['qb-core']:DrawText(Lang:t('labels.o_menu'), 'left')
            else
                if IsPedInAnyVehicle(PlayerPedId()) then
                    exports['qb-core']:DrawText(Lang:t('labels.work_v'), 'left')
                end
            end
        else
            exports['qb-core']:HideText()
        end

        isInsideVehiclePlateZone = isPointInside
    end)
end

local function SetVehiclePlateZones()
    if Config.Plates and next(Config.Plates) then
        for id, plate in pairs(Config.Plates) do
            RegisterVehiclePlateZone(id, plate)
        end
    else
        print('No vehicle plates configured')
    end
end

local function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(5)
    end
end

local function SetClosestPlate()
    local pos = GetEntityCoords(PlayerPedId(), true)
    local current = nil
    local dist = nil
    for id,_ in pairs(Config.Plates) do
        if current ~= nil then
            if #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z)) < dist then
                current = id
                dist = #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z))
            end
        else
            dist = #(pos - vector3(Config.Plates[id].coords.x, Config.Plates[id].coords.y, Config.Plates[id].coords.z))
            current = id
        end
    end
    ClosestPlate = current
end

local function ScrapAnim(time)
    time = time / 1000
    loadAnimDict("mp_car_bomb")
    TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic" ,3.0, 3.0, -1, 16, 0, false, false, false)
    openingDoor = true
    CreateThread(function()
        while openingDoor do
            TaskPlayAnim(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 3.0, 3.0, -1, 16, 0, 0, 0, 0)
            Wait(2000)
            time = time - 2
            if time <= 0 then
                openingDoor = false
                StopAnimTask(PlayerPedId(), "mp_car_bomb", "car_bomb_mechanic", 1.0)
            end
        end
    end)
end

local function ApplyEffects(vehicle)
    local plate = QBCore.Functions.GetPlate(vehicle)
    if GetVehicleClass(vehicle) ~= 13 and GetVehicleClass(vehicle) ~= 21 and GetVehicleClass(vehicle) ~= 16 and GetVehicleClass(vehicle) ~= 15 and GetVehicleClass(vehicle) ~= 14 then
        if VehicleStatus[plate] ~= nil then
            local chance = math.random(1, 100)
            if VehicleStatus[plate]["radiator"] <= 80 and (chance >= 1 and chance <= 20) then
                local engineHealth = GetVehicleEngineHealth(vehicle)
                if VehicleStatus[plate]["radiator"] <= 80 and VehicleStatus[plate]["radiator"] >= 60 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(10, 15))
                elseif VehicleStatus[plate]["radiator"] <= 59 and VehicleStatus[plate]["radiator"] >= 40 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(15, 20))
                elseif VehicleStatus[plate]["radiator"] <= 39 and VehicleStatus[plate]["radiator"] >= 20 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(20, 30))
                elseif VehicleStatus[plate]["radiator"] <= 19 and VehicleStatus[plate]["radiator"] >= 6 then
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(30, 40))
                else
                    SetVehicleEngineHealth(vehicle, engineHealth - math.random(40, 50))
                end
            end

            if VehicleStatus[plate]["axle"] <= 80 and (chance >= 21 and chance <= 40) then
                if VehicleStatus[plate]["axle"] <= 80 and VehicleStatus[plate]["axle"] >= 60 then
                    for i=0,360 do
                        SetVehicleSteeringScale(vehicle,i)
                        Wait(5)
                    end
                elseif VehicleStatus[plate]["axle"] <= 59 and VehicleStatus[plate]["axle"] >= 40 then
                    for i=0,360 do
                        Wait(10)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 39 and VehicleStatus[plate]["axle"] >= 20 then
                    for i=0,360 do
                        Wait(15)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                elseif VehicleStatus[plate]["axle"] <= 19 and VehicleStatus[plate]["axle"] >= 6 then
                    for i=0,360 do
                        Wait(20)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                else
                    for i=0,360 do
                        Wait(25)
                        SetVehicleSteeringScale(vehicle,i)
                    end
                end
            end

            if VehicleStatus[plate]["brakes"] <= 80 and (chance >= 41 and chance <= 60) then
                if VehicleStatus[plate]["brakes"] <= 80 and VehicleStatus[plate]["brakes"] >= 60 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 59 and VehicleStatus[plate]["brakes"] >= 40 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(3000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 39 and VehicleStatus[plate]["brakes"] >= 20 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(5000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["brakes"] <= 19 and VehicleStatus[plate]["brakes"] >= 6 then
                    SetVehicleHandbrake(vehicle, true)
                    Wait(7000)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    Wait(9000)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["clutch"] <= 80 and (chance >= 61 and chance <= 80) then
                if VehicleStatus[plate]["clutch"] <= 80 and VehicleStatus[plate]["clutch"] >= 60 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(50)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(500)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 59 and VehicleStatus[plate]["clutch"] >= 40 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(100)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(750)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 39 and VehicleStatus[plate]["clutch"] >= 20 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(150)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1000)
                    SetVehicleHandbrake(vehicle, false)
                elseif VehicleStatus[plate]["clutch"] <= 19 and VehicleStatus[plate]["clutch"] >= 6 then
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(200)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1250)
                    SetVehicleHandbrake(vehicle, false)
                else
                    SetVehicleHandbrake(vehicle, true)
                    SetVehicleEngineOn(vehicle,0,0,1)
                    SetVehicleUndriveable(vehicle,true)
                    Wait(250)
                    SetVehicleEngineOn(vehicle,1,0,1)
                    SetVehicleUndriveable(vehicle,false)
                    for i=1,360 do
                        SetVehicleSteeringScale(vehicle, i)
                        Wait(5)
                    end
                    Wait(1500)
                    SetVehicleHandbrake(vehicle, false)
                end
            end

            if VehicleStatus[plate]["fuel"] <= 80 and (chance >= 81 and chance <= 100) then
                local fuel = exports['ed-fuel']:GetFuel(vehicle)
                if VehicleStatus[plate]["fuel"] <= 80 and VehicleStatus[plate]["fuel"] >= 60 then
                    exports['ed-fuel']:SetFuel(vehicle, fuel - 2.0)
                elseif VehicleStatus[plate]["fuel"] <= 59 and VehicleStatus[plate]["fuel"] >= 40 then
                    exports['ed-fuel']:SetFuel(vehicle, fuel - 4.0)
                elseif VehicleStatus[plate]["fuel"] <= 39 and VehicleStatus[plate]["fuel"] >= 20 then
                    exports['ed-fuel']:SetFuel(vehicle, fuel - 6.0)
                elseif VehicleStatus[plate]["fuel"] <= 19 and VehicleStatus[plate]["fuel"] >= 6 then
                    exports['ed-fuel']:SetFuel(vehicle, fuel - 8.0)
                else
                    exports['ed-fuel']:SetFuel(vehicle, fuel - 10.0)
                end
            end
        end
    end
end

local function round(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 1) .. "f", num))
end

local function SendStatusMessage(statusList)
    if statusList ~= nil then
        TriggerEvent('chat:addMessage', {
            template = '<div class="chat-message normal"><div class="chat-message-body"><strong>{0}:</strong><br><br> <strong>'.. Config.ValuesLabels["engine"] ..' (engine):</strong> {1} <br><strong>'.. Config.ValuesLabels["body"] ..' (body):</strong> {2} <br><strong>'.. Config.ValuesLabels["radiator"] ..' (radiator):</strong> {3} <br><strong>'.. Config.ValuesLabels["axle"] ..' (axle):</strong> {4}<br><strong>'.. Config.ValuesLabels["brakes"] ..' (brakes):</strong> {5}<br><strong>'.. Config.ValuesLabels["clutch"] ..' (clutch):</strong> {6}<br><strong>'.. Config.ValuesLabels["fuel"] ..' (fuel):</strong> {7}</div></div>',
            args = {Lang:t('labels.veh_status'), round(statusList["engine"]) .. "/" .. Config.MaxStatusValues["engine"] .. " ("..QBCore.Shared.Items["advancedrepairkit"]["label"]..")", round(statusList["body"]) .. "/" .. Config.MaxStatusValues["body"] .. " ("..QBCore.Shared.Items[Config.RepairCost["body"]]["label"]..")", round(statusList["radiator"]) .. "/" .. Config.MaxStatusValues["radiator"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["radiator"]]["label"]..")", round(statusList["axle"]) .. "/" .. Config.MaxStatusValues["axle"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["axle"]]["label"]..")", round(statusList["brakes"]) .. "/" .. Config.MaxStatusValues["brakes"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["brakes"]]["label"]..")", round(statusList["clutch"]) .. "/" .. Config.MaxStatusValues["clutch"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["clutch"]]["label"]..")", round(statusList["fuel"]) .. "/" .. Config.MaxStatusValues["fuel"] .. ".0 ("..QBCore.Shared.Items[Config.RepairCost["fuel"]]["label"]..")"}
        })
    end
end

local function OpenMenu()
    local openMenu = {
        {
            header = Lang:t('lift_menu.header_menu'),
            isMenuHeader = true
        }, {
            header = Lang:t('lift_menu.header_vehdc'),
            txt = Lang:t('lift_menu.desc_vehdc'),
            params = {
                event = "qb-mechanicjob:client:UnattachVehicle",
            }
        }, {
            header = Lang:t('lift_menu.header_stats'),
            txt = Lang:t('lift_menu.desc_stats'),
            params = {
                event = "qb-mechanicjob:client:CheckStatus",
                args = {
                    number = 1,
                }
            }
        }, {
            header = Lang:t('lift_menu.header_parts'),
            txt = Lang:t('lift_menu.desc_parts'),
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
                args = {
                    number = 1,
                }
            }
        }, {
            header = Lang:t('lift_menu.c_menu'),
            txt = "",
            params = {
                event = "qb-mechanicjob:client:target:CloseMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(openMenu)
end

local function PartsMenu()
    local plate = QBCore.Functions.GetPlate(Config.Plates[ClosestPlate].AttachedVehicle)
    if VehicleStatus[plate] ~= nil then
        local vehicleMenu = {
            {
                header = "Status",
                isMenuHeader = true
            }
        }
        for k,v in pairs(Config.ValuesLabels) do
            if math.ceil(VehicleStatus[plate][k]) ~= Config.MaxStatusValues[k] then
                local percentage = math.ceil(VehicleStatus[plate][k])
                if percentage > 100 then
                    percentage = math.ceil(VehicleStatus[plate][k]) / 10
                end
                vehicleMenu[#vehicleMenu+1] = {
                    header = v,
                    txt = "Status: " .. percentage .. ".0% / 100.0%",
                    params = {
                        event = "qb-mechanicjob:client:PartMenu",
                        args = {
                            name = v,
                            parts = k
                        }
                    }
                }
            else
                local percentage = math.ceil(Config.MaxStatusValues[k])
                if percentage > 100 then
                    percentage = math.ceil(Config.MaxStatusValues[k]) / 10
                end
                vehicleMenu[#vehicleMenu+1] = {
                    header = v,
                    txt = Lang:t('parts_menu.status') .. percentage .. ".0% / 100.0%",
                    params = {
                        event = "qb-mechanicjob:client:NoDamage",
                    }
                }
            end
        end
        vehicleMenu[#vehicleMenu+1] = {
            header = Lang:t('lift_menu.c_menu'),
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu"
            }
        }
        exports['qb-menu']:openMenu(vehicleMenu)
    end

end

local function PartMenu(data)
    local partName = data.name
    local part = data.parts
    local TestMenu1 = {
        {
            header = Lang:t('parts_menu.menu_header'),
            isMenuHeader = true
        },
        {
            header = ""..partName.."",
            txt = Lang:t('parts_menu.repair_op')..QBCore.Shared.Items[Config.RepairCostAmount[part].item]["label"].." "..Config.RepairCostAmount[part].costs.."x",
            params = {
                event = "qb-mechanicjob:client:RepairPart",
                args = {
                    part = part,
                }
            }
        },
        {
            header = Lang:t('parts_menu.b_menu'),
            txt = Lang:t('parts_menu.d_menu'),
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
            }
        },
        {
            header = Lang:t('parts_menu.c_menu'),
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    }

    exports['qb-menu']:openMenu(TestMenu1)
end

local function NoDamage()
    local noDamage = {
        {
            header = Lang:t('nodamage_menu.header'),
            isMenuHeader = true
        },
        {
            header = Lang:t('nodamage_menu.bh_menu'),
            txt = Lang:t('nodamage_menu.bd_menu'),
            params = {
                event = "qb-mechanicjob:client:PartsMenu",
            }
        },
        {
            header = Lang:t('nodamage_menu.c_menu'),
            txt = "",
            params = {
                event = "qb-menu:client:closeMenu",
            }
        },
    }
    exports['qb-menu']:openMenu(noDamage)
end

local function UnattachVehicle()
    DoScreenFadeOut(150)
    Wait(150)
    FreezeEntityPosition(Config.Plates[ClosestPlate].AttachedVehicle, false)
    SetEntityCoords(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.x, Config.Plates[ClosestPlate].coords.y, Config.Plates[ClosestPlate].coords.z)
    SetEntityHeading(Config.Plates[ClosestPlate].AttachedVehicle, Config.Plates[ClosestPlate].coords.w)
    TaskWarpPedIntoVehicle(PlayerPedId(), Config.Plates[ClosestPlate].AttachedVehicle, -1)
    Wait(500)
    DoScreenFadeIn(250)
    Config.Plates[ClosestPlate].AttachedVehicle = nil
    TriggerServerEvent('qb-vehicletuning:server:SetAttachedVehicle', false, ClosestPlate)

    DestroyVehiclePlateZone(ClosestPlate)
    RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])

end

local function SpawnListVehicle(model)
    local coords = {
        x = Config.Locations["vehicle"].x,
        y = Config.Locations["vehicle"].y,
        z = Config.Locations["vehicle"].z,
        w = Config.Locations["vehicle"].w,
    }

    QBCore.Functions.TriggerCallback('QBCore:Server:SpawnVehicle', function(netId)
        local veh = NetToVeh(netId)
        SetVehicleNumberPlateText(veh, "ACBV"..tostring(math.random(1000, 9999)))
        SetEntityHeading(veh, coords.w)
        exports['ed-fuel']:SetFuel(veh, 100.0)
        TaskWarpPedIntoVehicle(PlayerPedId(), veh, -1)
        TriggerEvent("vehiclekeys:client:SetOwner", QBCore.Functions.GetPlate(veh))
        SetVehicleEngineOn(veh, true, true)
    end, model, coords, true)
end

local function VehicleList()
    local vehicleMenu = {
        {
            header = "Vehicle List",
            isMenuHeader = true
        }
    }
    for k,v in pairs(Config.Vehicles) do
        vehicleMenu[#vehicleMenu+1] = {
            header = v,
            txt = "Vehicle: "..v.."",
            params = {
                event = "qb-mechanicjob:client:SpawnListVehicle",
                args = {
                    headername = v,
                    spawnName = k
                }
            }
        }
    end
    vehicleMenu[#vehicleMenu+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        txt = "",
        params = {
            event = "qb-menu:client:closeMenu"
        }

    }
    exports['qb-menu']:openMenu(vehicleMenu)
end

local function CheckStatus()
    local plate = QBCore.Functions.GetPlate(Config.Plates[ClosestPlate].AttachedVehicle)
    SendStatusMessage(VehicleStatus[plate])
end

local function RepairPart(part)
    local PartData = Config.RepairCostAmount[part]
    local hasitem = false
    local indx = 0
    local countitem = 0
    QBCore.Functions.TriggerCallback('qb-inventory:server:GetStashItems', function(StashItems)
        for k,v in pairs(StashItems) do
            if v.name == PartData.item then
                hasitem = true
                if v.amount >= PartData.costs then
                    countitem = v.amount
                    indx = k
                end
            end
        end
        if hasitem and countitem >= PartData.costs then
            TriggerEvent('animations:client:EmoteCommandStart', {"mechanic"})
            QBCore.Functions.Progressbar("repair_part", Lang:t('labels.progress_bar') ..Config.ValuesLabels[part], math.random(5000, 10000), false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                if (countitem - PartData.costs) <= 0 then
                    StashItems[indx] = nil
                else
                    countitem = (countitem - PartData.costs)
                    StashItems[indx].amount = countitem
                end
                TriggerEvent('qb-vehicletuning:client:RepaireeePart', part)
                TriggerServerEvent('qb-inventory:server:SaveStashItems', "mechanicstash", StashItems)
                SetTimeout(250, function()
                    PartsMenu()
                end)
            end, function()
                QBCore.Functions.Notify(Lang:t('notifications.rep_canceled'), "error")
            end)
        else
            QBCore.Functions.Notify(Lang:t('notifications.not_materials'), 'error')
        end
    end, "mechanicstash")
end


-- Events

RegisterNetEvent("qb-mechanicjob:client:UnattachVehicle",function()
    UnattachVehicle()
end)

RegisterNetEvent("qb-mechanicjob:client:PartsMenu",function()
    PartsMenu()
end)

RegisterNetEvent("qb-mechanicjob:client:PartMenu",function(data)
    PartMenu(data)
end)

RegisterNetEvent("qb-mechanicjob:client:NoDamage",function()
    NoDamage()
end)

RegisterNetEvent("qb-mechanicjob:client:CheckStatus",function()
    CheckStatus()
end)

RegisterNetEvent("qb-mechanicjob:client:SpawnListVehicle",function(data)
    local vehicleSpawnName = data.spawnName
    SpawnListVehicle(vehicleSpawnName)
end)

RegisterNetEvent("qb-mechanicjob:client:RepairPart",function(data)
    local partData = data.part
    RepairPart(partData)
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerJob.type == 'mechanic' then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
    QBCore.Functions.TriggerCallback('qb-vehicletuning:server:GetAttachedVehicle', function(plates)
        for k, v in pairs(plates) do
            Config.Plates[k].AttachedVehicle = v.AttachedVehicle
        end
    end)

    QBCore.Functions.TriggerCallback('qb-vehicletuning:server:GetDrivingDistances', function(retval)
        DrivingDistance = retval
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
    DeleteTarget(dutyTargetBoxID)
    DeleteTarget(stashTargetBoxID)
end)

RegisterNetEvent('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
    DeleteTarget(dutyTargetBoxID)
    DeleteTarget(stashTargetBoxID)
end)

RegisterNetEvent('qb-vehicletuning:client:SetAttachedVehicle', function(veh, key)
    if veh ~= false then
        Config.Plates[key].AttachedVehicle = veh
    else
        Config.Plates[key].AttachedVehicle = nil
    end
end)

RegisterNetEvent('qb-vehicletuning:client:RepaireeePart', function(part)
    local veh = Config.Plates[ClosestPlate].AttachedVehicle
    local plate = QBCore.Functions.GetPlate(veh)
    if part == "engine" then
        SetVehicleEngineHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", Config.MaxStatusValues[part])
    elseif part == "body" then
        local enhealth = GetVehicleEngineHealth(veh)
        local realFuel = GetVehicleFuelLevel(veh)
        SetVehicleBodyHealth(veh, Config.MaxStatusValues[part])
        TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", Config.MaxStatusValues[part])
        SetVehicleFixed(veh)
        SetVehicleEngineHealth(veh, enhealth)
        if GetVehicleFuelLevel(veh) ~= realFuel then
            SetVehicleFuelLevel(veh, realFuel)
        end
    else
        TriggerServerEvent("vehiclemod:server:updatePart", plate, part, Config.MaxStatusValues[part])
    end
    QBCore.Functions.Notify(Lang:t('notifications.partrep', {value = Config.ValuesLabels[part]}))
end)
RegisterNetEvent('vehiclemod:client:setVehicleStatus', function(plate, status)
    VehicleStatus[plate] = status
end)

RegisterNetEvent('vehiclemod:client:getVehicleStatus', function()
    if not (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)
        if veh ~= nil and veh ~= 0 then
            local vehpos = GetEntityCoords(veh)
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vehpos) < 5.0 then
                if not IsThisModelABicycle(GetEntityModel(veh)) then
                    local plate = QBCore.Functions.GetPlate(veh)
                    if VehicleStatus[plate] ~= nil then
                        SendStatusMessage(VehicleStatus[plate])
                    else
                        QBCore.Functions.Notify(Lang:t('notifications.uknown'), "error")
                    end
                else
                    QBCore.Functions.Notify(Lang:t('notifications.not_valid'), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t('notifications.not_close'), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t('notifications.veh_first'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('notifications.outside'), "error")
    end
end)

RegisterNetEvent('vehiclemod:client:fixEverything', function()
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = QBCore.Functions.GetPlate(veh)
            TriggerServerEvent("vehiclemod:server:fixEverything", plate)
        else
            QBCore.Functions.Notify(Lang:t('notifications.wrong_seat'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('notifications.not_vehicle'), "error")
    end
end)

RegisterNetEvent('vehiclemod:client:setPartLevel', function(part, level)
    if (IsPedInAnyVehicle(PlayerPedId(), false)) then
        local veh = GetVehiclePedIsIn(PlayerPedId(),false)
        if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
            local plate = QBCore.Functions.GetPlate(veh)
            if part == "engine" then
                SetVehicleEngineHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", GetVehicleEngineHealth(veh))
            elseif part == "body" then
                SetVehicleBodyHealth(veh, level)
                TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", GetVehicleBodyHealth(veh))
            else
                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, level)
            end
        else
            QBCore.Functions.Notify(Lang:t('notifications.wrong_seat'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('notifications.wrong_seat'), "error")
    end
end)

RegisterNetEvent('vehiclemod:client:repairPart', function(part, level, needAmount)
    if not IsPedInAnyVehicle(PlayerPedId(), false) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), true)
        if veh ~= nil and veh ~= 0 then
            local vehpos = GetEntityCoords(veh)
            local pos = GetEntityCoords(PlayerPedId())
            if #(pos - vehpos) < 5.0 then
                if not IsThisModelABicycle(GetEntityModel(veh)) then
                    local plate = QBCore.Functions.GetPlate(veh)
                    if VehicleStatus[plate] ~= nil and VehicleStatus[plate][part] ~= nil then
                        local lockpickTime = (1000 * level)
                        if part == "body" then
                            lockpickTime = lockpickTime / 10
                        end
                        ScrapAnim(lockpickTime)
                        QBCore.Functions.Progressbar("repair_advanced", Lang:t('notifications.progress_bar'), lockpickTime, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {
                            animDict = "mp_car_bomb",
                            anim = "car_bomb_mechanic",
                            flags = 16,
                        }, {}, {}, function() -- Done
                            openingDoor = false
                            ClearPedTasks(PlayerPedId())
                            if part == "body" then
                                local enhealth = GetVehicleEngineHealth(veh)
                                SetVehicleBodyHealth(veh, GetVehicleBodyHealth(veh) + level)
                                SetVehicleFixed(veh)
                                SetVehicleEngineHealth(veh, enhealth)
                                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleBodyHealth(veh))
                                TriggerServerEvent("qb-mechanicjob:server:removePart", part, needAmount)
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RepairCost[part]], "remove")
                            elseif part ~= "engine" then
                                TriggerServerEvent("vehiclemod:server:updatePart", plate, part, GetVehicleStatus(plate, part) + level)
                                TriggerServerEvent("qb-mechanicjob:server:removePart", part, level)
                                TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[Config.RepairCost[part]], "remove")
                            end
                        end, function() -- Cancel
                            openingDoor = false
                            ClearPedTasks(PlayerPedId())
                            QBCore.Functions.Notify(Lang:t('notifications.process_canceled'), "error")
                        end)
                    else
                        QBCore.Functions.Notify(Lang:t('notifications.not_part'), "error")
                    end
                else
                    QBCore.Functions.Notify(Lang:t('notifications.not_valid'), "error")
                end
            else
                QBCore.Functions.Notify(Lang:t('notifications.not_close'), "error")
            end
        else
            QBCore.Functions.Notify(Lang:t('notifications.veh_first'), "error")
        end
    else
        QBCore.Functions.Notify(Lang:t('notifications.not_vehicle'), "error")
    end
end)

RegisterNetEvent('qb-mechanicjob:client:target:OpenStash', function ()
    TriggerEvent("inventory:client:SetCurrentStash", "mechanicstash")
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "mechanicstash", {
        maxweight = 4000000,
        slots = 500,
    })
end)

RegisterNetEvent('qb-mechanicjob:client:target:CloseMenu', function()
    DestroyVehiclePlateZone(ClosestPlate)
    RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])

    TriggerEvent('qb-menu:client:closeMenu')
end)


-- Threads

CreateThread(function()
    local wait = 500
    while not LocalPlayer.state.isLoggedIn do
        -- do nothing
        Wait(wait)
    end

    RegisterGarageZone()
    -- RegisterDutyTarget()
    -- RegisterStashTarget()
    SetVehiclePlateZones()

    while true do
        wait = 500
        SetClosestPlate()

        if PlayerJob.type == 'mechanic' then

            if isInsideDutyZone then
                wait = 0
                if IsControlJustPressed(0, 38) then
                    TriggerServerEvent("QBCore:ToggleDuty")
                end
            end

            if onDuty then
                if isInsideStashZone then
                    wait = 0
                    if IsControlJustPressed(0, 38) then
                        TriggerEvent("qb-mechanicjob:client:target:OpenStash")
                    end
                end

                if isInsideGarageZone then
                    wait = 0
                    local inVehicle = IsPedInAnyVehicle(PlayerPedId())
                    if IsControlJustPressed(0, 38) then
                        if inVehicle then
                            DeleteVehicle(GetVehiclePedIsIn(PlayerPedId()))
                            exports['qb-core']:HideText()
                        else
                            VehicleList()
                            exports['qb-core']:HideText()
                        end
                    end
                end

                if isInsideVehiclePlateZone then
                    wait = 0
                    local attachedVehicle = Config.Plates[ClosestPlate].AttachedVehicle
                    local coords = Config.Plates[ClosestPlate].coords
                    if attachedVehicle then
                        if IsControlJustPressed(0, 38) then
                            exports['qb-core']:HideText()
                            OpenMenu()
                        end
                    else
                        if IsControlJustPressed(0, 38) and IsPedInAnyVehicle(PlayerPedId()) then
                            local veh = GetVehiclePedIsIn(PlayerPedId())
                            DoScreenFadeOut(150)
                            Wait(150)
                            Config.Plates[ClosestPlate].AttachedVehicle = veh
                            SetEntityCoords(veh, coords)
                            SetEntityHeading(veh, coords.w)
                            FreezeEntityPosition(veh, true)
                            Wait(500)
                            DoScreenFadeIn(150)
                            TriggerServerEvent('qb-vehicletuning:server:SetAttachedVehicle', veh, ClosestPlate)

                            DestroyVehiclePlateZone(ClosestPlate)
                            RegisterVehiclePlateZone(ClosestPlate, Config.Plates[ClosestPlate])
                        end
                    end
                end
            end
        end
        Wait(wait)
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if (IsPedInAnyVehicle(PlayerPedId(), false)) then
            local veh = GetVehiclePedIsIn(PlayerPedId(),false)
            if not IsThisModelABicycle(GetEntityModel(veh)) and GetPedInVehicleSeat(veh, -1) == PlayerPedId() then
                local engineHealth = GetVehicleEngineHealth(veh)
                local bodyHealth = GetVehicleBodyHealth(veh)
                local plate = QBCore.Functions.GetPlate(veh)
                if VehicleStatus[plate] == nil then
                    TriggerServerEvent("vehiclemod:server:setupVehicleStatus", plate, engineHealth, bodyHealth)
                else
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "engine", engineHealth)
                    TriggerServerEvent("vehiclemod:server:updatePart", plate, "body", bodyHealth)
                    effectTimer = effectTimer + 1
                    if effectTimer >= math.random(10, 15) then
                        ApplyEffects(veh)
                        effectTimer = 0
                    end
                end
            else
                effectTimer = 0
                Wait(1000)
            end
        else
            effectTimer = 0
            Wait(2000)
        end
    end
end)

-- Eklenecek Depolar 
Citizen.CreateThread(function()
    
    exports['qb-target']:AddBoxZone("Depo_1", vector3(-194.19, -1335.47, 31.3), 3.0, 0.6, { 
        name="Depo_1", 
        heading = 270.0, 
        debugPoly = false, 
        minZ = 28.5,
        maxZ = 32.5
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "Bennys", 
                job = "mechanic"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_2", vector3(145.66, -3007.81, 7.04), 1.6, 1.0, { 
        name="Depo_2", 
        heading = 270.0, 
        debugPoly = false, 
        minZ = 2.84,
        maxZ = 6.84
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "Tunner_Shop", 
                job = "mechanic2"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_3", vector3(950.4, -970.62, 39.51), 0.6, 2.8, { 
        name="Depo_3", 
        heading = 4.0, 
        debugPoly = false, 
        minZ = 38.51,
        maxZ = 41.31
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "Auto_Care", 
                job = "mechanic3"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_4", vector3(727.76, -1065.04, 28.31), 0.6, 1.2, { 
        name="Depo_4", 
        heading = 4.0, 
        debugPoly = false, 
        minZ = 27.31,
        maxZ = 28.71
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "LS_Custom_1", 
                job = "mechanic4"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_5", vector3(799.31, -831.11, 26.34), 0.6, 1.2, { 
        name="Depo_5", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 25.34,
        maxZ = 26.74
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "Ottos_Auto", 
                job = "mechanic5"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_6", vector3(-1428.57, -459.85, 35.91), 0.6, 1.4, { 
        name="Depo_6", 
        heading = 302.0, 
        debugPoly = false, 
        minZ = 34.91,
        maxZ = 36.31
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "Hayes_Custom", 
                job = "mechanic6"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_7", vector3(-340.98, -104.1, 39.01), 1.0, 4.6, { 
        name="Depo_7", 
        heading = 340.0, 
        debugPoly = false, 
        minZ = 38.01,
        maxZ = 41.01
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "LS_Custom_2", 
                job = "mechanic7"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_8", vector3(-1124.47, -2017.85, 13.18), 4.6, 1.0, { 
        name="Depo_8", 
        heading = 315.0, 
        debugPoly = false, 
        minZ = 12.18,
        maxZ = 15.18
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "LS_Custom_3", 
                job = "mechanic8"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_9", vector3(914.55, -2098.73, 30.46), 0.8, 4.2, { 
        name="Depo_9", 
        heading = 355.0, 
        debugPoly = false, 
        minZ = 29.46,
        maxZ = 32.66
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "East_Custom_1", 
                job = "mechanic9"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Depo_10", vector3(917.05, -2101.37, 30.46), 4.2, 0.8, { 
        name="Depo_10", 
        heading = 355.0, 
        debugPoly = false, 
        minZ = 29.46,
        maxZ = 32.66
    }, 
        { options = { {  
                event = "qb-stash:OpenStashDuty", 
                icon = "fas fa-box-open", 
                label = "Depo", 
                stash = "East_Custom_2", 
                job = "mechanic9"
            },
        },
      distance = 2.0
    })
       
end)

-- Eklenecek Kıyafet Dolapları 
Citizen.CreateThread(function()
    
    exports['qb-target']:AddBoxZone("Kiyafet_1", vector3(-194.26, -1339.96, 31.3), 0.6, 2.8, { 
        name="Kiyafet_1", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 28.5,
        maxZ = 32.5
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_2", vector3(154.45, -3011.35, 7.04), 2.2, 0.4, { 
        name="Kiyafet_2", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 6.04,
        maxZ = 8.24
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic2"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_3", vector3(957.44, -966.19, 39.51), 1.6, 0.6, { 
        name="Kiyafet_3", 
        heading = 4.0, 
        debugPoly = false, 
        minZ = 38.51,
        maxZ = 39.91
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic3"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_4", vector3(728.95, -1066.35, 28.31), 0.8, 0.2, { 
        name="Kiyafet_4", 
        heading = 4.0, 
        debugPoly = false, 
        minZ = 27.91,
        maxZ = 29.71
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic4"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_5", vector3(800.49, -830.35, 26.34), 2.0, 0.4, { 
        name="Kiyafet_5", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 25.29,
        maxZ = 27.49
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic5"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_6", vector3(-1425.57, -457.77, 36.36), 2.6, 0.8, { 
        name="Kiyafet_6", 
        heading = 32.0, 
        debugPoly = false, 
        minZ = 34.91,
        maxZ = 37.51
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic6"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_7", vector3(-345.97, -109.07, 39.01), 1.6, 0.6, { 
        name="Kiyafet_7", 
        heading = 340.0, 
        debugPoly = false, 
        minZ = 37.96,
        maxZ = 39.96
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic7"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_8", vector3(-1126.88, -2011.23, 13.18), 0.6, 1.6, { 
        name="Kiyafet_8", 
        heading = 315.0, 
        debugPoly = false, 
        minZ = 12.18,
        maxZ = 14.18
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic8"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kiyafet_9", vector3(883.26, -2099.91, 30.46), 0.6, 2.2, { 
        name="Kiyafet_9", 
        heading = 355.0, 
        debugPoly = false, 
        minZ = 29.41,
        maxZ = 31.61
    }, 
        { options = { {  
                event = "qb-clothing:client:openOutfitMenu", 
                icon = "fas fa-tshirt", 
                label = "Kıyafet Dolabı", 
                job = "mechanic9"
            },
        },
      distance = 2.0
    })
       
end)

-- Eklenecek Mesai Kısımları
-- Citizen.CreateThread(function()
    
--     exports['qb-target']:AddBoxZone("Mesai_1", vector3(-191.81, -1337.45, 31.3), 0.4, 0.4, { 
--         name="Mesai_1", 
--         heading = 5.0, 
--         debugPoly = false, 
--         minZ = 29.3,
--         maxZ = 31.7
--     }, 
--         { options = { {  
--                 event = "QBCore:ToggleDuty", 
--                 icon = "fas fa-pen-alt", 
--                 label = "Mesai Gir/Çık", 
--                 job = "mechanic"
--             },
--         },
--       distance = 2.0
--     })

--     exports['qb-target']:AddBoxZone("Mesai_2", vector3(125.36, -3014.92, 7.04), 0.8, 2.2,  { 
--         name="Mesai_2", 
--         heading = 0.0, 
--         debugPoly = false, 
--         minZ = 2.64,
--         maxZ = 7.04
--     }, 
--         { options = { {  
--                 event = "QBCore:ToggleDuty", 
--                 icon = "fas fa-pen-alt", 
--                 label = "Mesai Gir/Çık", 
--                 job = "mechanic2"
--             },
--         },
--       distance = 2.0
--     })

--     exports['qb-target']:AddBoxZone("Mesai_3", vector3(949.4, -968.74, 39.51), 2.2, 1,  { 
--         name="Mesai_3", 
--         heading = 4.0, 
--         debugPoly = false, 
--         minZ = 35.51,
--         maxZ = 39.51
--     }, 
--         { options = { {  
--                 event = "QBCore:ToggleDuty", 
--                 icon = "fas fa-pen-alt", 
--                 label = "Mesai Gir/Çık", 
--                 job = "mechanic3"
--             },
--         },
--       distance = 2.0
--     })
       
-- end)



-- Depo Event
RegisterNetEvent('qb-stash:OpenStashDuty', function(data)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    id = data.stash
    TriggerServerEvent('inventory:server:OpenInventory', "stash", ""..id)
    TriggerEvent('inventory:client:SetCurrentStash', ""..id)
end)