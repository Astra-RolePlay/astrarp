local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}

local onDuty = false
local alcoholCount = 0

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "pizzathis" then
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

CreateThread(function()
    Blip = AddBlipForCoord(Config.Locations["main"].coords)
    SetBlipSprite(Blip, 267)
    SetBlipDisplay(Blip, 3)
    SetBlipColour(Blip, 6)
    SetBlipScale(Blip, 0.6)
    SetBlipAsShortRange(Blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(Blip)
end)

--Distance Check for if player is too far away, so they don't keep getting tickets for sales while at other side of the planet.
CreateThread(function()
	while true do
			local ped = PlayerPedId()
			local pos = GetEntityCoords(ped)
			if PlayerJob.name == "pizzathis" and onDuty then
				if #(pos - Config.Locations["main"].coords) >= Config.ClockOutDist then
					TriggerEvent("qb-pizzathis:toggleDuty")
				end
			end
		Wait(100)
	end
end)

CreateThread(function()
	-- Quick Prop Changes
	if box == nil then
		RequestModel(604847691)
		Wait(100)
		local box = CreateObject(604847691,810.94, -749.94, 28.03-1.0,false,false,false)
		SetEntityHeading(box,GetEntityHeading(box)-150)
		FreezeEntityPosition(box, true)
	end
	if box2 == nil then
		RequestModel(-856584171)
		Wait(100)
		local box2 = CreateObject(-856584171,810.98, -752.89, 28.03-1.0,false,false,false)
		SetEntityHeading(box2,GetEntityHeading(box2)-80)
		FreezeEntityPosition(box2, true)
	end
	if clockin == nil then
		RequestModel(502084445)
		Wait(100)
		local clockin = CreateObject(502084445,807.07, -761.83, 31.27,false,false,false)
		SetEntityHeading(clockin,GetEntityHeading(clockin)-270)
		FreezeEntityPosition(clockin, true)
	end
end)

CreateThread(function()
--Stashes
	local debug = false
	exports['qb-target']:AddBoxZone("PizzTray", vector3(811.94, -755.57, 26.78), 0.6, 1.6, { name="PizzTray", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { {  event = "qb-pizzathis:Stash", icon = "fas fa-box-open", label = "Malzeme Tepsisi", stash = "Soslar", job = "pizzathis" }, },
		  distance = 1.0
	})	
	exports['qb-target']:AddBoxZone("PizzBase", vector3(811.42, -754.55, 26.78), 0.4, 0.4, { name="PizzBase", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.18, }, 
		{ options = { {  event = "qb-pizzathis:Menu:PizzaBase", icon = "fas fa-pizza-slice", label = "Pizzayı Hazırla", job = "pizzathis" }, },
		  distance = 1.0
	})	
	exports['qb-target']:AddBoxZone("PizzDough", vector3(806.98, -757.05, 26.78), 1.2, 3.2, { name="PizzDough", heading = 0.0, debugPoly=debug, minZ = 25.78, maxZ = 27.58, }, 
		{ options = { {  event = "qb-pizzathis:JustGive", icon = "fas fa-cookie", label = "Hamur Hazırla", job = "pizzathis", id = "pizzadough" }, },
		  distance = 1.0
	})	
	exports['qb-target']:AddBoxZone("PizzOven", vector3(808.28, -761.19, 26.78), 2.8, 0.7, { name="PizzOven", heading = 0.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "qb-pizzathis:Menu:Oven", icon = "fas fa-temperature-high", label = "Fırın", job = "pizzathis" }, },
		  distance = 1.0
	})
	exports['qb-target']:AddBoxZone("PizzChop", vector3(810.45, -765.17, 26.78), 0.6, 0.6, { name="PizzChop", heading = 0.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "qb-pizzathis:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Doğrama Tahtası", job = "pizzathis" }, },
		  distance = 1.0
	})	
	exports['qb-target']:AddBoxZone("PizzChop2", vector3(809.26, -761.19, 26.78), 0.55, 0.4, { name="PizzChop2", heading = 10.0, debugPoly=debug, minZ = 26.18, maxZ = 27.38, }, 
		{ options = { {  event = "qb-pizzathis:Menu:ChoppingBoard", icon = "fas fa-utensils", label = "Doğrama Tahtası", job = "pizzathis" }, },
		  distance = 1.0
	})
	exports['qb-target']:AddBoxZone("PizzBurner", vector3(814.05, -752.89, 26.78), 2.4, 1.2, { name="PizzBurner", heading = 0.0, debugPoly=debug, minZ = 25.98, maxZ = 27.98, }, 
		{ options = { {  event = "qb-pizzathis:Menu:PizzaOven", icon = "fas fa-temperature-high", label = "Taş Fırın", job = "pizzathis" }, },
		  distance = 1.0
	})
	exports['qb-target']:AddBoxZone("PizzWine", vector3(809.34, -761.84, 22.3), 0.4, 1.7, { name="PizzWine", heading = 0.0, debugPoly=debug, minZ = 21.3, maxZ = 22.9, }, 
		{ options = { {  event = "qb-pizzathis:Menu:Wine", icon = "fas fa-wine-bottle", label = "Şarap Rafı", job = "pizzathis" }, },
		  distance = 1.0
	})	
	exports['qb-target']:AddBoxZone("PizzWine2", vector3(807.25, -761.79, 22.3), 0.4, 1.7, { name="PizzWine", heading = 0.0, debugPoly=debug, minZ = 21.3, maxZ = 22.9, }, 
		{ options = { {  event = "qb-pizzathis:Menu:Wine", icon = "fas fa-wine-bottle", label = "Şarap Rafı", job = "pizzathis" }, },
		  distance = 1.0
	})
	

	
	exports['qb-target']:AddBoxZone("PizzFridge", vector3(814.09, -750.07, 26.78), 0.6, 0.6, { name="PizzFridge", heading = 0.0, debugPoly=debug, minZ=25.98, maxZ=26.83 }, 
		{ options = { {  event = "qb-pizzathis:Shop", icon = "fas fa-archive", label = "İçecek Dolabı", shop = 1, job = "pizzathis" }, },
		  distance = 1.5
	})	
	exports['qb-target']:AddBoxZone("PizzFridge2", vector3(814.07, -748.64, 26.78), 0.6, 0.6, { name="PizzFridge2", heading = 0.0, debugPoly=debug, minZ=25.98, maxZ=26.83 }, 
		{ options = { {  event = "qb-pizzathis:Shop", icon = "fas fa-archive", label = "İçecek Dolabı", shop = 1, job = "pizzathis" }, },
		  distance = 1.5
	})	
	exports['qb-target']:AddBoxZone("PizzFridge3", vector3(805.68, -761.62, 26.78), 1.6, 0.6, { name="PizzFridge3", heading = 0.0, debugPoly=debug, minZ = 25.98, maxZ = 28.18, }, 
		{ options = { {  event = "qb-pizzathis:Shop", icon = "fas fa-temperature-low", label = "Buzdolabı", shop = 2, job = "pizzathis" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzFreezer", vector3(802.75, -756.85, 26.78), 0.6, 4.0, { name="PizzFreezer", heading = 0.0, debugPoly=debug, minZ = 25.78, maxZ = 28.58, }, 
		{ options = { {  event = "qb-pizzathis:Shop", icon = "fas fa-temperature-low", label = "Dondurucu", shop = 3, job = "pizzathis" }, },
		  distance = 1.0
	})
		
	
	exports['qb-target']:AddBoxZone("PizzWash1", vector3(809.47, -765.19, 26.78), 0.6, 0.8, { name="PizzWash1", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka", }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("PizzWash2", vector3(809.25, -760.15, 26.78), 0.8, 0.6, { name="PizzWash2", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("PizzWash3", vector3(813.35, -755.46, 26.78), 0.4, 0.8, { name="PizzWash3", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})
	exports['qb-target']:AddBoxZone("PizzWash4", vector3(800.88, -767.88, 26.78), 0.8, 0.6, { name="PizzWash4", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka", job = "pizzathis" }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("PizzWash5", vector3(800.85, -767.07, 26.78), 0.8, 0.6, { name="PizzWash5", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.5
	})		
	exports['qb-target']:AddBoxZone("PizzWash6", vector3(800.85, -761.18, 26.78), 0.8, 0.6, { name="PizzWash6", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})	
	exports['qb-target']:AddBoxZone("PizzWash7", vector3(800.89, -762.04, 26.78), 0.8, 0.6, { name="PizzWash7", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.38, }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})
	exports['qb-target']:AddBoxZone("PizzWash8", vector3(809.9, -765.32, 31.27), 0.6, 0.6, { name="PizzWash8", heading = 0.0, debugPoly=debug, minZ=30.67, maxZ=31.67 }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})
	exports['qb-target']:AddBoxZone("PizzWash9", vector3(808.91, -765.34, 31.27), 0.6, 0.6, { name="PizzWash9", heading = 0.0, debugPoly=debug, minZ=30.67, maxZ=31.67 }, 
		{ options = { { event = "qb-pizzathis:washHands", icon = "fas fa-hand-holding-water", label = "Ellerini Yıka" }, },
		  distance = 1.2
	})
	
	
	exports['qb-target']:AddBoxZone("PizzCounter", vector3(810.98, -752.9, 26.78), 0.6, 0.6, { name="PizzCounter", heading = 9.0, debugPoly=debug, minZ = 26.78, maxZ = 27.58, }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Tezgah", stash = "Tezgah_1" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("PizzCounter2", vector3(810.93, -749.92, 26.78), 0.7, 0.7, { name="PizzCounter2", heading = 30.0, debugPoly=debug, minZ = 26.78, maxZ = 27.58, }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Tezgah", stash = "Tezgah_1" }, },
		  distance = 2.0
	})
	exports['qb-target']:AddBoxZone("PizzReceipt", vector3(811.32, -750.77, 26.78), 0.7, 0.35, { name="PizzReceipt", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.18, }, 
		{ options = { { event = "qb-pizzathis:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "pizzathis" } },
		  distance = 2.0
	})		
	exports['qb-target']:AddBoxZone("PizzReceipt2", vector3(811.29, -752.09, 26.78), 0.7, 0.35, { name="PizzReceipt2", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.18, }, 
		{ options = { { event = "qb-pizzathis:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "pizzathis" } },
		  distance = 2.0
	})		

	exports['qb-target']:AddBoxZone("PizzTap", vector3(814.14, -749.35, 26.78), 0.9, 0.6, { name="PizzTap", heading = 0.0, debugPoly=debug, minZ = 26.78, maxZ = 27.48, }, 
		{ options = { { event = "qb-pizzathis:Menu:Beer", icon = "fas fa-beer", label = "Bira Doldur", job = "pizzathis" }, },
		  distance = 1.5
	})	
	exports['qb-target']:AddBoxZone("PizzCoffee", vector3(808.78, -765.35, 26.78), 0.6, 0.6, { name="PizzCoffee", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { { event = "qb-pizzathis:JustGive", icon = "fas fa-mug-hot", label = "Kahve Hazırla", job = "pizzathis", id = "coffee"}, },
		  distance = 2.0
	})				
	exports['qb-target']:AddBoxZone("PizzCoffee2", vector3(811.49, -764.82, 26.78), 1.6, 0.63, { name="PizzCoffee2", heading = 0.0, debugPoly=debug, minZ = 26.58, maxZ = 27.58, }, 
		{ options = { { event = "qb-pizzathis:JustGive", icon = "fas fa-mug-hot", label = "Kahve Hazırla", job = "pizzathis", id = "coffee"}, },
		  distance = 2.0
	})			
	exports['qb-target']:AddBoxZone("PizzClockin", vector3(807.15, -761.83, 31.27), 1.2, 0.2, { name="PizzClockin", heading = 0.0, debugPoly=debug, minZ = 31.27, maxZ = 32.52, }, 
		{ options = { { event = "qb-pizzathis:toggleDuty", icon = "fas fa-user-check", label = "Mesai Gir/Çık", job = "pizzathis" }, },
		  distance = 2.0
	})				
	exports['qb-target']:AddBoxZone("PizzClockin2", vector3(804.44, -760.52, 31.27), 0.4, 0.4, { name="PizzClockin2", heading = 0.0, debugPoly=debug, minZ = 30.87, maxZ = 31.67, }, 
		{ options = { { event = "qb-pizzathis:toggleDuty", icon = "fas fa-user-check", label = "Mesai Gir/Çık", job = "pizzathis" }, },
		  distance = 2.0
	})
	
	
	exports['qb-target']:AddBoxZone("PizzTable", vector3(807.08, -751.57, 26.78), 1.0, 1.0, { name="PizzTable", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table1" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable2", vector3(803.13, -751.59, 26.78), 1.0, 1.0, { name="PizzTable2", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table2" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable3", vector3(799.13, -751.57, 26.78), 1.0, 1.0, { name="PizzTable3", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table3" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable4", vector3(797.96, -748.86, 26.78), 1.0, 1.0, { name="PizzTable4", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table4" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable5", vector3(795.25, -751.55, 26.78), 1.0, 1.0, { name="PizzTable5", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table5" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable6", vector3(799.46, -755.04, 26.78), 1.0, 1.0, { name="PizzTable6", heading = 9.0, debugPoly=debug, minZ=25.98, maxZ=27.18 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table6" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable7", vector3(807.71, -754.9, 26.78), 2.0, 0.8, { name="PizzTable7", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table7" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable8", vector3(805.61, -754.89, 26.78), 2.0, 0.8, { name="PizzTable8", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table8" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable9", vector3(803.51, -754.9, 26.78), 2.0, 0.8, { name="PizzTable9", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table9" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable10", vector3(801.42, -754.93, 26.78), 2.0, 0.8, { name="PizzTable10", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table10" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable11", vector3(799.32, -757.63, 26.78), 0.8, 1.4, { name="PizzTable11", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table11" }, },
		  distance = 2.0
	})	
	exports['qb-target']:AddBoxZone("PizzTable12", vector3(799.32, -759.72, 26.78), 0.8, 1.4, { name="PizzTable12", heading = 9.0, debugPoly=debug, minZ=26.18, maxZ=26.98 }, 
		{ options = { { event = "qb-pizzathis:Stash", icon = "fas fa-hamburger", label = "Masa", stash = "Table12" }, },
		  distance = 2.0
	})
	
	
	
end)

RegisterNetEvent('qb-pizzathis:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('qb-pizzathis:washHands')
AddEventHandler('qb-pizzathis:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Ellerini Yıkıyorsun.', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "Ellerini Yıkadın!", 'success')
	end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi", 'error')
    end)
end)


RegisterNetEvent('qb-pizzathis:MakeItem')
AddEventHandler('qb-pizzathis:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else
		--Food
		if data.item == "bolognese" or data.item == "calamari" or data.item == "meatball" or data.item == "alla" or data.item == "pescatore" or data.item == "capricciosabox" or data.item == "diavolabox" or data.item == "marinarabox" or data.item == "margheritabox" or data.item == "prosciuttiobox" or data.item == "vegetarianabox" or data.item == "pizzabase" or data.item == "salami" or data.item == "ham" then
			QBCore.Functions.TriggerCallback('qb-pizzathis:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin!", 'error') else FoodProgress(data.item) end		
			end)
		end
	end
end)

RegisterNetEvent('qb-pizzathis:Stash')
AddEventHandler('qb-pizzathis:Stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Pizza_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "Pizza_"..id)
end)

RegisterNetEvent('qb-pizzathis:Shop')
AddEventHandler('qb-pizzathis:Shop',function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else
		if data.shop == 1 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.DrinkItems)
		elseif data.shop == 2 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.FoodItems)		
		elseif data.shop == 3 then
			TriggerServerEvent("inventory:server:OpenInventory", "shop", "pizzathis", Config.FreezerItems)
		end
	end
end)

-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "pizzadough" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"	
	elseif ItemMake == "pizzabase" or ItemMake == "ham" or ItemMake == "salami" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 7000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
	elseif ItemMake == "bolognese" or ItemMake == "calamari" or ItemMake == "meatball" or ItemMake == "alla" or ItemMake == "pescatore" or ItemMake == "capricciosabox" or ItemMake == "diavolabox" or ItemMake == "marinarabox"  or ItemMake == "margheritabox"  or ItemMake == "prosciuttiobox"  or ItemMake == "vegetarianabox" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
	elseif ItemMake == "ambeer" or ItemMake == "dusche" or ItemMake == "logger" or ItemMake == "pisswasser" or ItemMake == "pisswasser2" or ItemMake == "pisswasser3" or ItemMake == "coffee" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
	elseif ItemMake == "amarone" or ItemMake == "barbera" or ItemMake == "dolceto" or ItemMake == "housered" or ItemMake == "housewhite" or ItemMake == "rosso" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 3000
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
	end
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true,
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = 8,
	}, {}, {}, function()  
		TriggerServerEvent('qb-pizzathis:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi!", 'error')
	end)
end

-- // Utilities \\ 

RegisterNetEvent('qb-pizzathis:Menu:Oven', function()
    exports['qb-menu']:openMenu({
		{ header = "Fırın", isMenuHeader = true },
        { header = QBCore.Shared.Items["bolognese"].label, txt = "- "..QBCore.Shared.Items["meat"].label.."<br>- "..QBCore.Shared.Items["sauce"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'bolognese' } } },
        { header = QBCore.Shared.Items["calamari"].label, txt = "- "..QBCore.Shared.Items["squid"].label.."<br>- "..QBCore.Shared.Items["sauce"].label.."<br>- "..QBCore.Shared.Items["pasta"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'calamari' } } },
        { header = QBCore.Shared.Items["meatball"].label, txt = "- "..QBCore.Shared.Items["meat"].label.."<br>- "..QBCore.Shared.Items["pasta"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'meatball' } } },
        { header = QBCore.Shared.Items["alla"].label, txt = "- "..QBCore.Shared.Items["ham"].label.."<br>- "..QBCore.Shared.Items["pasta"].label.."<br>- "..QBCore.Shared.Items["vodka"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'alla' } } },
        { header = QBCore.Shared.Items["pescatore"].label, txt = "- "..QBCore.Shared.Items["squid"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'pescatore' } } },
    })
end)
RegisterNetEvent('qb-pizzathis:Menu:PizzaBase', function()
    exports['qb-menu']:openMenu({
		--{ header = "", isMenuHeader = true },
        { header = QBCore.Shared.Items["pizzabase"].label, txt = "- "..QBCore.Shared.Items["pizzadough"].label.."<br>- "..QBCore.Shared.Items["sauce"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'pizzabase' } } },
    })
end)
RegisterNetEvent('qb-pizzathis:Menu:PizzaOven', function()
    exports['qb-menu']:openMenu({
		{ header = "Pizza Hazırla", isMenuHeader = true },
        { header = QBCore.Shared.Items["margherita"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'margheritabox' } } },
        { header = QBCore.Shared.Items["marinara"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["basil"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'marinarabox' } } },
        { header = QBCore.Shared.Items["prosciuttio"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["ham"].label.."<br> - "..QBCore.Shared.Items["pizzmushrooms"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'prosciuttiobox' } } },
        { header = QBCore.Shared.Items["diavola"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["salami"].label.."<br> - "..QBCore.Shared.Items["basil"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'diavolabox' } } },
        { header = QBCore.Shared.Items["capricciosa"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["ham"].label.."<br>- "..QBCore.Shared.Items["pizzmushrooms"].label.."<br> - "..QBCore.Shared.Items["olives"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'capricciosabox' } } },
        { header = QBCore.Shared.Items["vegetariana"].label, txt = "- "..QBCore.Shared.Items["pizzabase"].label.."<br>- "..QBCore.Shared.Items["mozz"].label.."<br>- "..QBCore.Shared.Items["lettuce"].label.."<br> - "..QBCore.Shared.Items["basil"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'vegetarianabox' } } },
    })
end)
RegisterNetEvent('qb-pizzathis:Menu:Beer', function()
    exports['qb-menu']:openMenu({
		{ header = "Bira Çeşitleri", isMenuHeader = true },
        { header = "", txt = QBCore.Shared.Items["ambeer"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'ambeer' } } },
        { header = "", txt = QBCore.Shared.Items["dusche"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'dusche' } } },
        { header = "", txt = QBCore.Shared.Items["logger"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'logger' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser"].label,  params = { event = "qb-pizzathis:JustGive", args = { id = 'pisswasser' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser2"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'pisswasser2' } } },
        { header = "", txt = QBCore.Shared.Items["pisswasser3"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'pisswasser3' } } },
    })
end)
RegisterNetEvent('qb-pizzathis:Menu:Wine', function()
    exports['qb-menu']:openMenu({
		{ header = "Şarap Mahzeni", isMenuHeader = true },
        { header = "", txt = QBCore.Shared.Items["amarone"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'amarone' } } },
        { header = "", txt = QBCore.Shared.Items["barbera"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'barbera' } } },
        { header = "", txt = QBCore.Shared.Items["dolceto"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'dolceto' } } },
        { header = "", txt = QBCore.Shared.Items["housered"].label,  params = { event = "qb-pizzathis:JustGive", args = { id = 'housered' } } },
        { header = "", txt = QBCore.Shared.Items["housewhite"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'housewhite' } } },
        { header = "", txt = QBCore.Shared.Items["rosso"].label, params = { event = "qb-pizzathis:JustGive", args = { id = 'rosso' } } },
    })
end)
RegisterNetEvent('qb-pizzathis:Menu:ChoppingBoard', function()
    exports['qb-menu']:openMenu({
		{ header = "Malzemeleri Doğra", isMenuHeader = true },
        { header = QBCore.Shared.Items["salami"].label, txt = "- "..QBCore.Shared.Items["meat"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'salami' } } },
        { header = QBCore.Shared.Items["ham"].label, txt = "- "..QBCore.Shared.Items["meat"].label, params = { event = "qb-pizzathis:MakeItem", args = { item = 'ham' } } },
    })
end)

RegisterNetEvent('qb-pizzathis:JustGive', function(data) if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('qb-pizzathis:client:Charge', function()
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
        TriggerServerEvent('qb-pizzathis:server:Charge', dialog.citizen, dialog.price)
    end
end)

function AlienEffect()
	StartScreenEffect("DrugsMichaelAliensFightIn", 3.0, 0)
	Wait(math.random(5000, 8000))
	StartScreenEffect("DrugsMichaelAliensFight", 3.0, 0)
	Wait(math.random(5000, 8000))    
	StartScreenEffect("DrugsMichaelAliensFightOut", 3.0, 0)
	StopScreenEffect("DrugsMichaelAliensFightIn")
	StopScreenEffect("DrugsMichaelAliensFight")
	StopScreenEffect("DrugsMichaelAliensFightOut")
end

RegisterNetEvent('qb-pizzathis:client:Drink', function(itemName)
	if itemName == "sprunk" or itemName == "sprunklight" then TriggerEvent('animations:client:EmoteCommandStart', {"sprunk"})
	elseif itemName == "ecola" or itemName == "ecolalight" then TriggerEvent('animations:client:EmoteCommandStart', {"ecola"}) end
    QBCore.Functions.Progressbar("drink_something", "Drinking "..QBCore.Shared.Items[itemName].label.."..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove", 1)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("QBCore:Server:SetMetaData", "thirst", QBCore.Functions.GetPlayerData().metadata["thirst"] + QBCore.Shared.Items[itemName].thirst)
		--if itemName == "sprunk" then TriggerServerEvent("consumables:server:Give", "can") end
	end)
end)
