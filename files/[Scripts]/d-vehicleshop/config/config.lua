Config = {}

-- General
-- Available: en, de, fr
Config.Locale = 'tr'

-- Available: esx and qb
Config.framework = "qb"

-- Enable this, if youre using D-Vehiclelock
Config.DVehiclelock = false

-- Set this to true if you  want that dark design as default
Config.Darkmode = true

-- Enable this if youre using d-garage
Config.DGarage = false

-- ControlKeys
Config.uikey = "E"
Config.secondKey = "H"

-- If youre using ESX Version 1.2 or higher enable it. If not let it on false
Config.ESXLegacy = false
-- Enable this if youre Using ESX 1.7.5 or higher
Config.GetSharedObjectfunction = false

Config.Currency = "$"

Config.Debug = true


Config.MySQLWaitingTime = 500

-- If you enable this the player will be teleportet in his vehicle after he parks it out. If its on false then he has to walk to it.
Config.Warpinvehicle = false

Config.SpawnOptions = {
	engine = {
		on = false,
		autostart = false,
	},
	vehiclelocked = true,
}

Config.Customize = {
	enabled = false,
	options = {
		["primary-color"] = {
			enabled = true,
			price = 5000,
		},
		["secondary-color"] = {
			enabled = true,
			price = 5000,
		},
		["plate"] = {
			enabled = false,
			price = 250000,
		},
	}
}

Config.Plate = {
	-- special signs are not allowed
	-- you can use "-" wit you want an space between the prefix and the random numbers
	prefix = ""
}

Config.Sell = {
	-- Enable this if you want that players can sell their vehicles
	enabled = false,
	-- the resell percentage influces the price which the player gets for his vehicle
	resellpercentage = 0.8,
}

-- Enable this if you use LegacyFuel and want to save the fuellevel
Config.LegacyFuel = false
Config.LegacyFuelResourceName = "ed-fuel"

-- AdvancedParking
Config.advancedparking = false

-- Coordinates and time for the Testdrive
Config.TestDriveSpot = {
	enabled = true,
	time    = 30000,
	x       = -1037.81,
	y       = -3313.72,
	z       = 13.94
}

Config.Locations = {
	{
		-- where the npc spawns, where the player can press e to view enter the vehicle
		npcspot = {
			ped = 0xC306D6F5,
			x = -56.77,
			y = -1098.78,
			z = 26.42,
			h = 30.5
		},
		-- Animation of the npc
		npcanimation = "WORLD_HUMAN_SMOKING",
		-- Where the car spawns in the "camera" view
		carpreviewspawn = {
			x = -43.71,
			y = -1094.99,
			z = 25.62,
			h = 165.5,
			-- These settings are relevant for the camera
			plusx = -7,
			plusy = -6
		},
		-- Multiple spawns, if you parking out his vehicle
		carSpawns = {
			{ x = -40.57, y = -1103.25, z = 26.42, h = 319.5 }
		},
		-- the blip / marker on the map
		Blip = {
			-- if you dont want an blip, set sprite = false
			sprite = 225,
			display = 4,
			scale = 0.7,
			color = 3,
			label = _U("vehicle")
		},
		-- All cars of your database owned_vehicles will be selected where the job column  is `nil`. unemployed = nil in db
		job = {
			"unemployed",
			"civ",
		},
		-- This value will be inserted in the your database > ownedvehicles > job column
		databasejob = "civ",
		-- All cars of your database owned_vehicles will be selected where the type column  is `car` or `nil`
		vehicles = "car",
		-- categorys = {
		-- 	"sports",
		-- 	"super",
		-- },
		-- only_vehicles = {
		-- 	"alpha",
		-- 	"banshee",
		-- },
		ignore_vehicles = {
			-- "banshee",
		},
		testdrive = {
			enabled = true
		},
	},
	{
		-- where the npc spawns, where the player can press e to view enter the vehicle
		npcspot = {
			ped = 0xC306D6F5,
			x = -247.06,
			y = 6213.17,
			z = 31.93,
			h = 138.5
		},
		npcanimation = "WORLD_HUMAN_SMOKING",
		-- Where the car spawns in the "camera" view
		carpreviewspawn = {
			x = -261.38,
			y = 6214.05,
			z = 31.48,
			h = 138.5,
			-- These settings are relevant for the camera
			plusx = -7,
			plusy = -6
		},
		-- Multiple spawns, if you parking out his vehicle
		carSpawns = {
			{ x = -254.59, y = 6204.94, z = 31.48, h = 230.5 },
			{ x = -247.36, y = 6197.51, z = 31.48, h = 224.5 },
			{ x = -239.25, y = 6196.09, z = 31.48, h = 131.5 },
		},
		-- the blip / marker on the map
		Blip = {
			-- if you dont want an blip, set sprite = false
			sprite = 225,
			display = 4,
			scale = 0.7,
			color = 3,
			label = _U("vehicle")
		},
		-- All cars of your database owned_vehicles will be selected where the job column  is `nil`. unemployed = nil in db
		job = {
			"unemployed",
			"civ",
		},
		-- This value will be inserted in the your database > ownedvehicles > job column
		databasejob = "civ",
		-- All cars of your database owned_vehicles will be selected where the type column  is `car` or `nil`
		vehicles = "car",
		categorys = {
			"muscle",
			"offroad",
			"suv",
			"vans",
		},
		-- only_vehicles = {
		-- 	"alpha",
		-- 	"banshee",
		-- },
		ignore_vehicles = {
			-- "banshee",
		},
		testdrive = {
			enabled = true
		},
	},

	{
		-- where the npc spawns, where the player can press e to view enter the vehicle
		npcspot = {
			ped = 0xC306D6F5,
			x = -247.06,
			y = 6213.17,
			z = 31.93,
			h = 138.5
		},
		npcanimation = "WORLD_HUMAN_SMOKING",
		-- Where the car spawns in the "camera" view
		carpreviewspawn = {
			x = -261.38,
			y = 6214.05,
			z = 31.48,
			h = 138.5,
			-- These settings are relevant for the camera
			plusx = -7,
			plusy = -6
		},
		-- Multiple spawns, if you parking out his vehicle
		carSpawns = {
			{ x = -254.59, y = 6204.94, z = 31.48, h = 230.5 },
			{ x = -247.36, y = 6197.51, z = 31.48, h = 224.5 },
			{ x = -239.25, y = 6196.09, z = 31.48, h = 131.5 },
		},
		-- the blip / marker on the map
		Blip = {
			-- if you dont want an blip, set sprite = false
			sprite = 225,
			display = 4,
			scale = 0.7,
			color = 3,
			label = _U("vehicle")
		},
		-- All cars of your database owned_vehicles will be selected where the job column  is `nil`. unemployed = nil in db
		job = {
			"unemployed",
			"civ",
		},
		-- This value will be inserted in the your database > ownedvehicles > job column
		databasejob = "boat",
		-- All cars of your database owned_vehicles will be selected where the type column  is `car` or `nil`
		vehicles = "boat",
		categorys = {
			"boat",
		},
		-- only_vehicles = {
		-- 	"alpha",
		-- 	"banshee",
		-- },
		ignore_vehicles = {
			-- "banshee",
		},
		testdrive = {
			enabled = false
		},
	},
}


-- ESX Events DONT TOUCH THIS IF YOU DONT EXACTLY KNOW WHAT THESE DOES
Config.esxgetSharedObjectevent = 'esx:getSharedObject'
Config.esxprefix = "esx:"
Config.esxprefix2 = "esx_"
