Config = {}
Config.MaxWidth = 5.0
Config.MaxHeight = 5.0
Config.MaxLength = 5.0
Config.DamageNeeded = 100.0
Config.IdleCamera = true
Config.EnableProne = false
Config.JointEffectTime = 60
Config.RemoveWeaponDrops = true
Config.RemoveWeaponDropsTimer = 25
Config.DefaultPrice = 20 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.DisableAmbience = true -- Disabled distance sirens, distance car alarms, etc

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 16, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

Config.Density = {
    ['parked'] = 0.8,
    ['vehicle'] = 0.8,
    ['multiplier'] = 0.8,
    ['peds'] = 0.8,
    ['scenario'] = 0.8,
}

ConsumablesEat = {
    ["sandwich"] = math.random(35, 54),
    ["tosti"] = math.random(40, 50),
    ["twerks_candy"] = math.random(35, 54),
    ["snikkel_candy"] = math.random(40, 50),
    ["bmochi"] = math.random(30, 40),
    ["pmochi"] = math.random(40, 50),
    ["gmochi"] = math.random(40, 50),
    ["omochi"] = math.random(40, 50),
    ["bento"] = math.random(40, 50),
    ["riceball"] = math.random(40, 50),
    ["miso"] = math.random(40, 50),
    ["cake"] = math.random(40, 50),
    ["nekocookie"] = math.random(40, 50),
    ["nekodonut"] = math.random(40, 50),
    ["rice"] = math.random(30, 40),
    ["blueberry"] = math.random(30, 40),
    ["strawberry"] = math.random(30, 40),
    ["cakepop"] = math.random(30, 40),
    ["pancake"] = math.random(30, 40),
    ["pizza"] = math.random(30, 40),
    ["purrito"] = math.random(30, 40),
    ["ramen"] = math.random(30, 40),
    ["noodlebowl"] = math.random(30, 40),
    ["chocolate"] = math.random(30, 40),
    ["friedpick"] = math.random(40, 50),
    ["maccheese"] = math.random(40, 50),
    ["bplate"] = math.random(40, 50),
    ["cplate"] = math.random(40, 50),
    ["splate"] = math.random(40, 50),
    ["rplate"] = math.random(40, 50),
    ["nplate"] = math.random(40, 50),
    ["wings"] = math.random(40, 50),
    ["pickle"] = math.random(40, 50),
    ["nachoes"] = math.random(30, 40),
    ["tiramisu"] = math.random(40, 50),
    ["gelato"] = math.random(40, 50),
    ["medfruits"] = math.random(30, 40),
    ["bolognese"] = math.random(20, 30),
    ["calamari"] = math.random(20, 30),
    ["meatball"] = math.random(20, 30),
    ["alla"] = math.random(20, 30),
    ["pescatore"] = math.random(20, 30),
    ["capricciosa"] = math.random(20, 30),
    ["diavola"] = math.random(20, 30),
    ["marinara"] = math.random(20, 30), 
    ["margherita"] = math.random(20, 30), 
    ["prosciuttio"] = math.random(20, 30), 
    ["vegetariana"] = math.random(20, 30),
    ["beandonut"] = math.random(20, 40),
    ["cheesecake"] = math.random(20, 30),
    ["crisps"] = math.random(20, 30),
    ["shotnuggets"] = math.random(40, 50),
    ["shotrings"] = math.random(40, 50),
    ["heartstopper"] = math.random(40, 50),
    ["shotfries"] = math.random(40, 50),
    ["moneyshot"] = math.random(40, 50),
    ["meatfree"] = math.random(40, 50),
    ["bleeder"] = math.random(40, 50),
    ["torpedo"] = math.random(40, 50),
    ["rimjob"] = math.random(40, 50),
    ["creampie"] = math.random(40, 50),
    ["cheesewrap"] = math.random(40, 50),
    ["chickenwrap"] = math.random(40, 50),
    ["watermelon"] = math.random(20, 30),
    ["slicedcake"] = math.random(20, 30),
}

ConsumablesDrink = {
    ["water_bottle"] = math.random(35, 54),
    ["kurkakola"] = math.random(35, 54),
    ["coffee"] = math.random(40, 50),
    ["nekolatte"] = math.random(20, 40),
    ["bobatea"] = math.random(20, 40),
    ["bbobatea"] = math.random(20, 40),
    ["gbobatea"] = math.random(20, 40),
    ["obobatea"] = math.random(20, 40),
    ["pbobatea"] = math.random(20, 40),
    ["milk"] = math.random(20, 40),
    ["mocha"] = math.random(20, 40),
    ["cranberry"] = math.random(20, 40),
    ["beancoffee"] = math.random(20, 40),
    ["bigfruit"] = math.random(20, 30),
    ["highnoon"] = math.random(20, 30),
    ["speedball"] = math.random(20, 30),
    ["gunkaccino"] = math.random(20, 30),
    ["bratte"] = math.random(20, 30),
    ["flusher"] = math.random(20, 30),
    ["ecocoffee"] = math.random(20, 30),
    ["caffeagra"] = math.random(20, 30),
    ["chickenbreast"] = math.random(20, 30),
    ["sprunk"] = math.random(35, 54),
    ["sprunklight"] = math.random(35, 54),
    ["ecola"] = math.random(35, 54),
    ["ecolalight"] = math.random(35, 54),
    ["milkshake"] = math.random(35, 54),
    ["bscoffee"] = math.random(35, 54),
    ["bscoke"] = math.random(35, 54),
    ["grapejuice"] = math.random(35, 54),
    ["peyote_tea"] = math.random(35, 54),
}

ConsumablesAlcohol = {
    ["whiskey"] = math.random(20, 30),
    ["beer"] = math.random(30, 40),
    ["vodka"] = math.random(20, 40),
    ["sake"] = math.random(20, 40),
    ["b52"] = math.random(20, 40),
    ["brussian"] = math.random(20, 40),
    ["bkamikaze"] = math.random(20, 40),
    ["cappucc"] = math.random(20, 40),
    ["ccookie"] = math.random(20, 40),
    ["iflag"] = math.random(20, 40),
    ["kamikaze"] = math.random(20, 40),
    ["sbullet"] = math.random(20, 40),
    ["voodoo"] = math.random(20, 40),
    ["woowoo"] = math.random(20, 40),
    ["cranberry"] = math.random(20, 40),
    ["schnapps"] = math.random(20, 40),
    ["gin"] = math.random(20, 40),
    ["scotch"] = math.random(20, 40),
    ["rum"] = math.random(20, 40),
    ["icream"] = math.random(20, 40),
    ["amaretto"] = math.random(20, 40),
    ["curaco"] = math.random(20, 40),
    ["beerglass"] = math.random(20, 40),
    ["ambeer"] = math.random(40, 50),
    ["dusche"] = math.random(40, 50),
    ["logger"] = math.random(40, 50),
    ["pisswasser"] = math.random(40, 50),
    ["pisswasser2"] = math.random(40, 50),
    ["pisswasser3"] = math.random(40, 50),
    ["amarone"] = math.random(20, 30),
    ["barvera"] = math.random(20, 30),
    ["dolceto"] = math.random(20, 30),
    ["housered"] = math.random(20, 30),
    ["hausewhite"] = math.random(20, 30),
    ["rosso"] = math.random(20, 30),
}

ConsumablesFireworks = {
    "firework1",
    "firework2",
    "firework3",
    "firework4"
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = false,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = false,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.Teleports = {
    --Elevator @ labs
    [1] = {
        [1] = {
            coords = vector4(3540.74, 3675.59, 20.99, 167.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Up'
        },
        [2] = {
            coords = vector4(3540.74, 3675.59, 28.11, 172.5),
            ["AllowVehicle"] = false,
            drawText = '[E] Take Elevator Down'
        },

    },
    --Coke Processing Enter/Exit
    [2] = {
        [1] = {
            coords = vector4(909.49, -1589.22, 30.51, 92.24),
            ["AllowVehicle"] = false,
            drawText = '[E] Enter Coke Processing'
        },
        [2] = {
            coords = vector4(1088.81, -3187.57, -38.99, 181.7),
            ["AllowVehicle"] = false,
            drawText = '[E] Leave'
        },
    },
}

Config.CarWash = { -- carwash

}
