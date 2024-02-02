-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(461.45, -986.2, 30.73),
    },
    ['sheriff'] = {
        vector3(-438.02, 6003.48, 36.81),
    },
    ['sasp'] = {
        vector3(848.34, -1300.82, 28.23),
    },
    ['fbi'] = {
        vector3(2510.44, -421.83, 106.91),
    },
    ['sahp'] = {
        vector3(1546.47, 826.47, 77.66),
    },
    ['doj'] = {
        vector3(-520.59, -170.34, 42.84),
    },
    ['ambulance'] = {
        vector3(335.46, -594.52, 43.28),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-27.47, -1107.13, 27.27),
    },
    
    
    
    
    ['mechanic1'] = {
        vector3(547.2, -181.99, 54.49),
    },

    ['mechanic2'] = {
        vector3(124.77, -3014.17, 7.04)
    },

    ['mechanic3'] = {
        vector3(1186.72, 2637.31, 38.4)
    },

    ['mechanic4'] = {
        vector3(-227.83, -1327.84, 30.89)
    },
    
    ['mechanic5'] = {
        vector3(-339.99, -157.35, 44.59)
    },

    
}

Config.BossMenuZones = {
    ['mechanic1'] = {
        { coords = vector3(547.2, -181.99, 54.49), length = 1.15, width = 2.6, heading = 353.0, minZ = 49.59, maxZ = 58.99 },
    },
    ['mechanic2'] = {
        { coords = vector3(124.77, -3014.17, 7.04), length = 1.15, width = 2.6, heading = 353.0, minZ = 3.0, maxZ = 12.0 },
    },
    ['mechanic3'] = {
        { coords = vector3(1186.72, 2637.31, 38.4), length = 1.15, width = 2.6, heading = 353.0, minZ = 33.0, maxZ = 47.0 },
    },
    ['mechanic4'] = {
        { coords = vector3(-227.83, -1327.84, 30.89), length = 1.15, width = 2.6, heading = 353.0, minZ = 25.0, maxZ = 27.0 },
    },
    ['mechanic5'] = {
        { coords = vector3(-339.99, -157.35, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 38.0, maxZ = 50.0 },
    },
    
    
    
    
    
    ['police'] = {
        { coords = vector3(463.29, -988.71, 30.69), length = 0.35, width = 0.45, heading = 351.0, minZ = 28.58, maxZ = 32.68 } ,
    },
    ['ambulance'] = {
        { coords = vector3(335.46, -594.52, 43.28), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67 },
    },
    
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
