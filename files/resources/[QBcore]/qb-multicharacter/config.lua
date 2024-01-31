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
    { license = "license:xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx", numberOfChars = 2 },
}

Config.Clothing = {
    ['qb-clothing'] = false,
    ['fivem-appearance'] = true,
}
