local QBCore = exports['qb-core']:GetCoreObject()
local bussy = false
local inAnimation = false
local barCount = 0
local esktraBarCount = 3
local targetPlayer = 0
local taskBarActive = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)
        if inAnimation then
            DisableControlAction(0, 73, true)
            if IsDisabledControlJustReleased(0, 73) then
                clearAnim(true)
            end
        end
    end
end)

RegisterNetEvent('ed-erp:openmenu', function()
    local Menu = {
        {
            header = "E-RP Menü",
            isMenuHeader = true,
        },
        {
            header = "E-RP İsteği Gönder",
            icon = "fa-solid fa-heart-circle-plus",
            txt = "Kişinin vatandaş kimliğini yazarak istek gönderebilirsiniz.",
            params = {
                event = "ed-erp:istek",
            }
        },
        {
            header = "E-RP İptal Et",
            icon = "fa-solid fa-heart-circle-xmark",
            txt = "E-RP izni verilmiş oyuncunun iznini iptal eder!",
            params = {
                event = "ed-erp:iptal",
            }
        },
        {
            header = "Pozisyonlar",
            icon = "fa-solid fa-face-kiss-wink-heart",
            txt = "Pozisyon menüsünü açar.",
            params = {
                event = "ed-erp:pozisyonlar",
            }
        },
    }
    Menu[#Menu+1] = {
        header = "⬅ Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('ed-erp:pozisyonlar', function()
    local Menu = {
        {
            header = "E-RP Menü Pozisyonlar",
            isMenuHeader = true,
        },
        {
            header = "Pozisyon 1",
            icon = "fa-solid fa-heart-circle-bolt",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P1",
            }
        },
        {
            header = "Pozisyon 2",
            icon = "fa-solid fa-heart-circle-bolt",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P2",
            }
        },
        {
            header = "Pozisyon 3 (Araçta)",
            icon = "fa-solid fa-car-on",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P3",
            }
        },
        {
            header = "Pozisyon 4 (Araçta)",
            icon = "fa-solid fa-car-on",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P4",
            }
        },
        {
            header = "Pozisyon 5 (Araçta)",
            icon = "fa-solid fa-car-on",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P5",
            }
        },
        {
            header = "Pozisyon 6 (Araçta)",
            icon = "fa-solid fa-car-on",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P6",
            }
        },
        {
            header = "Pozisyon 7 (Araçta)",
            icon = "fa-solid fa-car-on",
            txt = "Seks sadece doğru tekniklerden ibaret değildir.",
            params = {
                event = "ed-erp:P7",
            }
        },
    }
    Menu[#Menu+1] = {
        header = "⬅ Geri Dön",
        params = {
            event = "ed-erp:openmenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('ed-erp:istek', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "İstek Gönder",
        submitText = "Gönder",
        inputs = {
            { type = 'number', isRequired = true, name = 'oyuncuid', text = 'İD Giriniz' },
        }
    })
    if dialog then
        if not dialog.oyuncuid then return end
        ExecuteCommand('erp '..dialog.oyuncuid)
    end
end)

RegisterNetEvent('ed-erp:iptal', function()
    ExecuteCommand('erpiptal')
end)

RegisterNetEvent('ed-erp:P1', function()
    ExecuteCommand('p1')
end)
RegisterNetEvent('ed-erp:P2', function()
    ExecuteCommand('p2')
end)
RegisterNetEvent('ed-erp:P3', function()
    ExecuteCommand('p3')
end)
RegisterNetEvent('ed-erp:P4', function()
    ExecuteCommand('p4')
end)
RegisterNetEvent('ed-erp:P5', function()
    ExecuteCommand('p5')
end)
RegisterNetEvent('ed-erp:P6', function()
    ExecuteCommand('p6')
end)
RegisterNetEvent('ed-erp:P7', function()
    ExecuteCommand('p7')
end)

-- Citizen.CreateThread(function()
--     while true do
--         Citizen.Wait(1000)
--         if inAnimation then
--             barCount = barCount + 1
--             local playerPed = PlayerPedId()
--             local cd = math.random(4000,6000)
--             if GetEntityModel(PlayerPedId()) ~= 1885233650 then cd = math.random(25000,35000) end 
--             Citizen.Wait(cd)
--             if inAnimation and taskBarActive then
--                 local taskBarTime = (8-barCount)
--                 local random = math.random(10,15)
--                 if taskBarTime < 1 then 
--                     TriggerServerEvent("3dme:display", "Kişi Gelmek Üzeredir", QBCore.Key, "do")
--                     taskBarTime = 1 
--                     esktraBarCount = esktraBarCount - 1 
--                     if esktraBarCount < 0 then
--                         random =  math.random(1,5)
--                     elseif esktraBarCount < 2 then
--                         taskBarTime = 0.5
--                     end
--                 end
--                 local finished = exports["ed-skillbar"]:taskBar(taskBarTime*1000, random, true)
--                 if not finished then
--                     TriggerServerEvent("3dme:display", "Kişi Gelmiştir", QBCore.Key, "do")
--                     Citizen.Wait(2500)
--                     clearAnim(true)
--                 end
--             end
--         end
--     end
-- end)

RegisterNetEvent('ed-erp:client:clear-anim')
AddEventHandler('ed-erp:client:clear-anim', function()
    clearAnim(false)
end)

RegisterNetEvent('ed-erp:izin')
AddEventHandler('ed-erp:izin', function(gonderen, name)
    if not bussy then
        bussy = true
        QBCore.Functions.Notify(name .." E-RP İzni İstiyor, Kabul Etmek İçin [Y] Tuşuna Bas", "primary", 15000)
        local time = 1000
        while time > 0 do
            Citizen.Wait(1)
            time = time - 1
            if time == 0 then
                QBCore.Functions.Notify("İstek Zaman Aşımına Uğradı", "error")
                TriggerServerEvent("ed-erp:cancel", gonderen)
            end
            if IsControlJustPressed(0, 246) then
                time = 0
                QBCore.Functions.Notify("İstek Kabul Edildi", "success")
                TriggerServerEvent("ed-erp:ok", gonderen)
            end
        end
        bussy = false
    end
end)

RegisterNetEvent('ed-erp:animasyon')
AddEventHandler('ed-erp:animasyon', function(car, driveSeat, flag, dict, anim, konumZorla, target, rot, x, y)
    if not inAnimation then
        taskBarActive = true
        barCount = 0
        local playerPed = PlayerPedId()
        if not IsPedSittingInAnyVehicle(playerPed) and car then
            QBCore.Functions.Notify("Araçta Değilsin!", "error")
            return
        elseif IsPedSittingInAnyVehicle(playerPed) and car then
            local playerVehicle = GetVehiclePedIsIn(playerPed)
            if driveSeat then
                if GetPedInVehicleSeat(playerVehicle, -1) ~= playerPed then
                    QBCore.Functions.Notify("Doğru Koltukda Değilsin!", "error")
                    return
                end
            else
                if GetPedInVehicleSeat(playerVehicle, 0) ~= playerPed then
                    QBCore.Functions.Notify("Doğru Koltukda Değilsin!", "error")
                    return
                end
            end
        elseif IsPedSittingInAnyVehicle(playerPed) and not car then
            QBCore.Functions.Notify("Bu Animasyonu Araçta Yapamazsın!", "error")
            return
        end

        targetPlayer = target

        if anim == "bj_loop_prostitute" or anim == "f_blow_job_loop" or anim == "pimpsex_hooker" then taskBarActive = false end
        inAnimation = true
        if konumZorla then
            SetEntityCollision(playerPed, false, false)
            FreezeEntityPosition(playerPed, true)
            local player = GetPlayerFromServerId(targetPlayer)
            local ped = GetPlayerPed(player)

            local playerheading = GetEntityHeading(ped)
            local playerlocation = GetEntityForwardVector(ped)
            local playerCoords = GetEntityCoords(ped)
            konumaldir(playerPed, playerlocation, playerheading, playerCoords, x, y, rot)
        end

        -- QBCore.Shared.RequestAnimDict(dict, function() 
        --     while inAnimation do
        --         if not IsEntityPlayingAnim(PlayerPedId(), dict, anim, 1) then
        --             TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, -1, flag, 0.0, false, false, false)
        --         end
        --         Citizen.Wait(100)
        --     end
        -- end)
    else
        QBCore.Functions.Notify("Zaten Bir İş Üzerindesin!", "error")
    end
end)

function konumaldir(playerPed, playerlocation, playerheading, playerCoords, nx, ny, rot)
    SetCurrentPedWeapon(playerPed, `WEAPON_UNARMED`, true) -- unarm player
    if nx == nil then nx = 0 end
    if ny == nil then ny = 0 end
    local x, y, z = table.unpack(playerCoords + playerlocation * vector3(nx, ny, 0.0))
    SetEntityCoords(playerPed, x, y, z-1.0)
    if rot then
        SetEntityHeading(playerPed, playerheading-180)
    else
        SetEntityHeading(playerPed, playerheading)
    end
end

function clearAnim(targetClear)
    inAnimation = false
    local playerPed = PlayerPedId()
    if not IsPedSittingInAnyVehicle(playerPed) then
        SetEntityCollision(playerPed, true, true)
        FreezeEntityPosition(playerPed, false)
        ClearPedTasksImmediately(playerPed)
    else
        ClearPedTasks(playerPed)
    end
    if targetClear then
        TriggerServerEvent("ed-erp:clear-anim", targetPlayer)
    end
end