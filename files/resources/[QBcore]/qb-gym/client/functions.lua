local QBCore = exports['qb-core']:GetCoreObject()
local isDead = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    local PlayerData = QBCore.Functions.GetPlayerData()
    FetchSkills(PlayerData.metadata["skill"])
end)

local blips = {
     {title="Spor Salonu", colour=5, id=311, x = -1202.43, y = -1567.53, z = 4.61},
     {title="Balıkçı Dükkanı", colour=5, id=404, x = -1792.64, y = -1203.22, z = 4.61},
     {title="İskele", colour=18, id=266, x = -1839.89, y = -1198.17, z = 4.61},
}

local blips2 = {
    {title="San Andreas Park", colour=13, id=684, x = -1249.07, y = -1473.58, z = 4.61},
}

Citizen.CreateThread(function()
    for _, info in pairs(blips2) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.6)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

FetchSkills = function(data)
    for status, value in pairs(data) do
        if Config.Skills[status] then
            Config.Skills[status]["Current"] = value["Current"]
        end
    end
    RefreshSkills()
end

SkillMenu = function()
    QBCore.UI.Menu.CloseAll()
    local skills = {}

	for type, value in pairs(Config.Skills) do
        if value["Menu"] then
            table.insert(skills, {
                ["label"] = type .. ': <span style="color:green">' .. QBCore.Shared.Round(value["Current"], 1) .. "</span> %"
            })
        end
	end

	QBCore.UI.Menu.Open("default", GetCurrentResourceName(), "skill_menu", {
		["title"] = "Skills",
		["align"] = "center",
		["elements"] = skills

	}, function(data, menu)

	end, function(data, menu)
		menu.close()
	end)
end

GetCurrentSkill = function(skill)
    return Config.Skills[skill]
end

UpdateSkill = function(skill, amount)
    if not Config.Skills[skill] then return  end

    local SkillAmount = Config.Skills[skill]["Current"]
    
    if SkillAmount + tonumber(amount) < 0 then
        Config.Skills[skill]["Current"] = 0
    elseif SkillAmount + tonumber(amount) > 99 then
        Config.Skills[skill]["Current"] = 99
    else
        Config.Skills[skill]["Current"] = SkillAmount + tonumber(amount)
    end
    
    RefreshSkills()

	TriggerServerEvent("qb-gym:update", Config.Skills, QBCore.Key)
end

UpdateSkillRemove = function(skill, amount)
    if not Config.Skills[skill] then  return end

    local SkillAmount = Config.Skills[skill]["Current"]
    
    if SkillAmount + tonumber(amount) < 0 then
        Config.Skills[skill]["Current"] = 0
    elseif SkillAmount + tonumber(amount) > 99 then
        Config.Skills[skill]["Current"] = 99
    else
        Config.Skills[skill]["Current"] = SkillAmount - tonumber(amount)
    end
    
    RefreshSkills()

	TriggerServerEvent("qb-gym:update", Config.Skills, QBCore.Key)
end

RefreshSkills = function()
    for type, value in pairs(Config.Skills) do
        if value["Stat"] then
            local skillValue =  QBCore.Shared.Round(value["Current"])
            StatSetInt(GetHashKey(value["Stat"]), skillValue, true)
            TriggerEvent("weaponry:set-unarmed-damage", value["Stat"], skillValue)
            SendNUIMessage({
                type = 'update',
                skill = value["Stat"],
                skillValue = QBCore.Shared.Round(value["Current"], 2)
            })
        end
    end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		local ped = PlayerPedId()
		local vehicle = GetVehiclePedIsUsing(ped)

        if DoesEntityExist(vehicle) then
            if GetPedInVehicleSeat(vehicle, -1) == ped then
                local speed = GetEntitySpeed(vehicle) * 3.6
                if GetVehicleClass(vehicle) == 8 or GetVehicleClass(vehicle) == 13 and speed >= 5 then
                    local rotation = GetEntityRotation(vehicle)
                    if IsControlPressed(0, 210) then
                        if rotation.x >= 25.0 then
                            UpdateSkill("Ön Kaldırma Yeteneği", 0.5)
                        end 
                    end
                end

                if speed >= 80 then
                    UpdateSkill("Sürüş Yeteneği", 0.1)
                end
            end
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(8000)
        local playerPed = PlayerPedId()
        if not isDead then
            if IsPedSwimmingUnderWater(playerPed) then
                UpdateSkill("Ciğer Kapasitesi", 0.1)
                UpdateSkill("Kondisyon", 0.02)
            end
        end
	end
end)

local skillMenuOpen = false

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/skill', 'Skill Menüsünü Aç Kapat', {})
end)

RegisterCommand("skill", function()
    skillMenuOpen = not skillMenuOpen
    if skillMenuOpen then
        SendNUIMessage({type = 'open'})
    else
        SendNUIMessage({type = 'close'})
    end
end)