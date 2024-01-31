local playingSongs = {}
local musicOn = false
local SongMinimumDistance = Config.SongMinimumDistance + 0.0
local selfId = false

function PlaySong(link, mp3)
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    local serverId = GetPlayerServerId(PlayerId())
    local muzikAdi = tostring(serverId)
    local vehicle = GetVehiclePedIsIn(ped)
    if vehicle == 0 then return print('no vehicle') end
    if musicOn then
        TriggerServerEvent("musicplayer:server:stopSong", muzikAdi)
        musicOn = false
    end
    if #playingSongs >= 99 then
        return print('Too many people using the youtube app, so the sound of the video you opened cannot be heard by people nearby')
    end
    TriggerServerEvent("musicplayer:server:playSong", pos, muzikAdi, link, serverId, false, VehToNet(vehicle))
    -- if mp3 then
    --     TriggerServerEvent("musicplayer:server:playSong", pos, muzikAdi, "phone-ring/" .. link, serverId, true)
    -- end
    musicOn = true
end

function StopSong()
    if musicOn then
        musicOn = false
        TriggerServerEvent("musicplayer:server:stopSong", tostring(GetPlayerServerId(PlayerId())))
    end
end

function PauseSong()
    local myId = tostring(GetPlayerServerId(PlayerId()))
    TriggerServerEvent("musicplayer:server:pauseSong", myId)
end

function ResumeSong()
    local myId = tostring(GetPlayerServerId(PlayerId()))
    TriggerServerEvent("musicplayer:server:resumeSong", myId)
end

RegisterNetEvent('musicplayer:client:playSong')
AddEventHandler('musicplayer:client:playSong', function(pos, muzikAdi, link, serverId, mp3, vehicleNet)
    if not enableSelf(muzikAdi) then return end
    local vehicle = NetworkGetEntityFromNetworkId(vehicleNet)
    if not vehicle or not DoesEntityExist(vehicle) then return print('no vehicle in musicplayer:client:playSong') end
    playingSongs[muzikAdi] = {}
    playingSongs[muzikAdi]["duraklat"] = false
    playingSongs[muzikAdi]["serverId"] = serverId
    playingSongs[muzikAdi]["vehicle"] = vehicle
    playingSongs[muzikAdi]["mp3"] = mp3
    if mp3 then
        PlayUrlPos(muzikAdi, link, 0.1, pos)
        setVolumeMax(muzikAdi, 0.1)
        Distance(muzikAdi, 10)
    else
        PlayUrlPos(muzikAdi, link, 0.15, pos)
        setVolumeMax(muzikAdi, 0.15)
        Distance(muzikAdi, 15)
    end
end)

RegisterNetEvent('musicplayer:client:stopSong')
AddEventHandler('musicplayer:client:stopSong', function(muzikAdi)
    if not enableSelf(muzikAdi) then return end
    playingSongs[muzikAdi] = nil
    Destroy(muzikAdi)
end)

RegisterNetEvent('musicplayer:client:pauseSong')
AddEventHandler('musicplayer:client:pauseSong', function(muzikAdi)
    if not enableSelf(muzikAdi) then return end
    if muzikAdi and playingSongs[muzikAdi] and playingSongs[muzikAdi]["duraklat"] == false then
        playingSongs[muzikAdi]["duraklat"] = true
        Pause(muzikAdi)
    end
end)

RegisterNetEvent('musicplayer:client:resumeSong')
AddEventHandler('musicplayer:client:resumeSong', function(muzikAdi)
    if not enableSelf(muzikAdi) then return end
    if muzikAdi and playingSongs[muzikAdi] and playingSongs[muzikAdi]["duraklat"] == true then
        playingSongs[muzikAdi]["duraklat"] = false
        Resume(muzikAdi)
    end
end)

local time = 100
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(time)
        for x, y in pairs(playingSongs) do
            local player = GetPlayerFromServerId(playingSongs[x]["serverId"])
            if player ~= -1 then
                local vehicle = playingSongs[x]["vehicle"]
                if vehicle ~= 0 and DoesEntityExist(vehicle) then
                    local ped = GetPlayerPed(player)
                    local targetVehicleCoords = GetEntityCoords(vehicle)
                    local sourcePlayerCoords = GetEntityCoords(PlayerPedId())
                    local mesafe = #(sourcePlayerCoords - targetVehicleCoords)
                    if mesafe < 200 then
                        time = 100
                        Position(x, targetVehicleCoords)
                        -- if IsPedInAnyVehicle(ped, true) == 1 then
                            -- local vehicle = GetVehiclePedIsIn(ped, false)
                            if GetEntitySpeed(vehicle) * 3.6 > 200.0 then
                                Distance(x, 140)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 150.0 then
                                Distance(x, 125)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 110.0 then
                                Distance(x, 100)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 90.0 then
                                Distance(x, 80)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 60.0 then
                                Distance(x, 65)
                            elseif GetEntitySpeed(vehicle) * 3.6 > 30.0 then
                                Distance(x, 40)
                            else
                                Distance(x, SongMinimumDistance)
                            end
                        -- else
                        --     Distance(x, 15)
                        -- end
                    else
                        time = 2000
                        Position(x, kordinat)
                    end
                else
                    local muzikAdi = tostring(playingSongs[x]["serverId"])
                    playingSongs[muzikAdi] = nil
                    Destroy(muzikAdi)
                end
            else
                local muzikAdi = tostring(playingSongs[x]["serverId"])
                playingSongs[muzikAdi] = nil
                Destroy(muzikAdi)
            end
        end
    end
end)

function Resume(muzikAdi)
    return exports['xsound']:Resume(muzikAdi)
end

function Position(x, kordinat)
    return exports['xsound']:Position(x, kordinat)
end

function Distance(x, mesafe)
    return exports['xsound']:Distance(x, mesafe)
end

function Destroy(muzikAdi)
    return exports['xsound']:Destroy(muzikAdi)
end

function Pause(muzikAdi)
    return exports['xsound']:Pause(muzikAdi)
end

function PlayUrlPos(muzikAdi, link, ses, kordinat)
    return exports['xsound']:PlayUrlPos(muzikAdi, link, ses, kordinat)
end

function setVolumeMax(muzikAdi, ses)
    return exports['xsound']:setVolumeMax(muzikAdi, ses)
end

function enableSelf(muzikAdi)
    return selfId and tostring(GetPlayerServerId(PlayerId())) ~= muzikAdi or true
end