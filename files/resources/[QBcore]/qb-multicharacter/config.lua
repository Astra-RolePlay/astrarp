Config = {}
Config.StartingApartment = false
Config.Interior = vector3(-814.89, 181.95, 76.85)            -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86)     -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(402.88, -996.33, -99.0, 181.79)   -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(403.5, -983.65, -99.0, 231.54) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(402.87, -997.50, -98.5, 0.0)      -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true                             -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 1                         -- Define maximum amount of default characters (maximum 5 characters defined by default)
Config.PlayersNumberOfCharacters = {                         -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:1b08d417a013b97236eb4941ed577c2aa22f4973", numberOfChars = 5 }, -- Ulaş
    { license = "license:52b101e073da3b76bb2218931ce6fb5e38c2bd69", numberOfChars = 2 },    
    { license = "license:64038a7810c56288850ab0e5cc75768c0b817337", numberOfChars = 5 }, -- Kyrien Emre
    { license = "license:579c4cc24ed4bb55b371e0fd1d553aa624337fd6", numberOfChars = 5 }, --Zeki Slaugh
}

Config.Clothing = {
    ['qb-clothing'] = false,
    ['fivem-appearance'] = true,
}
