local QBCore = exports["qb-core"]:GetCoreObject()
Citizen.CreateThread(
        function()
            while QBCore == nil do
                TriggerEvent(
                        "QBCore:GetObject",
                        function(obj)
                            QBCore = obj
                        end
                )
                Citizen.Wait(200)
            end
        end
)

-- Üzüm SATMA
RegisterNetEvent("ude-uzum:weedSellTarget")
AddEventHandler("ude-uzum:weedSellTarget", function()
    weedSell()
end)
function weedSell()
    if not is_selling then
        is_selling = true
        exports["mythic_progbar"]:Progress(
                {
                    name = "weedSell",
                    duration = 3500,
                    label = "Üzüm satıyorsun...",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    },
                    animation = {
                        animDict = "mp_arresting",
                        anim = "a_uncuff",
                        flags = 49
                    }
                },
                function(cancelled)
                    if not cancelled then
                        local dialog = exports["qb-input"]:ShowInput(
                                {
                                    header = "İllegal Satış",
                                    submitText = "Sat",
                                    inputs = {
                                        {
                                            text = "Kaç adet satmak istiyorsun?",
                                            name = "amount",
                                            type = "text",
                                            isRequired = true
                                        }
                                    }
                                }
                        )

                        if dialog ~= nil then
                            TriggerServerEvent("ude-uzum:weedSell", dialog.amount)
                        end
                        is_selling = false
                    else
                    end
                end
        )
    end
end

-- Üzüm ISLEME

RegisterNetEvent("ude-uzum:processGrapeTarget")
AddEventHandler("ude-uzum:processGrapeTarget",function()
    processWeed()
end)
function processWeed()
    if not is_processing then
        is_processing = true
        exports["mythic_progbar"]:Progress(
                {
                    name = "processWeed",
                    duration = 3500,
                    label = "Üzüm isliyorsun...",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    },
                    animation = {
                        animDict = "mp_arresting",
                        anim = "a_uncuff",
                        flags = 49
                    }
                },
                function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("ude-uzum:processWeed")
                    end
                    is_processing = false
                end
        )
    end
end

-- Üzüm TOPLAMA

local LastWeedLocation = 1

Citizen.CreateThread(
        function()
            while true do
                local sleep = 500
                local player = PlayerPedId()
                local playercoords = GetEntityCoords(player)
                local dst = GetDistanceBetweenCoords(
                        playercoords,
                        Config.WeedLocation[LastWeedLocation].x,
                        Config.WeedLocation[LastWeedLocation].y,
                        Config.WeedLocation[LastWeedLocation].z,
                        true
                )
                local dst2 = GetDistanceBetweenCoords(
                        playercoords,
                        Config.WeedLocation[LastWeedLocation].x,
                        Config.WeedLocation[LastWeedLocation].y,
                        Config.WeedLocation[LastWeedLocation].z,
                        true
                )
                if dst2 < 32 then
                    sleep = 2
                    DrawMarker(
                            2,
                            Config.WeedLocation[LastWeedLocation].x,
                            Config.WeedLocation[LastWeedLocation].y,
                            Config.WeedLocation[LastWeedLocation].z,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            0.0,
                            0.3,
                            0.3,
                            0.3,
                            100,
                            0,
                            254,
                            150,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0,
                            0
                    )
                    DrawText3Ds(
                            Config.WeedLocation[LastWeedLocation].x,
                            Config.WeedLocation[LastWeedLocation].y,
                            Config.WeedLocation[LastWeedLocation].z + 1.3,
                            "[E] Üzüm Topla"
                    )
                    if dst2 < 1 then
                        if IsControlJustReleased(0, 38) then
                            LastWeedLocation = math.random(1, #Config.WeedLocation)
                            gatherWeed()
                        end
                    end
                end
                Citizen.Wait(sleep)
            end
        end
)

function gatherWeed()
    if not is_gathering then
        is_gathering = true
        exports["mythic_progbar"]:Progress(
                {
                    name = "gatherWeed",
                    duration = 7000,
                    label = "Üzüm topluyorsun...",
                    useWhileDead = false,
                    canCancel = false,
                    controlDisables = {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true
                    },
                    animation = {
                        animDict = "mp_arresting",
                        anim = "a_uncuff",
                        flags = 49
                    }
                },
                function(cancelled)
                    if not cancelled then
                        TriggerServerEvent("ude-uzum:gatherWeed")
                        is_gathering = false
                    else
                    end
                end
        )
    end
end

-- ELLEME

function DrawText3Ds(x, y, z, text)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local px, py, pz = table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x, _y)
    local factor = (string.len(text)) / 250
    DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 75)
end

Citizen.CreateThread(
        function()
            for _, info in pairs(Config.Blips) do
                info.blip = AddBlipForCoord(info.x, info.y, info.z)
                SetBlipSprite(info.blip, info.id)
                SetBlipDisplay(info.blip, 4)
                SetBlipScale(info.blip, 0.7) -- BURASI HARİTADAKİ BLİP BÜYÜKLÜĞÜ
                SetBlipColour(info.blip, info.colour)
                SetBlipAsShortRange(info.blip, true)
                BeginTextCommandSetBlipName("STRING")
                AddTextComponentString(info.title)
                EndTextCommandSetBlipName(info.blip)
            end
        end
)