Config = {}

Config.EnableBlips = false

Config.TargetIcon = "fas fa-leaf"
Config.PeyoteItem = "peyote"
Config.PeyoteTeaItem = "peyote_tea"
Config.GiveAmount = 1
Config.Neededfortea = 2
Config.GiveTea = 1
Config.ToAmount = 2

Config.Sell = {
    ["peyote"] = {
        ["price"] = math.random(166,167) -- Seller Price
    }
}


ProcessingPeyote = {
    targetZone = vector3(2438.7, 4976.31, 46.81),
    targetHeading = 315.44,
    minZ = 46.05,
    maxZ = 48.00,
}

SellPeyote = {
    targetZone = vector3(3310.74, 5176.42, 19.61),
    targetHeading = 61.58,
    minZ = 18.05,
    maxZ = 20.50,
}


Config.CircleZones = {
    PeyoteField = { coords = vector3(-2169.09, 2672.18, 2.85), name = ('Peyote Farm'), radius = 100.0 },
}


Config.Locations = {
    [1] = { label = "Peyote Toplama", coord = vector3(-2169.09, 2672.18, 2.85), color = 5, sprite = 86, scale = 0.6 },
    [2] = { label = "Peyote Satış", coord = vector3(3311.15, 5175.82, 19.61), color = 2, sprite = 605, scale = 0.7 },
    [3] = { label = "Peyote İşleme", coord = vector3(2444.05, 4980.99, 46.81), color = 38, sprite = 280, scale = 0.7 },
}


Config.Peds = {
    [1] = { handle = nil, model = "a_m_m_fatlatin_01", coords = vector3(3310.74, 5176.42, 19.61), heading = 235.83, anim = { type = 1, name = "WORLD_HUMAN_CLIPBOARD" } }, -- scene
}
