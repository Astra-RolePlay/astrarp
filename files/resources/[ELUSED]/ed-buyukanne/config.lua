Config = {}

Config.Framework = {
    Target = 'qb-target',
    -- 'qb-target' = QBCore Target
    -- 'qtarget' = QTarget
    Notifications = 'qb',
    -- 'qb' = QBCoreNotify
    -- 'okok' = okokNotify
    -- 'mythic' = mythic_notify
    -- 'chat' = Chat Message
    DrawText = {
        Type = 'qb-core', -- 'qb-core' or 'okok'
        Position = 'top', -- 'top' or 'left' or 'right'
    },
    Logs = false, -- Currrently setup via QBCore Logs
    -- True = Logs Enabled
    -- False = Logs Disabled
    Debug = false,
    -- True = Prints Enabled
    -- False = Prints Disabled
}

Config.IllegalMedicalTarget = {
    Coords = vector3(1393.56, 2162.82, 97.81), -- Coords for the Target
    Width = 0.5, -- Width for the Target
    Length = 0.5, -- Length for the Target
    Heading = 0, -- Heading for the Target
    minZ = 96.10, -- Minimum Z for the Target
    maxZ = 98.36, -- Maximum Z for the Target
    DebugPoly = false, -- Whether you want the Target Poly's Enabled
    TargetDistance = 2.0, -- Distance in which you can Target the Medical Aid
    TargetLabel = "Büyükannenizle Tıbbi Yaralanmalarınız hakkında konuşun", -- Target Label Description | Text you see for the Target Label
    TargetIcon = "fa-solid fa-skull", -- Another Example: fa-solid fa-skull | Icon you see when Targeting the Medical Aid
    CanInteractLimit = false, -- Ölüyken canlandırma olsun mu olmasın mı şuanda var yani false

    -- This Configuration plays a toll with the Injury Healing.
    -- If you set 'InjuryTarget' to false than you won't have to edit the 'InjuryTargetLabel' and 'InjuryTargetIcon'
    InjuryTarget = true,
    InjuryTargetLabel = "Büyükannenin yaptığı yemeklerden ye",
    InjuryTargetIcon = "fas fa-user-injured",
}

Config.IllegalMedical = {
    Coords = vector4(1393.56, 2162.82, 97.81, 170.03), -- Entire Vector4 Coordinate
    PedModel = 'cs_mrs_thornhill', -- Ped Hash (https://docs.fivem.net/docs/game-references/ped-models/)
    PedName = "Büyükanne", -- Ped Name
    PaymentType = 'cash', -- 'cash' = QBCore Player Cash Money | 'bank' = QBCore Player Bank Money | 'crypto' = QBCore Player Crypto Money | 'item' = QBCore Shared Item
    PaymentCost = 0, -- Amount of Money | If you aren't using a Money Type(cash, bank, or crypto) than you can remove this Configuration
    Item = nil, -- 'ItemName' | ItemName = QBCore Shared Item Name | If you aren't using an Item, you can remove this Configuration and the one below.
    ItemAmount = 0, -- Amount of Items
    OkOkNotificationTitle = "Grandma Aid",
    Minigame = {
        Enabled = true,
        PSUI = true,
        QBCoreSkillBar = false,
        QBCoreNPInspiredLock = false
    }
}

Config.MedicalAidInjuries = {
    PaymentType = 'cash', -- 'cash' = QBCore Player Cash Money | 'bank' = QBCore Player Bank Money | 'crypto' = QBCore Player Crypto Money | 'item' = QBCore Shared Item
    PaymentCost = 0, -- Amount of Money | If you aren't using a Money Type(cash, bank, or crypto) than you can remove this Configuration
    Item = nil, -- 'ItemName' | ItemName = QBCore Shared Item Name | If you aren't using an Item, you can remove this Configuration and the one below.
    ItemAmount = 0, -- Amount of Items
}
