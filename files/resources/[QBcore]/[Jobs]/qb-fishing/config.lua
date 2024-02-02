Config = {}

Config.Framework = "qb" -- "qb" / "oldqb" : qb = export system , oldqb = triggerevent system
Config.sql = "oxmysql"  -- dont forget to change fxmanifest.lua! |ghmattimysql - oxmysql - mysql-async

Config.Settings = {
    ["canOpenWithCommand"] = false,     -- CAN THE MENU BE OPENED BY COMMAND
    ["menuOpenCommand"] = "fishmenu",
    ["addXP"] = { min = 10, max = 30 }, -- The amount of xp to be given after fishing
    ["addxpafterXcatch"] = 3,           -- How many successful catch after exp awards will be given
    ["needxpforlevelup"] = 500,         -- How Many xp needed to level up
    ["addTrashWithoutBait"] = 1,        -- HOW MANY MORE TRASH ITEMS WILL APPEAR WITHOUT FISH Bait
    ["rodBrokeChanceWhenUpgrade"] = 40, -- WHAT IS THE CHANCE OF BREAKING THE FISHING ROD DURING LEVEL UPGRADING?
    ["eatBaitChance"] = 50,             -- WHAT PERCENTAGE CHANCE THAT THE BAIT WILL DISAPPEAR AFTER FISHING
    ["illegalBaitName"] = "illegalfishbait",    -- TYPE OF BAIT REQUIRED TO CATCH ILLEGAL FISH
    ["tasksResetDay"] = 3,              -- HOW MANY DAYS AFTER THE TASK IS RECEIVED WILL IT BE RESET (EVEN IF 1 TASK IS RECEIVED, ALL TASKS WILL BE DELETED AFTER THE WRITTEN DAY)
}

Config.Language = {
    ["eatBaitText"] = "Balık yemini kaybettin.",
    ["catchFish"] = "Yakaladın!",
    ["youCantFishHere"] = "Burada balık tutamazsın!",
    ["somethingStoppingFish"] = "Bir şey seni balık tutmaktan alıkoyuyor",
    ["movementOnRod"] = "Oltada hareket var!",
    ["missedFish"] = "Balık kaçtı!",
    ["noLeftBait"] = "Oltanın ucunda yem kalmadı!",
    ["fishingHBStopped"] = "Balık tutmayı bıraktın.",
    ["illegalCant"] = "Bu bölgede kaçak balık yakalayamazsınız!",
    ["useBaitNotFishing"] = "Oltayı yemlemek için elinizde olta olmalı!",
    ["youDontHaveItemUPGRADE"] = "Yükseltme için gerekli öğeye sahip değilsiniz!",
    ["upgradedRod"] = "Oltanız bir sonraki seviyeye yükseltildi!",
    ["brokenRod"] = "Oltan kırıldı!",
    ["youDontHave"] = "Bu Öğe Sende yok!",
    ["youDontHaveMoney"] = "Yeterli paran yok!",
    ["youDontHaveEnoughSpace"] = "Öğeyi taşımak için yeterli alanınız yok!",
    ["youDontHaveWantSell"] = "Satmak istediğin ürün sende yok!",
    ["succesBuy"] = "Satın aldın: ",
    ["succesSold"] = "Sattın: ",
}

Config.Customize = {
    title = "Balıkçılık Rehberi",
    fishAreaTitle = "Balıklar",
    taskAreaTitle = "Görevler",
    currentXP = "Şuanki XP:",
    requiredXP = "Gerekli XP:",
}

Config.FishLevels = { -- ALL FISH THAT CAN BE KEPT ATTACHED IN THE FISHING SYSTEM AND FISH LEVELS (THIS AREA NOT FISHINGROD LEVEL) (ALL FISH MUST BE ATTACHED)
    ["anchovy"] = 1,
    ["smallbluefish"] = 2,
    ["bluefish"] = 5,
    ["bonitosfish"] = 9,
    ["garfish"] = 11,
    ["perch"] = 13,
    ["carettacaretta"] = 15,
    ["pantfish"] = 18,
    ["sharkfish"] = 20,
    ["whitepearl"] = 1,
    ["bluepearl"] = 2,
    ["redpearl"] = 3,
    ["greenpearl"] = 4,
    ["yellowpearl"] = 5,
}

Config.fishingRods = { -- FISHING RODS, ITEM NAMES AND LEVELS
    { itemName = "fishingrod1", level = 1 },
    { itemName = "fishingrod2", level = 2 },
    { itemName = "fishingrod3", level = 3 },
    { itemName = "fishingrod4", level = 4 },
    { itemName = "fishingrod5", level = 5 },
}

Config.fishBaits = { -- FISH BAITS AND FEED TYPES
    { itemName = "fishbait",        baitType = "fish",    label = "Balık Yemi" },
    { itemName = "illegalfishbait", baitType = "illegal", label = "Illegal Balık Yemi" },
}

-- MUST START WITH TABLE 1 - TABLE 1 ACTUALLY POINTS TO LEVEL 2 FISHING ROD
Config.upgradeRodPrices = { -- PRICE LIST FOR FISHING ROD UPGRADE
    [1] = 250,              -- LEVEL 2
    [2] = 500,              -- LEVEL 3
    [3] = 750,              -- LEVEL 4
    [4] = 1000,             -- LEVEL 5
}

Config.fishMenuArea = { -- GO NEXT TO IT AND PRESS E TO OPEN THE /FISH MENU
    {
        pedName = "Balikci",
        pedHash = 0xAD54E7A8,
        pedCoord = vector3(-1789.01, -1203.8, 12.017),
        drawText = "",
        h = 100.0,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipName = "Balıkçı Adam",
            blipIcon = 68,
            blipColour = 3,
        },
    },
}

Config.upgradeRodArea = { -- ROD LEVEL UPGRADE AREAS
    {
        pedName = "Balikci",
        pedHash = 0x1EEC7BDC,
        pedCoord = vector3(-1791.02, -1207.05, 12.017),
        drawText = "",
        h = 6.94,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipName = "Oltacı Adam",
            blipIcon = 68,
            blipColour = 3,
        },
    },
}

Config.marketArea = { -- MARKET AREAS (BUYING AND SELLING)
    {
        pedName = "Balikci",
        pedHash = 0xAE5BE23A,
        pedCoord = vector3(-1795.68, -1200.23, 12.017),
        drawText = "",
        h = 228.78,
        blipSettings = { -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipName = "Balık Mağazası",
            blipIcon = 68,
            blipColour = 3,
        },
    },
}

Config.buyMarketItems = { -- LIST OF ITEMS SOLD IN THE FISH MARKET (BUY MENU)
    { itemId = 1, itemName = "fishingrod1",     itemLabel = "Olta 1Lv.",          itemPrice = 50, image = './css/imgs/fishingrod.png' },
    { itemId = 2, itemName = "fishbait",        itemLabel = "Balık Yemi",         itemPrice = 5,  image = './css/imgs/fishbait.png' },
    { itemId = 3, itemName = "illegalfishbait", itemLabel = "Illegal Balık Yemi", itemPrice = 30, image = './css/imgs/illegalfishbait.png' },
}

Config.Zones = {                                     -- FISHING AREAS
    {                                                -- Motel
        coords = vector3(-1825.14, -1220.48, 13.02), -- FISHING AREA COORDINATES
        radius = 60,                                 -- RADIUS LEVEL OF THE ABOVE COORDINATE
        blipSettings = {                             -- https://docs.fivem.net/docs/game-references/blips/
            blip = false,
            blipAlpha = true,
            blipName = "Balık Alanı",
            blipIcon = 68,
            blipColour = 3,
            blipAlphaColour = 2,
        },
        trashChance = 15,                                                                         -- WHAT PERCENTAGE OF TRASH ITEMS WILL BE GIVEN WHILE FISHING IN THIS COORDINATE
        rareChance = 5,                                                                           -- WHAT PERCENTAGE OF VALUABLE ITEMS WILL BE GIVEN WHEN FISHING IN THIS COORDINATE
        illegal = false,                                                                          -- CAN AN ILLEGAL ITEM BE HELD IN THIS COORDINATE?
        items = {                                                                                 -- ITEMS THAT WILL APPEAR WHILE FISHING IN THIS COORDINATION
            trashItems = { "fishbait", "fish" },                                                  -- TRASH ITEMS
            rare = {                                                                              -- RARE ITEMS
                rodLevel = {
                    [1] = { "whitepearl" },                                                       -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "whitepearl", "bluepearl" },                                          -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "whitepearl", "bluepearl", "redpearl" },                              -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "whitepearl", "bluepearl", "redpearl", "yellowpearl" },               -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "whitepearl", "bluepearl", "redpearl", "yellowpearl", "greenpearl" }, -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
            normal = {                                                                                   -- NORMAL ITEMS
                rodLevel = {
                    [1] = { "anchovy" },                                                                 -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "anchovy", "smallbluefish" },                                                -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish" },                     -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish", "garfish" },          -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish", "garfish", "perch" }, -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
            illegal = {                                                              -- ILLEGAL ITEMS
                rodLevel = {
                    [1] = { "anchovy" },                                             -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "anchovy", "smallbluefish" },                            -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish" }, -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "carettacaretta", "pantolobaligi" },                     -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "carettacaretta", "pantolobaligi", "sharkfish" },        -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
        },
    },

    {                                                 -- ILLEGAL AREA
        coords = vector3(-3747.00, -1919.14, -0.234), -- FISHING AREA COORDINATES
        radius = 300,                                 -- RADIUS LEVEL OF THE ABOVE COORDINATE
        blipSettings = {                              -- https://docs.fivem.net/docs/game-references/blips/
            blip = true,
            blipAlpha = true,
            blipName = "İllegal Balık Alanı",
            blipIcon = 68,
            blipColour = 1,
            blipAlphaColour = 1,
        },
        trashChance = 70,                                                                         -- WHAT PERCENTAGE OF TRASH ITEMS WILL BE GIVEN WHILE FISHING IN THIS COORDINATE
        rareChance = 15,                                                                          -- WHAT PERCENTAGE OF VALUABLE ITEMS WILL BE GIVEN WHEN FISHING IN THIS COORDINATE
        illegal = true,                                                                           -- CAN AN ILLEGAL ITEM BE HELD IN THIS COORDINATE?
        items = {                                                                                 -- ITEMS THAT WILL APPEAR WHILE FISHING IN THIS COORDINATION
            trashItems = { "illegalfishbait", "fish" },                                           -- TRASH ITEMS
            rare = {                                                                              -- RARE ITEMS
                rodLevel = {
                    [1] = { "whitepearl" },                                                       -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "whitepearl", "bluepearl" },                                          -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "whitepearl", "bluepearl", "redpearl" },                              -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "whitepearl", "bluepearl", "redpearl", "yellowpearl" },               -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "whitepearl", "bluepearl", "redpearl", "yellowpearl", "greenpearl" }, -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
            normal = {                                                                                   -- NORMAL ITEMS
                rodLevel = {
                    [1] = { "anchovy" },                                                                 -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "anchovy", "smallbluefish" },                                                -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish" },                     -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish", "garfish" },          -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish", "garfish", "perch" }, -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
            illegal = {                                                              -- ILLEGAL ITEMS
                rodLevel = {
                    [1] = { "anchovy" },                                             -- WHAT CAN BE CAUGHT WITH 1 LEVEL FISHING ROD
                    [2] = { "anchovy", "smallbluefish" },                            -- WHAT CAN BE CAUGHT WITH 2 LEVEL FISHING ROD
                    [3] = { "anchovy", "smallbluefish", "bluefish", "bonitosfish" }, -- WHAT CAN BE CAUGHT WITH 3 LEVEL FISHING ROD
                    [4] = { "carettacaretta", "pantolobaligi" },                     -- WHAT CAN BE CAUGHT WITH 4 LEVEL FISHING ROD
                    [5] = { "carettacaretta", "pantolobaligi", "sharkfish" },        -- WHAT CAN BE CAUGHT WITH 5 LEVEL FISHING ROD
                },
            },
        },
    },
}

Config.Tasks = {                            -- TASKS APPEARING ON THE FISH MENU
    {
        taskId = 1,                         -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "40 Küçük Balık Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "smallbluefish",         -- ITEM OF TASK
        moneyRewards = 2000,                -- TASK'S PRIZE MONEY
        xpRewards = 500,                    -- TASK'S XP REWARD
        requiredCount = 40,                 -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
    {
        taskId = 2,                        -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "30 Mavi Balık Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "bluefish",             -- ITEM OF TASK
        moneyRewards = 3000,               -- TASK'S PRIZE MONEY
        xpRewards = 500,                   -- TASK'S XP REWARD
        requiredCount = 30,                -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
    {
        taskId = 3,                     -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "20 Palamut Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "bonitosfish",       -- ITEM OF TASK
        moneyRewards = 4000,            -- TASK'S PRIZE MONEY
        xpRewards = 500,                -- TASK'S XP REWARD
        requiredCount = 20,             -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
    {
        taskId = 4,                     -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "15 Zargana Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "garfish",           -- ITEM OF TASK
        moneyRewards = 5000,            -- TASK'S PRIZE MONEY
        xpRewards = 500,                -- TASK'S XP REWARD
        requiredCount = 15,             -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
    {
        taskId = 5,                    -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "10 Levrek Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "perch",            -- ITEM OF TASK
        moneyRewards = 6000,           -- TASK'S PRIZE MONEY
        xpRewards = 500,               -- TASK'S XP REWARD
        requiredCount = 10,            -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
    {
        taskId = 6,                          -- TASK NUMBER (ALL TASKS MUST BE NUMBERED DIFFERENTLY AND SEQUENTIALLY)
        taskName = "20 Köpek Balığı Yakala", -- NAME OF THE TASK AS IT APPEARS IN THE MENU
        itemName = "sharkfish",              -- ITEM OF TASK
        moneyRewards = 15000,                -- TASK'S PRIZE MONEY
        xpRewards = 500,                     -- TASK'S XP REWARD
        requiredCount = 20,                  -- NUMBER OF FISH CATCHES REQUIRED TO COMPLETE THE TASK
        taskDescription = "Görevi başarıyla tamamladıktan sonra ödülünüzü alın.",
    },
}

Config.Fishes = {                            -- /FISH MENU SETTINGS
    {
        id = 1,                              -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Balık",                  -- THE APPARENT NAME OF THE FISH
        itemName = "fish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 1,                   -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 1,                  -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                      -- SALE PRICE OF FISH
        onFishMenu = true,                   -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                  -- TYPE OF FISH
        image = "./css/imgs/fishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 1. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 2,                                 -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Hamsi",                     -- THE APPARENT NAME OF THE FISH
        itemName = "anchovy",                   -- ITEM NAME OF THE FISH
        requiredLevel = 1,                      -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 1,                     -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                         -- SALE PRICE OF FISH
        onFishMenu = true,                      -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                     -- TYPE OF FISH
        image = "./css/imgs/anchovyMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 1. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 3,                                       -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Küçük Balık",                     -- THE APPARENT NAME OF THE FISH
        itemName = "smallbluefish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 2,                            -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 2,                           -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                               -- SALE PRICE OF FISH
        onFishMenu = true,                            -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                           -- TYPE OF FISH
        image = "./css/imgs/smallbluefishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 2. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 4,                                  -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Mavi Balık",                 -- THE APPARENT NAME OF THE FISH
        itemName = "bluefish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 5,                       -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 3,                      -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                          -- SALE PRICE OF FISH
        onFishMenu = true,                       -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                      -- TYPE OF FISH
        image = "./css/imgs/bluefishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 3. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 5,                                     -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Palamut",                       -- THE APPARENT NAME OF THE FISH
        itemName = "bonitosfish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 9,                          -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 3,                         -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                             -- SALE PRICE OF FISH
        onFishMenu = true,                          -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                         -- TYPE OF FISH
        image = "./css/imgs/bonitosfishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 3. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 6,                                 -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Zargana",                   -- THE APPARENT NAME OF THE FISH
        itemName = "garfish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 11,                     -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 4,                     -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                         -- SALE PRICE OF FISH
        onFishMenu = true,                      -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                     -- TYPE OF FISH
        image = "./css/imgs/garfishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 4. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 7,                               -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Levrek",                  -- THE APPARENT NAME OF THE FISH
        itemName = "perch",                   -- ITEM NAME OF THE FISH
        requiredLevel = 13,                   -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 5,                   -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                       -- SALE PRICE OF FISH
        onFishMenu = true,                    -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Legal",                   -- TYPE OF FISH
        image = "./css/imgs/perchMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı iskelede tutabilirsin, canlıyı yakalamak için 5. seviye veya daha yüksek bir oltaya ihtiyacın var!"
    },
    {
        id = 8,                                 -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Kaplumbağa",                -- THE APPARENT NAME OF THE FISH
        itemName = "carettacaretta",            -- ITEM NAME OF THE FISH
        requiredLevel = 15,                     -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 4,                     -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                         -- SALE PRICE OF FISH
        onFishMenu = true,                      -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Illegal",                   -- TYPE OF FISH
        image = "./css/imgs/carettaMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı açık denizde yakalayabilirsiniz, bu canlıyı yakalamak için 4. seviye ve üzeri bir oltaya ihtiyacınız var!"
    },
    {
        id = 9,                                  -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Aslan Balığı",               -- THE APPARENT NAME OF THE FISH
        itemName = "pantfish",                   -- ITEM NAME OF THE FISH
        requiredLevel = 18,                      -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 4,                      -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                          -- SALE PRICE OF FISH
        onFishMenu = true,                       -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Illegal",                    -- TYPE OF FISH
        image = "./css/imgs/pantfishMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı açık denizde yakalayabilirsiniz, bu canlıyı yakalamak için 4. seviye ve üzeri bir oltaya ihtiyacınız var!"
    },
    {
        id = 10,                              -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        fishName = "Köpek Balığı",            -- THE APPARENT NAME OF THE FISH
        itemName = "sharkfish",               -- ITEM NAME OF THE FISH
        requiredLevel = 20,                   -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        requiredRodLvl = 5,                   -- FISHING ROD LEVEL AND ABOVE THAT SHOULD BE USED TO CATCH THE FISH
        fishPrice = 10,                       -- SALE PRICE OF FISH
        onFishMenu = true,                    -- /FISH APPEARS OR DOES NOT APPEAR ON THE MENU - TRUE: APPEARS _ FALSE: DOES NOT APPEAR
        fishType = "Illegal",                 -- TYPE OF FISH
        image = "./css/imgs/sharkMiddle.png", -- PICTURE OF THE FISH ON THE FISH MENU
        description =
        "Bu canlıyı açık denizde yakalayabilirsiniz, bu canlıyı yakalamak için seviye 5 ve üzeri bir oltaya ihtiyacınız var!"
    },
}

Config.sellMenuItems = {                   -- FISH ON THE FISH SALE MENU
    {
        id = 1,                            -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                 -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Balık",                -- THE APPARENT NAME OF THE FISH
        itemName = "fish",                 -- ITEM NAME OF THE FISH
        fishPrice = 30,                    -- SALE PRICE OF FISH
        shopImage = "./css/imgs/fish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 2,                               -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                    -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Hamsi",                   -- THE APPARENT NAME OF THE FISH
        itemName = "anchovy",                 -- ITEM NAME OF THE FISH
        fishPrice = 50,                       -- SALE PRICE OF FISH
        shopImage = "./css/imgs/anchovy.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 3,                                     -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 2,                          -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Küçük Balık",                   -- THE APPARENT NAME OF THE FISH
        itemName = "smallbluefish",                 -- ITEM NAME OF THE FISH
        fishPrice = 70,                             -- SALE PRICE OF FISH
        shopImage = "./css/imgs/smallbluefish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 4,                                -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 5,                     -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Mavi Balık",               -- THE APPARENT NAME OF THE FISH
        itemName = "bluefish",                 -- ITEM NAME OF THE FISH
        fishPrice = 90,                        -- SALE PRICE OF FISH
        shopImage = "./css/imgs/bluefish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 5,                                   -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 9,                        -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Palamut",                     -- THE APPARENT NAME OF THE FISH
        itemName = "bonitosfish",                 -- ITEM NAME OF THE FISH
        fishPrice = 110,                          -- SALE PRICE OF FISH
        shopImage = "./css/imgs/bonitosfish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 6,                               -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 11,                   -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Zargana",                 -- THE APPARENT NAME OF THE FISH
        itemName = "garfish",                 -- ITEM NAME OF THE FISH
        fishPrice = 130,                      -- SALE PRICE OF FISH
        shopImage = "./css/imgs/garfish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 7,                             -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 13,                 -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Levrek",                -- THE APPARENT NAME OF THE FISH
        itemName = "perch",                 -- ITEM NAME OF THE FISH
        fishPrice = 150,                    -- SALE PRICE OF FISH
        shopImage = "./css/imgs/perch.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 8,                                      -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 15,                          -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Kaplumbağa",                     -- THE APPARENT NAME OF THE FISH
        itemName = "carettacaretta",                 -- ITEM NAME OF THE FISH
        fishPrice = 210,                             -- SALE PRICE OF FISH
        shopImage = "./css/imgs/carettacaretta.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 9,                                -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 18,                    -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Aslan Balığı",             -- THE APPARENT NAME OF THE FISH
        itemName = "pantfish",                 -- ITEM NAME OF THE FISH
        fishPrice = 240,                       -- SALE PRICE OF FISH
        shopImage = "./css/imgs/pantfish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 10,                                -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 20,                     -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Köpek Balığı",              -- THE APPARENT NAME OF THE FISH
        itemName = "sharkfish",                 -- ITEM NAME OF THE FISH
        fishPrice = 280,                        -- SALE PRICE OF FISH
        shopImage = "./css/imgs/sharkfish.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 11,                                 -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                       -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Beyaz İnci",                 -- THE APPARENT NAME OF THE FISH
        itemName = "whitepearl",                 -- ITEM NAME OF THE FISH
        fishPrice = 150,                         -- SALE PRICE OF FISH
        shopImage = "./css/imgs/whitepearl.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 12,                                -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                      -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Mavi İnci",                 -- THE APPARENT NAME OF THE FISH
        itemName = "bluepearl",                 -- ITEM NAME OF THE FISH
        fishPrice = 200,                        -- SALE PRICE OF FISH
        shopImage = "./css/imgs/bluepearl.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 13,                               -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                     -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Kırmızı İnci",             -- THE APPARENT NAME OF THE FISH
        itemName = "redpearl",                 -- ITEM NAME OF THE FISH
        fishPrice = 250,                       -- SALE PRICE OF FISH
        shopImage = "./css/imgs/redpearl.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 14,                                  -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                        -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Sarı İnci",                   -- THE APPARENT NAME OF THE FISH
        itemName = "yellowpearl",                 -- ITEM NAME OF THE FISH
        fishPrice = 300,                          -- SALE PRICE OF FISH
        shopImage = "./css/imgs/yellowpearl.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
    {
        id = 15,                                 -- FISH ID (ID OF ALL FISH MUST BE DIFFERENT AND SEQUENTIAL)
        requiredLevel = 1,                       -- DESIRED LEVEL TO KEEP THE FISH (DON'T FORGET TO CHANGE FROM Config.FishLevels)
        fishName = "Yeşil İnci",                 -- THE APPARENT NAME OF THE FISH
        itemName = "greenpearl",                 -- ITEM NAME OF THE FISH
        fishPrice = 350,                         -- SALE PRICE OF FISH
        shopImage = "./css/imgs/greenpearl.png", -- PICTURE OF THE FISH ON THE SALES MENU
    },
}
