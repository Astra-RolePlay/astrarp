Config = {}

Config.Locations = { ["main"] = { label = "Pizza This", coords = vector3(806.97, -759.59, 26.78) } }

Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.DrinkItems = {
    label = "İçecek Dolabı",
    slots = 5,
    items = {
        [1] = { name = "vodka", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "sprunk", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "sprunklight", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "ecola", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "ecolalight", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
    }
}

Config.FoodItems = {
    label = "Buzdolabı",
    slots = 7,
    items = {
        [1] = { name = "sauce", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "pasta", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "olives", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "basil", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "mozz", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "lettuce", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "pizzmushrooms", price = 0, amount = 50, info = {}, type = "item", slot = 7, },	
        [8] = { name = "tiramisu", price = 0, amount = 50, info = {}, type = "item", slot = 8, },	
        [9] = { name = "gelato", price = 0, amount = 50, info = {}, type = "item", slot = 9, },	
        [10] = { name = "medfruits", price = 0, amount = 50, info = {}, type = "item", slot = 10, },	
    }
}

Config.FreezerItems = {
    label = "Dondurucu",
    slots = 2,
    items = {
        [1] = { name = "meat", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "squid", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
    }
}