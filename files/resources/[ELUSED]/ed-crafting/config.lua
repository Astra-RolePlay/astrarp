Config = {}

Config.prop = 'gr_prop_gr_bench_04b'

Config.craftingBenches = {
    {id = "testId", coords = vector3(429.16, 6478.77, 28.79), heading = 140.76},
}

--[[
Make sure to change the image path to your inventory image file. Default is lj-inventory, you can change it to qb-inventory by doing this example below:
    https://cfx-nui-qb-inventory/html/images/radio.png
]]


-- Recipes that come with every workbench
Config.defaultRecipes = {
    weapon_advancedrifle = {
        item = "weapon_advancedrifle",
        label = "Advanced Rifle",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_advancedrifle.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 1100, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 900, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 1050, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_assaultrifle = {
        item = "weapon_assaultrifle",
        label = "Assault Rifle",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_assaultrifle.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 1200, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 999, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 1250, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_assaultrifle_mk2 = {
        item = "weapon_assaultrifle_mk2",
        label = "Assault Rifle Mk II",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_assaultrifle_mk2.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "copper", label = "Copper", amount = 1150, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "aluminum", label = "Aluminum", amount = 1112, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "steel", label = "Steel", amount = 1450, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    weapon_carbinerifle_mk2 = {
        item = "weapon_carbinerifle_mk2",
        label = "Carbine Rifle Mk II",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_carbinerifle_mk2.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 500, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 999, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "steel", label = "Steel", amount = 1250, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    weapon_compactrifle = {
        item = "weapon_compactrifle",
        label = "Compact Rifle",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_compactrifle.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "copper", label = "Copper", amount = 1150, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "aluminum", label = "Aluminum", amount = 499, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "steel", label = "Steel", amount = 850, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    weapon_combatpdw = {
        item = "weapon_combatpdw",
        label = "Combat PDW",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_combatpdw.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 800, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 599, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 550, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_assaultsmg = {
        item = "weapon_assaultsmg",
        label = "Assault SMG",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_assaultsmg.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 900, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "copper", label = "Copper", amount = 350, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "steel", label = "Steel", amount = 350, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    weapon_minismg = {
        item = "weapon_minismg",
        label = "Mini SMG",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_minismg.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 500, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "steel", label = "Steel", amount = 750, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
            {item = "iron", label = "Iron", amount = 250, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_pumpshotgun = {
        item = "weapon_pumpshotgun",
        label = "Pump Shotgun",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_pumpshotgun.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 200, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 400, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "steel", label = "Steel", amount = 750, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    weapon_sawnoffshotgun = {
        item = "weapon_sawnoffshotgun",
        label = "Sawed-Off Shotgun",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_sawnoffshotgun.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 800, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "iron", label = "Iron", amount = 550, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_bullpupshotgun = {
        item = "weapon_bullpupshotgun",
        label = "Bullpup Shotgun",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_bullpupshotgun.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 350, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
            {item = "aluminum", label = "Aluminum", amount = 499, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 250, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_machinepistol = {
        item = "weapon_machinepistol",
        label = "Machine Pistol",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_machinepistol.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 150, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 99, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 350, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_pistol_mk2 = {
        item = "weapon_pistol_mk2",
        label = "Pistol Mk II",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_pistol_mk2.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 125, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "copper", label = "Copper", amount = 50, image = "https://cfx-nui-qb-inventory/html/images/copper.png"},
            {item = "iron", label = "Iron", amount = 50, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    weapon_vintagepistol = {
        item = "weapon_vintagepistol",
        label = "Vintage Pistol",
        image = "https://cfx-nui-qb-inventory/html/images/weapon_vintagepistol.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "plastic", label = "Plastic", amount = 200, image = "https://cfx-nui-qb-inventory/html/images/plastic.png"},
            {item = "aluminum", label = "Aluminum", amount = 50, image = "https://cfx-nui-qb-inventory/html/images/aluminum.png"},
            {item = "iron", label = "Iron", amount = 70, image = "https://cfx-nui-qb-inventory/html/images/iron.png"},
        }
    },
    pistol_ammo = {
        item = "pistol_ammo",
        label = "Pistol Ammo",
        image = "https://cfx-nui-qb-inventory/html/images/pistol_ammo.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 10, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    rifle_ammo = {
        item = "rifle_ammo",
        label = "Rifle Ammo",
        image = "https://cfx-nui-qb-inventory/html/images/rifle_ammo.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 35, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    smg_ammo = {
        item = "smg_ammo",
        label = "Smg Ammo",
        image = "https://cfx-nui-qb-inventory/html/images/smg_ammo.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 25, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
    shotgun_ammo = {
        item = "shotgun_ammo",
        label = "Shotgun Ammo",
        image = "https://cfx-nui-qb-inventory/html/images/shotgun_ammo.png", 
        isAttachment = false,
        threshold = 0,
        points = 1,
        components = {
            {item = "steel", label = "Steel", amount = 15, image = "https://cfx-nui-qb-inventory/html/images/steel.png"},
        }
    },
}

--Recipes that are unlocked with blueprints
Config.blueprintRecipes = {
    advancedlockpick = {
        item = "advancedlockpick",
        label = "Advanced Lockpick",
        image = "https://cfx-nui-qb-inventory/html/images/radio.png",
        isAttachment = false,
        points = 1,
        components = {
            {item = "aluminum", label = "Aluminum", amount = 10, image = "aluminum.png"},
            {item = "rubber", label = "Rubber", amount = 10, image = "rubber.png"},
            {item = "plastic", label = "Plastic", amount = 10, image = "plastic.png"},
        },
        blueprintImage = "blueprint.png"
    },
}
