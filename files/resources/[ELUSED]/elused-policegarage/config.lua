Config = {}

Config.UseLogs = true -- Set to true to enable discord logs, using default QBCore logs system

Config.BanWhenExploit = false -- Set to true if you want to ban players / cheaters (Just another safety system)

Config.CompanyFunds = {
    Enable = false, -- Set to false to disable the company funds feature (Havent been tested completely. NOT recommended to use)
    CheckDistance = 10.0, -- The radius that the script checks for nearby players (If Enable)
}

Config.UseBlips = true -- Set to false to disable all script blips

Config.RentMaximum = 60 -- The rent maximum allowed in minutes

Config.Target = "qb-target" -- The name of your target

Config.FuelSystem = "ed-fuel" -- The fuel system, ed-fuel by default

Config.SetVehicleTransparency = 'none' -- The vehicle transparency level for the preview. Options : low, medium, high, none

Config.Locals = {
    Targets = {
        GarageTarget = {
            Distance = 5.0,
            Icon = "fa fa-car",
            Label = "MESLEK GARAJI",  
        },
    },

    Notifications = {
        RentOver = "Kira süresi ",
        RentWarning = "Aracı iade edin yoksa silinecek! araç",
        NoRentedVehicle = "There are no rented vehicles on your name",
        NoMoney = "You dont have enough money",
        VehicleReturned = "Vehicle returned. Vehicle ",
        SuccessfullyRented = " successfully rented for ",
        SuccessfullyBought = " successfully bought from ",
        NotDriver = "You must be the driver !",
        ExtraTurnedOn = " vehicle extra successfully got turned on",
        NoFunds = "There isnt enough funds for ",
        ExtraTurnedOff = " vehicle extra successfully got turned off",
        NoJob = " doesnt have the correct job",
        NoRank = " doesnt have the correct required rank",
        VehicleInSpawn = 'Theres a vehicle in the spawn area !',
        NotInVehicle = "You are not in any vehicle !",
        LiverySet = "Vehicle livery has been successfully set to ",
        LeftVehicle = "You have left the vehicle",
        IncorrectVehicle = "Incorrect vehicle ! you rented "
    },
}

Config.Locations = {
    Stations = {
        ["EMS -"] = { -- Full template, inculdes all script features (The string is the garage name used as the station / garage name)
        UseTarget = true, -- Set to false to use the Marker for this station
        UseRent = false, -- Set to false to disable the rent feature for this station (Garage WONT WORK if UseRent and UsePurchasable are set to false)
        UseOwnable = true, -- Set to false to disable ownable vehicles 
        UseExtras = false, -- Set to false to disable the extras feature
        UsePurchasable = true, -- Set to false to disable purchasable vehicles (Garage WONT WORK if UseRent and UsePurchasable are set to false)
        UseLiveries = false, -- Set to false to disable the livery feature
        JobRequired = "ambulance", -- The job required for this station garage; For 1 job use, for multiple jobs JobRequired = {"job1", "job2"}, for all job use JobRequired = "all"
        VehiclesInformation = {
            RentVehicles = { -- Rent vehicles information, if UseRent set to true as : UseRent = true
                ["Bati"] = {
                    Vehicle = "bati", -- The vehicle to spawn
                    PricePerMinute = 50, -- The price to charge for that vehicle every minute
                }, 
            },
            PurchaseVehicles = { -- Purchasable vehicles, make sure you have the vehicle information set in qb-core > shared > vehicles.lua
            ["EMS Ambulance"] = {
                Vehicle = "ambulance", -- The vehicle to spawn
                TotalPrice = 0, -- The total price it costs to buy this vehicle
                Rank = 1,2,3,4,5,6,7,8, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                VehicleSettings = { -- Everthing inside those brackets is totally optional
                    -- Example of how it should look like if you dont want to use any of those features
                },
            }, 
            ["PD Taharus"] = {
                Vehicle = "clrgtaurus", -- The vehicle to spawn
                TotalPrice = 0, -- The total price it costs to buy this vehicle
                Rank = 1,2,3,4,5,6,7,8, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                VehicleSettings = { -- Everthing inside those brackets is totally optional
                    -- Example of how it should look like if you dont want to use any of those features
                },
            }, 
            ["PD Tahot"] = {
                Vehicle = "clrgtahoe", -- The vehicle to spawn
                TotalPrice = 0, -- The total price it costs to buy this vehicle
                Rank = 1,2,3,4,5,6,7,8, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                VehicleSettings = { -- Everthing inside those brackets is totally optional
                    -- Example of how it should look like if you dont want to use any of those features
                },
            }, 
        },
            SpawnCoords = {
                VehicleSpawn = vector4(294.31, -608.6, 43.34, 251.19), -- Vehicle spawn and vehicle clear check coords
                PreviewSpawn = vector4(283.91, -604.86, 50.4, 249.15), -- Preview vehicle spawn coords
                CheckRadius = 5.0, -- The radius the script checks for vehicle
                CameraInformation = {
                    CameraCoords = vector3(283.91, -604.86, 48.76), -- Vehicle preview camera coords
                    CameraRotation = vector3(-10.00, 0.00, 240.494419), -- Vehicle preview camera rotation coords
                    CameraFOV = 80.0, -- The vehicle preview camera fov value
                },
            },
        },
        GeneralInformation = {
            Blip = { -- If UseTarget set to true it uses the target ped coords and if false it uses the marker coords
                BlipId = 357, -- The blip id. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                BlipColour = 2, -- The blip colour. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                BlipScale = 0.4, -- The blip scale
                Title = "Ems - Garajı" -- The blip title string
            },
            TargetInformation = { -- If UseTarget set to true this is the required information
                Ped = "a_m_y_smartcaspat_01", -- The ped model. More models can be found at : https://docs.fivem.net/docs/game-references/ped-models/
                Coords = vector4(294.85, -596.42, 42.29, 69.41), -- The ped coords
                Scenario = "WORLD_HUMAN_CLIPBOARD", -- Ped scenario. More can be found at : https://wiki.rage.mp/index.php?title=Scenarios
            },
            MarkerInformation = { -- If UseTarget set to false this is the required information
                Coords = vector3(294.85, -596.42, 43.29), -- The marker coords
                MarkerType = 36, -- The marker type. More can be found at : https://docs.fivem.net/docs/game-references/markers/
                MarkerColor = { R = 255, G = 0, B = 0, A = 100 }, -- The marker color. You can pick other colors here : https://rgbacolorpicker.com/
            },
        },  
    },
        ["PD --"] = { -- Full template, inculdes all script features (The string is the garage name used as the station / garage name)
            UseTarget = true, -- Set to false to use the Marker for this station
            UseRent = false, -- Set to false to disable the rent feature for this station (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseOwnable = true, -- Set to false to disable ownable vehicles 
            UseExtras = false, -- Set to false to disable the extras feature
            UsePurchasable = true, -- Set to false to disable purchasable vehicles (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseLiveries = false, -- Set to false to disable the livery feature
            JobRequired = "police", -- The job required for this station garage; For 1 job use, for multiple jobs JobRequired = {"job1", "job2"}, for all job use JobRequired = "all"
            VehiclesInformation = {
                RentVehicles = { -- Rent vehicles information, if UseRent set to true as : UseRent = true
                    ["Bati"] = {
                        Vehicle = "bati", -- The vehicle to spawn
                        PricePerMinute = 50, -- The price to charge for that vehicle every minute
                    }, 
                },
                PurchaseVehicles = { -- Purchasable vehicles, make sure you have the vehicle information set in qb-core > shared > vehicles.lua
                ["PD Cruiser"] = {
                    Vehicle = "polvic", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Taharus"] = {
                    Vehicle = "clrgtaurus", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Tahot"] = {
                    Vehicle = "clrgtahoe", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Kekxplorer"] = {
                    Vehicle = "npolexp", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Raptor"] = {
                    Vehicle = "polraptor", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Challgargent"] = {
                    Vehicle = "npolchal", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Curvi"] = {
                    Vehicle = "npolvette", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Stgang"] = {
                    Vehicle = "npolstang", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
            },
                SpawnCoords = {
                    VehicleSpawn = vector4(438.42324, -1021.07, 28.677057, 101.4219), -- Vehicle spawn and vehicle clear check coords
                    PreviewSpawn = vector4(453.6509, -1023.771, 28.494075, 62.526172), -- Preview vehicle spawn coords
                    CheckRadius = 5.0, -- The radius the script checks for vehicle
                    CameraInformation = {
                        CameraCoords = vector3(447.5325, -1020.384, 30.494419), -- Vehicle preview camera coords
                        CameraRotation = vector3(-10.00, 0.00, 240.494419), -- Vehicle preview camera rotation coords
                        CameraFOV = 80.0, -- The vehicle preview camera fov value
                    },
                },
            },
            GeneralInformation = {
                Blip = { -- If UseTarget set to true it uses the target ped coords and if false it uses the marker coords
                    BlipId = 357, -- The blip id. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipColour = 2, -- The blip colour. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipScale = 0.4, -- The blip scale
                    Title = "Police - Garajı" -- The blip title string
                },
                TargetInformation = { -- If UseTarget set to true this is the required information
                    Ped = "a_m_y_smartcaspat_01", -- The ped model. More models can be found at : https://docs.fivem.net/docs/game-references/ped-models/
                    Coords = vector4(459.05987, -1017.118, 27.153299, 96.337463), -- The ped coords
                    Scenario = "WORLD_HUMAN_CLIPBOARD", -- Ped scenario. More can be found at : https://wiki.rage.mp/index.php?title=Scenarios
                },
                MarkerInformation = { -- If UseTarget set to false this is the required information
                    Coords = vector3(443.73809, -1017.172, 28.648283), -- The marker coords
                    MarkerType = 36, -- The marker type. More can be found at : https://docs.fivem.net/docs/game-references/markers/
                    MarkerColor = { R = 255, G = 0, B = 0, A = 100 }, -- The marker color. You can pick other colors here : https://rgbacolorpicker.com/
                },
            },  
        },
        ["SD --"] = { -- Full template, inculdes all script features (The string is the garage name used as the station / garage name)
            UseTarget = true, -- Set to false to use the Marker for this station
            UseRent = false, -- Set to false to disable the rent feature for this station (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseOwnable = true, -- Set to false to disable ownable vehicles 
            UseExtras = false, -- Set to false to disable the extras feature
            UsePurchasable = true, -- Set to false to disable purchasable vehicles (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseLiveries = false, -- Set to false to disable the livery feature
            JobRequired = "sheriff", -- The job required for this station garage; For 1 job use, for multiple jobs JobRequired = {"job1", "job2"}, for all job use JobRequired = "all"
            VehiclesInformation = {
                RentVehicles = { -- Rent vehicles information, if UseRent set to true as : UseRent = true
                    ["Bati"] = {
                        Vehicle = "bati", -- The vehicle to spawn
                        PricePerMinute = 50, -- The price to charge for that vehicle every minute
                    }, 
                },
                PurchaseVehicles = { -- Purchasable vehicles, make sure you have the vehicle information set in qb-core > shared > vehicles.lua
                ["PD Cruiser"] = {
                    Vehicle = "polvic", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Taharus"] = {
                    Vehicle = "clrgtaurus", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Tahot"] = {
                    Vehicle = "clrgtahoe", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 2,3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Kekxplorer"] = {
                    Vehicle = "npolexp", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Raptor"] = {
                    Vehicle = "polraptor", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 3,4,5,6,7,8,9,10,11,12,13,14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Challgargent"] = {
                    Vehicle = "npolchal", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Curvi"] = {
                    Vehicle = "npolvette", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Stgang"] = {
                    Vehicle = "npolstang", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
            },
                SpawnCoords = {
                    VehicleSpawn = vector4(-471.34, 6026.0, 31.34, 155.57), -- Vehicle spawn and vehicle clear check coords
                    PreviewSpawn = vector4(-471.34, 6026.0, 31.34, 155.57), -- Preview vehicle spawn coords
                    CheckRadius = 5.0, -- The radius the script checks for vehicle
                    CameraInformation = {
                        CameraCoords = vector3(-476.34, 6028.83, 32.84), -- Vehicle preview camera coords
                        CameraRotation = vector3(-10.00, 0.00, 240.494419), -- Vehicle preview camera rotation coords
                        CameraFOV = 80.0, -- The vehicle preview camera fov value
                    },
                },
            },
            GeneralInformation = {
                Blip = { -- If UseTarget set to true it uses the target ped coords and if false it uses the marker coords
                    BlipId = 357, -- The blip id. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipColour = 2, -- The blip colour. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipScale = 0.4, -- The blip scale
                    Title = "Sheriff - Garajı" -- The blip title string
                },
                TargetInformation = { -- If UseTarget set to true this is the required information
                    Ped = "a_m_y_smartcaspat_01", -- The ped model. More models can be found at : https://docs.fivem.net/docs/game-references/ped-models/
                    Coords = vector4(-478.88, 6015.1, 30.40, 316.02), -- The ped coords
                    Scenario = "WORLD_HUMAN_CLIPBOARD", -- Ped scenario. More can be found at : https://wiki.rage.mp/index.php?title=Scenarios
                },
                MarkerInformation = { -- If UseTarget set to false this is the required information
                    Coords = vector3(-478.88, 6015.1, 31.34), -- The marker coords
                    MarkerType = 36, -- The marker type. More can be found at : https://docs.fivem.net/docs/game-references/markers/
                    MarkerColor = { R = 255, G = 0, B = 0, A = 100 }, -- The marker color. You can pick other colors here : https://rgbacolorpicker.com/
                },
            },  
        },
        ["ST --"] = { -- Full template, inculdes all script features (The string is the garage name used as the station / garage name)
            UseTarget = true, -- Set to false to use the Marker for this station
            UseRent = false, -- Set to false to disable the rent feature for this station (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseOwnable = true, -- Set to false to disable ownable vehicles 
            UseExtras = true, -- Set to false to disable the extras feature
            UsePurchasable = true, -- Set to false to disable purchasable vehicles (Garage WONT WORK if UseRent and UsePurchasable are set to false)
            UseLiveries = true, -- Set to false to disable the livery feature
            JobRequired = "sasp", -- The job required for this station garage; For 1 job use, for multiple jobs JobRequired = {"job1", "job2"}, for all job use JobRequired = "all"
            VehiclesInformation = {
                RentVehicles = { -- Rent vehicles information, if UseRent set to true as : UseRent = true
                    ["Bati"] = {
                        Vehicle = "bati", -- The vehicle to spawn
                        PricePerMinute = 50, -- The price to charge for that vehicle every minute
                    }, 
                },
                PurchaseVehicles = { -- Purchasable vehicles, make sure you have the vehicle information set in qb-core > shared > vehicles.lua
                ["PD Cruiser"] = {
                    Vehicle = "polvic", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Cruiser"] = {
                    Vehicle = "polvic", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Taharus"] = {
                    Vehicle = "clrgtaurus", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Tahot"] = {
                    Vehicle = "clrgtahoe", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 2,3,4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Kekxplorer"] = {
                    Vehicle = "npolexp", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Raptor"] = {
                    Vehicle = "polraptor", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 3,4,5,6,7,8,9,10,11,12,13,14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Challgargent"] = {
                    Vehicle = "npolchal", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Curvi"] = {
                    Vehicle = "npolvette", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
                ["PD Stgang"] = {
                    Vehicle = "npolstang", -- The vehicle to spawn
                    TotalPrice = 0, -- The total price it costs to buy this vehicle
                    Rank = 14,15,16, -- The rank required to purchase this vehicle. Set to 0 to enable all ranks
                    VehicleSettings = { -- Everthing inside those brackets is totally optional
                        -- Example of how it should look like if you dont want to use any of those features
                    },
                }, 
            },
                SpawnCoords = {
                    VehicleSpawn = vector4(854.89, -1359.11, 26.1, 94.24), -- Vehicle spawn and vehicle clear check coords
                    PreviewSpawn = vector4(857.06, -1373.16, 26.12, 16.66), -- Preview vehicle spawn coords
                    CheckRadius = 5.0, -- The radius the script checks for vehicle
                    CameraInformation = {
                        CameraCoords = vector3(849.67, -1369.03, 28.23), -- Vehicle preview camera coords
                        CameraRotation = vector3(-10.00, 0.00, 240.494419), -- Vehicle preview camera rotation coords
                        CameraFOV = 80.0, -- The vehicle preview camera fov value
                    },
                },
            },
            GeneralInformation = {
                Blip = { -- If UseTarget set to true it uses the target ped coords and if false it uses the marker coords
                    BlipId = 357, -- The blip id. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipColour = 2, -- The blip colour. More can be found at : https://docs.fivem.net/docs/game-references/blips/
                    BlipScale = 0.4, -- The blip scale
                    Title = "State - Garajı" -- The blip title string
                },
                TargetInformation = { -- If UseTarget set to true this is the required information
                    Ped = "a_m_y_smartcaspat_01", -- The ped model. More models can be found at : https://docs.fivem.net/docs/game-references/ped-models/
                    Coords = vector4(863.44, -1346.48, 25.04, 89.38), -- The ped coords
                    Scenario = "WORLD_HUMAN_CLIPBOARD", -- Ped scenario. More can be found at : https://wiki.rage.mp/index.php?title=Scenarios
                },
                MarkerInformation = { -- If UseTarget set to false this is the required information
                    Coords = vector3(863.44, -1346.48, 26.04), -- The marker coords
                    MarkerType = 36, -- The marker type. More can be found at : https://docs.fivem.net/docs/game-references/markers/
                    MarkerColor = { R = 255, G = 0, B = 0, A = 100 }, -- The marker color. You can pick other colors here : https://rgbacolorpicker.com/
                },
            },  
        },
    },
}