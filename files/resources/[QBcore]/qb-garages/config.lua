SpawnVehicleServerside = false -- REQUIRES THE ABSOLUTE LATEST VERSION OF QBCORE, OR MAKE SURE YOU HAVE THESE: https://github.com/qbcore-framework/qb-core/blob/81ffd872319d2eb8e496c3b3faaf37e791912c84/server/events.lua#L252
SpawnAtFreeParkingSpot = true

StoreDamageAccuratly = false -- Do not use, if on latest qb-core, if set to true, make sure to apply / run patch1.sql
StoreParkinglotAccuratly = false  -- store the last parking lot in the DB, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet for qb-phone from the ReadMe to the phone so you can track the vehicle to the exact parking lot
SpawnAtLastParkinglot = false -- spawn the vehicle at hte last parked location if StoreParkinglotAccuratly = true, if set to true, make sure to apply / run patch1.sql, I recommend applying the tracking snippet from the ReadMe to the phone so you can track the vehicle to the exact parking lot
GarageNameAsBlipName = true -- if set to true, the blips name will match the garage name
FuelScript = 'ed-fuel' -- change to lj-fuel / ps-fuel if you use lj-fuel / ps-fuel or something else if you use any other LegcyFuel compatible script
AllowSpawningFromAnywhere = true -- if set to true, the car can be spawned from anywhere inside the zone on the closest parking lot, if set to false you will have to walk up to a parking lot 
AutoRespawn = true --True == auto respawn cars that are outside into your garage on script restart, false == does not put them into your garage and players have to go to the impound
WarpPlayerIntoVehicle = false -- True == Will Warp Player Into their vehicle after pulling it out of garage. False It will spawn on the parking lot / in front of them  (Global, can be overriden by each garage)
HouseParkingDrawText = 'Ev Garajı' -- text when driving on to the HOUSE parking lot
ParkingDistance = 25.0 -- Distance to the parking lot when trying to park the vehicle  (Global, can be overriden by each garage)
SpawnDistance = 4.5 -- The maximum distance you can be from a parking spot, to spawn a car (Global, can be overriden by each garage)
DepotPrice = 60.0 -- The price to take out a despawned vehicle from impound.
DrawTextPosition = 'left' -- location of drawtext: left, top, right

JobVehicles = {}

RestoreCommandPermissionLevel = 'god' -- sets the permission level for the above mentioned command

VehicleCategories = {
    ['car'] = { 0, 1, 2, 3, 4, 5, 6, 7, 9, 10, 11, 12, 17, 18 },
    ['motorcycle'] = { 8 },
    ['other'] = { 13 },
    ['boat'] = { 14 },
    ['helicopter'] = { 15 },
    ['plane'] = { 16 },
    ['military'] = { 19 },
    ['commercial'] = { 20 },
}

HouseGarageCategories = {'car', 'motorcycle', 'other'} -- Which categories are allowed to be parked at a house garage


VehicleHeading = 'driverside'

SharedJobGarages = {}

Garages = {
    ['pillboxgarageleft'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(302.23864746094, -602.27526855469),
                vector2(298.15417480469, -613.57073974609),
                vector2(287.90060424805, -609.74993896484),
                vector2(292.21099853516, -598.66320800781),
            },
            ['minZ'] = 42.6,  -- min height of the parking zone
            ['maxZ'] = 46.6,  -- max height of the parking zone
        },
        label = 'Pillbox Garaj',
        showBlip = false,
        blipcoords = vector3(296.15, -606.15, 43.24),
        blipName = 'Garage',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(298.84, -602.52, 42.79, 250.33),
            vector4(298.06, -605.03, 42.82, 249.14),
            vector4(297.01, -607.97, 42.84, 247.59),
            vector4(296.06, -610.65, 42.83, 251.19),
        }
    },
    ['lowerpowerstgaraj'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(75.48, -576.16),
                vector2(63.96, -572.52),
                vector2(55.68, -570.44),
                vector2(48.57, -568.98),
                vector2(38.42, -567.4),
                vector2(31.73, -566.63),
                vector2(20.83, -566.22),
                vector2(19.61, -569.19),
                vector2(15.02, -567.57),
                vector2(3.76, -598.58),
                vector2(23.77, -605.67),
                vector2(7.99, -648.6),
                vector2(21.81, -653.62),
                vector2(20.7, -657.82),
                vector2(32.76, -662.45),
                vector2(34.63, -661.22),
                vector2(48.2, -666.25),
                vector2(78.06, -584.13),
                vector2(73.72, -582.12),
            },
            ['minZ'] = 30.6,  -- min height of the parking zone
            ['maxZ'] = 32.6,  -- max height of the parking zone
        },
        label = 'Lower Power St Garaj',
        showBlip = false,
        blipcoords = vector3(37.08, -616.99, 34.19),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(48.46, -600.58, 31.05, 339.83),
            vector4(45.27, -598.81, 31.05, 337.94),
            vector4(41.67, -597.67, 31.05, 340.45),
            vector4(38.56, -596.16, 31.05, 338.12),
            vector4(34.99, -595.47, 31.05, 340.89),
            vector4(31.2, -593.92, 31.05, 339.65),
            vector4(27.64, -592.9, 31.05, 341.86),
            vector4(7.72, -596.58, 31.05, 251.56),
            vector4(9.52, -592.97, 31.05, 249.91),
            vector4(10.79, -589.67, 31.05, 248.15),
            vector4(11.64, -586.28, 31.05, 250.38),
            vector4(13.02, -582.73, 31.05, 250.56),
            vector4(14.43, -579.28, 31.05, 250.48),
            vector4(15.79, -575.91, 31.05, 250.57),
            vector4(16.99, -572.2, 31.05, 250.35),
            vector4(32.27, -579.78, 31.05, 338.59),
            vector4(36.28, -581.01, 31.05, 342.11),
            vector4(39.79, -581.82, 31.05, 339.93),
            vector4(42.7, -583.86, 31.05, 338.52),
            vector4(46.25, -584.88, 31.05, 343.14),
            vector4(49.66, -586.2, 31.05, 341.91),
            vector4(53.64, -586.94, 31.05, 341.75),
            vector4(57.03, -588.71, 31.05, 340.63),
            vector4(64.95, -576.19, 31.05, 163.06),
            vector4(68.08, -577.66, 31.05, 154.95),
            vector4(72.16, -578.61, 31.05, 155.89),
            vector4(73.41, -586.19, 31.05, 69.64),
            vector4(72.48, -589.82, 31.05, 67.8),
            vector4(70.89, -592.9, 31.05, 68.41),
            vector4(69.46, -596.76, 31.05, 68.6),
            vector4(67.89, -600.17, 31.05, 69.91),
            vector4(67.24, -603.68, 31.05, 67.92),
            vector4(65.89, -607.19, 31.05, 68.69),
            vector4(64.22, -611.22, 31.1, 68.4),
            vector4(54.68, -638.55, 31.09, 246.21),
            vector4(53.23, -641.75, 31.06, 69.7),
            vector4(52.06, -645.06, 31.05, 70.13),
            vector4(50.58, -648.56, 31.05, 67.35),
            vector4(49.61, -652.33, 31.05, 69.85),
            vector4(48.33, -655.49, 31.05, 68.67),
            vector4(47.37, -659.23, 31.05, 69.73),
            vector4(45.67, -662.47, 31.05, 66.96),
        }
    },
    ['pillboxlowergaraj'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(352.34439086914, -620.59851074219),
                vector2(344.32354736328, -636.03747558594),
                vector2(325.94189453125, -628.93359375),
                vector2(331.88412475586, -613.10968017578)
            },
            ['minZ'] = 28.2,  -- min height of the parking zone
            ['maxZ'] = 31.30,  -- max height of the parking zone
        },
        label = 'Pillbox Lower Garaj',
        showBlip = false,
        blipcoords = vector3(341.7, -623.33, 29.29),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(342.07, -632.51, 28.87, 340.17),
            vector4(338.89, -631.43, 28.87, 341.89),
            vector4(335.77, -630.04, 28.87, 340.85),
            vector4(332.61, -628.68, 28.87, 342.74),
            vector4(329.16, -627.36, 28.87, 341.84),
            vector4(346.44, -620.82, 28.87, 157.15),
            vector4(343.13, -619.38, 28.87, 157.56),
            vector4(339.76, -619.01, 28.87, 157.43),
            vector4(336.5, -617.88, 28.87, 162.09),
            vector4(333.34, -616.15, 28.87, 160.22),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    -- ['pillboxlower2garaj'] = {
    --     ['Zone'] = {
    --         ['Shape'] = {
    --             vector2(318.84606933594, -581.78985595703),
    --             vector2(311.14108276367, -578.96514892578),
    --             vector2(317.73159790039, -561.54937744141),
    --             vector2(325.25082397461, -564.17541503906),
    --             vector2(327.95275878906, -574.94073486328)
    --         },
    --         ['minZ'] = 27.2,  -- min height of the parking zone
    --         ['maxZ'] = 31.30,  -- max height of the parking zone
    --     },
    --     label = 'Pillbox Lower 2 Garaj',
    --     showBlip = false,
    --     blipcoords = vector3(341.7, -623.33, 29.29),
    --     blipName = 'Public Parking',
    --     blipNumber = 357,
    --     type = 'public',
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Garaj Bölgesi',
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(320.68, -565.24, 28.08, 252.61),
    --         vector4(319.86, -569.6, 28.08, 249.75),
    --         vector4(318.77, -574.17, 28.08, 250.65),
    --         vector4(317.42, -578.36, 28.08, 249.66),
    --     }
    -- },
    ['mirrorparkgaraj'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(1043.447265625, -767.26947021484),
                vector2(1049.4702148438, -769.44775390625),
                vector2(1049.4797363281, -794.31622314453),
                vector2(1048.9655761719, -794.32214355469),
                vector2(1049.03125, -793.87451171875),
                vector2(1043.466796875, -793.80151367188),
                vector2(1043.3436279297, -794.52691650391),
                vector2(1031.5026855469, -794.34808349609),
                vector2(1007.7255859375, -764.88061523438),
                vector2(1022.2494506836, -752.11022949219),
                vector2(1025.6563720703, -755.25653076172),
                vector2(1030.9210205078, -758.50311279297),
                vector2(1031.2462158203, -758.19201660156),
                vector2(1035.1042480469, -760.79956054688),
                vector2(1030.6268310547, -767.16302490234),
                vector2(1025.9473876953, -763.81085205078),
                vector2(1024.8063964844, -765.39245605469),
                vector2(1033.9915771484, -772.05816650391),
                vector2(1036.6497802734, -781.24871826172),
                vector2(1038.708984375, -780.87786865234),
                vector2(1035.7690429688, -770.72528076172),
                vector2(1032.0593261719, -768.04278564453),
                vector2(1034.0390625, -764.51586914062),
                vector2(1036.8060302734, -766.30773925781),
                vector2(1038.0424804688, -763.41851806641),
                vector2(1043.5157470703, -766.21325683594)
            },
            ['minZ'] = 56.50,
            ['maxZ'] = 59.20
        },
        label = 'Mirror Park Garaj',
        showBlip = false,
        blipcoords = vector3(1037.65, -771.62, 58.01),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(1023.5, -756.15, 57.48, 225.44),
            vector4(1020.64, -758.19, 57.49, 225.22),
            vector4(1017.57, -760.75, 57.47, 222.83),
            vector4(1014.9, -763.11, 57.4, 223.82),
            vector4(1016.1, -770.57, 57.41, 311.2),
            vector4(1018.8, -773.42, 57.43, 308.15),
            vector4(1020.68, -776.34, 57.39, 311.86),
            vector4(1023.75, -779.38, 57.41, 309.66),
            vector4(1025.72, -782.07, 57.4, 308.8),
            vector4(1028.49, -784.92, 57.41, 307.36),
            vector4(1030.06, -787.96, 57.38, 310.65),
            vector4(1038.12, -791.16, 57.47, 1.48),
            vector4(1046.49, -785.56, 57.5, 89.6),
            vector4(1046.38, -782.01, 57.51, 92.17),
            vector4(1046.22, -778.03, 57.52, 89.04),
            vector4(1046.27, -774.45, 57.52, 90.5),
            vector4(1030.96, -773.4, 57.57, 144.89),
            vector4(1028.05, -771.42, 57.55, 146.44),
            vector4(1029.35, -763.6, 57.49, 56.05),
            vector4(1041.6, -791.45, 57.5, 0.97),
        }
    },
    ['casinogaraj'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(915.48345947266, -14.229139328003),
                vector2(912.52160644531, -19.256662368774),
                vector2(914.41729736328, -20.468030929565),
                vector2(928.14013671875, -29.422761917114),
                vector2(931.68640136719, -24.097787857056),
                vector2(943.31915283203, -31.373510360718),
                vector2(940.18115234375, -36.682193756104),
                vector2(940.63336181641, -37.222324371338),
                vector2(941.06457519531, -38.056762695312),
                vector2(940.69250488281, -39.514526367188),
                vector2(945.86834716797, -42.898574829102),
                vector2(936.578125, -58.041912078857),
                vector2(935.71746826172, -59.93187713623),
                vector2(935.32781982422, -63.596141815186),
                vector2(935.49609375, -65.299346923828),
                vector2(936.2734375, -67.329566955566),
                vector2(938.08367919922, -69.736022949219),
                vector2(939.06182861328, -70.789291381836),
                vector2(942.05615234375, -73.50260925293),
                vector2(944.24096679688, -76.701873779297),
                vector2(945.71282958984, -80.333465576172),
                vector2(945.46759033203, -86.331184387207),
                vector2(944.24163818359, -90.072593688965),
                vector2(942.83435058594, -92.46647644043),
                vector2(928.69256591797, -105.37116241455),
                vector2(926.07592773438, -107.04386138916),
                vector2(922.68194580078, -107.79019927979),
                vector2(918.29956054688, -107.78350067139),
                vector2(914.76385498047, -106.68801879883),
                vector2(891.66986083984, -92.136535644531),
                vector2(894.90283203125, -86.966018676758),
                vector2(877.28314208984, -75.933624267578),
                vector2(873.83764648438, -81.048561096191),
                vector2(849.61877441406, -65.853485107422),
                vector2(842.07305908203, -59.212493896484),
                vector2(832.29779052734, -48.991901397705),
                vector2(836.66088867188, -44.546573638916),
                vector2(834.18530273438, -42.00004196167),
                vector2(832.93865966797, -39.975162506104),
                vector2(832.380859375, -35.275825500488),
                vector2(833.16229248047, -31.17188835144),
                vector2(839.43792724609, -22.388980865479),
                vector2(849.22601318359, -10.30827331543),
                vector2(871.66424560547, 12.689045906067),
                vector2(872.94342041016, 12.611633300781),
                vector2(881.33111572266, 7.0416121482849),
                vector2(880.61773681641, 5.6222538948059),
                vector2(880.45855712891, 1.066015958786),
                vector2(889.86468505859, -5.0284695625305),
                vector2(894.46960449219, -2.9582657814026),
                vector2(895.51623535156, -1.5529407262802)
            },
            ['minZ'] = 77.50,
            ['maxZ'] = 80.00
        },
        label = 'Casino Garaj',
        showBlip = false,
        blipcoords = vector3(888.47, -37.44, 78.76),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(868.22, -74.12, 78.34, 327.6),
            vector4(865.89, -71.32, 78.34, 327.2),
            vector4(862.79, -70.26, 78.34, 327.35),
            vector4(859.57, -67.92, 78.34, 326.45),
            vector4(856.54, -66.59, 78.34, 326.94),
            vector4(853.6, -64.76, 78.34, 329.96),
            vector4(850.98, -62.23, 78.34, 315.33);
            vector4(848.28, -60.42, 78.34, 316.25),
            vector4(845.29, -58.06, 78.34, 316.99),
            vector4(843.2, -55.19, 78.34, 315.68),
            vector4(841.22, -52.13, 78.34, 315.19),
            vector4(838.31, -49.98, 78.34, 309.63),
            vector4(836.03, -47.87, 78.34, 310.48),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(934.99, -72.5, 78.27, 132.69),
            vector4(937.69, -74.87, 78.27, 135.96),
            vector4(940.12, -77.9, 78.27, 124.93),
            vector4(874.36, -77.52, 78.34, 326.7),
            vector4(871.34, -75.41, 78.34, 327.5),
            vector4(894.66, -90.02, 78.34, 329.43),
            vector4(897.75, -92.07, 78.34, 328.5),
            vector4(900.96, -93.67, 78.34, 326.42),
            vector4(903.67, -95.7, 78.34, 328.69),
            vector4(906.77, -97.42, 78.34, 326.69),
            vector4(909.56, -98.98, 78.27, 329.54),
            vector4(912.88, -100.65, 78.27, 327.47),
            vector4(915.52, -102.44, 78.27, 328.46),
            vector4(919.92, -104.15, 78.27, 355.56),
            vector4(924.34, -102.86, 78.27, 23.29),
            vector4(928.29, -100.03, 78.27, 41.76),
            vector4(931.14, -98.26, 78.27, 42.82),
            vector4(933.29, -95.84, 78.27, 43.98),
            vector4(935.95, -93.66, 78.27, 43.12),
            vector4(938.28, -91.0, 78.27, 43.96),
            vector4(941.5, -86.74, 78.27, 71.64),
            vector4(942.22, -82.22, 78.27, 96.61),
            vector4(932.29, -67.33, 78.27, 108.81),
            vector4(931.48, -62.49, 78.27, 87.5),
            vector4(933.04, -58.41, 78.27, 74.44),
            vector4(934.81, -53.94, 78.27, 56.79),
            vector4(936.58, -51.51, 78.27, 59.07),
            vector4(938.49, -48.34, 78.27, 57.96),
            vector4(939.46, -45.37, 78.27, 57.51),
            vector4(941.87, -42.09, 78.27, 57.26),
            vector4(939.92, -33.37, 78.27, 147.28),
            vector4(937.11, -31.58, 78.27, 146.31),
            vector4(934.46, -29.74, 78.27, 147.43),
            vector4(931.24, -28.27, 78.27, 148.17),
            vector4(911.98, -15.91, 78.27, 148.59),
            vector4(908.33, -14.25, 78.27, 151.66),
            vector4(905.28, -11.85, 78.27, 146.75),
            vector4(901.6, -10.25, 78.27, 151.03),
            vector4(898.56, -7.47, 78.27, 150.42),
            vector4(894.74, -5.36, 78.27, 147.31),
            vector4(878.41, 5.09, 78.27, 148.03),
            vector4(874.81, 6.34, 78.27, 145.35),
            vector4(872.04, 8.2, 78.27, 147.69),
            vector4(857.52, -16.84, 78.27, 61.37),
            vector4(855.4, -18.91, 78.27, 56.95),
            vector4(853.22, -21.71, 78.27, 58.03),
            vector4(851.4, -24.62, 78.27, 56.48),
            vector4(849.71, -27.73, 78.27, 56.12),
            vector4(848.46, -30.95, 78.27, 58.58),
            vector4(846.43, -33.78, 78.27, 58.11),
            vector4(844.31, -36.58, 78.27, 58.6),
            vector4(851.99, -41.32, 78.27, 237.04),
            vector4(854.14, -38.45, 78.27, 237.84),
            vector4(855.52, -35.12, 78.27, 239.77),
            vector4(857.58, -32.6, 78.27, 237.61),
            vector4(859.49, -29.77, 78.27, 238.44),
            vector4(860.76, -26.41, 78.27, 239.23),
            vector4(862.82, -23.64, 78.27, 238.93),
            vector4(864.37, -20.41, 78.27, 237.61),
            vector4(867.05, -18.08, 78.27, 237.15),
            vector4(868.52, -15.1, 78.27, 236.79),
            vector4(870.25, -12.23, 78.27, 236.92),
            vector4(871.96, -9.18, 78.27, 236.79),
            vector4(860.59, -50.52, 78.27, 56.19),
            vector4(862.21, -47.59, 78.27, 57.87),
            vector4(864.07, -44.72, 78.27, 57.35),
            vector4(866.09, -41.98, 78.27, 59.81),
            vector4(868.02, -39.09, 78.27, 58.16),
            vector4(869.38, -35.99, 78.27, 59.41),
            vector4(871.76, -33.27, 78.27, 57.79),
            vector4(873.26, -30.41, 78.27, 58.11),
            vector4(875.5, -27.57, 78.27, 59.75),
            vector4(876.7, -24.3, 78.27, 55.59),
            vector4(878.68, -21.55, 78.27, 55.73),
            vector4(880.83, -18.82, 78.27, 58.7),
            vector4(882.29, -15.94, 78.27, 59.44),
            vector4(868.59, -55.55, 78.27, 239.79),
            vector4(870.31, -52.52, 78.27, 237.16),
            vector4(872.25, -49.62, 78.27, 238.25),
            vector4(873.82, -46.81, 78.27, 237.55),
            vector4(875.38, -43.64, 78.27, 240.61),
            vector4(877.57, -40.99, 78.27, 238.89),
            vector4(879.2, -37.86, 78.27, 239.24),
            vector4(881.32, -35.29, 78.27, 239.98),
            vector4(882.71, -32.06, 78.27, 239.47),
            vector4(884.88, -29.13, 78.27, 238.24),
            vector4(886.69, -26.11, 78.27, 238.21),
            vector4(888.29, -23.61, 78.27, 236.97),
            vector4(890.23, -20.25, 78.27, 237.91),
            vector4(879.01, -62.07, 78.27, 57.16),
            vector4(880.87, -59.46, 78.27, 56.4),
            vector4(882.31, -55.9, 78.27, 56.01),
            vector4(884.39, -53.05, 78.27, 55.15),
            vector4(886.74, -50.98, 78.27, 57.74),
            vector4(887.88, -47.3, 78.27, 56.18),
            vector4(889.9, -44.62, 78.27, 57.31),
            vector4(891.22, -41.1, 78.27, 56.82),
            vector4(893.37, -38.44, 78.27, 57.27),
            vector4(894.9, -35.5, 78.27, 57.88),
            vector4(896.66, -32.62, 78.27, 56.27),
            vector4(898.89, -29.89, 78.27, 59.62),
            vector4(900.59, -27.03, 78.27, 57.96),
            vector4(918.92, -38.5, 78.27, 57.96),
            vector4(917.27, -41.62, 78.27, 57.19),
            vector4(915.72, -44.57, 78.27, 58.35),
            vector4(913.25, -46.72, 78.27, 59.34),
            vector4(911.8, -50.19, 78.27, 58.27),
            vector4(909.86, -52.95, 78.27, 56.01),
            vector4(907.82, -56.09, 78.27, 58.75),
            vector4(906.64, -59.22, 78.27, 59.0),
            vector4(904.82, -62.24, 78.27, 58.09),
            vector4(902.76, -64.94, 78.27, 57.42),
            vector4(900.32, -67.77, 78.27, 60.95),
            vector4(898.92, -70.71, 78.27, 59.52),
            vector4(897.37, -73.94, 78.27, 60.01),
            vector4(905.41, -78.55, 78.27, 237.47),
            vector4(906.51, -75.4, 78.27, 239.08),
            vector4(908.51, -72.21, 78.27, 240.06),
            vector4(910.57, -69.75, 78.27, 239.33),
            vector4(912.5, -66.76, 78.27, 236.77),
            vector4(914.61, -63.85, 78.27, 236.27),
            vector4(916.47, -61.02, 78.27, 239.26),
            vector4(918.2, -57.97, 78.27, 239.18),
            vector4(919.83, -55.26, 78.27, 239.26),
            vector4(921.38, -52.13, 78.27, 239.95),
            vector4(923.46, -49.15, 78.27, 240.09),
            vector4(925.59, -46.6, 78.27, 238.16),
            vector4(925.88, -42.81, 78.27, 239.65),
            vector4(915.9, -84.07, 78.27, 56.96),
            vector4(917.48, -81.16, 78.27, 58.09),
            vector4(920.09, -78.3, 78.27, 55.86),
            vector4(927.69, -83.29, 78.27, 238.3),
            vector4(926.1, -86.14, 78.27, 236.23),
            vector4(924.0, -89.35, 78.27, 237.62),
        }
    },
    ['legionsquaregaraj'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(69.414520263672, -849.34320068359),
                vector2(59.563220977783, -876.13598632812),
                vector2(53.812015533447, -873.94421386719),
                vector2(52.552845001221, -876.92974853516),
                vector2(58.53719329834, -879.25579833984),
                vector2(49.19457244873, -904.89520263672),
                vector2(12.526390075684, -891.47192382812),
                vector2(32.711112976074, -835.94616699219),
                vector2(43.370277404785, -840.03533935547),
                vector2(41.773113250732, -844.49047851562),
                vector2(44.550273895264, -845.6552734375),
                vector2(46.358081817627, -841.06768798828)
            },
            ['minZ'] = 29.0,
            ['maxZ'] = 31.10
        },
        label = 'Legion Square Garaj',
        showBlip = false,
        blipcoords = vector3(52.41, -874.53, 30.42),
        blipName = 'Public Parking',
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(19.23, -880.71, 29.8, 341.54),
            vector4(22.45, -882.16, 29.79, 340.09),
            vector4(25.93, -883.46, 29.79, 343.72),
            vector4(37.8, -887.64, 29.77, 160.81),
            vector4(40.91, -889.25, 29.75, 160.21),
            vector4(44.33, -890.22, 29.75, 159.58),
            vector4(48.14, -890.77, 29.75, 161.49),
            vector4(51.0, -892.1, 29.74, 158.87),
            vector4(52.71, -887.68, 29.81, 158.88),
            vector4(49.66, -885.99, 29.83, 161.45),
            vector4(45.81, -885.22, 29.83, 161.8),
            vector4(42.78, -884.27, 29.83, 161.42),
            vector4(39.63, -883.03, 29.84, 159.02),
            vector4(27.5, -878.27, 29.87, 160.31),
            vector4(24.28, -877.02, 29.88, 158.81),
            vector4(20.96, -876.17, 29.88, 157.99),
            vector4(25.15, -864.12, 30.08, 161.27),
            vector4(28.23, -865.24, 30.07, 158.11),
            vector4(32.0, -866.64, 30.06, 158.96),
            vector4(44.22, -870.05, 30.05, 159.97),
            vector4(47.29, -872.04, 30.03, 160.4),
            vector4(50.56, -873.75, 30.01, 158.52),
            vector4(60.1, -866.79, 30.13, 159.36),
            vector4(56.83, -865.6, 30.14, 161.35),
            vector4(53.77, -864.08, 30.16, 158.58),
            vector4(50.79, -863.1, 30.16, 159.63),
            vector4(47.46, -861.17, 30.18, 160.06),
            vector4(35.2, -857.05, 30.21, 160.46),
            vector4(31.39, -855.98, 30.22, 163.34),
            vector4(28.65, -854.67, 30.24, 156.84),
            vector4(34.44, -839.08, 30.49, 161.56),
            vector4(37.43, -840.18, 30.48, 159.6),
            vector4(41.04, -841.14, 30.47, 157.63),
            vector4(53.89, -846.47, 30.42, 159.93),
            vector4(56.93, -847.64, 30.41, 162.76),
            vector4(60.37, -848.47, 30.41, 161.79),
            vector4(63.44, -850.18, 30.39, 157.81),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(233.41, -774.07, 30.31, 248.68)
        }
    },
    ['motelgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(266.04238891602, -348.67025756836),
                vector2(285.89639282227, -356.23840332031),
                vector2(287.69180297852, -351.80249023438),
                vector2(294.92953491211, -354.30316162109),
                vector2(304.30255126953, -329.3703918457),
                vector2(268.12475585938, -316.15463256836),
                vector2(261.09896850586, -334.95642089844),
                vector2(268.07708740234, -337.50454711914),
                vector2(266.080078125, -343.24353027344),
                vector2(267.49453735352, -344.12811279297)
            },
            ['minZ'] = 43.5,  -- min height of the parking zone
            ['maxZ'] = 47.15,  -- max height of the parking zone
        },
        label = "Motel Garaj",
        showBlip = false,
        blipcoords = vector3(273.43, -343.99, 44.91),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                -- public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},                --car, air, sea
        drawText = 'Garaj Bölgesi',
        debug = false,
        ['ParkingSpots'] = {
            vector4(277.62, -340.01, 44.5, 70.08),
            vector4(284.0, -342.32, 44.5, 70.09),
            vector4(278.33, -336.51, 44.49, 70.34),
            vector4(284.94, -338.87, 44.5, 70.28),
            vector4(285.3, -335.65, 44.5, 70.49),
            vector4(286.94, -332.56, 44.5, 67.79),
            vector4(288.56, -329.41, 44.5, 69.87),
            vector4(289.54, -325.98, 44.5, 70.81),
            vector4(300.23, -330.3, 44.5, 69.25),
            vector4(298.52, -333.09, 44.5, 69.25),
            vector4(298.66, -337.07, 44.5, 67.98),
            vector4(297.0, -340.11, 44.49, 69.9),
            vector4(296.05, -342.85, 44.49, 68.75),
            vector4(294.61, -346.22, 44.5, 67.07),
            vector4(292.54, -349.49, 44.52, 68.4),
            vector4(268.42, -325.58, 44.5, 249.47),
            vector4(267.58, -329.12, 44.49, 247.62),
            vector4(266.03, -332.22, 44.5, 247.32),
            vector4(271.12, -319.16, 44.5, 67.31),
            vector4(283.0, -323.71, 44.5, 73.83),
            vector4(281.99, -326.86, 44.5, 69.26),
            vector4(281.1, -330.43, 44.49, 71.55),
            vector4(279.59, -333.68, 44.5, 71.98),
            vector4(269.97, -322.62, 44.5, 248.07),
        }
    },
    ['sanandreasgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-362.48254394531, -793.2802734375),
                vector2(-362.46408081055, -730.71594238281),
                vector2(-360.078125, -727.29187011719),
                vector2(-359.91299438477, -726.02014160156),
                vector2(-355.41589355469, -725.94165039062),
                vector2(-347.00802612305, -729.64282226562),
                vector2(-312.21273803711, -742.18682861328),
                vector2(-310.43478393555, -737.13165283203),
                vector2(-266.06091308594, -753.01647949219),
                vector2(-275.53680419922, -777.63562011719),
                vector2(-284.21676635742, -774.40985107422),
                vector2(-285.57073974609, -778.85809326172),
                vector2(-287.20227050781, -778.1279296875),
                vector2(-289.10836791992, -783.76214599609),
                vector2(-319.63018798828, -772.48706054688),
                vector2(-335.69149780273, -786.58020019531),
                vector2(-345.55349731445, -791.60711669922)
            },
            ['minZ'] = 33.00,  -- min height of the parking zone
            ['maxZ'] = 37.60,  -- max height of the parking zone
        },
        label = "San Andreas Garaj",
        showBlip = false,
        blipcoords = vector3(-330.01, -780.33, 33.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false,                 --car, air, sea
        ['ParkingSpots'] = {
            vector4(-356.89, -749.29, 33.54, 270.15),
            vector4(-356.83, -753.66, 33.54, 269.64),
            vector4(-357.22, -756.74, 33.54, 269.93),
            vector4(-357.17, -760.01, 33.54, 269.71),
            vector4(-357.4, -764.54, 33.54, 268.82),
            vector4(-357.14, -767.51, 33.54, 269.67),
            vector4(-357.09, -770.59, 33.54, 271.03),
            vector4(-357.09, -776.02, 33.54, 267.95),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-357.37, -746.23, 33.54, 269.64),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-289.82, -764.25, 33.54, 160.83),
            vector4(-292.62, -763.17, 33.54, 160.52),
            vector4(-295.59, -762.4, 33.54, 160.93),
            vector4(-298.43, -761.45, 33.54, 159.95),
            vector4(-302.41, -760.02, 33.54, 161.24),
            vector4(-305.16, -758.37, 33.54, 158.98),
            vector4(-308.23, -757.98, 33.54, 160.64),
            vector4(-311.14, -757.03, 33.54, 158.78),
            vector4(-315.09, -755.34, 33.54, 157.34),
            vector4(-317.51, -753.39, 33.54, 160.53),
            vector4(-320.45, -752.5, 33.55, 161.44),
            vector4(-323.24, -751.76, 33.54, 158.57),
            vector4(-329.02, -750.3, 33.54, 179.15),
            vector4(-331.75, -750.26, 33.54, 179.53),
            vector4(-334.52, -750.73, 33.54, 181.13),
            vector4(-337.46, -751.25, 33.54, 183.02),
            vector4(-342.14, -749.82, 33.55, 272.39),
            vector4(-341.94, -753.53, 33.55, 94.28),
            vector4(-341.97, -756.82, 33.55, 90.65),
            vector4(-342.23, -760.49, 33.55, 88.42),
            vector4(-341.84, -764.1, 33.55, 89.13),
            vector4(-341.93, -767.36, 33.55, 91.18),
            vector4(-357.3, -732.9, 33.54, 270.41),
            vector4(-357.24, -737.63, 33.55, 269.9),
            vector4(-357.33, -743.24, 33.54, 270.89),
            vector4(-295.82, -778.26, 33.54, 342.22),
            vector4(-299.37, -776.74, 33.54, 342.64),
            vector4(-307.47, -773.5, 33.54, 340.32),
            vector4(-303.19, -775.79, 33.54, 339.27),
            vector4(-310.37, -772.78, 33.54, 339.1),
            vector4(-313.07, -771.64, 33.54, 338.38),
            vector4(-315.73, -770.26, 33.54, 339.87),
            vector4(-273.07, -761.54, 33.54, 69.58),
            vector4(-273.81, -765.05, 33.54, 71.99),
            vector4(-276.05, -771.7, 33.54, 68.27),
            vector4(-277.3, -775.37, 33.54, 70.28),
            vector4(-277.07, -751.83, 33.54, 160.8),
            vector4(-279.97, -750.75, 33.54, 160.08),
            vector4(-284.28, -748.9, 33.54, 159.2),
            vector4(-287.28, -748.29, 33.54, 160.63),
            vector4(-290.22, -747.64, 33.54, 159.94),
            vector4(-292.89, -746.25, 33.54, 160.17),
            vector4(-297.03, -744.69, 33.54, 159.37),
            vector4(-299.71, -743.7, 33.54, 159.26),
            vector4(-302.62, -742.8, 33.54, 159.48),
            vector4(-275.18, -768.22, 33.54, 71.26)
        }
    },
    ['northrockfordgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1135.1311035156, -778.41644287109),
                vector2(-1114.7188720703, -761.08288574219),
                vector2(-1142.3354492188, -729.19293212891),
                vector2(-1161.1352539062, -745.50402832031)
            },
            ['minZ'] = 17.69,  -- min height of the parking zone
            ['maxZ'] = 20.61,  -- max height of the parking zone
        },
        label = "North Rockford Garaj",
        showBlip = false,
        blipcoords = vector3(-1160.86, -741.41, 19.63),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1144.92, -745.32, 19.69, 105.6),
            vector4(-1143.46, -748.47, 19.51, 111.41),
            vector4(-1140.84, -751.4, 19.37, 112.09),
            vector4(-1138.4, -754.54, 19.21, 112.51),
            vector4(-1135.45, -757.27, 19.08, 109.69),
            vector4(-1133.38, -760.28, 18.91, 112.11),
            vector4(-1130.78, -763.25, 18.76, 111.18),
            vector4(-1128.38, -758.73, 19.13, 286.83),
            vector4(-1130.16, -755.67, 19.29, 291.44),
            vector4(-1132.5, -752.58, 19.45, 289.94),
            vector4(-1135.36, -749.6, 19.59, 287.4),
            vector4(-1137.97, -746.77, 19.71, 287.88),
            vector4(-1140.21, -743.83, 19.85, 289.91),
            vector4(-1142.87, -740.91, 20.01, 289.42),
        }
    },
    ['spanishavegaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(76.188446044922, 7.9120540618896),
                vector2(81.977760314941, 23.525623321533),
                vector2(55.219917297363, 32.982769012451),
                vector2(49.228351593018, 16.684007644653),
                vector2(68.127639770508, 9.6578321456909),
                vector2(68.597557067871, 10.655039787292)
            },
            ['minZ'] = 68.00,  -- min height of the parking zone
            ['maxZ'] = 70.45,  -- max height of the parking zone
        },
        label = "Spanish Ave Garaj",
        showBlip = false,
        blipcoords = vector3(69.84, 12.6, 68.96),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(54.49, 19.49, 69.14, 339.68),
            vector4(57.48, 17.98, 68.92, 340.13),
            vector4(60.49, 16.99, 68.8, 338.05),
            vector4(64.03, 16.28, 68.75, 337.71),
        }
    },
    ['caears24garaj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-480.87042236328, -819.84265136719),
                vector2(-441.08392333984, -820.39178466797),
                vector2(-440.29922485352, -795.61010742188),
                vector2(-450.12713623047, -795.83892822266),
                vector2(-450.57876586914, -792.54748535156),
                vector2(-480.38143920898, -792.79217529297)
            },
            ['minZ'] = 29.47,  -- min height of the parking zone
            ['maxZ'] = 32.82,  -- max height of the parking zone
        },
        label = "Caesar 24 Garaj",
        showBlip = false,
        blipcoords = vector3(-475.31, -818.73, 30.46),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-477.62, -816.44, 30.05, 271.2),
            vector4(-477.28, -813.29, 30.1, 265.04),
            vector4(-477.3, -809.77, 30.12, 268.93),
            vector4(-477.37, -806.7, 30.12, 271.51),
            vector4(-477.45, -803.55, 30.12, 268.73),
            vector4(-477.12, -800.59, 30.12, 270.28),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.98, -796.99, 30.12, 269.26),
            vector4(-476.99, -794.09, 30.13, 268.72),
            vector4(-459.54, -797.15, 30.12, 267.11),
            vector4(-460.45, -800.21, 30.12, 270.89),
            vector4(-460.18, -803.33, 30.11, 269.85),
            vector4(-460.74, -809.84, 30.11, 270.31),
            vector4(-460.21, -813.14, 30.13, 271.44),
            vector4(-460.21, -816.42, 30.16, 269.02),
            vector4(-444.8, -797.5, 30.12, 90.73),
            vector4(-444.33, -801.16, 30.12, 92.51),
            vector4(-444.6, -804.72, 30.11, 90.88),
            vector4(-444.63, -808.75, 30.11, 89.24),
            vector4(-443.84, -812.02, 30.13, 87.33),
            vector4(-444.21, -816.02, 30.24, 89.21),
            vector4(-460.34, -806.46, 30.11, 267.68),
            vector4(-466.14, -816.36, 30.11, 88.66),
            vector4(-466.18, -812.98, 30.11, 88.96),
            vector4(-466.22, -809.72, 30.11, 89.54),
            vector4(-467.38, -806.99, 30.11, 89.36),
            vector4(-466.99, -803.3, 30.12, 85.98),
            vector4(-466.81, -800.55, 30.12, 89.29),
            vector4(-466.41, -797.08, 30.12, 88.09),
            vector4(-460.34, -806.46, 30.11, 267.68),
        }
    },
    ['lagunagaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(358.69207763672, 302.30017089844),
                vector2(351.44546508789, 277.92486572266),
                vector2(355.01831054688, 277.03842163086),
                vector2(353.3766784668, 270.50997924805),
                vector2(387.72875976562, 257.78961181641),
                vector2(399.73132324219, 290.71780395508),
                vector2(364.49926757812, 300.54202270508),
                vector2(362.70568847656, 295.12139892578),
                vector2(359.67681884766, 296.56146240234),
                vector2(361.49871826172, 301.58950805664)
            },
            ['minZ'] = 102.00,  -- min height of the parking zone
            ['maxZ'] = 105.89,  -- max height of the parking zone
        },
        label = "Laguna Garaj",
        showBlip = false,
        blipcoords = vector3(364.37, 297.83, 103.49),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(359.53, 270.99, 102.65, 341.37),
            vector4(363.59, 269.88, 102.64, 341.77),
            vector4(368.05, 267.75, 102.62, 337.77),
            vector4(371.2, 266.77, 102.6, 340.94),
            vector4(375.32, 265.38, 102.59, 339.29),
            vector4(379.12, 264.74, 102.59, 337.98),
            vector4(388.53, 269.67, 102.58, 68.7),
            vector4(389.17, 272.93, 102.58, 72.26),
            vector4(391.11, 276.63, 102.57, 69.67),
            vector4(392.57, 280.58, 102.57, 70.77),
            vector4(393.81, 283.91, 102.55, 71.82),
            vector4(390.92, 290.55, 102.58, 163.29),
            vector4(386.89, 291.62, 102.63, 162.58),
            vector4(383.07, 292.87, 102.69, 164.08),
            vector4(379.23, 293.87, 102.77, 162.43),
            vector4(374.93, 294.49, 102.85, 162.54),
            vector4(375.86, 274.26, 102.65, 157.86),
            vector4(371.94, 275.54, 102.71, 158.54),
            vector4(368.03, 277.26, 102.77, 156.9),
            vector4(378.84, 281.93, 102.68, 336.98),
            vector4(375.05, 283.0, 102.75, 339.72),
            vector4(370.91, 284.66, 102.83, 337.04),
            vector4(361.12, 293.52, 103.08, 251.69),
            vector4(359.6, 290.0, 103.08, 249.21),
            vector4(357.99, 286.45, 103.1, 248.69),
            vector4(356.98, 283.01, 103.0, 248.05),
        }
    },
    ['autopiagaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-779.76104736328, -2023.2966308594),
                vector2(-775.14440917969, -2019.8140869141),
                vector2(-767.18334960938, -2012.3591308594),
                vector2(-760.70989990234, -2004.76171875),
                vector2(-756.01049804688, -1997.4604492188),
                vector2(-753.18353271484, -1990.4525146484),
                vector2(-751.64544677734, -1983.7036132812),
                vector2(-748.98046875, -1969.5380859375),
                vector2(-748.11468505859, -1967.5456542969),
                vector2(-746.72650146484, -1965.5721435547),
                vector2(-744.23596191406, -1963.4608154297),
                vector2(-739.22473144531, -1961.9007568359),
                vector2(-733.59368896484, -1962.0502929688),
                vector2(-729.30279541016, -1963.3483886719),
                vector2(-727.666015625, -1964.8414306641),
                vector2(-725.72021484375, -1966.9916992188),
                vector2(-714.04919433594, -2019.2927246094),
                vector2(-710.76025390625, -2032.8103027344),
                vector2(-707.01336669922, -2040.8115234375),
                vector2(-704.6533203125, -2044.3029785156),
                vector2(-703.19024658203, -2045.3291015625),
                vector2(-701.63171386719, -2045.6253662109),
                vector2(-699.74157714844, -2045.2917480469),
                vector2(-687.05395507812, -2039.5653076172),
                vector2(-685.76708984375, -2038.6518554688),
                vector2(-684.13092041016, -2036.3044433594),
                vector2(-672.29400634766, -2041.8348388672),
                vector2(-670.67193603516, -2043.4077148438),
                vector2(-665.39947509766, -2046.6591796875),
                vector2(-657.96466064453, -2048.1787109375),
                vector2(-655.55963134766, -2048.3508300781),
                vector2(-651.94177246094, -2047.6011962891),
                vector2(-649.02130126953, -2046.1932373047),
                vector2(-633.71252441406, -2030.9672851562),
                vector2(-631.34783935547, -2030.0726318359),
                vector2(-628.30303955078, -2030.5014648438),
                vector2(-616.89349365234, -2042.3790283203),
                vector2(-616.16394042969, -2045.1605224609),
                vector2(-617.02777099609, -2047.9118652344),
                vector2(-648.34002685547, -2079.3305664062),
                vector2(-652.69281005859, -2082.1706542969),
                vector2(-658.36376953125, -2083.3293457031),
                vector2(-671.02252197266, -2082.0708007812),
                vector2(-676.02673339844, -2082.1984863281),
                vector2(-684.85815429688, -2084.7019042969),
                vector2(-695.00408935547, -2087.8937988281),
                vector2(-701.19207763672, -2088.712890625),
                vector2(-703.89630126953, -2088.4221191406),
                vector2(-708.56176757812, -2085.2458496094),
                vector2(-713.30065917969, -2087.1435546875),
                vector2(-718.29937744141, -2082.3813476562),
                vector2(-724.05651855469, -2078.2341308594),
                vector2(-736.53204345703, -2071.5529785156),
                vector2(-746.24493408203, -2067.9118652344),
                vector2(-751.45703125, -2073.4653320312),
                vector2(-787.72106933594, -2037.2147216797)
            },
            ['minZ'] = 8.85,  -- min height of the parking zone
            ['maxZ'] = 10.10,  -- max height of the parking zone
        },
        label = "Autopia Garaj",
        showBlip = false,
        blipcoords = vector3(-796.86, -2024.85, 8.88),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        debug = false
    },
    ['beachgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1177.4599609375, -1504.8297119141),
                vector2(-1170.6567382812, -1500.1866455078),
                vector2(-1167.892578125, -1496.4272460938),
                vector2(-1167.0075683594, -1491.4938964844),
                vector2(-1168.083984375, -1487.3162841797),
                vector2(-1184.8902587891, -1461.9444580078),
                vector2(-1203.3045654297, -1475.2700195312),
                vector2(-1202.2609863281, -1476.640625),
                vector2(-1208.1496582031, -1480.9470214844),
                vector2(-1207.1524658203, -1483.8693847656),
                vector2(-1207.7424316406, -1485.8941650391),
                vector2(-1188.0931396484, -1513.3830566406),
                vector2(-1185.7036132812, -1511.7416992188),
                vector2(-1187.1550292969, -1509.7088623047),
                vector2(-1183.7425537109, -1507.1494140625),
                vector2(-1182.2048339844, -1508.9814453125)
            },
            ['minZ'] = 3.20,  -- min height of the parking zone
            ['maxZ'] = 6.53,  -- max height of the parking zone
        },
        label = "Beach Garaj",
        showBlip = false,
        blipcoords = vector3(-1183.1, -1511.11, 4.36),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false
    },
    ["route68garaj"] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1140.2746582031, 2644.5261230469),
                vector2(1108.8831787109, 2644.2172851562),
                vector2(1108.5783691406, 2660.1645507812),
                vector2(1089.9521484375, 2660.1198730469),
                vector2(1091.3571777344, 2677.4743652344),
                vector2(1133.5280761719, 2674.8422851562),
                vector2(1133.7532958984, 2658.8393554688),
                vector2(1140.4176025391, 2658.8898925781)
            },
            ['minZ'] = 36.78,  -- min height of the parking zone
            ['maxZ'] = 39.74,  -- max height of the parking zone
        },
        label = "Route 68 Garaj",
        showBlip = false,
        blipcoords = vector3(1137.77, 2663.54, 37.9),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false
    },
    ['liqourgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(934.54669189453, 3604.5546875),
                vector2(954.29815673828, 3604.1672363281),
                vector2(954.35180664062, 3626.7893066406),
                vector2(934.75305175781, 3626.3806152344)
            },
            ['minZ'] = 31.5,  -- min height of the parking zone
            ['maxZ'] = 35.99,  -- max height of the parking zone
        },
        label = "Liquor Garaj",
        showBlip = false,
        blipcoords = vector3(934.95, 3606.59, 32.81),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false
    },
    ['lspdotopark'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(405.13595581054, -998.57788085938),
            vector2(410.59521484375, -1002.8664550782),
            vector2(410.91711425782, -979.44134521484),
            vector2(405.4065246582, -974.57928466796),
            },
            ['minZ'] = 28.0,  -- min height of the parking zone
            ['maxZ'] = 31.0,  -- max height of the parking zone

        },
        label = 'zLSPD Otopark',
        showBlip = false,
        blipcoords = vector3(407.45, -997.7, 29.26),
        blipName = "LSPD Otopark",
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(407.44, -997.7, 28.94, 52.87),
            vector4(407.55, -992.85, 28.94, 51.63),
            vector4(407.7, -988.49, 28.94, 52.48),
            vector4(407.42, -983.95, 28.94, 51.54),
            vector4(407.68, -979.62, 28.94, 51.69),
        },
        debug = false
    },
    ['bellfarmsgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(67.230964660645, 6414.7719726562),
                vector2(53.828144073486, 6401.8227539062),
                vector2(59.075645446777, 6396.736328125),
                vector2(57.678955078125, 6394.4799804688),
                vector2(55.321895599365, 6393.0532226562),
                vector2(49.954971313477, 6398.6840820312),
                vector2(32.203670501709, 6380.2915039062),
                vector2(36.029750823975, 6376.328125),
                vector2(33.88489151001, 6373.9545898438),
                vector2(31.614000320435, 6372.1850585938),
                vector2(27.5251121521, 6376.2802734375),
                vector2(3.0867385864258, 6350.3901367188),
                vector2(7.4540538787842, 6345.6538085938),
                vector2(6.2227344512939, 6343.2216796875),
                vector2(3.7218370437622, 6341.9638671875),
                vector2(-0.76969349384308, 6346.2749023438),
                vector2(-22.776170730591, 6325.3828125),
                vector2(-24.351142883301, 6322.0849609375),
                vector2(-23.452659606934, 6319.2861328125),
                vector2(-12.439478874207, 6304.8647460938),
                vector2(-10.365778923035, 6304.6127929688),
                vector2(5.0310492515564, 6313.4970703125),
                vector2(5.2357106208801, 6314.859375),
                vector2(41.809215545654, 6335.396484375),
                vector2(42.73751449585, 6334.2446289062),
                vector2(71.22339630127, 6349.8232421875),
                vector2(68.208351135254, 6355.2939453125),
                vector2(117.06902313232, 6378.890625)
            },
            ['minZ'] = 30.00,  -- min height of the parking zone
            ['maxZ'] = 33.38,  -- max height of the parking zone
        },
        label = "Bell Farms Garaj",
        showBlip = false,
        blipcoords = vector3(78.34, 6418.74, 31.28),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false
    },
    ['elginstgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(239.88751220703, -820.52038574219),
                vector2(252.71513366699, -784.91027832031),
                vector2(258.39483642578, -786.82489013672),
                vector2(264.27755737305, -769.99841308594),
                vector2(218.69738769531, -754.69787597656),
                vector2(200.07238769531, -805.74285888672)
            },
            ['minZ'] = 29.07,  -- min height of the parking zone
            ['maxZ'] = 40.0,  -- max height of the parking zone
        },
        label = "Elgin St Garaj",
        showBlip = false,
        blipcoords = vector3(215.9499, -809.698, 30.731),
        blipName = "Public Parking",
        blipNumber = 357,
        type = 'public',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(219.38, -765.95, 30.41, 247.04),
            vector4(218.07, -768.47, 30.41, 248.86),
            vector4(216.93, -770.89, 30.42, 249.93),
            vector4(216.35, -773.48, 30.43, 249.43),
            vector4(215.02, -775.62, 30.44, 252.59),
            vector4(214.22, -778.6, 30.45, 247.99),
            vector4(213.67, -780.92, 30.45, 248.98),
            vector4(212.9, -783.52, 30.46, 249.01),
            vector4(210.97, -785.75, 30.5, 250.38),
            vector4(210.35, -788.41, 30.51, 249.85),
            vector4(209.74, -790.91, 30.51, 248.14),
            vector4(209.21, -793.47, 30.52, 249.87),
            vector4(207.96, -795.82, 30.55, 248.81),
            vector4(206.91, -798.68, 30.57, 248.97),
            vector4(205.45, -800.74, 30.6, 249.38),
            vector4(234.07, -771.23, 30.33, 249.64),
            vector4(232.09, -776.31, 30.3, 248.31),
            vector4(230.94, -778.87, 30.29, 248.97),
            vector4(230.7, -781.41, 30.28, 250.6),
            vector4(229.02, -783.81, 30.28, 250.06),
            vector4(227.64, -789.2, 30.26, 247.99),
            vector4(226.28, -791.42, 30.26, 248.95),
            vector4(225.72, -794.21, 30.24, 249.28),
            vector4(224.66, -796.59, 30.24, 247.01),
            vector4(223.2, -798.92, 30.25, 248.79),
            vector4(222.61, -801.4, 30.25, 248.1),
            vector4(221.77, -804.1, 30.26, 245.92),
            vector4(221.6, -806.74, 30.25, 247.77),
            vector4(219.83, -808.89, 30.26, 251.3),
            vector4(228.63, -768.88, 30.36, 69.31),
            vector4(227.76, -771.74, 30.35, 71.5),
            vector4(226.39, -773.88, 30.35, 68.62),
            vector4(225.43, -776.69, 30.35, 69.02),
            vector4(224.35, -778.81, 30.34, 64.93),
            vector4(224.25, -781.78, 30.33, 70.11),
            vector4(222.81, -784.16, 30.34, 72.1),
            vector4(221.16, -786.48, 30.35, 68.66),
            vector4(221.04, -789.3, 30.34, 68.07),
            vector4(219.76, -791.48, 30.34, 70.29),
            vector4(218.97, -794.38, 30.34, 68.04),
            vector4(218.34, -796.97, 30.34, 66.59),
            vector4(217.56, -799.45, 30.35, 69.51),
            vector4(216.23, -801.69, 30.37, 70.17),
            vector4(215.69, -804.56, 30.38, 68.56),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(236.32, -812.55, 29.88, 248.26),
            vector4(237.41, -809.93, 29.89, 244.26),
            vector4(238.45, -807.4, 29.9, 244.04),
            vector4(238.94, -804.82, 29.93, 248.53),
            vector4(240.36, -802.39, 29.94, 246.63),
            vector4(241.52, -799.87, 29.96, 245.68),
            vector4(242.03, -797.37, 29.98, 246.08),
            vector4(243.06, -794.79, 30.01, 249.35),
            vector4(244.27, -792.42, 30.03, 247.07),
            vector4(245.14, -789.87, 30.06, 247.13),
            vector4(246.18, -787.38, 30.08, 248.58),
            vector4(246.61, -784.52, 30.12, 248.32),
            vector4(248.17, -782.46, 30.14, 248.95),
            vector4(249.12, -779.63, 30.18, 249.01),
            vector4(249.32, -776.78, 30.22, 247.42),
            vector4(250.19, -774.3, 30.26, 248.86),
            vector4(244.75, -772.24, 30.29, 69.17),
            vector4(228.66, -786.48, 30.27, 248.6),
            vector4(233.41, -774.07, 30.31, 248.68),
            vector4(231.42, -810.44, 30.01, 70.18),
            vector4(231.62, -807.79, 30.03, 68.27),
            vector4(232.96, -805.51, 30.02, 66.62),
            vector4(234.88, -803.0, 30.02, 69.62),
            vector4(235.38, -800.43, 30.04, 68.23),
            vector4(236.58, -797.83, 30.05, 69.89),
            vector4(236.68, -795.08, 30.08, 66.13),
            vector4(237.88, -792.75, 30.08, 66.76),
            vector4(238.84, -790.11, 30.11, 68.34),
            vector4(240.15, -787.59, 30.13, 67.55),
            vector4(241.01, -785.27, 30.15, 69.84),
            vector4(244.51, -775.07, 30.26, 70.7),
            vector4(243.65, -777.69, 30.22, 67.25),
            vector4(242.44, -779.84, 30.2, 68.04),
            vector4(241.32, -782.41, 30.18, 69.19),
        }
    },
    ['altaapartgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-363.8267211914, -862.93182373046),
                vector2(-268.29055786132, -885.1919555664),
                vector2(-282.65710449218, -925.12030029296),
                vector2(-298.25598144532, -919.4287109375),
                vector2(-302.71203613282, -930.14245605468),
                vector2(-297.5908203125, -932.38952636718),
                vector2(-310.84530639648, -969.61614990234),
                vector2(-289.9221496582, -977.25311279296),
                vector2(-296.0697631836, -994.66876220704),
                vector2(-364.01559448242, -969.91552734375)
            },
            ['minZ'] = 30.0,  -- min height of the parking zone
            ['maxZ'] = 33.0,  -- max height of the parking zone

        },
        label = 'zAlta Apartments',
        showBlip = false,
        blipcoords = vector3(-318.08, -948.55, 31.08),
        blipName = "Alta Apartmanı Garaj",
        blipNumber = 357,
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-297.71, -990.11, 30.76, 338.79),
            vector4(-301.09, -988.82, 30.76, 339.11),
            vector4(-304.64, -987.72, 30.76, 339.36),
            vector4(-308.09, -986.34, 30.76, 339.47),
            vector4(-311.46, -985.08, 30.76, 339.5),
            vector4(-315.07, -983.98, 30.76, 339.18),
            vector4(-318.71, -982.49, 30.76, 338.43),
            vector4(-285.76, -888.04, 30.76, 168.44),
            vector4(-289.39, -887.34, 30.76, 168.59),
            vector4(-292.99, -886.36, 30.76, 167.4),
            vector4(-296.78, -885.82, 30.75, 167.93),
            vector4(-300.35, -885.14, 30.76, 167.76),
            vector4(-303.82, -884.06, 30.76, 167.76),
            vector4(-307.59, -883.44, 30.76, 167.24),
            vector4(-311.16, -882.7, 30.76, 166.92),
            vector4(-314.74, -881.99, 30.75, 166.91),
            vector4(-318.34, -881.19, 30.75, 167.5),
            vector4(-322.02, -880.47, 30.75, 167.75),
            vector4(-325.62, -879.65, 30.75, 168.31),
            vector4(-329.11, -878.9, 30.75, 168.35),
            vector4(-332.88, -878.22, 30.75, 167.35),
            vector4(-336.55, -877.38, 30.75, 168.02),
            vector4(-340.1, -876.67, 30.75, 167.45),
            vector4(-343.78, -875.91, 30.75, 167.01),
            vector4(-352.86, -874.08, 30.75, 0.76),
            vector4(-360.26, -889.43, 30.75, 269.23),
            vector4(-360.46, -893.17, 30.75, 268.23),
            vector4(-360.24, -896.83, 30.75, 270.26),
            vector4(-360.37, -900.58, 30.75, 268.61),
            vector4(-360.29, -904.27, 30.75, 269.75),
            vector4(-360.14, -908.01, 30.75, 270.4),
            vector4(-360.5, -911.66, 30.76, 269.55),
            vector4(-360.12, -915.4, 30.76, 269.63),
            vector4(-360.28, -919.07, 30.76, 270.11),
            vector4(-360.56, -922.77, 30.75, 268.41),
            vector4(-360.46, -926.49, 30.76, 270.43),
            vector4(-360.37, -930.12, 30.76, 269.72),
            vector4(-360.22, -933.88, 30.76, 270.34),
            vector4(-360.28, -937.58, 30.76, 269.99),
            vector4(-360.47, -941.31, 30.75, 269.54),
            vector4(-360.28, -944.99, 30.76, 270.14),
            vector4(-360.32, -948.72, 30.76, 269.82),
            vector4(-360.38, -952.44, 30.75, 269.95),
            vector4(-360.57, -956.16, 30.76, 270.31),
            vector4(-322.02, -981.29, 30.76, 339.92),
            vector4(-325.56, -980.1, 30.76, 340.1),
            vector4(-329.0, -978.69, 30.76, 338.49),
            vector4(-332.49, -977.59, 30.76, 339.58),
            vector4(-335.9, -976.3, 30.76, 339.7),
            vector4(-339.43, -975.08, 30.76, 339.47),
            vector4(-342.7, -973.45, 30.76, 338.85),
            vector4(-326.58, -956.4, 30.75, 250.37),
            vector4(-325.37, -952.84, 30.76, 250.47),
            vector4(-324.03, -949.43, 30.76, 250.37),
            vector4(-322.69, -945.96, 30.75, 249.91),
            vector4(-321.47, -942.43, 30.76, 250.29),
            vector4(-320.23, -939.06, 30.76, 250.38),
            vector4(-318.8, -935.56, 30.76, 249.46),
            vector4(-317.66, -932.03, 30.76, 250.73),
            vector4(-316.5, -928.43, 30.76, 250.15),
            vector4(-345.07, -932.2, 30.76, 69.27),
            vector4(-343.99, -928.61, 30.76, 70.11),
            vector4(-342.58, -925.18, 30.76, 70.69),
            vector4(-341.39, -921.67, 30.76, 69.83),
            vector4(-327.34, -924.44, 30.76, 69.82),
            vector4(-328.81, -927.89, 30.76, 69.43),
            vector4(-330.09, -931.33, 30.76, 70.81),
            vector4(-331.29, -934.83, 30.76, 70.29),
            vector4(-332.71, -938.34, 30.76, 69.75),
            vector4(-333.91, -941.81, 30.76, 69.46),
            vector4(-335.02, -945.3, 30.75, 71.24),
            vector4(-336.56, -948.74, 30.75, 70.65),
            vector4(-337.69, -952.22, 30.76, 70.31),
            vector4(-340.74, -902.45, 30.75, 167.89),
            vector4(-337.18, -903.24, 30.75, 167.65),
            vector4(-333.64, -903.98, 30.75, 167.05),
            vector4(-329.93, -904.61, 30.75, 167.95),
            vector4(-326.38, -905.62, 30.75, 168.51),
            vector4(-322.65, -906.2, 30.75, 167.96),
            vector4(-318.98, -906.94, 30.75, 168.06),
            vector4(-315.39, -907.89, 30.75, 166.81),
            vector4(-311.81, -908.81, 30.75, 167.5),
            vector4(-308.14, -909.33, 30.75, 167.34),
            vector4(-285.56, -921.9, 30.76, 70.14),
            vector4(-283.75, -918.52, 30.76, 70.23),
            vector4(-282.97, -914.81, 30.75, 69.93),
            vector4(-281.65, -911.4, 30.76, 69.49),
            vector4(-280.5, -908.04, 30.76, 69.51),
            vector4(-279.28, -904.45, 30.76, 70.18),
            vector4(-302.07, -933.44, 30.75, 69.9),
            vector4(-303.19, -937.09, 30.76, 70.71),
            vector4(-304.56, -940.34, 30.76, 70.04),
            vector4(-305.74, -943.95, 30.76, 70.49),
            vector4(-307.19, -947.34, 30.76, 69.04),
            vector4(-308.26, -950.95, 30.76, 70.24),
            vector4(-309.63, -954.35, 30.76, 68.9),
            vector4(-310.83, -957.88, 30.76, 69.56),
            vector4(-312.07, -961.38, 30.76, 70.21),
            vector4(-313.39, -964.8, 30.76, 68.92),
            vector4(-298.26, -899.82, 30.66, 346.23),
            vector4(-302.47, -898.86, 30.66, 348.7),
            vector4(-305.9, -898.52, 30.66, 351.35),
            vector4(-309.58, -897.38, 30.66, 347.24),
            vector4(-313.04, -896.37, 30.65, 349.98),
            vector4(-316.74, -895.46, 30.65, 347.83),
            vector4(-320.36, -894.95, 30.65, 348.97),
            vector4(-324.05, -893.86, 30.65, 348.71),
            vector4(-327.67, -893.18, 30.65, 347.61),
            vector4(-331.02, -892.69, 30.65, 346.03),
            vector4(-334.83, -891.72, 30.65, 350.2),
            vector4(-338.6, -891.08, 30.65, 348.34),
        },
        debug = false
    },
    ['cekilmisgaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-128.76565551758, -1186.7231445312),
            vector2(-128.95680236816, -1158.9990234375),
            vector2(-155.75888061524, -1158.6616210938),
            vector2(-155.84657287598, -1186.7335205078)
            },
            ['minZ'] = 22.25,  -- min height of the parking zone
            ['maxZ'] = 26.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Cekilmiş Garaj",
        showBlip = true,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garaj',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-152.91, -1170.13, 23.14, 270.11),
            vector4(-153.26, -1166.51, 23.14, 270.74),
            vector4(-147.67, -1161.83, 23.14, 179.67),
            vector4(-144.19, -1161.83, 23.14, 179.02),
            vector4(-139.1, -1161.6, 23.14, 178.95),
            vector4(-131.92, -1166.54, 23.14, 89.09),
            vector4(-132.01, -1170.05, 23.14, 90.24),
            vector4(-132.03, -1175.15, 23.14, 90.94),
            vector4(-131.99, -1178.68, 23.14, 90.07),
            vector4(-131.95, -1182.25, 23.14, 90.11),
        }
    },
    -- ['cekilmisgaraj2'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --         vector2(412.45556640625, -1619.9279785156),
    --         vector2(411.56134033203, -1619.2470703125),
    --         vector2(406.28265380859, -1625.5926513672),
    --         vector2(403.32202148438, -1623.1264648438),
    --         vector2(387.65893554688, -1642.0072021484),
    --         vector2(410.71667480469, -1661.2642822266),
    --         vector2(414.49334716797, -1656.5693359375),
    --         vector2(413.81848144531, -1656.0217285156),
    --         vector2(418.38479614258, -1650.4766845703),
    --         vector2(419.06268310547, -1651.0219726563),
    --         vector2(423.65991210938, -1645.4058837891),
    --         vector2(424.2509765625, -1640.6071777344),
    --         vector2(424.0791015625, -1632.9758300781),
    --         vector2(423.41149902344, -1628.0551757813),
    --         vector2(418.43167114258, -1623.8996582031),
    --         vector2(417.92526245117, -1624.4998779297)
    --         },
    --         ['minZ'] = 27.25,  -- min height of the parking zone
    --         ['maxZ'] = 32.31,  -- max height of the parking zone
    --         debug = false,
    --     },
    --     label = "Cekilmiş Garaj",
    --     showBlip = true,
    --     blipcoords = vector3(410.05, -1637.53, 29.29),
    --     blipName = "Çekilmiş Garaj",
    --     blipNumber = 68,
    --     blipColor = 1,
    --     type = 'depot',                --public, job, gang, depot
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Çekilmiş Garaj',                 --car, air, sea
    --     debug = false,
    --     ['ParkingSpots'] = {
    --         vector4(396.44, -1644.23, 28.87, 140.98),
    --         vector4(398.86, -1646.27, 28.87, 141.31),
    --         vector4(400.68, -1648.68, 28.87, 139.26),
    --         vector4(403.42, -1650.42, 28.87, 140.08),
    --         vector4(405.61, -1652.5, 28.87, 140.84),
    --         vector4(407.88, -1654.76, 28.87, 136.65),
    --         vector4(411.02, -1656.24, 28.87, 139.71),
    --         vector4(418.25, -1646.36, 28.87, 228.47),
    --         vector4(420.48, -1642.2, 28.87, 268.44),
    --         vector4(420.66, -1639.1, 28.87, 269.3),
    --         vector4(420.99, -1635.81, 28.87, 268.95),
    --         vector4(419.65, -1629.6, 28.87, 320.26),
    --         vector4(417.63, -1627.51, 28.87, 322.75),
    --         vector4(411.18, -1636.8, 28.87, 231.44),
    --         vector4(409.14, -1638.95, 28.87, 229.77),
    --     }
    -- },
    ['cekilmisgaraj3'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(1726.5103759766, 3772.9047851563),
            vector2(1719.8903808594, 3768.9729003906),
            vector2(1719.0596923828, 3767.9890136719),
            vector2(1718.6062011719, 3766.6040039063),
            vector2(1718.7429199219, 3765.3181152344),
            vector2(1706.1174316406, 3757.8674316406),
            vector2(1705.8039550781, 3758.4509277344),
            vector2(1705.27734375, 3759.1076660156),
            vector2(1704.2060546875, 3760.1403808594),
            vector2(1698.9396972656, 3765.2570800781),
            vector2(1697.8897705078, 3766.5395507813),
            vector2(1697.3601074219, 3767.9455566406),
            vector2(1697.3154296875, 3769.1206054688),
            vector2(1697.6638183594, 3770.5151367188),
            vector2(1698.1865234375, 3771.5065917969),
            vector2(1698.7435302734, 3772.2021484375),
            vector2(1700.0344238281, 3773.1374511719),
            vector2(1712.4379882813, 3781.55078125)
            },
            ['minZ'] = 33.25,  -- min height of the parking zone
            ['maxZ'] = 38.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Cekilmiş Garaj",
        showBlip = true,
        blipcoords = vector3(1712.82, 3770.35, 34.37),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garaj',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(1711.93, 3777.35, 34.09, 36.14),
            vector4(1708.73, 3775.3, 34.08, 31.83),
            vector4(1704.26, 3764.67, 33.93, 134.46),
            vector4(1707.26, 3762.04, 33.83, 134.18),
            vector4(1705.11, 3772.54, 34.08, 38.76)
        }
    },
    ['cekilmisgaraj4'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-120.2541809082, 6288.5073242188),
            vector2(-125.95920562744, 6293.9228515625),
            vector2(-129.09274291992, 6290.8295898438),
            vector2(-145.08262634277, 6274.8647460938),
            vector2(-135.21998596191, 6265.0625),
            vector2(-120.29518127441, 6280.0434570313),
            vector2(-124.49457550049, 6284.2841796875)
            },
            ['minZ'] = 29.25,  -- min height of the parking zone
            ['maxZ'] = 34.31,  -- max height of the parking zone
            debug = false,
        },
        label = "Cekilmiş Garaj",
        showBlip = true,
        blipcoords = vector3(-132.82, 6279.06, 31.37),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garaj',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(-129.53, 6285.9, 30.93, 43.44),
            vector4(-131.76, 6283.89, 30.93, 42.88),
            vector4(-133.92, 6281.54, 30.92, 46.83),
            vector4(-136.5, 6279.03, 30.92, 46.49),
            vector4(-138.6, 6276.4, 30.92, 44.0),
            vector4(-141.75, 6273.65, 30.92, 39.63)
        }
    },
    ['pdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(435.40472412109, -984.70751953125),
                vector2(447.87017822266, -984.70983886719),
                vector2(447.87530517578, -998.40051269531),
                vector2(435.42446899414, -998.39276123047)
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 27.0,  -- max height of the parking zone
        },
        label = 'LSPD Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(445.67, -997.0, 24.81, 269.98),
            vector4(445.83, -994.31, 25.21, 267.42),
            vector4(445.53, -991.53, 25.21, 269.55),
            vector4(445.51, -988.84, 25.21, 269.43),
            vector4(445.55, -986.12, 25.21, 270.71),
            vector4(437.35, -986.1, 25.21, 89.31),
            vector4(437.27, -988.86, 25.21, 90.05),
            vector4(437.32, -991.57, 25.21, 90.47),
            vector4(437.3, -994.26, 25.21, 90.38),
            vector4(437.31, -996.97, 25.21, 90.1),
        },
        debug = false
    },
    ['pdgarage2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(451.60485839844, -1028.0988769531),
                vector2(451.08233642578, -1022.5136108398),
                vector2(433.41857910156, -1024.4827880859),
                vector2(433.93646240234, -1030.052734375)
            },
            ['minZ'] = 27.15,  -- min height of the parking zone
            ['maxZ'] = 29.15,  -- max height of the parking zone
        },
        label = 'LSPD Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(449.72, -1025.15, 28.15, 183.94),
            vector4(446.13, -1025.17, 28.21, 184.03),
            vector4(442.62, -1025.63, 28.27, 186.43),
            vector4(439.06, -1026.15, 28.35, 184.91),
            vector4(435.58, -1026.52, 28.42, 186.33)
        },
        debug = false
    },
    ['pdgarage3'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(472.3161315918, -1029.7106933594),
                vector2(475.02746582031, -1024.7690429688),
                vector2(486.34036254883, -1023.5036621094),
                vector2(483.62231445313, -1028.4250488281)
            },
            ['minZ'] = 27.15,  -- min height of the parking zone
            ['maxZ'] = 29.15,  -- max height of the parking zone
        },
        label = 'LSPD Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(475.9, -1026.73, 27.68, 330.64),
            vector4(479.56, -1026.27, 27.61, 329.24),
            vector4(483.03, -1025.94, 27.58, 331.67)
        },
        debug = false
    },
    ['pdgarage4'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(389.03775024414, -1623.2438964844),
                vector2(379.70953369141, -1634.3249511719),
                vector2(387.16827392578, -1640.7471923828),
                vector2(391.11227416992, -1636.0738525391),
                vector2(390.978515625, -1635.9537353516),
                vector2(406.60488891602, -1617.3709716797),
                vector2(402.30758666992, -1613.7540283203),
                vector2(396.61755371094, -1608.9699707031),
                vector2(391.85290527344, -1604.9923095703),
                vector2(381.5595703125, -1617.0568847656)
            },
            ['minZ'] = 27.87,  -- min height of the parking zone
            ['maxZ'] = 30.87,  -- max height of the parking zone
        },
        label = 'Davis PD Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(403.05, -1616.71, 28.87, 230.6),
            vector4(400.94, -1618.91, 28.87, 230.45),
            vector4(398.94, -1621.34, 28.87, 230.58),
            vector4(397.0, -1623.71, 28.87, 229.47),
            vector4(394.78, -1625.92, 28.87, 229.81),
            vector4(392.84, -1628.41, 28.87, 230.43),
            vector4(387.73, -1636.22, 28.87, 140.2),
            vector4(385.15, -1634.22, 28.87, 140.58),
            vector4(387.19, -1615.44, 28.87, 49.16),
            vector4(389.17, -1613.1, 28.87, 49.56),
            vector4(391.11, -1610.84, 28.87, 50.31),
            vector4(391.11, -1610.84, 28.87, 50.31),
        },
        debug = false
    },
    ['pdgarage5'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(847.408203125, -1357.3986816406),
                vector2(824.81530761719, -1357.3259277344),
                vector2(824.79022216797, -1327.8117675781),
                vector2(847.41845703125, -1327.8481445313)
            },
            ['minZ'] = 24.87,  -- min height of the parking zone
            ['maxZ'] = 32.87,  -- max height of the parking zone
        },
        label = 'La Mesa PD Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(826.63, -1332.63, 25.69, 245.48),
            vector4(827.7, -1338.94, 25.68, 245.06),
            vector4(827.67, -1345.03, 25.67, 248.61),
            vector4(827.14, -1350.92, 25.68, 247.74),
            vector4(844.55, -1335.11, 25.68, 64.34),
            vector4(844.12, -1340.46, 25.64, 67.9),
            vector4(843.91, -1346.25, 25.65, 62.59)
        },
        debug = false
    },
    ['pdgarage6'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1853.97, 3679.19),
                vector2(1857.42, 3673.09),
                vector2(1848.14, 3668.21),
                vector2(1844.02, 3673.29)
            },
            ['minZ'] = 33.07,  -- min height of the parking zone
            ['maxZ'] = 38.87,  -- max height of the parking zone
        },
        label = 'Sandy Shotes Garage',
        type = 'public',
        job = "police",
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(1853.65, 3676.44, 33.78, 214.78),
            vector4(1849.99, 3674.56, 33.78, 213.81),
            vector4(1847.12, 3672.56, 33.71, 215.13)
        },
        debug = false
    },
    ['pdgarage7'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(848.80877685547, -1274.6791992188),
                vector2(848.85626220703, -1264.1363525391),
                vector2(847.63745117188, -1262.8845214844),
                vector2(843.716796875, -1259.6865234375),
                vector2(836.18359375, -1255.1499023438),
                vector2(820.85552978516, -1255.1304931641),
                vector2(820.43933105469, -1274.6929931641)
            },
            ['minZ'] = 24.87,  -- min height of the parking zone
            ['maxZ'] = 32.87,  -- max height of the parking zone
        },
        label = 'La Mesa PD2 Garage',
        type = 'public',
        --useVehicleSpawner = true,
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(822.62, -1258.73, 25.82, 1.2),
            vector4(827.84, -1258.69, 25.85, 0.76),
            vector4(833.49, -1258.81, 25.9, 0.34),
            vector4(833.38, -1270.93, 25.85, 179.32),
            vector4(828.26, -1270.92, 25.84, 179.77),
            vector4(822.94, -1270.89, 25.82, 178.54)
        },
        debug = false
    },
    ['pdcekilmis'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(427.68862915039, -998.57489013672),
                vector2(422.80303955078, -998.56744384766),
                vector2(422.80551147461, -974.71234130859),
                vector2(427.73034667969, -974.72601318359)
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 27.0,  -- max height of the parking zone
            debug = false,
        },
        label = "Çekilmiş Garaj",
        showBlip = false,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        job = "police",
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garajı',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(425.76, -997.07, 25.21, 270.57),
            vector4(425.72, -994.41, 25.21, 269.31),
            vector4(425.72, -991.68, 25.21, 269.53),
            vector4(425.69, -989.03, 25.21, 270.22),
            vector4(425.69, -984.26, 25.21, 269.65),
            vector4(425.67, -981.55, 25.21, 269.33),
            vector4(425.68, -978.88, 25.21, 269.76),
            vector4(425.68, -976.24, 25.21, 270.49),
        }
    },
    ['pdcekilmis2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(857.24298095703, -1364.7086181641),
                vector2(869.39184570313, -1378.681640625),
                vector2(848.32061767578, -1418.1148681641),
                vector2(822.93957519531, -1418.1234130859),
                vector2(827.05615234375, -1410.8802490234),
                vector2(827.46545410156, -1406.7447509766),
                vector2(827.04309082031, -1400.0522460938),
                vector2(841.67456054688, -1400.1506347656),
                vector2(854.56646728516, -1377.2574462891)
            },
            ['minZ'] = 24.0,  -- min height of the parking zone
            ['maxZ'] = 28.0,  -- max height of the parking zone
            debug = false,
        },
        label = "Çekilmiş Garaj",
        showBlip = false,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        job = "police",
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garajı',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(865.23, -1377.77, 25.71, 219.1),
            vector4(862.62, -1383.01, 25.72, 218.89),
            vector4(859.59, -1388.04, 25.73, 217.26),
            vector4(856.73, -1393.1, 25.72, 218.18),
            vector4(854.17, -1398.57, 25.71, 214.45),
            vector4(851.06, -1403.37, 25.7, 218.45),
            vector4(833.88, -1414.04, 25.73, 151.17),
            vector4(828.0, -1414.23, 25.73, 154.22),
        }
    },
    ['pdcekilmis3'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1838.1588134766, 3689.92578125),
                vector2(1831.5511474609, 3702.0209960938),
                vector2(1807.1754150391, 3688.0100097656),
                vector2(1814.6997070313, 3676.1467285156),
                vector2(1821.5689697266, 3679.9772949219),
                vector2(1818.8731689453, 3684.6103515625),
                vector2(1822.1762695313, 3686.4868164063),
                vector2(1824.7674560547, 3682.1115722656)
            },
            ['minZ'] = 33.0,  -- min height of the parking zone
            ['maxZ'] = 38.0,  -- max height of the parking zone
            debug = false,
        },
        label = "Çekilmiş Garaj",
        showBlip = false,
        blipcoords = vector3(-143.15, -1175.06, 23.77),
        blipName = "Çekilmiş Garaj",
        blipNumber = 68,
        blipColor = 1,
        job = "police",
        type = 'depot',                --public, job, gang, depot
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Çekilmiş Garajı',                 --car, air, sea
        debug = false,
        ['ParkingSpots'] = {
            vector4(1818.16, 3682.07, 33.55, 210.16),
            vector4(1814.87, 3680.19, 33.55, 207.88),
            vector4(1834.58, 3691.5, 33.55, 210.67),
            vector4(1831.4, 3689.6, 33.55, 213.58),
            vector4(1827.91, 3687.85, 33.55, 213.82),
            vector4(1824.81, 3685.85, 33.55, 211.89),
        }
    },

    ['helikoptergaraj'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-757.8896484375, -1469.876953125),
                vector2(-744.54223632812, -1480.4110107422),
                vector2(-733.07989501954, -1467.4460449218),
                vector2(-746.4605102539, -1456.0607910156)
            },
            ['minZ'] = 4.0,  -- min height of the parking zone
            ['maxZ'] = 8.0,  -- max height of the parking zone
        },
        label = 'Helikopter Garajı',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helikopter Garajı',
        showBlip = true,
        blipName = "Helipad",
        blipNumber = 64,
        blipColor = 63,
        blipcoords = vector3(-745.61, -1468.57, 4.37),
        ["ParkingSpots"] = {
            vector4(-745.53, -1468.68, 5.0, 321.19)
        },
        ParkingDistance = 10.0,
        debug = false
    },
    ['helikoptergaraj2'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(1774.4047851562, 3246.9484863281),
                vector2(1762.30859375, 3244.3928222656),
                vector2(1765.3605957031, 3231.908203125),
                vector2(1777.5689697266, 3235.4580078125)
            },
            ['minZ'] = 40.0,  -- min height of the parking zone
            ['maxZ'] = 46.0,  -- max height of the parking zone
        },
        label = 'Helikopter Garajı 2',
        type = 'public',
        vehicleCategories = {'helicopter'},
        drawText = 'Helikopter Garajı 2',
        showBlip = true,
        blipName = 'Helipad',
        blipNumber = 64,
        blipColor = 63,
        blipcoords = vector3(1769.62, 3240.14, 42.01),
        ['ParkingSpots'] = {
            vector4(1769.62, 3240.14, 42.01, 60.44),
        },
        ParkingDistance = 100.0,
        debug = false
    },
    ['havaalanihangar'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-992.59680175781, -2949.84375),
                vector2(-1030.8975830078, -3016.2927246094),
                vector2(-1030.3382568359, -3016.5925292969),
                vector2(-1029.6291503906, -3017.0434570312),
                vector2(-1028.7434082031, -3018.0705566406),
                vector2(-1022.2585449219, -3021.5798339844),
                vector2(-1021.3436279297, -3020.5522460938),
                vector2(-1016.1632080078, -3023.6635742188),
                vector2(-1016.3262329102, -3024.7385253906),
                vector2(-966.09301757812, -3052.3435058594),
                vector2(-965.42352294922, -3051.1135253906),
                vector2(-961.01477050781, -3052.7600097656),
                vector2(-923.76300048828, -2978.2124023438)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Heli/Uçak Garaj',
        type = 'public',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Heli/Uçak Garaj',
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 359,
        blipColor = 63,
        blipcoords = vector3(-974.76, -2991.2, 13.95),
        ParkingDistance = 100.0,
        SpawnDistance = 100.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-985.04, -2965.05, 14.55, 128.92),
            vector4(-964.84, -2974.78, 14.55, 125.92),
            vector4(-945.49, -2985.63, 14.55, 117.77),
            vector4(-967.17, -3034.71, 14.55, 14.16),
            vector4(-990.13, -3022.86, 14.55, 15.42),
            vector4(-1010.91, -3012.56, 14.55, 2.31),
            vector4(-968.09, -3004.59, 14.55, 62.25)
        },

    },
    ['airdepot'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
                vector2(-1235.3253173828, -3378.4008789062),
                vector2(-1284.2642822266, -3350.1474609375),
                vector2(-1284.5589599609, -3350.7241210938),
                vector2(-1289.5042724609, -3348.0512695312),
                vector2(-1308.7587890625, -3382.4091796875),
                vector2(-1307.0877685547, -3383.8776855469),
                vector2(-1307.6185302734, -3385.4577636719),
                vector2(-1306.0087890625, -3386.4213867188),
                vector2(-1308.2755126953, -3391.1662597656),
                vector2(-1306.2180175781, -3392.1394042969),
                vector2(-1264.1188964844, -3420.0451660156),
                vector2(-1258.6077880859, -3412.1069335938),
                vector2(-1258.1317138672, -3412.4846191406),
                vector2(-1237.5152587891, -3387.8581542969),
                vector2(-1236.4268798828, -3387.1162109375),
                vector2(-1233.0942382812, -3380.8115234375),
                vector2(-1233.4357910156, -3380.13671875),
                vector2(-1235.1755371094, -3379.1962890625)
            },
            ['minZ'] = 12.00,  -- min height of the parking zone
            ['maxZ'] = 20.0,  -- max height of the parking zone
        },
        label = 'Hangar (Çekilmiş)',
        type = 'depot',
        vehicleCategories = {'helicopter', 'plane'},
        drawText = 'Hangar (Çekilmiş)',
        showBlip = true,
        blipName = 'Hangar',
        blipNumber = 569,
        blipColor = 1,
        blipcoords = vector3(-1274.34, -3385.97, 13.94),
        ParkingDistance = 200.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-1286.09, -3363.24, 14.54, 275.59),
            vector4(-1292.65, -3383.11, 14.54, 280.17),
            vector4(-1252.97, -3385.7, 14.54, 11.75),
            vector4(-1268.63, -3402.56, 14.54, 14.72),
            vector4(-1280.83, -3395.7, 14.54, 330.47),

        },
    },
    ['teknegarage'] = {
        ['Zone'] = {
            ['Shape'] = {
                vector2(-778.9291381836, -1513.3040771484),
                vector2(-803.83276367188, -1521.1665039062),
                vector2(-816.67852783204, -1493.2373046875),
                vector2(-791.34436035156, -1481.7546386718)
            },
            ['minZ'] = 0.00,
            ['maxZ'] = 5.00
        },
        label = 'Tekne Garaj',
        type = 'public',
        vehicleCategories = {'boat'},
        drawText = 'Tekne Garaj',
        showBlip = true,
        blipName = 'Boat House',
        blipNumber = 427,
        blipColor = 15,
        blipcoords = vector3(-784.84, -1498.33, 0.2),
        ParkingDistance = 20.0,
        SpawnDistance = 10.0,
        debug = false,
        ['ParkingSpots'] = {
            vector4(-798.39, -1499.15, 0.37, 109.87),
            vector4(-797.47, -1506.73, 0.3, 114.49),
        },
        ExitWarpLocations = {
            vector3(-807.15, -1496.86, 1.6),
            vector3(-800.17, -1494.87, 1.6),
            vector3(-792.92, -1492.18, 1.6),
            vector3(-787.58, -1508.59, 1.6),
            vector3(-794.89, -1511.16, 1.6),
            vector3(-800.21, -1513.05, 1.6),
        },
    },
    ['lssdgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-478.67135620117, 6014.1728515625),
            vector2(-450.36566162109, 6041.8920898438),
            vector2(-460.85848999023, 6052.1958007812),
            vector2(-488.91687011719, 6024.1474609375)
            },
            ['minZ'] = 30.0,  -- min height of the parking zone
            ['maxZ'] = 32.0,  -- max height of the parking zone
        },
        label = 'LSSD Park Alanı',
        job = 'sheriff', -- optional, everyone can use it when not defined
        type = 'job',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-482.68, 6024.94, 30.95, 224.44),
            vector4(-479.5, 6028.4, 30.95, 225.02),
            vector4(-476.33, 6031.87, 30.95, 224.03),
            vector4(-472.26, 6035.07, 30.95, 225.53),
            vector4(-468.94, 6038.45, 30.95, 224.79),
            vector4(-454.45, 6041.16, 30.95, 135.63),
            vector4(-457.49, 6044.44, 30.95, 134.54),
            vector4(-460.8, 6047.87, 30.95, 134.34)
        },
        debug = false
    },
    -- ['emsgarage'] = {
    --     ['Zone'] = {
    --         ['Shape'] = { --polygon that surrounds the parking area
    --         vector2(-861.06091308594, -1198.7951660156),
    --         vector2(-842.01940917969, -1187.9561767578),
    --         vector2(-826.52868652344, -1189.1154785156),
    --         vector2(-810.02947998047, -1202.8452148438),
    --         vector2(-840.9501953125, -1239.2330322266),
    --         vector2(-856.63256835938, -1225.3204345703),
    --         vector2(-858.53521728516, -1217.9775390625)
    --         },
    --         ['minZ'] = 4.0,  -- min height of the parking zone
    --         ['maxZ'] = 9.0,  -- max height of the parking zone
    --     },
    --     label = 'Hastane Park Alanı',
    --     type = 'job',
    --     job = 'ambulance',
    --     vehicleCategories = {'car', 'motorcycle', 'other'},
    --     drawText = 'Garaj Bölgesi',
    --     ["ParkingSpots"] = {
    --         vector4(-842.63, -1233.62, 6.4, 228.28),
    --         vector4(-826.68, -1192.97, 6.09, 318.12),
    --         vector4(-824.37, -1195.25, 6.19, 320.31),
    --         vector4(-822.04, -1197.28, 6.3, 321.3),
    --         vector4(-819.26, -1199.06, 6.4, 320.39),
    --         vector4(-816.7, -1201.11, 6.41, 318.14),
    --         vector4(-814.56, -1203.43, 6.41, 320.43),
    --         vector4(-828.58, -1217.77, 6.41, 50.28)

    --     },
    --     debug = false
    -- },
    ['uwugarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-567.66766357422, -1097.4791259766),
            vector2(-588.15496826172, -1097.4769287109),
            vector2(-598.23114013672, -1109.8201904297),
            vector2(-598.771484375, -1146.9992675781),
            vector2(-591.82678222656, -1146.8303222656),
            vector2(-591.24499511719, -1167.5207519531),
            vector2(-571.56298828125, -1167.2906494141)
            },
            ['minZ'] = 21.0,  -- min height of the parking zone
            ['maxZ'] = 24.0,  -- max height of the parking zone
        },
        label = 'uWu Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-572.55, -1100.9, 21.65, 268.82),
            vector4(-572.5, -1104.52, 21.65, 269.88),
            vector4(-572.53, -1108.31, 21.65, 270.1),
            vector4(-572.62, -1111.84, 21.65, 269.31),
            vector4(-572.53, -1115.65, 21.65, 269.5),
            vector4(-573.11, -1119.19, 21.65, 269.4),
            vector4(-572.8, -1122.94, 21.65, 268.87),
            vector4(-572.68, -1126.54, 21.65, 269.2),
            vector4(-572.59, -1130.29, 21.65, 269.35),
            vector4(-572.49, -1133.83, 21.65, 269.81),
            vector4(-581.55, -1101.22, 21.65, 88.73),
            vector4(-582.28, -1104.39, 21.65, 89.7),
            vector4(-582.78, -1108.37, 21.65, 89.67),
            vector4(-582.55, -1111.79, 21.65, 89.1),
            vector4(-582.62, -1115.58, 21.65, 92.4),
            vector4(-582.49, -1119.25, 21.65, 88.5),
            vector4(-582.26, -1122.92, 21.65, 90.72),
            vector4(-582.5, -1126.52, 21.65, 91.1),
            vector4(-582.34, -1130.27, 21.65, 89.86),
            vector4(-582.74, -1133.78, 21.65, 91.3),
            vector4(-595.03, -1141.36, 21.65, 88.09),
            vector4(-594.57, -1137.86, 21.65, 90.42),
            vector4(-594.58, -1134.07, 21.68, 86.41),
            vector4(-594.72, -1130.42, 21.68, 87.11),
            vector4(-594.63, -1126.61, 21.68, 89.78),
            vector4(-594.82, -1123.25, 21.68, 90.95),
            vector4(-594.87, -1119.4, 21.68, 91.22),
            vector4(-594.56, -1115.76, 21.68, 89.03),
            vector4(-594.95, -1112.26, 21.68, 87.72),
            vector4(-584.59, -1161.45, 21.68, 270.16),
            vector4(-584.39, -1157.68, 21.68, 271.29),
            vector4(-584.37, -1154.03, 21.68, 269.97),
            vector4(-584.56, -1150.5, 21.68, 269.08),
            vector4(-584.21, -1146.66, 21.68, 266.99),

        },
        debug = false
    },
    ['pdmgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-37.002159118652, -1114.3826904297),
            vector2(-39.094856262207, -1120.4017333984),
            vector2(-64.630859375, -1121.6557617188),
            vector2(-61.479099273682, -1112.5858154297)
            },
            ['minZ'] = 25.0,  -- min height of the parking zone
            ['maxZ'] = 29.0,  -- max height of the parking zone
        },
        label = 'PDM Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-60.94, -1117.9, 26.17, 340.6),
            vector4(-57.52, -1118.21, 26.17, 337.75),
            vector4(-54.12, -1118.04, 26.17, 340.27),
            vector4(-50.63, -1117.7, 26.17, 340.03),
            vector4(-47.21, -1117.43, 26.17, 340.11),
            vector4(-43.9, -1117.25, 26.17, 338.82),
            vector4(-40.36, -1117.09, 26.17, 338.96)

        },
        debug = false
    },
    ['pdmleftgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-6.1620411872864, -1094.4901123047),
            vector2(-13.008597373962, -1091.9779052734),
            vector2(-20.621028900146, -1114.2987060547),
            vector2(-14.47656917572, -1116.4373779297)
            },
            ['minZ'] = 25.0,  -- min height of the parking zone
            ['maxZ'] = 29.0,  -- max height of the parking zone
        },
        label = 'PDM Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-16.29, -1113.48, 26.57, 248.78),
            vector4(-15.27, -1110.56, 26.58, 250.18),
            vector4(-14.07, -1107.64, 26.58, 248.4),
            vector4(-12.78, -1104.73, 26.57, 248.99),
            vector4(-11.83, -1101.67, 26.58, 247.66),
            vector4(-10.75, -1098.77, 26.58, 249.53),
            vector4(-9.34, -1095.81, 26.67, 248.87)

        },
        debug = false
    },
    ['bahamasgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1389.7524414063, -581.59399414063),
            vector2(-1393.2579345703, -576.84539794922),
            vector2(-1431.9951171875, -598.16497802734),
            vector2(-1430.6306152344, -600.86578369141),
            vector2(-1423.9398193359, -600.4599609375)
            },
            ['minZ'] = 29.0,  -- min height of the parking zone
            ['maxZ'] = 33.0,  -- max height of the parking zone
        },
        label = 'Bahamas Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-1393.45, -582.0, 29.79, 298.91),
            vector4(-1398.5, -584.75, 29.85, 298.32),
            vector4(-1403.61, -587.56, 29.91, 298.47),
            vector4(-1408.83, -590.4, 29.98, 298.47),
            vector4(-1414.44, -593.46, 30.05, 298.47),
            vector4(-1419.63, -596.34, 30.12, 298.65)
        },
        debug = false
    },
    ['pinkcagegarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(308.40618896484, -241.59202575684),
            vector2(271.00570678711, -227.47256469727),
            vector2(263.05276489258, -218.08905029297),
            vector2(300.96807861328, -232.62031555176)
            },
            ['minZ'] = 53.0,  -- min height of the parking zone
            ['maxZ'] = 57.0,  -- max height of the parking zone
        },
        label = 'Motel Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(299.95, -235.61, 53.63, 8.03),
            vector4(294.6, -233.51, 53.62, 11.71),
            vector4(289.27, -231.26, 53.61, 16.22),
            vector4(283.86, -229.16, 53.6, 13.48),
            vector4(278.54, -227.04, 53.59, 13.46),
            vector4(273.35, -225.27, 53.59, 12.83)
        },
        debug = false
    },
    ['delperrogarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1831.0126953125, -1212.8786621094),
            vector2(-1834.6627197266, -1217.2423095703),
            vector2(-1812.6507568359, -1235.5313720703),
            vector2(-1794.2694091797, -1213.6069335938),
            vector2(-1816.3148193359, -1195.1390380859)
            },
            ['minZ'] = 12.0,  -- min height of the parking zone
            ['maxZ'] = 18.0,  -- max height of the parking zone
        },
        label = 'İskele Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-1831.22, -1216.29, 12.59, 140.36),
            vector4(-1828.28, -1218.29, 12.59, 136.35),
            vector4(-1822.25, -1223.37, 12.55, 138.54),
            vector4(-1819.54, -1225.62, 12.54, 138.48),
            vector4(-1816.76, -1227.92, 12.55, 139.08),
            vector4(-1809.87, -1227.26, 12.59, 228.56),
            vector4(-1807.44, -1224.52, 12.59, 230.78),
            vector4(-1802.39, -1218.44, 12.59, 228.51),
            vector4(-1800.09, -1215.66, 12.59, 230.45),
            vector4(-1798.06, -1212.78, 12.59, 230.25)
        },
        debug = false
    },
    ['burgershotgarage'] = {
        ['Zone'] = {
            ['Shape'] = { --polygon that surrounds the parking area
            vector2(-1163.9786376953, -894.87261962891),
            vector2(-1165.2540283203, -895.56860351563),
            vector2(-1179.2916259766, -872.0859375),
            vector2(-1178.7303466797, -871.61364746094),
            vector2(-1178.5457763672, -872.03594970703),
            vector2(-1178.1878662109, -872.47088623047),
            vector2(-1177.6295166016, -872.61199951172),
            vector2(-1177.140625, -872.55786132813),
            vector2(-1172.7044677734, -869.73132324219),
            vector2(-1159.71875, -890.96221923828),
            vector2(-1159.9342041016, -891.43194580078),
            vector2(-1164.4180908203, -893.96990966797)
            },
            ['minZ'] = 12.0,  -- min height of the parking zone
            ['maxZ'] = 17.0,  -- max height of the parking zone
        },
        label = 'Burger Shot Garaj',
        type = 'public',
        vehicleCategories = {'car', 'motorcycle', 'other'},
        drawText = 'Garaj Bölgesi',
        ["ParkingSpots"] = {
            vector4(-1174.56, -873.54, 13.7, 300.28),
            vector4(-1172.83, -876.33, 13.7, 303.39),
            vector4(-1171.12, -879.74, 13.69, 303.59),
            vector4(-1168.85, -883.17, 13.7, 300.27),
            vector4(-1165.51, -887.8, 13.71, 304.64),
            vector4(-1163.93, -891.36, 13.7, 300.7)
        },
        debug = false
    },
}



HouseGarages = {} -- DO NOT TOUCH!
