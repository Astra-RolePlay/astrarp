Config = {}

Config.Locations = {
    ["main"] = {
        label = "UwU Cafe",
        coords = vector3(-581.06, -1066.22, 22.34),
    }
}

Config.ActivePayments = {}

Config.PayPerTicket = 50  --How much per ticket given at the bank
--Config.PayPerTicket = math.random(40,60)  --Change to this to get between $40 and $60 per ticket

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.PatHeal = 2 			--how much you are healed by patting a cat, 2 hp seems resonable, enough not to be over powered and enough to draw people in.
							--set to 0 if you don't want to use this
							
Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.Items = {
    label = "Malzeme Deposu",
    slots = 11,
    items = {
        [1] = { name = "sugar", price = 0, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "flour", price = 0, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "nori", price = 0, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "tofu", price = 0, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "onion", price = 0, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "boba", price = 0, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "mint", price = 0, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "orange", price = 0, amount = 50, info = {}, type = "item", slot = 8, },
        [9] = { name = "strawberry", price = 0, amount = 50, info = {}, type = "item", slot = 9, },
        [10] = { name = "blueberry", price = 0, amount = 50, info = {}, type = "item", slot = 10, },
        [11] = { name = "milk", price = 0, amount = 50, info = {}, type = "item", slot = 11, },
        [12] = { name = "rice", price = 0, amount = 50, info = {}, type = "item", slot = 12, },
        [13] = { name = "sake", price = 0, amount = 50, info = {}, type = "item", slot = 13, },
        [14] = { name = "noodles", price = 0, amount = 50, info = {}, type = "item", slot = 14, },
    }
}

Config.Items1 = {
    label = "Oyuncak",
    slots = 8,
    items = {
        [1] = { name = "uwupurpleplush", price = 250, amount = 50, info = {}, type = "item", slot = 1, },
        [2] = { name = "uwugreenplush", price = 250, amount = 50, info = {}, type = "item", slot = 2, },
        [3] = { name = "uwublueplush", price = 250, amount = 50, info = {}, type = "item", slot = 3, },
        [4] = { name = "uwubrownplush", price = 250, amount = 50, info = {}, type = "item", slot = 4, },
        [5] = { name = "uwuyellowplush", price = 250, amount = 50, info = {}, type = "item", slot = 5, },
        [6] = { name = "uwuredplush", price = 250, amount = 50, info = {}, type = "item", slot = 6, },
        [7] = { name = "uwugreenrareplush", price = 300, amount = 50, info = {}, type = "item", slot = 7, },
        [8] = { name = "uwupinkrareplush", price = 300, amount = 50, info = {}, type = "item", slot = 8, },
    }
}