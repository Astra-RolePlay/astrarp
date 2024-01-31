function Load(name)
	local resourceName = GetCurrentResourceName()
	local chunk = LoadResourceFile(resourceName, ('data/%s.lua'):format(name))
	if chunk then
		local err
		chunk, err = load(chunk, ('@@%s/data/%s.lua'):format(resourceName, name), 't')
		if err then
			error(('\n^1 %s'):format(err), 0)
		end
		return chunk()
	end
end

-- Settings
Config = {}

Config.MaxDistance = 5.0
Config.Debug = false
Config.Standalone = false
Config.EnableOutline = false
Config.EnableDefaultOptions = false
Config.DisableInVehicle = false
Config.OpenKey = 'LMENU'
Config.OpenControlKey = 19
Config.MenuControlKey = 237

-- Target Configs
Config.CircleZones = {

}

Config.BoxZones = {

}

Config.PolyZones = {

}

Config.TargetBones = {

}

Config.TargetEntities = {
    
}

Config.TargetModels = {

}

Config.GlobalPedOptions = {

}

Config.GlobalVehicleOptions = {
    options = {
        {
            type = 'client',
            event = 'qb-methcar:cook',
            icon = 'fas fa-blender',
            label = 'Pişirmeye Başla',
			canInteract = function(entity)
                if GetVehicleEngineHealth(entity) <= 0 then return false end
                	local model = GetEntityModel(entity)
					local modelName = GetDisplayNameFromVehicleModel(model)
					if modelName == 'JOURNEY' then
                    return true
                end
                return false
            end
        },
    },
    distance = 2.0,
}

Config.GlobalObjectOptions = {

}

Config.GlobalPlayerOptions = {

	bones = {
		'mp_f_freemode_01',
		'mp_m_freemode_01',
		},
		
	options = {
	
		{
			id = 1,
			type = "client",
			event = "qb-hud:GiveMoney",
			icon = "fas fa-dollar",
			label = "Para Ver",
		},
        {		
			id = 2,
            type = 'client',
            event = 'vehiclekey:givekey',
            icon = 'fas fa-key',
            label = 'Anahtar Ver',
			canInteract = function()
				return exports["qb-vehiclekeys"]:GetVehicle()
			end        
		},

	}
}

Config.Peds = {
	{ -- ÜZÜM SATIŞ
		model = 'a_m_y_business_02',
		coords = vector4(-2189.29, -398.77, 12.3, 227.57),
		networked = false,
		invincible = true,
		blockevents = true,
		freeze = true,
		target = {
			options = {
				{
					type = "client",
					event = "ude-uzum:weedSellTarget",
					icon = "fas fa-sign-in-alt",
					label = "Üzüm Suyu Sat",
				},
			},
			distance = 2.5
		}
	},
	{ -- ÜZÜM İŞLEME
		model = 'a_m_y_beach_01',
		coords = vector4(2016.95, 4987.87, 42.1, 133.61),
		networked = false,
		invincible = true,
		blockevents = true,
		freeze = true,
		target = {
			options = {
				{
					type = "client",
					event = "ude-uzum:processGrapeTarget",
					icon = "fas fa-sign-in-alt",
					label = "Üzüm İşle",
				},
			},
			distance = 2.5
		}
    },
    -- BlackMarket
	{
		model = 'a_m_y_soucent_02',
		coords = vector4(-2167.66, 5195.59, 15.88, 19.77),
		networked = true,
		invincible = true,
		blockevents = true,
		freeze = true,
		target = {
			options = {
				{
                    type = 'client',
                    event = 'qb-pawnshop:client:openMenu',
					icon = 'fas fa-ring',
                    label = 'Kaçak Mal Tüccarı',
                },
			},
			distance = 2.5
		}
    },
}

-- Functions
local function JobCheck() return true end
local function GangCheck() return true end
local function ItemCount() return true end
local function CitizenCheck() return true end

CreateThread(function()
	if not Config.Standalone then
		local QBCore = exports['qb-core']:GetCoreObject()
		local PlayerData = QBCore.Functions.GetPlayerData()

		ItemCount = function(item)
			for _, v in pairs(PlayerData.items) do
				if v.name == item then
					return true
				end
			end
			return false
		end

		JobCheck = function(job)
			if type(job) == 'table' then
				job = job[PlayerData.job.name]
				if job and PlayerData.job.grade.level >= job then
					return true
				end
			elseif job == 'all' or job == PlayerData.job.name then
				return true
			end
			return false
		end

		GangCheck = function(gang)
			if type(gang) == 'table' then
				gang = gang[PlayerData.gang.name]
				if gang and PlayerData.gang.grade.level >= gang then
					return true
				end
			elseif gang == 'all' or gang == PlayerData.gang.name then
				return true
			end
			return false
		end

		CitizenCheck = function(citizenid)
			return citizenid == PlayerData.citizenid or citizenid[PlayerData.citizenid]
		end

		RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
			PlayerData = QBCore.Functions.GetPlayerData()
			SpawnPeds()
		end)

		RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
			PlayerData = {}
			DeletePeds()
		end)

		RegisterNetEvent('QBCore:Client:OnJobUpdate', function(JobInfo)
			PlayerData.job = JobInfo
		end)

		RegisterNetEvent('QBCore:Client:OnGangUpdate', function(GangInfo)
			PlayerData.gang = GangInfo
		end)

		RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
			PlayerData = val
		end)
	else
		local firstSpawn = false
		AddEventHandler('playerSpawned', function()
			if not firstSpawn then
				SpawnPeds()
				firstSpawn = true
			end
		end)
	end
end)

function CheckOptions(data, entity, distance)
	if distance and data.distance and distance > data.distance then return false end
	if data.job and not JobCheck(data.job) then return false end
	if data.gang and not GangCheck(data.gang) then return false end
	if data.item and not ItemCount(data.item) then return false end
	if data.citizenid and not CitizenCheck(data.citizenid) then return false end
	if data.canInteract and not data.canInteract(entity, distance, data) then return false end
	return true
end
