maxVehiclePerformanceUpgrades = 0 -- Set to 0 to have all the upgrades
vehicleBaseRepairCost = 600
vehicleRepairCostMultiplier = 1

-- Location Configs
-- Add locations here
-- Add jobs specific to the garage.
bennyGarages = {
    [1] = {coords = vector4(462.6910, -1019.56, 27.906, 271.35), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [2] = {coords = vector4(463.1309, -1014.95, 27.361, 268.97), useJob = true, job = {"police", "sheriff", "state", "fbi", "parkranger"}},
    [3] = {coords = vector4(-826.942, -1263.46, 5.0003, 52.54), useJob = true, job = {"ambulance"}},
    [4] = {coords = vector4(1879.71, 3699.67, 33.54, 300.3), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
	[5] = {coords = vector4(871.54, -1350.07, 26.31, 274.18), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
	
    --- MEKANIKLER

    [6] = {coords = vector4(938.26,-978.40,39.57, 3.77), useJob = true, job = {"mechanic"}},
    [7] = {coords = vector4(938.17,-970.49,39.54, 94.32), useJob = true, job = {"mechanic"}},
	[8] = {coords = vector4(920.52,-980.6,39.5, 183.02), useJob = true, job = {"mechanic"}},
    [9] = {coords = vector4(-210.31,-1324.47,30.89, 358.61), useJob = true, job = {"mechanic"}},
    [10] = {coords = vector4(-222.52,-1330.1,30.89, 269.69), useJob = true, job = {"mechanic"}},
    --[11] = {coords = vector4(540.8,-188.17,53.88, 269.73), useJob = true, job = {"mechanic"}},
    --[12] = {coords = vector4(537.09,-177.61,53.86, 269.44), useJob = true, job = {"mechanic"}},
    [11] = {coords = vector4(-1155.1,-2005.58,13.3, 140.25), useJob = true, job = {"mechanic"}},
    [12] = {coords = vector4(-1159.78,-2019.27,13.3, 223.19), useJob = true, job = {"mechanic"}},
    [13] = {coords = vector4(-339.06,-136.96,3.01, 253.55), useJob = true, job = {"mechanic"}},
    [14] = {coords = vector4(-325.14,-135.51,3.01, 338.92), useJob = true, job = {"mechanic"}},
    [15] = {coords = vector4(730.98,-1089.07,22.17, 268.85), useJob = true, job = {"mechanic"}},
    [16] = {coords = vector4(734.57,-1081.39,22.17, 358.83), useJob = true, job = {"mechanic"}},
    [17] = {coords = vector4(378.25, -1628.93, 29.29, 139.48), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [18] = {coords = vector4(292.76, -689.98, 29.3, 66.14), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [19] = {coords = vector4(535.92,-182.98,54.34, 268.56), useJob = true, job = {"mechanic"}},
    [20] = {coords = vector4(156.31, -681.06, 33.13, 340.03), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [21] = {coords = vector4(-458.41, 6043.34, 31.34, 311.5), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [22] = {coords = vector4(1880.49, 3691.18, 33.35, 210.23), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [22] = {coords = vector4(449.2, -981.27, 43.69, 268.63), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
    [23] = {coords = vector4(-214.06,-1324.28,30.22, 357.7), useJob = true, job = {"mechanic"}},
    [24] = {coords = vector4(-199.14,-1324.33,30.46, 91.72), useJob = true, job = {"mechanic"}},
    [25] = {coords = vector4(481.1,-1317.67,29.2, 114.46), useJob = true, job = {"mechanic"}},
    [26] = {coords = vector4(487.11,-1308.72,29.26, 20.56), useJob = true, job = {"mechanic"}},
    [27] = {coords = vector4(-1610.37,-833.94,10.1, 136.26), useJob = true, job = {"mechanic"}},
    [28] = {coords = vector4(-1613.32,-827.98,10.1, 137.6), useJob = true, job = {"mechanic"}},
    [39] = {coords = vector4(-1617.77,-824.0,10.1, 137.65), useJob = true, job = {"mechanic"}},
    [30] = {coords = vector4(-1622.37,-820.17,10.1, 139.34), useJob = true, job = {"mechanic"}},
    [31] = {coords = vector4(-1627.06,-816.36,10.1, 137.82), useJob = true, job = {"mechanic"}},
    [32] = {coords = vector4(-1174.694,-1773.574,3.83667, 122.39), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "lsfd"}},
    [33] = {coords = vector4(154.54016,-1081.876,29.192356, 178.74139), useJob = true, job = {"mechanic"}},
    [34] = {coords = vector4(125.62947,-1069.466,29.192375, 178.57266), useJob = true, job = {"mechanic"}},
    [35] = {coords = vector4(544.23,-189.63,54.49, 267.52), useJob = true, job = {"mechanic"}},
    [36] = {coords = vector4(543.85,-179.15,54.49, 264.38), useJob = true, job = {"mechanic"}},
    [37] = {coords = vector4(537.15,-171.09,54.49, 357.25), useJob = true, job = {"mechanic"}},
    [38] = {coords = vector4(-327.01,-144.38,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [39] = {coords = vector4(-325.01,-139.29,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [40] = {coords = vector4(-323.3,-134.1,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [41] = {coords = vector4(-321.54,-128.79,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [42] = {coords = vector4(-319.55,-123.55,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [43] = {coords = vector4(-317.78,-118.37,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [44] = {coords = vector4(-315.67,-113.29,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [45] = {coords = vector4(-313.78,-108.15,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [46] = {coords = vector4(-311.84,-102.78,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [47] = {coords = vector4(-338.9,-95.08,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [48] = {coords = vector4(-353.56,-90.07,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [49] = {coords = vector4(-366.39,-85.15,39.02, 246.59), useJob = true, job = {"mechanic"}},
    [50] = {coords = vector4(-342.52,-114.01,39.01, 72.12), useJob = true, job = {"mechanic"}},
    [51] = {coords = vector4(-346.45,-124.65,39.01, 64.18), useJob = true, job = {"mechanic"}},
    [52] = {coords = vector4(-349.21,-131.56,39.01, 64.18), useJob = true, job = {"mechanic"}},
    [53] = {coords = vector4(-1137.059,-1991.891,13.15454, 134.82), useJob = true, job = {"mechanic"}},
    [54] = {coords = vector4(-648.79,-110.48,37.88, 27.75), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "lsfd"}},
    [55] = {coords = vector4(135.59,-1070.56,28.53, 0.89), useJob = true, job = {"mechanic"}},
    [56] = {coords = vector4(138.79,-1070.02,28.53, 0.89), useJob = true, job = {"mechanic"}},
    [57] = {coords = vector4(-1417.21,-446.2154,35.91, 210.47), useJob = true, job = {"mechanic"}},
    [58] = {coords = vector4(-1424.018,-450.5538,35.91, 207.28), useJob = true, job = {"mechanic"}},
    [59] = {coords = vector4(-1411.437,-442.3385,35.43, 210.66), useJob = true, job = {"mechanic"}},
    [60] = {coords = vector4(1874.47,3705.08,33.55, 28.18), useJob = true, job = {"mechanic"}},
    [61] = {coords = vector4(-1604.29,-997.07,13.08, 138.08), useJob = true, job = {"mechanic"}},
    [62] = {coords = vector4(832.09, -806.22, 26.33, 91.66), useJob = true, job = {"mechanic"}},
    [63] = {coords = vector4(833.21, -812.98, 25.91, 91.78), useJob = true, job = {"mechanic"}},
    [64] = {coords = vector4(833.28, -820.37, 25.91, 92.85), useJob = true, job = {"mechanic"}},
    [65] = {coords = vector4(136.05, -3030.59, 7.04, 181.55), useJob = true, job = {"mechanic"}},
    [66] = {coords = vector4(144.71, -3030.38, 7.04, 175.77), useJob = true, job = {"mechanic"}},
    [67] = {coords = vector4(-35.01, -1054.15, 28.4, 249.07), useJob = true, job = {"mechanic"}},
    [68] = {coords = vector4(1564.25, 820.31, 76.99, 152.76), useJob = true, job = {"police", "sheriff", "sasp", "fbi", "parkranger"}},
}

--[[ bennyLocations = {
    vector4(-211.55, -1324.55, 30.90, 319.731)
} ]]

-- ADJUST PRICING

vehicleCustomisationPrices = {
    cosmetics = {price = 0},
    respray = {price = 0},
    performance = {prices = {0, 0, 0, 0, 0, 0}},
    turbo = {price = 0},
    wheels = {price = 0},
    customwheels = {price = 0},
    wheelsmoke = {price = 0},
    windowtint = {price = 0},
    neonside = {price = 0},
    neoncolours = {price = 0},
    headlights = {price = 0},
    xenoncolours = {price = 0},
    oldlivery = {price = 0},
    plateindex = {price = 0}
}

-- RESPRAY CATEGORIES

vehicleResprayCategories = {
    {category = "Primary Colour", id = 0},
    {category = "Secondary Colour", id = 1},
    {category = "Pearlescent Colour", id = 2},
    {category = "Wheel Colour", id = 3},
    {category = "Dashboard Colour", id = 4},
    {category = "Interior Colour", id = 5}
}

-- WINDOW TINTS

vehicleWindowTintOptions = {
    {name = "Stok", id = 0},
    {name = "Simsiyah", id = 1},
    {name = "Koyu Siyah", id = 2},
    {name = "Acik Siyah", id = 3}
}

-- HEADLIGHTS

vehicleXenonOptions = {
    xenonColours = {
        {name = "Stok", id = 255},
        {name = "Beyaz",id = 0}, {name = "Mavi",id = 1},
        {name = "Elektrik Mavi",id = 2},
        {name = "Nane Yesil",id = 3},
        {name = "Limon Yesil",id = 4},
        {name = "Sari",id = 5},
        {name = "Altin",id = 6},
        {name = "Turuncu",id = 7},
        {name = "Kirmizi",id = 8},
        {name = "Pony Pembe",id = 9},
        {name = "Sicak Pembe",id = 10},
        {name = "Mor",id = 11},
        {name = "Siyah Isık",id = 12}
    }
}

-- WHEELS

vehicleWheelOptions = {
    {category = "Ozel Jantlar", id = -1, wheelID = 23},
    {category = "Lastik Dumani", id = 20, wheelID = 23},
    {category = "Spor", id = 0, wheelID = 23},
    {category = "Muscle", id = 1, wheelID = 23},
    {category = "Lowrider", id = 2, wheelID = 23},
    {category = "SUV", id = 3, wheelID = 23},
    {category = "Offroad", id = 4, wheelID = 23},
    {category = "Tuner", id = 5, wheelID = 23},
    {category = "Motorsiklet", id = 6, wheelID = 23},
    {category = "Ust Duzey", id = 7, wheelID = 23}
}

-- TIRE SMOKE

vehicleTyreSmokeOptions = {
    {
        name = "Beyaz Duman",
        r = 254,
        g = 254,
        b = 254
    }, 
    {
        name = "Siyah Duman",
        r = 1,
        g = 1,
        b = 1
    },
    {
        name = "Mavi Duman",
        r = 0,
        g = 150,
        b = 255
    },
    {
        name = "Sari Duman",
        r = 255,
        g = 255,
        b = 50
    },
    {
        name = "Turuncu Duman",
        r = 255,
        g = 153,
        b = 51
    },
    {
        name = "Kirmizi Duman",
        r = 255,
        g = 10,
        b = 10
    },
    {
        name = "Yesil Duman",
        r = 10,
        g = 255,
        b = 10
    },
    {
        name = "Mor Duman",
        r = 153,
        g = 10,
        b = 153
    },
    {
        name = "Pembe Duman",
        r = 255,
        g = 102,
        b = 178
    },
    {
        name = "Gri Duman",
        r = 128,
        g = 128,
        b = 128
    }
}

-- NEONS

vehicleNeonOptions = {
    category = "Neons",
        neonTypes = {
            {name = "On Neon", id = 2},
            {name = "Arka Neon", id = 3},
            {name = "Sol Neon", id = 0},
            {name = "Sag Neon", id = 1}
        },
    neonColours = {
        {
            name = "Beyaz",
            r = 222,
            g = 222,
            b = 255
        }, {
            name = "Mavi",
            r = 2,
            g = 21,
            b = 255
        }, {
            name = "Elektrik Mavi",
            r = 3,
            g = 83,
            b = 255
        }, {
            name = "Nane Yesil",
            r = 0,
            g = 255,
            b = 140
        }, {
            name = "Limon Yesil",
            r = 94,
            g = 255,
            b = 1
        }, {
            name = "Sari",
            r = 255,
            g = 255,
            b = 0
        }, {
            name = "Altin",
            r = 255,
            g = 150,
            b = 0
        }, {
            name = "Turuncu",
            r = 255,
            g = 62,
            b = 0
        }, {
            name = "Kirmizi",
            r = 255,
            g = 1,
            b = 1
        }, {
            name = "Pony Pembe",
            r = 255,
            g = 50,
            b = 100
        }, {
            name = "Sicak Pembe",
            r = 255,
            g = 5,
            b = 190
        }, {
            name = "Mor",
            r = 35,
            g = 1,
            b = 255
        }, {
            name = "Siyah Isık",
            r = 15,
            g = 3,
            b = 255
        }
    }
}

-- MAIN COMPONENTS

vehicleCustomisation = {
    {category = "Spoiler", id = 0}, 
    {category = "On Tampon", id = 1},
    {category = "Arka Tampon", id = 2},
    {category = "Yan Etek", id = 3},
    {category = "Egzoz", id = 4},
    {category = "Kafes", id = 5},
    {category = "Izgara", id = 6},
    {category = "Kaput", id = 7},
    {category = "Sol Camurluk", id = 8},
    {category = "Sag Camurluk", id = 9},
    {category = "Cati",id = 10},
    {category = "Motor Yukseltmesi", id = 11},
    {category = "Fren Yukseltmesi", id = 12},
    {category = "Vites Yukseltmesi", id = 13},
    {category = "Suspansiyon Yukseltmesi", id = 15},
    -- {category = "Zirh Yukseltmesi", id = 16},
    {category = "Turbo Yukseltmesi", id = 18},
    {category = "Plaka Kapagi",id = 25},
    {category = "Trim A", id = 27},
    {category = "Susler", id = 28},
    {category = "Gosterge Paneli", id = 29},
    {category = "Kadran", id = 30},
    {category = "Kapi Hoparloru", id = 31},
    {category = "Koltuk", id = 32},
    {category = "Direksiyon", id = 33},
    {category = "Vites Kolu", id = 34},
    {category = "Tabela", id = 35},
    {category = "Hoparlor", id = 36},
    {category = "Bagaj", id = 37},
    {category = "Hidrolik", id = 38},
    {category = "Motor Blogu", id = 39},
    {category = "Hava Filtresi", id = 40},
    {category = "Destek", id = 41},
    {category = "Kemer Kapagi", id = 42},
    {category = "Anten", id = 43},
    {category = "Trim B", id = 44},
    {category = "Yakit Tanki", id = 45},
    {category = "Pencere", id = 46},
    {category = "Cikartma", id = 48},
    {category = "Korna", id = 14, 
        
        hornNames = {
            {name = "Kamyon Korna", id = 0},
            {name = "Polis Korna", id = 1},
            {name = "Palyaco Korna", id = 2},
            {name = "Muzikal Korna 1", id = 3},
            {name = "Muzikal Korna 2", id = 4},
            {name = "Muzikal Korna 3", id = 5},
            {name = "Muzikal Korna 4", id = 6},
            {name = "Muzikal Korna 5", id = 7},
            {name = "Uzgun Trombon", id = 8},
            {name = "Klasik Korna 1", id = 9},
            {name = "Klasik Korna 2", id = 10},
            {name = "Klasik Korna 3", id = 11},
            {name = "Klasik Korna 4", id = 12},
            {name = "Klasik Korna 5", id = 13},
            {name = "Klasik Korna 6", id = 14},
            {name = "Klasik Korna 7", id = 15},
            {name = "Nota - Do", id = 16},
            {name = "Nota - Re", id = 17},
            {name = "Nota - Mi", id = 18},
            {name = "Nota - Fa", id = 19},
            {name = "Nota - Sol", id = 20},
            {name = "Nota - La", id = 21},
            {name = "Nota - Ti", id = 22},
            {name = "Nota - Do", id = 23},
            {name = "Jazz Korna 1", id = 24},
            {name = "Jazz Korna 2", id = 25},
            {name = "Jazz Korna 3", id = 26},
            {name = "Jazz Korna Dongu", id = 27},
            {name = "Amerika Milli Marsi 1", id = 28},
            {name = "Amerika Milli Marsi 2", id = 29},
            {name = "Amerika Milli Marsi 3", id = 30},
            {name = "Amerika Milli Marsi 4", id = 31},
            {name = "Klasik Korna 8 Dongu", id = 32},
            {name = "Klasik Korna 9 Dongu", id = 33},
            {name = "Klasik Korna 10 Dongu", id = 34},
            {name = "Klasik Korna 8", id = 35},
            {name = "Klasik Korna 9", id = 36},
            {name = "Klasik Korna 10", id = 37},
            {name = "Cenaze Dongu", id = 38},
            {name = "Cenaze", id = 39},
            {name = "Urpertici Dongu", id = 40},
            {name = "Urpertici", id = 41},
            {name = "San Andreas Dongu", id = 42},
            {name = "San Andreas", id = 43},
            {name = "Liberty City Dongu", id = 44},
            {name = "Liberty City", id = 45},
            {name = "Festival 1 Dongu", id = 46},
            {name = "Festival 1", id = 47},
            {name = "Festival 2 Dongu", id = 48},
            {name = "Festival 2", id = 49},
            {name = "Festival 3 Dongu", id = 50},
            {name = "Festival 3", id = 51}
        }
    }
}

-- COLORS

vehicleResprayOptions = {
    {category = "Klasik", id = 0,
        colours = {
            {name = "Siyah", id = 0, r = 0, g = 0, b = 0},
            {name = "Karbon Siyah", id = 147, r = 0, g = 0, b = 0},
            {name = "Grafit", id = 1, r = 28, g = 29, b = 33},
            {name = "Antrasit Siyah", id = 11, r = 29, g = 33, b = 41},
            {name = "Siyah Celik", id = 11, r = 29, g = 33, b = 41},
            {name = "Koyu Celik", id = 3, r = 69, g = 75, b = 79},
            {name = "Gumus", id = 4, r = 153, g = 157, b = 160},
            {name = "Mavimsi Gumus", id = 5, r = 194, g = 196, b = 198},
            {name = "Haddelenmis Celik", id = 6, r = 151, g = 154, b = 151},
            {name = "Golge Gumus", id = 7, r = 99, g = 115, b = 128},
            {name = "Tas Gumus", id = 8, r = 99, g = 98, b = 92},
            {name = "Geceyarisi Gumus", id = 9, r = 60, g = 63, b = 71},
            {name = "Dokme Demir Gumus", id = 10, r = 68, g = 78, b =84},
            {name = "Kirmizi", id = 27, r = 192, g = 14, b = 26},
            {name = "Torino Kirmizi", id = 28, r = 218, g = 25, b = 24},
            {name = "Formula Kirmizi", id = 29, r = 182, g = 17, b = 27},
            {name = "Lav Kirmizi", id = 150, r = 188, g = 25, b = 23},
            {name = "Ates Kirmizi", id = 30, r = 165, g = 30, b = 35},
            {name = "Zarif Kirmizi", id = 31, r = 123, g = 26, b = 34},
            {name = "Grena Kirmizi", id = 32, r = 142, g = 27, b = 31},
            {name = "Gun Batimi Kirmizi", id = 33, r = 111, g = 24, b = 24},
            {name = "Cabernet Kirmizi", id = 34, r = 73, g = 17, b = 29},
            {name = "Sarap Kirmizi", id = 143, r = 14, g = 13, b = 20},
            {name = "Seker Kirmizi", id = 35, r = 182, g = 15, b = 37},
            {name = "Sicak Pembe", id = 135, r = 242, g = 31, b = 153},
            {name = "Pfsiter Pembe", id = 137, r = 223, g = 88, b = 145},
            {name = "Somon Pembe", id = 136, r = 253, g = 214, b = 205},
            {name = "Gun Dogumu Turuncu", id = 36, r = 212, g = 74, b = 23},
            {name = "Turuncu", id = 38, r = 247, g = 134, b = 22},
            {name = "Parlak Turuncu", id = 138, r = 246, g = 174, b = 32},
            {name = "Altin", id = 99, r = 172, g = 153, b = 117},
            {name = "Bronz", id = 90, r = 145, g = 101, b = 50},
            {name = "Sari", id = 88, r = 255, g = 207, b = 32},
            {name = "Yaris Sari", id = 89, r = 251, g = 226, b = 18},
            {name = "Ciy Sari", id = 91, r = 224, g = 225, b = 61},
            {name = "Koyu Yesil", id = 49, r = 19, g = 36, b = 40},
            {name = "Yaris Yesil", id = 50, r = 18, g = 46, b = 43},
            {name = "Deniz Yesil", id = 51, r = 18, g = 56, b = 60},
            {name = "Zeytin Yesil", id = 52, r = 49, g = 66, b = 63},
            {name = "Parlak Yesil", id = 53, r = 21, g = 92, b = 45},
            {name = "Benzin Yesil", id = 54, r = 27, g = 103, b = 112},
            {name = "Limon Yesil", id = 92, r = 152, g = 210, b = 35},
            {name = "Geceyarisi Mavi", id = 141, r = 10, g = 12, b = 23},
            {name = "Galaksi Mavi", id = 61, r = 34, g = 46, b = 70},
            {name = "Koyu Mavi", id = 62, r = 35, g = 49, b = 85},
            {name = "Sakso Mavi", id = 63, r = 48, g = 76, b = 126},
            {name = "Mavi", id = 64, r = 71, g = 87, b = 143},
            {name = "Denizci Mavi", id = 65, r = 99, g = 123, b = 167},
            {name = "Liman Mavi", id = 66, r = 57, g = 71, b = 98},
            {name = "Elmas Mavi", id = 67, r = 214, g = 231, b = 241},
            {name = "Dalga Mavi", id = 68, r = 118, g = 175, b = 190},
            {name = "Deniz Mavi", id = 69, r = 52, g = 94, b = 114},
            {name = "Yaris Mavi", id = 73, r = 35, g = 84, b = 161},
            {name = "Ultra Mavi", id = 70, r = 11, g = 156, b = 241},
            {name = "Acik Mavi", id = 74, r = 110, g = 163, b = 198},
            {name = "Cikolata Kahverengi", id = 96, r = 34, g = 27, b = 25},
            {name = "Bizon Kahverengi", id = 101, r = 64, g = 46, b = 43},
            {name = "Creeen Kahverengi", id = 95, r = 71, g = 63, b = 43},
            {name = "Feltzer Kahverengi", id = 94, r = 80, g = 50, b = 24},
            {name = "Akcaagac Kahverengi", id = 97, r = 101, g = 63, b = 35},
            {name = "Kayin Agaci Kahverengi", id = 103, r = 70, g = 35, b = 26},
            {name = "Koyu Kahverengi", id = 104, r = 117, g = 43, b = 25},
            {name = "Semer Kahverengi", id = 98, r = 119, g = 92, b = 62},
            {name = "Yosun Kahverengi", id = 100, r = 108, g = 107, b = 75},
            {name = "Woodbeech Kahverengi", id = 102, r = 164, g = 150, b = 95},
            {name = "Hasir Kahverengi", id = 99, r = 172, g = 153, b = 117},
            {name = "Kumlu Kahverengi", id = 105, r = 191, g = 174, b = 123},
            {name = "Agartilmis Kahverengi", id = 106, r = 223, g = 213, b = 178},
            {name = "Schafter Mor", id = 71, r = 47, g = 45, b = 82},
            {name = "Yelken Mor", id = 72, r = 40, g = 44, b = 77},
            {name = "Geceyarisi Mor", id = 142, r = 12, g = 13, b = 24},
            {name = "Parlak Mor", id = 145, r = 98, g = 18, b = 118},
            {name = "Krem", id = 107, r = 247, g = 237, b = 213},
            {name = "Ice Beyaz", id = 111, r = 255, g = 255, b = 246},
            {name = "Buz Beyaz", id = 112, r = 234, g = 234, b = 234}
        }
    }, 
    {category = "Metalik", id = 1,
        colours = {{name = "Siyah", id = 0, r = 0, g = 0, b = 0},
            {name = "Karbon Siyah", id = 147, r = 0, g = 0, b = 0},
            {name = "Grafit", id = 1, r = 28, g = 29, b = 33},
            {name = "Antrasit Siyah", id = 11, r = 29, g = 33, b = 41},
            {name = "Siyah Celik", id = 11, r = 29, g = 33, b = 41},
            {name = "Koyu Celik", id = 3, r = 69, g = 75, b = 79},
            {name = "Gumus", id = 4, r = 153, g = 157, b = 160},
            {name = "Mavimsi Gumus", id = 5, r = 194, g = 196, b = 198},
            {name = "Haddelenmis Celik", id = 6, r = 151, g = 154, b = 151},
            {name = "Golge Gumus", id = 7, r = 99, g = 115, b = 128},
            {name = "Tas Gumus", id = 8, r = 99, g = 98, b = 92},
            {name = "Geceyarisi Gumus", id = 9, r = 60, g = 63, b = 71},
            {name = "Dokme Demir Gumus", id = 10, r = 68, g = 78, b =84},
            {name = "Kirmizi", id = 27, r = 192, g = 14, b = 26},
            {name = "Torino Kirmizi", id = 28, r = 218, g = 25, b = 24},
            {name = "Formula Kirmizi", id = 29, r = 182, g = 17, b = 27},
            {name = "Lav Kirmizi", id = 150, r = 188, g = 25, b = 23},
            {name = "Ates Kirmizi", id = 30, r = 165, g = 30, b = 35},
            {name = "Zarif Kirmizi", id = 31, r = 123, g = 26, b = 34},
            {name = "Grena Kirmizi", id = 32, r = 142, g = 27, b = 31},
            {name = "Gun Batimi Kirmizi", id = 33, r = 111, g = 24, b = 24},
            {name = "Cabernet Kirmizi", id = 34, r = 73, g = 17, b = 29},
            {name = "Sarap Kirmizi", id = 143, r = 14, g = 13, b = 20},
            {name = "Seker Kirmizi", id = 35, r = 182, g = 15, b = 37},
            {name = "Sicak Pembe", id = 135, r = 242, g = 31, b = 153},
            {name = "Pfsiter Pembe", id = 137, r = 223, g = 88, b = 145},
            {name = "Somon Pembe", id = 136, r = 253, g = 214, b = 205},
            {name = "Gun Dogumu Turuncu", id = 36, r = 212, g = 74, b = 23},
            {name = "Turuncu", id = 38, r = 247, g = 134, b = 22},
            {name = "Parlak Turuncu", id = 138, r = 246, g = 174, b = 32},
            {name = "Altin", id = 99, r = 172, g = 153, b = 117},
            {name = "Bronz", id = 90, r = 145, g = 101, b = 50},
            {name = "Sari", id = 88, r = 255, g = 207, b = 32},
            {name = "Yaris Sari", id = 89, r = 251, g = 226, b = 18},
            {name = "Ciy Sari", id = 91, r = 224, g = 225, b = 61},
            {name = "Koyu Yesil", id = 49, r = 19, g = 36, b = 40},
            {name = "Yaris Yesil", id = 50, r = 18, g = 46, b = 43},
            {name = "Deniz Yesil", id = 51, r = 18, g = 56, b = 60},
            {name = "Zeytin Yesil", id = 52, r = 49, g = 66, b = 63},
            {name = "Parlak Yesil", id = 53, r = 21, g = 92, b = 45},
            {name = "Benzin Yesil", id = 54, r = 27, g = 103, b = 112},
            {name = "Limon Yesil", id = 92, r = 152, g = 210, b = 35},
            {name = "Geceyarisi Mavi", id = 141, r = 10, g = 12, b = 23},
            {name = "Galaksi Mavi", id = 61, r = 34, g = 46, b = 70},
            {name = "Koyu Mavi", id = 62, r = 35, g = 49, b = 85},
            {name = "Sakso Mavi", id = 63, r = 48, g = 76, b = 126},
            {name = "Mavi", id = 64, r = 71, g = 87, b = 143},
            {name = "Denizci Mavi", id = 65, r = 99, g = 123, b = 167},
            {name = "Liman Mavi", id = 66, r = 57, g = 71, b = 98},
            {name = "Elmas Mavi", id = 67, r = 214, g = 231, b = 241},
            {name = "Dalga Mavi", id = 68, r = 118, g = 175, b = 190},
            {name = "Deniz Mavi", id = 69, r = 52, g = 94, b = 114},
            {name = "Yaris Mavi", id = 73, r = 35, g = 84, b = 161},
            {name = "Ultra Mavi", id = 70, r = 11, g = 156, b = 241},
            {name = "Acik Mavi", id = 74, r = 110, g = 163, b = 198},
            {name = "Cikolata Kahverengi", id = 96, r = 34, g = 27, b = 25},
            {name = "Bizon Kahverengi", id = 101, r = 64, g = 46, b = 43},
            {name = "Creeen Kahverengi", id = 95, r = 71, g = 63, b = 43},
            {name = "Feltzer Kahverengi", id = 94, r = 80, g = 50, b = 24},
            {name = "Akcaagac Kahverengi", id = 97, r = 101, g = 63, b = 35},
            {name = "Kayin Agaci Kahverengi", id = 103, r = 70, g = 35, b = 26},
            {name = "Koyu Kahverengi", id = 104, r = 117, g = 43, b = 25},
            {name = "Semer Kahverengi", id = 98, r = 119, g = 92, b = 62},
            {name = "Yosun Kahverengi", id = 100, r = 108, g = 107, b = 75},
            {name = "Woodbeech Kahverengi", id = 102, r = 164, g = 150, b = 95},
            {name = "Hasir Kahverengi", id = 99, r = 172, g = 153, b = 117},
            {name = "Kumlu Kahverengi", id = 105, r = 191, g = 174, b = 123},
            {name = "Agartilmis Kahverengi", id = 106, r = 223, g = 213, b = 178},
            {name = "Schafter Mor", id = 71, r = 47, g = 45, b = 82},
            {name = "Yelken Mor", id = 72, r = 40, g = 44, b = 77},
            {name = "Geceyarisi Mor", id = 142, r = 12, g = 13, b = 24},
            {name = "Parlak Mor", id = 145, r = 98, g = 18, b = 118},
            {name = "Krem", id = 107, r = 247, g = 237, b = 213},
            {name = "Ice Beyaz", id = 111, r = 255, g = 255, b = 246},
            {name = "Buz Beyaz", id = 112, r = 234, g = 234, b = 234}
        }
    },
    {category = "Mat", id = 2,
        colours = {{name = "Siyah", id = 12, r = 0, g = 0, b = 0},
            {name = "Gri", id = 13, r = 38, g = 40, b = 42},
            {name = "Acik Gri", id = 14, r = 81, g = 85, b = 84},
            {name = "Ice Beyaz", id = 131, r = 252, g = 249, b = 241},
            {name = "Mavi", id = 83, r = 37, g = 58, b = 167},
            {name = "Koyu Mavi", id = 82, r = 31, g = 40, b = 82},
            {name = "Geceyarisi Mavi", id = 84, r = 28, g = 53, b = 81},
            {name = "Geceyarisi Mor", id = 149, r = 30, g = 29, b = 34},
            {name = "Schafter Mor", id = 148, r = 107, g = 31, b = 123},
            {name = "Kirmizi", id = 39, r = 207, g = 31, b = 33},
            {name = "Koyu Kirmizi", id = 40, r = 115, g = 32, b = 33},
            {name = "Turuncu", id = 41, r = 242, g = 125, b = 32},
            {name = "Sari", id = 42, r = 255, g = 201, b = 31},
            {name = "Limon Yesil", id = 55, r = 102, g = 184, b = 31},
            {name = "Yesil", id = 128, r = 78, g = 100, b = 67},
            {name = "Forest Yesil", id = 151, r = 45, g = 54, b = 42},
            {name = "Foliage Yesil", id = 155, r = 90, g = 99, b = 82},
            {name = "Zeytin Darb", id = 152, r = 105, g = 103, b = 72},
            {name = "Koyu Earth", id = 153, r = 122, g = 108, b = 85},
            {name = "Desert Tan", id = 154, r = 195, g = 180, b = 146}
        }
    },
    {category = "Materyal", id = 3,
            colours = {{name = "Fircalanmis Celik", id = 117, r = 106, g = 116, b = 124},
            {name = "Fircalanmis Siyah Celik", id = 118, r = 53, g = 65, b = 88},
            {name = "Fircalanmis Aluminyum", id = 119, r = 155, g = 160, b = 168},
            {name = "Saf Altin", id = 158, r = 122, g = 100, b = 64},
            {name = "Fircalanmis Altin", id = 159, r = 127, g = 106, b = 72},
            {name = "Krom", id = 120, r = 88, g = 112, b = 161}
        }
    }
}
