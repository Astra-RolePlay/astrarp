QBCore = exports['qb-core']:GetCoreObject()

Config = {}

Config.RenewedPhone = false --> Set to true if you are using Renewed scripts their qb-phone

-- Ped spawner
Config.ped = {
    enabled = true,
    model = "a_m_m_indian_01",
    coords = vector4(-555.78, -185.77, 37.22, 206.2),
    label = "Nüfus Müdürlüğü Sistemi"
}

Config.blip = {
    enabled = true,
    Name = "Hükümet Binası",
    SpriteId = 487,
    Color = 2,
    Scale = 0.8,
    ShortRange = true,
    Alpha = 255,
    Coords = vector3(-555.69, -185.72, 38.22)
}

-- Jobs for hire
Config.jobs = {
    {
        job = "trucker",
        label = "TIR şoförü",
    },
    {
        job = "taxi",
        label = "Taksi",
    },
    {
        job = "tow",
        label = "Çekici",
    },
    {
        job = "reporter",
        label = "Muhabir",
    },
}

-- Items for purchase
Config.items = { {
    item = "id_card",
    meta = 'id',
    label = "dddddddddd",
    price = 100
}, {
    item = "driver_license",
    label = "Driver License",
    meta = 'driver',
    price = 100
},
    --{
    --     item = "weaponlicense",
    --     label = "Weapon License",
    --     meta = 'weapon',
    --     price = 100
    -- }
}

-- Items shown in the information tab
Config.licenseItems = { {
    item = 'id_card',
    label = 'Kimlik kartı'
}, {
    item = 'driver_license',
    label = 'Ehliyet'
}, {
    item = 'weaponlicense',
    label = 'Silah Lisansı'
} }
