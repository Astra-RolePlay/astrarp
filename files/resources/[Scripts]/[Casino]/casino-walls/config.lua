Config = {}

Config.PlayCasinoAmbientNoise = true
Config.SetShowCarOnDisplay = true
Config.VehicleOnDisplay = `comet3`
Config.CasinoEmployeePrompt  = 'peek' -- 'peek' or 'walk-up' ['walk-up' = walk up to open menu] ['peek' = uses qb-target to interact with employee]


Config.SetAnimatedWalls = true
Config.AnimatedWallNormal = 'CASINO_DIA_PL'
Config.AnimatedWallWin = 'CASINO_WIN_PL'
-- WALLS
-- CASINO_DIA_PL    - Falling Diamonds
-- CASINO_HLW_PL    - Falling Skulls
-- CASINO_SNWFLK_PL - Falling Snowflakes
-- CASINO_WIN_PL    - Falling Confetti

Config.SendWelcomeMail = true -- Sends a email to players phone on entering casino
Config.WelcomeMailsender = "The Diamond Casino"
Config.WelcomeMailsubject ="Hosgeldiniz!"
Config.WelcomeMailmessage = "Diamond Casinoya hosgeldiniz, 24/7 acigiz & sadece elektronik transferler gecerlidir."

Config.payment = "bank" -- or "cash" -- Payment player will recieve by selling casino chips

Config.whiteChipPrice   = 1
Config.redChipPrice     = 5
Config.blueChipPrice    = 10
Config.blackChipPrice   = 50
Config.goldChipPrice    = 100


Config.CasinoShop = {
    [1] = { name = "casino_whitechip",  price = 1,   amount = 999, info = {}, type = "item", slot = 1 },
    [2] = { name = "casino_redchip",    price = 5,   amount = 999, info = {}, type = "item", slot = 2 },
    [3] = { name = "casino_bluechip",   price = 10,  amount = 999, info = {}, type = "item", slot = 3 },
    [4] = { name = "casino_blackchip",  price = 50,  amount = 999, info = {}, type = "item", slot = 4 },
    [5] = { name = "casino_goldchip",   price = 100, amount = 999, info = {}, type = "item", slot = 5 },
    [6] = { name = "casino_member",     price = 5000, amount = 199, info = {}, type = "item", slot = 6 },
    [7] = { name = "casino_vip",        price = 7500, amount = 199, info = {}, type = "item", slot = 7 }
}   

Config.CasinoShop2 = {
    [1] = { name = "beer",  price = 1200,   amount = 999, info = {}, type = "item", slot = 1 },
    [2] = { name = "whiskey",    price = 1500,   amount = 999, info = {}, type = "item", slot = 2 },
    [3] = { name = "vodka",   price = 1000,  amount = 999, info = {}, type = "item", slot = 3 },
    [4] = { name = "wine",  price = 500,  amount = 999, info = {}, type = "item", slot = 4 },
}   
