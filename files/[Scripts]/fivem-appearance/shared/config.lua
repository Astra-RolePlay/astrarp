Config = {}

Config.Debug = false

Config.ClothingCost = 0
Config.BarberCost = 50
Config.TattooCost = 50
Config.SurgeonCost = 120000

Config.UseTarget = GetConvar("UseTarget", "false") == "true"
Config.UseRadialMenu = true

Config.EnablePedsForShops = false
Config.EnablePedsForClothingRooms = true
Config.EnablePedsForPlayerOutfitRooms = true

Config.EnablePedMenu = true
Config.PedMenuGroup = "god"

Config.NewCharacterSections = {
    Ped = false,
    HeadBlend = true,
    FaceFeatures = true,
    HeadOverlays = true,
    Components = true,
    Props = true,
    Tattoos = true
}

Config.GenderBasedOnPed = true

Config.AlwaysKeepProps = false

Config.PersistUniforms = false -- Keeps Job / Gang Outfits on player reconnects / logout
Config.OnDutyOnlyClothingRooms = false -- Set to `true` to make the clothing rooms accessible only to players who are On Duty

Config.BossManagedOutfits = false -- Allows Job / Gang bosses to manage their own job / gang outfits

Config.ReloadSkinCooldown = 5000

-- ACE Permissions Config
Config.EnableACEPermissions = false
Config.ACEResetCooldown = 5000
Config.ACEListCooldown = 60 * 60 * 1000 -- 1 Hour

Config.DisableComponents = {
    Masks = false,
    UpperBody = false,
    LowerBody = false,
    Bags = false,
    Shoes = false,
    ScarfAndChains = false,
    BodyArmor = false,
    Shirts = false,
    Decals = false,
    Jackets = false
}

Config.DisableProps = {
    Hats = false,
    Glasses = false,
    Ear = false,
    Watches = false,
    Bracelets = false
}

Config.Blips = {
    ["clothing"] = {
        Show = true,
        Sprite = 366,
        Color = 47,
        Scale = 0.7,
        Name = "Clothing Store",
    },
    ["barber"] = {
        Show = true,
        Sprite = 71,
        Color = 0,
        Scale = 0.7,
        Name = "Barber",
    },
    ["tattoo"] = {
        Show = true,
        Sprite = 75,
        Color = 4,
        Scale = 0.7,
        Name = "Tattoo Shop",
    },
    ["surgeon"] = {
        Show = true,
        Sprite = 102,
        Color = 4,
        Scale = 0.7,
        Name = "Plastic Surgeon",
    }
}

Config.TargetConfig = {
    ["clothing"] = {
        model = "s_f_m_shop_high",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-tshirt",
        label = "Kıyafet Mağazası",
        distance = 3
    },
    ["barber"] = {
        model = "s_m_m_hairdress_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-scissors",
        label = "Berber Dükkanı",
        distance = 3
    },
    ["tattoo"] = {
        model = "u_m_y_tattoo_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Dovme Dükkanı",
        distance = 3
    },
    ["surgeon"] = {
        model = "s_m_m_doctor_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-pen",
        label = "Esnetik Ameliyatı",
        distance = 3
    },
    ["clothingroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "İş / Çete Kıyafetleri Menüsünü Aç",
        distance = 3
    },
    ["playeroutfitroom"] = {
        model = "mp_g_m_pros_01",
        scenario = "WORLD_HUMAN_STAND_MOBILE",
        icon = "fas fa-sign-in-alt",
        label = "Dolabım",
        distance = 3
    },
}

Config.Stores = {
    {
        shopType = "clothing",
        coords = vector4(1692.99, 4827.09, 42.06, 6),
        width = 13.0,
        length = 7.6,
        showBlip = true, -- showBlip overrides the blip visibilty configured above for the group
        zone = {
            shape = {
                vector2(1686.9018554688, 4829.8330078125),
                vector2(1698.8566894531, 4831.4604492188),
                vector2(1700.2448730469, 4817.7734375),
                vector2(1688.3682861328, 4816.2954101562)
            },
            minZ = 42.07 - 1.5,
            maxZ = 42.07 + 2.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-709.45, -152.62, 37.42, 122),
        width = 20.0,
        length = 15.2,
        zone = {
            shape = {
                vector2(-719.86212158203, -147.83151245117),
                vector2(-709.10491943359, -141.53076171875),
                vector2(-699.94342041016, -157.44494628906),
                vector2(-710.68774414062, -163.64665222168)
            },
            minZ = 37.42 - 1.5,
            maxZ = 37.42 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(462.03, -998.69, 30.69, 91.2),
        width = 20.0,
        length = 15.2,
        zone = {
            shape = {
                vector2(461.84729003906, -998.72344970703),
                vector2(457.65719604492, -998.52795410156),
                vector2(458.65069580078, -995.66772460938),
                vector2(463.89938354492, -995.93377685547),
                vector2(463.90170288086, -999.66461181641),
                vector2(458.15798950195, -999.70190429688),
                vector2(457.91156005859, -999.57763671875),
                vector2(457.6662902832, -998.64520263672)
            },
          minZ = 30.689516067505,
          maxZ = 30.938627243042
        }
    },
    {
        shopType = "clothing",
        coords = vector4(1538.61, 810.68, 77.65, 149.72),
        width = 11,
        length = 16,
        zone = {
            shape = {
                vector2(-1206.9552001953, -775.06304931641),
                vector2(-1190.6080322266, -764.03198242188),
                vector2(-1184.5672607422, -772.16949462891),
                vector2(-1199.24609375, -783.07928466797)
            },
            minZ = 17.32 - 1.5,
            maxZ = 17.32 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(846.37, -1284.3, 24.32, 181.6),
        width = 11,
        length = 16,
        zone = {
            shape = {
                vector2(844.58679199219, -1286.8330078125),
                vector2(844.74603271484, -1281.3308105469),
                vector2(847.86499023438, -1281.0249023438),
                vector2(847.31854248047, -1287.0043945313)
            },
               minZ = 24.320341110229,
               maxZ = 24.321550369263
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-1192.47, -771.68, 17.32, 216.6),
        width = 11,
        length = 16,
        zone = {
            shape = {
                vector2(1540.3302001953, 808.63830566406),
                vector2(1536.5184326172, 810.38513183594),
                vector2(1538.0778808594, 812.34100341797),
                vector2(1541.0383300781, 810.65014648438)
            },
           minZ = 77.654251098633,
           maxZ = 77.658699035645
        }
    },
    {
        shopType = "clothing",
        coords = vector4(1849.86, 3695.43, 34.27, 210.49),
        width = 11,
        length = 16,
        zone = {
            shape = {
                vector2(1849.6517333984, 3692.4467773438),
                vector2(1852.0764160156, 3694.0263671875),
                vector2(1850.1953125, 3697.2915039063),
                vector2(1847.9825439453, 3696.1428222656)
            },
           minZ = 34.267036437988,
           maxZ = 34.612789154053
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-530.71, -191.75, 38.22, 286.79),
        width = 11,
        length = 16,
        zone = {
            shape = {
                vector2(-530.79467773438, -194.3911895752),
                vector2(-532.96649169922, -191.28266906738),
                vector2(-529.30364990234, -188.90960693359),
                vector2(-527.96716308594, -192.58740234375)
            },
           minZ = 38.21875,
           maxZ = 38.22106552124
        }
    },
    {
        shopType = "clothing",
        coords = vector4(425.91, -801.03, 29.49, 177.79),
        width = 13.0,
        length = 7.6,
        zone = {
            shape = {
                vector2(419.55020141602, -798.36547851562),
                vector2(431.61773681641, -798.31909179688),
                vector2(431.19784545898, -812.07122802734),
                vector2(419.140625, -812.03594970703)
            },
            minZ = 29.49 - 1.5,
            maxZ = 29.49 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-162.95, -303.87, 39.73, 342.67),
        width = 12,
        length = 19,
        zone = {
            shape = {
                vector2(-160.82145690918, -313.85919189453),
                vector2(-172.56513977051, -309.82858276367),
                vector2(-166.5775604248, -292.48077392578),
                vector2(-154.84906005859, -296.51647949219)
            },
            minZ = 39.73 - 1.5,
            maxZ = 39.73 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(75.39, -1398.28, 29.08, 6.73),
        width = 13,
        length = 7.6,
        zone = {
            shape = {
                vector2(81.406135559082, -1400.7791748047),
                vector2(69.335029602051, -1400.8251953125),
                vector2(69.754981994629, -1387.078125),
                vector2(81.500122070312, -1387.3002929688)
            },
            minZ = 29.38 - 1.5,
            maxZ = 29.38 + 2.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-827.39, -1075.93, 11.03, 29.31),
        width = 12,
        length = 7.6,
        zone = {
            shape = {
                vector2(-826.26251220703, -1082.6293945312),
                vector2(-832.27856445312, -1072.2819824219),
                vector2(-820.16442871094, -1065.7727050781),
                vector2(-814.08953857422, -1076.1878662109)
            },
            minZ = 11.33 - 1.5,
            maxZ = 11.33 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-1450.73, -238.54, 49.51, 50.73),
        width = 14,
        length = 14.8,
        zone = {
            shape = {
                vector2(81.406135559082, -1400.7791748047),
                vector2(69.335029602051, -1400.8251953125),
                vector2(69.754981994629, -1387.078125),
                vector2(81.500122070312, -1387.3002929688)
            },
            minZ = 29.38 - 1.5,
            maxZ = 29.38 + 2.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(9.22, 6515.74, 31.58, 131.27),
        width = 12,
        length = 7.6,
        zone = {
            shape = {
                vector2(6.4955291748047, 6522.205078125),
                vector2(14.737417221069, 6513.3872070312),
                vector2(4.3691010475159, 6504.3452148438),
                vector2(-3.5187695026398, 6513.1538085938)
            },
            minZ = 31.88 - 1.5,
            maxZ = 31.88 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(617.34, 2762.52, 41.89, 5.01),
        width = 8,
        length = 12,
        zone = {
            shape = {
                vector2(612.58312988281, 2747.2814941406),
                vector2(612.26214599609, 2767.0520019531),
                vector2(622.37548828125, 2767.7614746094),
                vector2(623.66833496094, 2749.5180664062)
            },
            minZ = 42.09 - 1.5,
            maxZ = 42.09 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(1191.61, 2710.91, 38.02, 269.96),
        width = 12,
        length = 7.6,
        zone = {
            shape = {
                vector2(1188.7923583984, 2704.2021484375),
                vector2(1188.7498779297, 2716.2661132812),
                vector2(1202.4979248047, 2715.8479003906),
                vector2(1202.3558349609, 2703.9294433594)
            },
            minZ = 38.22 - 1.5,
            maxZ = 38.22 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-3173.74, 1044.98, 20.56, 156.95),
        width = 8,
        length = 12,
        zone = {
            shape = {
                vector2(-3162.0075683594, 1056.7303466797),
                vector2(-3170.8247070312, 1039.0412597656),
                vector2(-3180.0979003906, 1043.1201171875),
                vector2(-3172.7292480469, 1059.8623046875)
            },
            minZ = 20.86 - 1.5,
            maxZ = 20.86 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(-1105.52, 2707.79, 19.01, 317.19),
        width = 12,
        length = 7.6,
        zone = {
            shape = {
                vector2(-1103.3004150391, 2700.8195800781),
                vector2(-1111.3771972656, 2709.884765625),
                vector2(-1100.8548583984, 2718.638671875),
                vector2(-1093.1976318359, 2709.7365722656)
            },
            minZ = 19.11 - 1.5,
            maxZ = 19.11 + 1.5,
        }
    },
    {
        shopType = "clothing",
        coords = vector4(122.45, -222.88, 54.46, 155.1),
        width = 8,
        length = 12,
        zone = {
            shape = {
                vector2(133.60948181152, -210.31390380859),
                vector2(125.8349609375, -228.48097229004),
                vector2(116.3140335083, -225.02020263672),
                vector2(122.56930541992, -207.83396911621)
            },
            minZ = 54.56 - 1.5,
            maxZ = 54.56 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(-814.74, -184.97, 37.47, 297.2),
        width = 6,
        length = 8,
        zone = {
            shape = {
                vector2(-825.06127929688, -182.67497253418),
                vector2(-808.82415771484, -179.19134521484),
                vector2(-808.55261230469, -184.9720916748),
                vector2(-819.77899169922, -191.81831359863)
            },
            minZ = 37.57 - 1.5,
            maxZ = 37.57 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(136.78, -1708.4, 29.19, 140.19),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(132.57008361816, -1710.5053710938),
                vector2(138.77899169922, -1702.6778564453),
                vector2(142.73052978516, -1705.6853027344),
                vector2(135.49719238281, -1712.9750976562)
            },
            minZ = 29.29 - 1.5,
            maxZ = 29.29 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(-1282.91, -1117.41, 6.89, 271.36),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(-1287.4735107422, -1115.4364013672),
                vector2(-1277.5638427734, -1115.1229248047),
                vector2(-1277.2469482422, -1120.1147460938),
                vector2(-1287.4561767578, -1119.2506103516)
            },
            minZ = 6.9 - 1.5,
            maxZ = 6.9 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(1931.74, 3730.53, 32.74, 32.34),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(1932.4931640625, 3725.3374023438),
                vector2(1927.2720947266, 3733.7663574219),
                vector2(1931.4379882812, 3736.5327148438),
                vector2(1936.0697021484, 3727.2839355469)
            },
            minZ = 32.8 - 1.5,
            maxZ = 32.8 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(1212.39, -473.08, 66.01, 250.66),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(1208.3327636719, -469.84338378906),
                vector2(1217.9066162109, -472.40216064453),
                vector2(1216.9870605469, -477.00939941406),
                vector2(1206.1077880859, -473.83499145508)
            },
            minZ = 65.2 - 1.5,
            maxZ = 65.2 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(-33.43, -152.96, 56.88, 154.51),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(-29.730783462524, -148.67495727539),
                vector2(-32.919719696045, -158.04254150391),
                vector2(-37.612594604492, -156.62759399414),
                vector2(-33.30192565918, -147.31649780273)
            },
            minZ = 56.1 - 1.5,
            maxZ = 56.1 + 1.5,
        }
    },
    {
        shopType = "barber",
        coords = vector4(-278.11, 6227.67, 31.5, 227.95),
        width = 5,
        length = 6,
        zone = {
            shape = {
                vector2(-280.29818725586, 6232.7265625),
                vector2(-273.06427001953, 6225.9692382812),
                vector2(-276.25280761719, 6222.4013671875),
                vector2(-282.98211669922, 6230.015625)
            },
            minZ = 30.7 - 1.5,
            maxZ = 30.7 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(1322.74, -1652.81, 52.08, 220.84),
        width = 6,
        length = 4,
        zone = {
            shape = {
                vector2(1323.9360351562, -1649.2370605469),
                vector2(1328.0186767578, -1654.3087158203),
                vector2(1322.5780029297, -1657.7045898438),
                vector2(1319.2043457031, -1653.0885009766)
            },
            minZ = 51.2 - 1.5,
            maxZ = 51.2 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(-1154.18, -1426.26, 4.95, 215.61),
        width = 6,
        length = 4,
        zone = {
            shape = {
                vector2(-1152.7110595703, -1422.8382568359),
                vector2(-1149.0043945312, -1428.1975097656),
                vector2(-1154.6730957031, -1431.1898193359),
                vector2(-1157.7064208984, -1426.3433837891)
            },
            minZ = 4.95 - 1.5,
            maxZ = 4.95 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(323.11, 180.97, 103.39, 336.15),
        width = 6,
        length = 4,
        zone = {
            shape = {
                vector2(319.28741455078, 179.9383392334),
                vector2(321.537109375, 186.04516601562),
                vector2(327.24526977539, 183.12303161621),
                vector2(325.01351928711, 177.8542175293)
            },
            minZ = 103.5 - 1.5,
            maxZ = 103.5 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(-3170.34, 1076.29, 20.53, 68.3),
        width = 6,
        length = 4,
        zone = {
            shape = {
                vector2(-3169.5861816406, 1072.3740234375),
                vector2(-3175.4802246094, 1075.0703125),
                vector2(-3172.2041015625, 1080.5860595703),
                vector2(-3167.076171875, 1078.0391845703)
            },
            minZ = 20.83 - 1.5,
            maxZ = 20.83 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(1863.86, 3748.17, 33.03, 122.92),
        width = 5,
        length = 4,
        zone = {
            shape = {
                vector2(1860.2752685547, 3750.1608886719),
                vector2(1866.390625, 3752.8081054688),
                vector2(1868.6164550781, 3747.3562011719),
                vector2(1863.65234375, 3744.5034179688)
            },
            minZ = 33.03 - 1.5,
            maxZ = 33.03 + 1.5,
        }
    },
    {
        shopType = "tattoo",
        coords = vector4(-293.68, 6199.79, 31.29, 317.69),
        width = 5,
        length = 4,
        zone = {
            shape = {
                vector2(-289.42239379883, 6198.68359375),
                vector2(-294.69515991211, 6194.5366210938),
                vector2(-298.23013305664, 6199.2451171875),
                vector2(-294.1501159668, 6203.2700195312)
            },
            minZ = 31.49 - 1.5,
            maxZ = 31.49 + 1.5,
        }
    }
}

Config.ClothingRooms = {}


Config.PlayerOutfitRooms = {
    -- Sample outfit room config
--[[
    {
        coords = vector4(287.28, -573.41, 43.16, 79.61),
        width = 3,
        length = 3,
        citizenIDs = {
            "BHH65156",
        }
    },
    ]]--
}

Config.Outfits = {
    ["police"] = {
        ["male"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 19, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 55, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 3}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 0}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = -1, texture = -1}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 24, texture = 0}, -- Pants
                    ["arms"] = {item = 20, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 58, texture = 0}, -- T Shirt
                    ["vest"] = {item = 0, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 317, texture = 8}, -- Jacket
                    ["shoes"] = {item = 51, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 58, texture = 3}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 130, texture = 1}, -- Pants
                    ["arms"] = {item = 172, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T Shirt
                    ["vest"] = {item = 15, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 336, texture = 3}, -- Jacket
                    ["shoes"] = {item = 24, texture = 0}, -- Shoes
                    ["accessory"] = {item = 133, texture = 0}, -- Neck Accessory
                    ["hat"] = {item = 150, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 52, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        },
        ["female"] = {
            {
                name = "Short Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 48, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Trooper Tan",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 3}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Long Sleeve",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 0}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {1, 2, 3, 4},
            },
            {
                name = "Trooper Black",
                outfitData = {
                    ["pants"] = {item = 133, texture = 0}, -- Pants
                    ["arms"] = {item = 31, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 35, texture = 0}, -- T Shirt
                    ["vest"] = {item = 34, texture = 0}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 0, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 0, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 0, texture = 0} -- Mask
                },
                grades = {2, 3, 4},
            },
            {
                name = "SWAT",
                outfitData = {
                    ["pants"] = {item = 135, texture = 1}, -- Pants
                    ["arms"] = {item = 213, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 0, texture = 0}, -- T Shirt
                    ["vest"] = {item = 17, texture = 2}, -- Body Vest
                    ["torso2"] = {item = 327, texture = 8}, -- Jacket
                    ["shoes"] = {item = 52, texture = 0}, -- Shoes
                    ["accessory"] = {item = 102, texture = 0}, -- Neck Accessory
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["hat"] = {item = 149, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["mask"] = {item = 35, texture = 0} -- Mask
                },
                grades = {3, 4},
            }
        }
    },
    ["realestate"] = {
        ["male"] = {
            {
                -- Outfits
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 28, texture = 0},  -- Pants
                    ["arms"]        = { item = 1, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 31, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 294, texture = 0},  -- Jacket
                    ["shoes"]       = { item = 10, texture = 0},  -- Shoes
                    ["accessory"]   = { item = 0, texture = 0},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = 12, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        },
        ["female"] = {
            {
                name = "Worker",
                outfitData = {
                    ["pants"]       = { item = 57, texture = 2},  -- Pants
                    ["arms"]        = { item = 0, texture = 0},  -- Arms
                    ["t-shirt"]     = { item = 34, texture = 0},  -- T Shirt
                    ["vest"]        = { item = 0, texture = 0},  -- Body Vest
                    ["torso2"]      = { item = 105, texture = 7},  -- Jacket
                    ["shoes"]       = { item = 8, texture = 5},  -- Shoes
                    ["accessory"]   = { item = 11, texture = 3},  -- Neck Accessory
                    ["bag"]         = { item = 0, texture = 0},  -- Bag
                    ["hat"]         = { item = -1, texture = -1},  -- Hat
                    ["glass"]       = { item = 0, texture = 0},  -- Glasses
                    ["mask"]        = { item = 0, texture = 0},  -- Mask
                },
                grades = {0, 1, 2, 3, 4},
            }
        }
    },
    ["ambulance"] = {
        ["male"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 85, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 129, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 250, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 58, texture = 0}, -- Decals
                    ["accessory"] = {item = 127, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 90, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 15, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 249, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 57, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 96, texture = 0}, -- Pants
                    ["shoes"] = {item = 54, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 122, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 93, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 32, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 31, texture = 7}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 126, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 28, texture = 0}, -- Pants
                    ["shoes"] = {item = 10, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        },
        ["female"] = {
            {
                name = "T-Shirt",
                outfitData = {
                    ["arms"] = {item = 109, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 159, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 258, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 66, texture = 0}, -- Decals
                    ["accessory"] = {item = 97, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {0, 1, 2, 3, 4},
            },
            {
                name = "Polo",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 13, texture = 0}, -- T-Shirt
                    ["torso2"] = {item = 257, texture = 0}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 65, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 99, texture = 0}, -- Pants
                    ["shoes"] = {item = 55, texture = 0}, -- Shoes
                    ["mask"] = {item = 121, texture = 0}, -- Mask
                    ["hat"] = {item = 121, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {2, 3, 4},
            },
            {
                name = "Doctor",
                outfitData = {
                    ["arms"] = {item = 105, texture = 0}, -- Arms
                    ["t-shirt"] = {item = 39, texture = 3}, -- T-Shirt
                    ["torso2"] = {item = 7, texture = 1}, -- Jackets
                    ["vest"] = {item = 0, texture = 0}, -- Vest
                    ["decals"] = {item = 0, texture = 0}, -- Decals
                    ["accessory"] = {item = 96, texture = 0}, -- Neck
                    ["bag"] = {item = 0, texture = 0}, -- Bag
                    ["pants"] = {item = 34, texture = 0}, -- Pants
                    ["shoes"] = {item = 29, texture = 0}, -- Shoes
                    ["mask"] = {item = 0, texture = 0}, -- Mask
                    ["hat"] = {item = -1, texture = 0}, -- Hat
                    ["glass"] = {item = 0, texture = 0}, -- Glasses
                    ["ear"] = {item = 0, texture = 0} -- Ear accessories
                },
                grades = {3, 4},
            }
        }
    }
}

Config.InitialPlayerClothes = {
    Male = {
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    },
    Female = {
        Components = {
            {
                component_id = 0, -- Face
                drawable = 0,
                texture = 0
            },
            {
                component_id = 1, -- Mask
                drawable = 0,
                texture = 0
            },
            {
                component_id = 2, -- Hair
                drawable = 0,
                texture = 0
            },
            {
                component_id = 3, -- Upper Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 4, -- Lower Body
                drawable = 0,
                texture = 0
            },
            {
                component_id = 5, -- Bag
                drawable = 0,
                texture = 0
            },
            {
                component_id = 6, -- Shoes
                drawable = 0,
                texture = 0
            },
            {
                component_id = 7, -- Scarf & Chains
                drawable = 0,
                texture = 0
            },
            {
                component_id = 8, -- Shirt
                drawable = 0,
                texture = 0
            },
            {
                component_id = 9, -- Body Armor
                drawable = 0,
                texture = 0
            },
            {
                component_id = 10, -- Decals
                drawable = 0,
                texture = 0
            },
            {
                component_id = 11, -- Jacket
                drawable = 0,
                texture = 0
            }
        },
        Props = {
            {
                prop_id = 0, -- Hat
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 1, -- Glasses
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 2, -- Ear
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 6, -- Watch
                drawable = -1,
                texture = -1
            },
            {
                prop_id = 7, -- Bracelet
                drawable = -1,
                texture = -1
            }
        },
        Hair = {
            color = 0,
            highlight = 0,
            style = 0,
            texture = 0
        }
    }
}
