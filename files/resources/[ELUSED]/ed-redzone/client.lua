QBCore = exports['qb-core']:GetCoreObject()
local PlayerJob
local isLoggedIn = false

local blacklistJobs = {
    ['police'] = true,
    ['sheriff'] = true,
    ['sasp'] = true,
}

Citizen.CreateThread(function()
    while QBCore == nil do
        TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
        Citizen.Wait(200)
    end
    PlayerJob = QBCore.Functions.GetPlayerData().job.name
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        isLoggedIn = true
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
    PlayerJob = QBCore.Functions.GetPlayerData().job.name 
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
    PlayerJob = job.name
end)

Citizen.CreateThread(function()
	redZoneNotify = false
    while true do
        Citizen.Wait(1750)
        if isLoggedIn then
            local ped = PlayerPedId()
            if Region() then
                if blacklistJobs[PlayerJob] then
                    QBCore.Functions.Notify('Bu alan sana göre değil. Uzaklaş yoksa öleceksin!')
                    SetEntityHealth(ped, GetEntityHealth(ped) - 2)
                end
                if IsPedInAnyVehicle(ped) then
                    QBCore.Functions.Notify('Bu alana araçla giremezsin!')
                    SetEntityHealth(ped, GetEntityHealth(ped) - 5)
                end
				if not redZoneNotify then
					QBCore.Functions.Notify('Kırmızı Alana Giriş Yaptın!', 'success')
                    TriggerServerEvent('ed-redzone:server:enableBucket')
					redZoneNotify = true
				end
                --Redzone(true)
            else
				if redZoneNotify then
					QBCore.Functions.Notify('Kırmızı Alandan Çıkış Yaptın!', 'error')
                    TriggerServerEvent('ed-redzone:server:disableBucket')
					redZoneNotify = false
				end
                --Redzone(false)
            end
        end
    end
end)

Redzone = function(status)
    if status then
        AnimpostfxPlay("MenuMGSelectionTint", 1000, true)
    elseif not status then
        AnimpostfxStop("MenuMGSelectionTint")
    end
end

Region = function()
    local ped = PlayerPedId()
    local pedCoord = GetEntityCoords(ped)
    local retval = false

    for k,v in pairs(ED['Zones']) do
        local dist = #(pedCoord - v.coords)

        if dist <= v.radius then
            retval = true
        end
    end
    return retval
end

if ED['REDZONE'] then
    for k, v in pairs(ED['Zones']) do
        blip = AddBlipForRadius(v.coords.x, v.coords.y, v.coords.z, v.radius)
        SetBlipHighDetail(blip, true)
        SetBlipColour(blip, 1)
        SetBlipAlpha (blip, 128)
    end
end

exports('getRedzone', function()
    return Region()
end)