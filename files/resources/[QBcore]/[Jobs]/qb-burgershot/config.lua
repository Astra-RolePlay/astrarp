Config = {}

Config.Locations = { ["main"] = { label = "BurgerShot", coords = vector3(-1195.53, -893.31, 13.98 ) }, }

--Info To load depends on chosen MLO's

Config.MLO = "GN"       --use "LP" if you are using Smallo's burgershot MLO
						--use "GN" if you are using GNMods burgershot MLO
						
Config.PayPerTicket = 50  --How much per ticket given at the bank

Config.ClockOutDist = 25 --25 Seems about fair, just outside the boundaries of the building

Config.MinAmountforTicket = 50 --Change this to your cheapest product price

Config.Items = {
    label = "Buzdolabı",
    slots = 20,
    items = { 
        [1] = { name = 'burgerpatty', price = 0, amount = 200, info = {}, type = 'item', slot = 1, },
        [2] = { name = 'potato', price = 0, amount = 200, info = {}, type = 'item', slot = 2, },
        [3] = { name = 'onion', price = 0, amount = 200, info = {}, type = 'item', slot = 3, },
        [4] = { name = 'frozennugget', price = 0, amount = 200, info = {}, type = 'item', slot = 4, },
        [5] = { name = 'milk', price = 0, amount = 200, info = {}, type = 'item', slot = 5, }, 
        [6] = { name = 'icecream', price = 0, amount = 200, info = {}, type = 'item', slot = 6, },
        [7] = { name = 'burgerbun', price = 0, amount = 200, info = {}, type = 'item', slot = 7, },
        [8] = { name = 'cheddar', price = 0, amount = 200, info = {}, type = 'item', slot = 8, },
        [9] = { name = 'lettuce', price = 0, amount = 200, info = {}, type = 'item', slot = 9, },
    },
}

Config.LPJobLocations = {
	--BurgerClockin
	{ location = vector3(-1193.18, -898.13, 14.2), heading = 35.0, width = 0.6, height = 2.5, minZ = 14.2, maxZ = 15.2, distance = 1.5, label = "Toggle Duty", icon = "fas fa-user-check", event = "qb-burgershot:toggleDuty", eventID = "" },
	--Burgershelf
	{ location = vector3(-1197.75, -894.31, 14.19), heading = 123.65, width = 1.1, height = 4.5, minZ = 13.0, maxZ = 14.9, distance = 2.0, label = "Open Shelves", icon = "fas fa-box-open", event = "qb-burgershot:Stash", eventID = "Shelf" },
	--Burgerfridge
	{ location = vector3(-1203.9, -889.75, 13.99), heading = 215.0, width = 1.2, height = 1.6, minZ = 13.0, maxZ = 14.5, distance = 1.5, label = "Open Fridge", icon = "fas fa-temperature-low", event = "qb-burgershot:Stash", eventID = "Fridge" },
	--BurgerStore
	{ location = vector3(-1205.75, -892.99, 13.99), heading = 122.65, width = 1.0, height = 4.5, minZ = 13.2, maxZ = 15.5, distance = 1.5, label = "Open Storage", icon = "fas fa-temperature-low", event = "qb-burgershot:shop", eventID = "" },
	--BurgerGrill
	{ location = vector3(-1200.27, -900.76, 14.0), heading = 123.65, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Burger Grill", icon = "fas fa-fire", event = "qb-burgershot:Menu:Grill", eventID = "" },
	--BurgerGrill
	{ location = vector3(-1202.64, -897.27, 14.0), heading = 122.65, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Burger Grill", icon = "fas fa-fire", event = "qb-burgershot:Menu:Grill", eventID = "" },
	--BurgerFryer
	{ location = vector3(-1201.4, -898.98, 13.98), heading = 123.65, width = 0.7, height = 2.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Deep Fryer", icon = "fas fa-temperature-high", event = "qb-burgershot:Menu:Fryer", eventID = "" },
	--BurgerChoppingBoard
	{ location = vector3(-1199.38, -902.07, 14.0), heading = 123.65, width = 0.6, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Use Chopping Board", icon = "fas fa-utensils", event = "qb-burgershot:Menu:ChopBoard", eventID = "" },
	--BurgerPrepare
	{ location = vector3(-1198.37, -898.36, 13.98), heading = 123.65, width = 1.8, height = 3.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Prepare Food", icon = "fas fa-hamburger", event = "qb-burgershot:Menu:Prepare", eventID = "" },
	--BurgerDrink
	{ location = vector3(-1199.47, -895.44, 13.9953), heading = 122.65, width = 0.6, height = 1.7, minZ = 13.3, maxZ = 15.0, distance = 1.5, label = "Prepare Drinks", icon = "fas fa-mug-hot", event = "qb-burgershot:Menu:Drink", eventID = "" },
	--BurgerDonut
	{ location = vector3(-1203.35, -895.66, 13.9952), heading = 122.65, width = 0.7, height = 1.0, minZ = 13.3, maxZ = 14.8, distance = 1.5, label = "Open Cabinet", icon = "fas fa-dot-circle", event = "qb-burgershot:Menu:Cabinet", eventID = "" },
}

Config.LPLocations = {
	--Tray 1
	{ location = vector3(-1196.3, -890.7, 14.0), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray1" },
	--Tray 2
	{ location = vector3(-1195.0, -892.68, 14.0), heading = 215.0, width = 0.6, height = 1.1, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray2" },
	--Tray 3
	{ location = vector3(-1193.86, -894.4, 14.0), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Open Tray", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray3" },
	
	--Handwash1
	{ location = vector3(-1197.12, -902.07, 13.98), heading = 215.0, width = 1.0, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash2
	{ location = vector3(-1198.23, -902.78, 13.98), heading = 215.65, width = 1.1, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash3
	{ location = vector3(-1200.7, -888.98, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.2, maxZ = 14.6, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash4
	{ location = vector3(-1198.57, -887.54, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.2, maxZ = 14.6, distance = 2.0, label = "Wash Your Hands", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },}




Config.GNJobLocations = {
	--BurgerClockin
	{ location = vector3(-1186.42, -898.41, 13.97), heading = 34, width = 0.25, height = 1.2, minZ = 13.97, maxZ = 15.22, distance = 1.5, label = "Mesai Gir/Çık", icon = "fas fa-user-check", event = "qb-burgershot:toggleDuty", eventID = "" },
	--BurgerGrill
	{ location = vector3(-1198.27, -895.3, 14.0), heading = 34.93, width = 0.7, height = 1.2, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Izgara", icon = "fas fa-fire", event = "qb-burgershot:Menu:Grill", eventID = "" },
	--BurgerChoppingBoard
	{ location = vector3(-1197.19, -898.18, 14.0), heading = 213.93, width = 0.6, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Kesme Tahtası", icon = "fas fa-utensils", event = "qb-burgershot:Menu:ChopBoard", eventID = "" },
	--BurgerPrepare
	{ location = vector3(-1196.54, -899.28, 13.98), heading = 34.93, width = 0.6, height = 1.5, minZ = 13.3, maxZ = 14.5, distance = 1.5, label = "Yiyecek Hazırla", icon = "fas fa-hamburger", event = "qb-burgershot:Menu:Prepare", eventID = "" },
	--BurgerStore
	{ location = vector3(-1198.5, -904.02, 13.97), heading = 213.65, width = 0.4, height = 1.4, minZ = 12.97, maxZ = 15.37, distance = 1.5, label = "Dondurucu", icon = "fas fa-temperature-low", event = "qb-burgershot:shop", eventID = "" },
	--Burgerfridge
	{ location = vector3(-1201.31, -901.69, 13.97), heading = 35.0, width = 3.8, height = 0.6, minZ = 13.0, maxZ = 15.37, distance = 1.5, label = "Buzdolabı", icon = "fas fa-temperature-low", event = "qb-burgershot:Stash", eventID = "Fridge" },
	--BurgerFryer
	{ location = vector3(-1200.85, -896.84, 13.97), heading = 34.0, width = 0.6, height = 1.6, minZ = 12.97, maxZ = 14.57, distance = 1.5, label = "Fritöz", icon = "fas fa-temperature-high", event = "qb-burgershot:Menu:Fryer", eventID = "" },
	--Burgershelf
	{ location = vector3(-1195.29, -897.51, 13.97), heading = 35, width = 3.0, height = 1.0, minZ = 13.17, maxZ = 14.77, distance = 2.0, label = "Raf", icon = "fas fa-box-open", event = "qb-burgershot:Stash", eventID = "Shelf" },
	--BurgerDrink
	{ location = vector3(-1197.25, -894.48, 13.97), heading = 35.0, width = 2.0, height = 0.6, minZ = 13.97, maxZ = 14.97, distance = 1.5, label = "İçecek Makinesi", icon = "fas fa-mug-hot", event = "qb-burgershot:Menu:Drink", eventID = "" },
	--BurgerDonut
	{ location = vector3(-1196.52, -895.74, 13.97), heading = 35.0, width = 0.8, height = 0.6, minZ = 13.97, maxZ = 15.17, distance = 1.5, label = "Dolap", icon = "fas fa-dot-circle", event = "qb-burgershot:Menu:Cabinet", eventID = "" },
}

Config.GNLocations = {
	--Tray 1
	{ location = vector3(-1194.29, -893.85, 14.2), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Tezgah", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray1" },
	--Tray 2
	{ location = vector3(-1193.39, -895.42, 14.2), heading = 215.0, width = 0.6, height = 1.1, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Tezgah", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray2" },
	--Tray 3
	{ location = vector3(-1192.39, -896.86, 14.2), heading = 215.0, width = 0.6, height = 1.0, minZ = 13.5, maxZ = 14.8, distance = 2.0, label = "Tezgah", icon = "fas fa-hamburger", event = "qb-burgershot:Stash", eventID = "Tray3" },

	--Handwash1
	{ location = vector3(-1197.61, -902.73, 13.98), heading = 300.0, width = 0.6, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Ellerini Yıka", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash2
	{ location = vector3(-1205.24, -893.9, 13.98), heading = 122.65, width = 0.6, height = 0.8, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Ellerini Yıka", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash3
	{ location = vector3(-1206.01, -892.84, 13.98), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Ellerini Yıka", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash4
	{ location = vector3(-1201.96, -890.09, 13.98), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Ellerini Yıka", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
	--Handwash5
	{ location = vector3(-1201.16, -891.14, 13.98), heading = 122.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.0, label = "Ellerini Yıka", icon = "fas fa-hand-holding-water", event = "qb-burgershot:washHands", eventID = "" },
}

