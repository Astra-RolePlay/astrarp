local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false
local debug = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "catcafe" then
                TriggerServerEvent("QBCore:ToggleDuty")
            end
        end
    end)
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(JobInfo)
    PlayerJob = JobInfo
    onDuty = PlayerJob.onduty
end)

RegisterNetEvent('QBCore:Client:SetDuty')
AddEventHandler('QBCore:Client:SetDuty', function(duty)
    onDuty = duty
end)

Citizen.CreateThread(function() 
    catcafeblip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(catcafeblip, 89)
    SetBlipDisplay(catcafeblip, 3)
    SetBlipColour(catcafeblip, 48)
    SetBlipScale(catcafeblip, 0,5)
    SetBlipAsShortRange(catcafeblip, true)
    SetBlipScale(catcafeblip, 0.5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(catcafeblip)
end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
CreateThread(function()
	while true do
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			if onDuty and PlayerJob.Name == "catcafe" then
				if #(pos - vector3(Config.Locations["main"].coords)) >= Config.ClockOutDist then
					onDuty = not onDuty
					TriggerServerEvent("QBCore:ToggleDuty")
				end
			end
		Wait(100)
	end
end)

RegisterNetEvent('qb-uwu:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)


Citizen.CreateThread(function()
	--Toys
	exports['qb-target']:AddBoxZone("uWuSmallShops1", vector3(-585.3, -1055.29, 22.34), 2.85, 0.6, { name="uWuSmallShops1", heading = 270, debugPoly=debug, minZ=21.34, maxZ=23.54 }, 
		{ options = { {  event = "qb-uwu:Shop1", icon = "fas fa-box-open", label = "Oyuncak Deposu", job = "catcafe" }, },
		  distance = 2.0
	})

	--Clothes
	exports['qb-target']:AddBoxZone("Clothes", vector3(-585.97, -1049.93, 22.34), 2.6, 0.6, { name="Clothes", heading = 0, debugPoly=debug, minZ=21.34, maxZ = 23.54, }, 
	{ options = { { event = "qb-clothing:client:openOutfitMenu", icon = "fas fa-tshirt", label = "Kıyafet Dolabı", job = "catcafe" }, },
	  distance = 2.0
	})

	--Stashes
	exports['qb-target']:AddBoxZone("uWuPrepared", vector3(-587.37, -1059.62, 22.34), 2.4, 1.7, { name="uWuPrepared", heading = 0.0, debugPoly=debug, minZ=22.14, maxZ=22.74 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Tezgah", stash = "Tezgah3" }, },
		  distance = 1.0
	})
	
	--FRIDGE
	exports['qb-target']:AddBoxZone("uWuFridge", vector3(-588.06, -1067.1, 22.34), 3.5, 0.5, { name="uWuFridge", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-temperature-low", label = "Buzdolabı", stash = "Buzdolabi", job = "catcafe" }, },
		  distance = 1.0
	})		
	exports['qb-target']:AddBoxZone("uWuFridge2", vector3(-590.67, -1068.1, 22.34), 2.0, 0.6, { name="uWuFridge2", heading = 0, debugPoly=debug, minZ=19.84, maxZ=23.84 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-temperature-low", label = "Buzdolabı", stash = "Buzdolabi2", job = "catcafe"  }, },
		  distance = 1.0
	})
	
	--WARESTORAGE
	exports['qb-target']:AddBoxZone("uWuShop", vector3(-598.0, -1068.47, 22.34), 4.0, 1.5, { name="uWuShop", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Malzeme Deposu", job = "catcafe" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("uWuShop2", vector3(-598.25, -1065.61, 22.34), 4.0, 1.5, { name="uWuShop2", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Malzeme Deposu", job = "catcafe" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("uWuShop3", vector3(-598.31, -1062.79, 22.34), 4.0, 1.5, { name="uWuShop3", heading = 90, debugPoly=debug, minZ=20.94, maxZ=24.94 }, 
		{ options = { {  event = "qb-uwu:Shop", icon = "fas fa-box-open", label = "Malzeme Deposu", job = "catcafe" }, },
		  distance = 2.0
	})
	
	--Sinks
	exports['qb-target']:AddBoxZone("uWuWash1", vector3(-587.89, -1062.58, 22.36), 0.7, 0.7, { name="uWuWash1", heading = 0, debugPoly=debug, minZ=19.11, maxZ=23.11 }, 
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("uWuWash2", vector3(-570.23, -1051.41, 22.34), 0.5, 0.5, { name="uWuWash2", heading = 0, debugPoly=debug, minZ=21.74, maxZ=22.94, }, 
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})		
	exports['qb-target']:AddBoxZone("uWuWash3", vector3(-570.25, -1056.98, 22.34), 0.5, 0.5, { name="uWuWash3", heading = 0, debugPoly=debug, debugPoly=debug, minZ=21.74, maxZ=22.94, },
		{ options = { { event = "qb-uwu:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})
	
	--Clockin
	exports['qb-target']:AddBoxZone("uWuClockin", vector3(-594.34, -1053.35, 22.34), 3.5, 0.5, { name="uWuClockin", heading = 0, debugPoly=debug, minZ=22.19, maxZ=23.79 }, 
		{ options = { { event = "qb-uwu:toggleDuty", icon = "fas fa-user-check", label = "Mesai Gir/Çık", job = "catcafe" }, },
		  distance = 2.0
	})
	
	--Oven
	exports['qb-target']:AddBoxZone("uWuOven", vector3(-590.98, -1059.74, 22.34), 1.2, 1, { name="uWuOven", heading = 0, debugPoly=debug, minZ=19.84, maxZ = 23.84, }, 
		{ options = { { event = "qb-uwu:Menu:Oven", icon = "fas fa-temperature-high", label = "Fırın", job = "catcafe" }, },
		  distance = 2.0
	})
	
	--Hot Plates
	exports['qb-target']:AddBoxZone("uWuHotPlates", vector3(-591.09, -1056.54, 22.36), 1.05, 0.65, { name="uWuHotPlates", heading = 0, debugPoly=debug, minZ=22.11, maxZ=22.76, }, 
		{ options = { { event = "qb-uwu:Menu:Hob", icon = "fab fa-free-code-camp", label = "Ocak", job = "catcafe" }, },
		  distance = 2.0
	})

	--Trays
	exports['qb-target']:AddBoxZone("uWuCounter", vector3(-584.01, -1059.27, 22.34), 0.6, 0.6, { name="uWuCounter", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 }, 
		{ options = { { event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Tezgah", stash = "Tezgah" }, },
		  distance = 2.5
	})	
	exports['qb-target']:AddBoxZone("uWuCounter2", vector3(-584.04, -1062.05, 22.34), 0.6, 0.6, { name="uWuCounter2", heading = 0, debugPoly=debug, minZ=19.04, maxZ=23.04 }, 
		{ options = { { event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Tezgah", stash = "Tezgah2" }, },
		  distance = 2.5
	})
	
	exports['qb-target']:AddBoxZone("CatReceipt1", vector3(-584.07, -1058.69, 22.34), 0.5, 0.5, { name="CatReceipt1", heading = 0, debugPoly=debug, minZ = 19.04, maxZ = 23.04, }, 
		{ options = { { event = "qb-uwu:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "catcafe" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("CatReceipt2", vector3(-584.09, -1061.47, 22.34), 0.5, 0.5, { name="CatReceipt2", heading = 0, debugPoly=debug, minZ = 19.04, maxZ = 23.04, }, 
		{ options = { { event = "qb-uwu:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "catcafe" }, },
		  distance = 2.0
	})	
	--Coffee
	exports['qb-target']:AddBoxZone("uWuCoffee", vector3(-586.8, -1061.89, 22.34), 0.7, 0.5, { name="uWuCoffee", heading = 0, debugPoly=debug, minZ=21.99, maxZ=23.19 }, 
		{ options = { { event = "qb-uwu:Menu:Coffee", icon = "fas fa-mug-hot", label = "Kahve Makinesi", job = "catcafe" }, },
		  distance = 2.0
	})
	--Chopping Board
	exports['qb-target']:AddBoxZone("uWuBoard", vector3(-591.12, -1063.07, 22.34), 0.7, 0.5, { name="uWuBoard", heading = 0, debugPoly=debug, minZ=22.29, maxZ=22.49, }, 
		{ options = { { event = "qb-uwu:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Sandwich Hazırla", job = "catcafe" }, },
		  distance = 2.0
	})
	--Tables
	exports['qb-target']:AddBoxZone("uWuTable", vector3(-573.43, -1059.76, 22.49), 1.9, 1.0, { name="uWuTable", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Masa", stash = "Masa_1" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable2", vector3(-573.44, -1063.45, 22.34), 1.9, 1.0, { name="uWuTable2", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Masa", stash = "Masa_2" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable3", vector3(-573.41, -1067.09, 22.49), 1.9, 1.0, { name="uWuTable3", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Masa", stash = "Masa_3" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable4", vector3(-578.68, -1051.09, 22.35), 1.2, 0.9, { name="uWuTable4", heading = 91.0, debugPoly=debug, minZ=21.49, maxZ=22.89 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Masa", stash = "Masa_4" }, },
		  distance = 2.5
	})
	exports['qb-target']:AddBoxZone("uWuTable5", vector3(-586.89, -1065.72, 22.34), 0.65, 0.55, { name="uWuTable5", heading = 0, debugPoly=debug, minZ=22.29, maxZ=22.54 }, 
		{ options = { {  event = "qb-uwu:Stash", icon = "fas fa-coffee", label = "Masa", stash = "Masa_5" }, },
		  distance = 2.5
	})

	exports['qb-target']:AddBoxZone("CatBank", vector3(251.75, 222.17, 106.2), 0.6, 2.0, { name="CatBank", heading = 340.0, debugPoly=debug, minZ = 105.75, maxZ = 107.29, }, 
		{ options = { { type = "server", event = "qb-uwu:Tickets:Sell", icon = "fas fa-receipt", label = "Fiş'i Uzat", job = "catcafe" }, },
		  distance = 2.0
	})
	
end)

RegisterNetEvent('qb-uwu:washHands')
AddEventHandler('qb-uwu:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Ellerini Yıkıyorsun.', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "Ellerini Yıkadın!", 'success')
	end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi", 'error')
    end)
end)


RegisterNetEvent('qb-uwu:MakeItem')
AddEventHandler('qb-uwu:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else
		--Chopping Board
		if data.item == "bmochi" or data.item == "gmochi" or data.item == "omochi" or data.item == "pmochi" or data.item == "riceball" or data.item == "bento" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin.", 'error') else FoodProgress(data.item) end		
			end)
		--Oven
		elseif data.item == "nekocookie" or data.item == "nekodonut" or data.item == "cake" or data.item == "miso" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin.", 'error') else FoodProgress(data.item) end		
			end)
		--Drinks
		elseif data.item == "bobatea" or data.item == "bbobatea" or data.item == "gbobatea" or data.item == "pbobatea" or data.item == "obobatea" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin.", 'error') else FoodProgress(data.item) end		
			end)
		--Version 1.1 items
		elseif data.item == "cakepop" or data.item == "pizza" or data.item == "pancake" or data.item == "purrito" or data.item == "mocha" or data.item == "noodlebowl" or data.item == "ramen" then
			QBCore.Functions.TriggerCallback('qb-uwu:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin.", 'error') else FoodProgress(data.item) end		
			end)
		end
	end
end)

RegisterNetEvent('qb-uwu:Stash')
AddEventHandler('qb-uwu:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "UwUCafe_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "UwUCafe_"..id)
end)

RegisterNetEvent('qb-uwu:Shop')
AddEventHandler('qb-uwu:Shop',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else TriggerServerEvent("inventory:server:OpenInventory", "shop", "catcafe", Config.Items)	end
end)

RegisterNetEvent('qb-uwu:Shop1')
AddEventHandler('qb-uwu:Shop1',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else TriggerServerEvent("inventory:server:OpenInventory", "shop", "uWuShop1", Config.Items1)	end
end)


-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "purrito" or ItemMake == "bmochi" or ItemMake == "pmochi" or ItemMake == "gmochi" or ItemMake == "omochi" or ItemMake == "riceball" or ItemMake == "bento" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif ItemMake == "cakepop" or ItemMake == "pancake" or ItemMake == "pizza" or ItemMake == "nekocookie" or ItemMake == "nekodonut" or ItemMake == "cake" or ItemMake == "miso" or ItemMake == "noodlebowl" or ItemMake == "ramen" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif ItemMake == "mocha" or ItemMake == "coffee" or ItemMake == "nekolatte" or ItemMake == "obobatea" or ItemMake == "pbobatea" or ItemMake == "gbobatea" or ItemMake == "bbobatea" or ItemMake == "bobatea" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true, --
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = 8,
	}, {}, {}, function()  
		TriggerServerEvent('qb-uwu:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi!", 'error')
	end)
end

-- // Utilities \\ 

RegisterNetEvent('qb-uwu:Ticket:Menu', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "henhouse Payment", txt = "Do you want trade your tickets for payment?" },
        { header = "Yes", server = true, params = { event = "qb-uwu:Tickets:Sell" } },
        { header = "No", event = "qb-uwu:Tickets:Sell:no" },
    })
end)

RegisterNetEvent('qb-uwu:Menu:ChoppingBoard', function()
    exports['qb-menu']:openMenu({
		{ header = "Kesme Tahtası", isMenuHeader = true },
        { header = "Mavi Mochi", txt = "Şeker - Un - Yaban Mersini", params = { event = "qb-uwu:MakeItem", args = { item = 'bmochi' } } },
        { header = "Yeşil Mochi", txt = "Şeker - Un - Matcha", params = { event = "qb-uwu:MakeItem", args = { item = 'gmochi' } } },
        { header = "Turuncu Mochi", txt = "Şeker - Un - Portakal", params = { event = "qb-uwu:MakeItem", args = { item = 'omochi' } } },
        { header = "Pembe Mochi", txt = "Şeker - Un - Çilek", params = { event = "qb-uwu:MakeItem", args = { item = 'pmochi' } } },
        { header = "Neko Onigiri", txt = "Pirinç - Yosun", params = { event = "qb-uwu:MakeItem", args = { item = 'riceball' } } },
        { header = "Bento Kutusu", txt = "Pirinç - Yosun - Tofu", params = { event = "qb-uwu:MakeItem", args = { item = 'bento' } } },
        { header = "Kruvasan", txt = "Un - Pirinç - Soğan", params = { event = "qb-uwu:MakeItem", args = { item = 'purrito' } } },
	})
end)

RegisterNetEvent('qb-uwu:Menu:Oven', function()
    exports['qb-menu']:openMenu({
		{ header = "Yemek Menüsü", isMenuHeader = true },
        { header = "Neko Kurabiyesi", txt = "Un - Süt", params = { event = "qb-uwu:MakeItem", args = { item = 'nekocookie' } } },
        { header = "Neko Donut", txt = "Un - Süt", params = { event = "qb-uwu:MakeItem", args = { item = 'nekodonut' } } },
        { header = "Çilekli Pasta", txt = "Un - Süt - Çilek", params = { event = "qb-uwu:MakeItem", args = { item = 'cake' } } },
        { header = "Kedi Desenli Kapkek", txt = "Un - Süt - Şeker", params = { event = "qb-uwu:MakeItem", args = { item = 'cakepop' } } },
        { header = "Pawkek", txt = "Un - Süt - Çilek", params = { event = "qb-uwu:MakeItem", args = { item = 'pancake' } } },
        { header = "Pizza", txt = "Un - Süt", params = { event = "qb-uwu:MakeItem", args = { item = 'pizza' } } },
    })
end)

RegisterNetEvent('qb-uwu:Menu:Coffee', function()
    exports['qb-menu']:openMenu({
		{ header = "İçecek Menüsü", isMenuHeader = true },
        { header = "Kahve", txt = "Malzeme Yok", params = { event = "qb-uwu:JustGive", args = { item = 'coffee' } } },
        { header = "Neko Latte", txt = "Malzeme Yok", params = { event = "qb-uwu:JustGive", args = { item = 'nekolatte' } } },
        { header = "Boba Tea", txt = "Jelibon - Süt", params = { event = "qb-uwu:MakeItem", args = { item = 'bobatea' } } },
        { header = "Mavi Boba Tea", txt = "Jelibon - Süt - Yaban Mersini", params = { event = "qb-uwu:MakeItem", args = { item = 'bbobatea' } } },
        { header = "Yeşil Boba Tea", txt = "Jelibon - Süt - Matcha", params = { event = "qb-uwu:MakeItem", args = { item = 'gbobatea' } } },
        { header = "Pembe Boba Tea", txt = "Jelibon - Süt - Çilek", params = { event = "qb-uwu:MakeItem", args = { item = 'pbobatea' } } },
        { header = "Turuncu Boba Tea", txt = "Jelibon - Süt - Portakal", params = { event = "qb-uwu:MakeItem", args = { item = 'obobatea' } } },
        { header = "Mocha Meow", txt = "Milk - Şeker", params = { event = "qb-uwu:MakeItem", args = { item = 'mocha' } } },
    })
end)

RegisterNetEvent('qb-uwu:Menu:Hob', function()
    exports['qb-menu']:openMenu({
		{ header = "Ocak Menüsü", isMenuHeader = true },
        { header = "Miso Çorbası", txt = "Yosun - Tofu - Soğan", params = { event = "qb-uwu:MakeItem", args = { item = 'miso' } } },
        { header = "Kase Erişte", txt = "Hazır Erişte", params = { event = "qb-uwu:MakeItem", args = { item = 'noodlebowl' } } },
        { header = "Kase Ramen", txt = "Hazır Erişte - Soğan", params = { event = "qb-uwu:MakeItem", args = { item = 'ramen' } } },
    })
end)



RegisterNetEvent('qb-uwu:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else FoodProgress(data.item) end end)

RegisterNetEvent('qb-uwu:client:Charge', function()
	if not onDuty then TriggerEvent("QBCore:Notify", "Mesai\'de Değilsin!", "error") return end
    local dialog = exports['qb-input']:ShowInput({
        header = "Müşteriden Ücret Al",
        submitText = "Gönder",
        inputs = {
            { type = 'number', isRequired = true, name = 'citizen', text = 'Vatandaş ID' },
            { type = 'number', isRequired = true, name = 'price', text = 'Ücret' },
        }
    })
    if dialog then
        if not dialog.citizen or not dialog.price then return end
        TriggerServerEvent('qb-uwu:server:Charge', dialog.citizen, dialog.price)
    end
end)