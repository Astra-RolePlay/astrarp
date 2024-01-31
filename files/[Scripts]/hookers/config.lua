Config = {}

-- The max distnace from a hooker you can pick them up
Config.MaxDistance = 7.5

-- The maximum amount of services a hooker will accept before they leave
Config.MaxServices = 3

-- The maximum speed (meters per seconds) your vehicle can have before it checks for nearby hookers etc.
Config.MaxVehicleSpeed = 0.1

Config.PaymentEnabled = false
Config.Framework = "qbcore" -- "esx", "qbcore", "ndcore" or "standalone" (used for the payments)
Config.Prices = {
    SERVICE_BLOWJOB = 50,
    SERVICE_SEX = 100
}

-- Localization
Config.Localization = {
    InviteHooker = "Fahişeyi araca davet etmek için ~INPUT_VEH_HORN~ basın veya kornanızı çalın.",
    FindSecludedArea = "Daha tenha bir yere git.",
    FindSecludedAreaFailed = "Zamanında tenha bir alan bulamadınız.",
    VehicleUnsuitable = "Bu araçla fahişeyi avlamaya mı çalışıyorsun?",
    FrontSeatOccupied = "Bir fahişeyi davet etmek için ön koltuğun boş olması gerekir.",
    NotEnoughMoney = "Yeterli paran yok!"
}

-- The peds that are considered hookers. (be carefull what you add here.)
Config.HookerPedModels = {
    [`s_f_y_hooker_01`] = true,
    [`s_f_y_hooker_02`] = true,
    [`s_f_y_hooker_03`] = true
}

-- The vehicle classes that can't be used to pick up hookers
Config.BlackListedVehicleClasses = {
    [8] = true, -- Motorcycles
    [13] = true, -- Cycles
    [14] = true, -- Boats
    [15] = true, -- Helicopters
    [16] = true, -- Planes
    [18] = true, -- Emergency
    [19] = true, -- Military
    [21] = true, -- Trains
    [22] = true, -- Open Wheel
}
