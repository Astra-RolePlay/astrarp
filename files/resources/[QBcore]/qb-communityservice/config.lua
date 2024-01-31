Config = {}
-- # By how many services a player's community service gets extended if he tries to escape
Config.ServiceExtensionOnEscape	= 5

-- # Don't change this unless you know what you are doing.
Config.ServiceLocation = vector3(170.43, -990.7, 30.09)

-- # Don't change this unless you know what you are doing.
Config.ServiceLocations = {
	{ type = "cleaning", coords = vector3(170.0, -1006.0, 29.34) },
	{ type = "cleaning", coords = vector3(177.0, -1007.94, 29.33) },
	{ type = "cleaning", coords = vector3(181.58, -1009.46, 29.34) },
	{ type = "cleaning", coords = vector3(189.33, -1009.48, 29.34) },
	{ type = "cleaning", coords = vector3(195.31, -1016.0, 29.34) },
	{ type = "cleaning", coords = vector3(169.97, -1001.29, 29.34) },
	{ type = "cleaning", coords = vector3(164.74, -1008.0, 29.43) },
	{ type = "cleaning", coords = vector3(163.28, -1000.55, 29.35) },
}

Config.Clothes = {
    -- Here you can configure clothes. More information on: https://docs.fivem.net/natives/?_0xD4F7B05C. Under this link you can see what id means what component.
    male = {
        {["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 3, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 4, ["texture"] = 4, ["drawable"] = 9},
        {["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 6, ["texture"] = 0, ["drawable"] = 25},
        {["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 8, ["texture"] = 1, ["drawable"] = 59},
        {["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 11, ["texture"] = 0, ["drawable"] = 226},    
    },

    female = {
        {["component_id"] = 1, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 3, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 4, ["texture"] = 15, ["drawable"] = 109},
        {["component_id"] = 5, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 6, ["texture"] = 0, ["drawable"] = 25},
        {["component_id"] = 7, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 8, ["texture"] = 1, ["drawable"] = 36},
        {["component_id"] = 9, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 10, ["texture"] = 0, ["drawable"] = 0},
        {["component_id"] = 11, ["texture"] = 0, ["drawable"] = 236},    
    }
}