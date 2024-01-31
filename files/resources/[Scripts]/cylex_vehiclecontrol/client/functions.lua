function openMenu(bool)
    if state == true and bool == true then return openMenu(false) end
    local inVeh, vehicle = inVehicle()
    -- if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not inVeh and bool == true then return notify("not_invehicle", "error") end
    state = bool
    SendNUIMessage({
        action = "setLanguage",
        language = Locales[Config.Language],
    })
    refreshData()
    SetNuiFocus(state, state)
    local playerData = Cylex.Call("GetPlayerData")
    SendNUIMessage({
        action = "open",
        bool = state,

        neonEnabled = Config.Parts.neonEnabled(playerData),
        doorControlEnabled = Config.Parts.doorControlEnabled(playerData),
        mediaEnabled = Config.Parts.mediaEnabled(playerData),
        extraEnabled = Config.Parts.extraEnabled(playerData),
    })
end

function getWindows(vehicle)
    local tbl = {}
    for i = 0, 7 do 
        tbl[i] = IsVehicleWindowIntact(vehicle, i) == 1
    end
    return tbl
end

function getSeats(vehicle)
    local tbl = {}
    -- print(GetVehicleMaxNumberOfPassengers(vehicle))
    for i = -1, 5 do 
        -- print(i, GetPedInVehicleSeat(vehicle, i) == 0)
        tbl[tostring(i)] = GetPedInVehicleSeat(vehicle, i) ~= 0
    end
    return tbl
end
function getDoors(vehicle)
    local tbl = {}
    -- print(GetNumberOfVehicleDoors(vehicle))
    for i = 0, 5 do 
        tbl[i] = GetVehicleDoorAngleRatio(vehicle, i) > 0.0 and true or false
    end
    return tbl
end

function inVehicle()
    local ped = PlayerPedId()
    local veh = GetVehiclePedIsIn(ped, false)

    return veh ~= 0, veh, GetPedInVehicleSeat(veh, -1) == ped
end

function isEngineRunning(vehicle)
    return GetIsVehicleEngineRunning(vehicle) and true or false
end

local currentLightState = 2

function isLightsOn(vehicle)
    return currentLightState ~= 1
end

function isInteriorLightOn(vehicle)
    return IsVehicleInteriorLightOn(vehicle) and true or false
end

function refreshData()
    local inVeh, vehicle = inVehicle()
    -- if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not inVeh then return end
    SetVehicleModKit(vehicle, 0)
    SendNUIMessage({
        action = "setData",

        neon = getNeons(vehicle),
        neonColor = convertRGBColorToHex(GetVehicleNeonLightsColour(vehicle)),
        doors = getDoors(vehicle),
        seats = getSeats(vehicle),
        window = getWindows(vehicle),
        extras = getExtras(vehicle),
        
        engine = isEngineRunning(vehicle),
        lights = isLightsOn(vehicle),
        interiorLights = isInteriorLightOn(vehicle),
        
        fuel = getFuel(vehicle) or 100,

        vehicleDegree = math.floor(convertFahrenheitToCelsius(GetVehicleEngineTemperature(vehicle)))
    })
end

-- convert fahrenheit to celsius
function convertFahrenheitToCelsius(fahrenheit)
    return (fahrenheit - 32) * 5 / 9
end

function getFuel(vehicle)
    return DecorGetFloat(vehicle, Config.FuelDecor)
end

function getNeons(vehicle)
    local tbl = {}
    for i = 0, 3 do 
        tbl[i] = IsVehicleNeonLightEnabled(vehicle, i)
    end
    return tbl
end

function getExtras(vehicle)
    local tbl = {}
    for i = 0, 20 do 
        -- print(i, "have:", DoesExtraExist(vehicle, i), "takılı:", IsVehicleExtraTurnedOn(vehicle, i))
        if DoesExtraExist(vehicle, i) then
            tbl[tostring(i)] = IsVehicleExtraTurnedOn(vehicle, i) == 1
        end
    end
    return tbl
end

CreateThread(function()
    while true do 
        local inVeh, vehicle = inVehicle()
        if not inVeh and state then 
            openMenu(false)
        end
        Wait(250)
    end
end)

CreateThread(function()
    while true do 
        if state then 
            -- refreshData()
        end
        Wait(2500)
    end
end)

---------------
RegisterNUICallback("setDoors", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    if not GetIsDoorValid(vehicle, data.door) then notify("not_valid_door", "error") return cb("error") end
    local door = GetVehicleDoorAngleRatio(vehicle, data.door) > 0.0
    if door then
        SetVehicleDoorShut(vehicle, data.door, false)
    else
        SetVehicleDoorOpen(vehicle, data.door, false, false)
    end
    -- print(103, door, not door)
    cb(not door)
end)

RegisterNUICallback("setWindow", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    -- if not GetIsDoorValid(vehicle, data.window) then notify("not_valid_door", "error") return cb("error") end
    local window = IsVehicleWindowIntact(vehicle, data.window) == 1
    if window then
        RollDownWindow(vehicle, data.window)
    else
        RollUpWindow(vehicle, data.window)
    end
    -- print(103, window, not window)
    cb(not window)
end)

RegisterNUICallback("setSeats", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    data.seat = tonumber(data.seat)
    local isSeatFree = GetPedInVehicleSeat(vehicle, data.seat)
    -- print(140, isSeatFree, inVeh, vehicle, data.seat)
    if isSeatFree ~= 0 then notify("seat_full", "error") return cb("error") end
    SetPedIntoVehicle(PlayerPedId(), vehicle, data.seat)
    refreshData()
    cb(true)
end)

RegisterNUICallback("engine", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    local engine = isEngineRunning(vehicle)
    SetVehicleEngineOn(vehicle, not engine, false, true)
    cb(not engine)
end)

RegisterNUICallback('lights', function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    local retval, lights, highBeams = GetVehicleLightsState(vehicle)
    
    currentLightState = currentLightState + 1
    if currentLightState > 3 then 
        currentLightState = 1
    end
    -- print(198, currentLightState, "asd", retval, lights, highBeams)

    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
    if currentLightState == 3 then 
        SetVehicleFullbeam(vehicle, true)
    else
        if highBeams then
            SetVehicleFullbeam(vehicle, false)
        end
        SetVehicleLights(vehicle, currentLightState)
    end

    -- SetVehicleLights(vehicle, not light)
    cb(currentLightState ~= 1)
end)

RegisterNUICallback("interiorLights", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    local light = isInteriorLightOn(vehicle)
    SetVehicleInteriorlight(vehicle, not light)
    cb(not light)
end)

--rgb to hex
function convertRGBColorToHex(r, g, b)
    return "#"..string.format("%02x%02x%02x", r, g, b)
end

--hex to rgb
function ConvertHEX(arg1)
	local red, green, blue = HEXtoRGB(arg1)
	return red, green, blue
end

function HEXtoRGB(hexArg)
    hexArg = hexArg:gsub('#','')
    if(string.len(hexArg) == 3) then
       return tonumber('0x'..hexArg:sub(1,1)) * 17, tonumber('0x'..hexArg:sub(2,2)) * 17, tonumber('0x'..hexArg:sub(3,3)) * 17
    elseif(string.len(hexArg) == 6) then
        return tonumber('0x'..hexArg:sub(1,2)), tonumber('0x'..hexArg:sub(3,4)), tonumber('0x'..hexArg:sub(5,6))
    else
        return 0, 0, 0
    end
end

RegisterNUICallback("setNeon", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    local isNeon = IsVehicleNeonLightEnabled(vehicle, data.side)
    SetVehicleNeonLightEnabled(vehicle, data.side, not isNeon)
    cb(not isNeon)
end)

RegisterNUICallback("setNeonColor", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    local r, g, b = ConvertHEX(data.color)
    -- print(999, r,g,b, data.color)
    SetVehicleNeonLightsColour(vehicle, r, g, b)
end)

RegisterNUICallback("setExtras", function(data, cb)
    local inVeh, vehicle, isDriver = inVehicle()
    if not inVeh then notify("not_invehicle", "error") return cb("error") end
    if not isDriver then notify("not_driver", "error") return cb("error") end
    data.extra = tonumber(data.extra)
    if not DoesExtraExist(vehicle, data.extra) then notify("no_extra", "error") return cb("error") end
    SetVehicleAutoRepairDisabled(vehicle, true)
    SetVehicleModKit(vehicle, 0)
    local isExtra = IsVehicleExtraTurnedOn(vehicle, data.extra) == 1
    SetVehicleExtra(vehicle, data.extra, isExtra)
    -- print(not isExtra, isExtra, IsVehicleExtraTurnedOn(vehicle, data.extra))
    cb(IsVehicleExtraTurnedOn(vehicle, data.extra))
end)

function text(txt)
    return Locales[Config.Language][txt]
end

function notify(msg, type)
    return Config.Notify(text(msg), type)
end

local function isRunningMusic(musicId)
    if not exports['xsound']:soundExists(musicId) then return false end
    return exports['xsound']:isPlaying(musicId) and true or false
end

local function getMusicInfo(musicId)
    local musicInfo = exports['xsound']:getInfo(musicId)
    if not musicInfo then return false end
    return {
        currentTime = musicInfo.timeStamp,
        maxDuration = musicInfo.maxDuration,
        volume = musicInfo.volume * 100,
        paused = musicInfo.paused,
        playing = musicInfo.playing,
        url = musicInfo.url
    }
end

RegisterNUICallback('playMusic', function(data, cb)
    local id = tostring(GetPlayerServerId(PlayerId()))
    local musicInfo = getMusicInfo(id)

    if musicInfo then
        -- print(265, musicInfo.url, data.url, musicInfo.playing)
        if musicInfo.url == data.url then 
            if musicInfo.playing then
                PauseSong()
            else
                ResumeSong()
            end
            musicInfo.playing = not musicInfo.playing
            SendNUIMessage({
                action = 'setMusicInfo',
                musicInfo = musicInfo
            })
            return
        end
        StopSong()
    end
    PlaySong(data.url, false)
end)

RegisterNUICallback('pauseMusic', function(data, cb)
    StopSong()
end)

CreateThread(function()
    while not NetworkIsSessionStarted() do Wait(250) end
    while true do
        local id = tostring(GetPlayerServerId(PlayerId()))
        if isRunningMusic(id) then
            local musicInfo = getMusicInfo(id)
            -- print(26666,json.encode(musicInfo, {indent = true}))
            if musicInfo then 
                SendNUIMessage({
                    action = 'setMusicInfo',
                    musicInfo = musicInfo
                })
            
            end
        end
        Wait(1000)
    end
end)

RegisterNUICallback('setVolume', function(data, cb)
    local id = tostring(GetPlayerServerId(PlayerId()))
    if not isRunningMusic(id) then return end
    exports["xsound"]:setVolume(id, data.volume / 100)
end)