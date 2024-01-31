local QBCore = exports['qb-core']:GetCoreObject()

PlayerJob = {}
local onDuty = false

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.GetPlayerData(function(PlayerData)
        PlayerJob = PlayerData.job
        if PlayerData.job.onduty then
            if PlayerData.job.name == "burgershot" then
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
    BurgershotBlip = AddBlipForCoord(Config.Locations["main"].coords.x, Config.Locations["main"].coords.y, Config.Locations["main"].coords.z)
    SetBlipSprite(BurgershotBlip, 106)
    SetBlipDisplay(BurgershotBlip, 3)
    SetBlipColour(BurgershotBlip, 5)
    SetBlipScale(BurgershotBlip, 0,6)
    SetBlipAsShortRange(BurgershotBlip, true)
    SetBlipScale(BurgershotBlip, 0.6)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Config.Locations["main"].label)
    EndTextCommandSetBlipName(BurgershotBlip)
end)

CreateThread(function()
	if Config.MLO == "GN" then
		if tray1 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_02"))
			Wait(100)
			local tray1 = CreateObject(GetHashKey("prop_food_bs_tray_02"),-1193.36, -895.44, 15.1-1.0,false,false,false)
			SetEntityHeading(tray1,GetEntityHeading(tray1)-60)
			FreezeEntityPosition(tray1, true)
		end
		if tray2 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_01"))
			Wait(100)
			local tray2 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1194.42, -893.88, 15.1-1.0,false,false,false)
			SetEntityHeading(tray2,GetEntityHeading(tray2)-60)
			FreezeEntityPosition(tray2, true)
		end
		if tray3 == nil then
			RequestModel(GetHashKey("prop_food_bs_tray_01"))
			Wait(100)
			local tray3 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1192.41, -896.84, 15.1-1.0,false,false,false)
			SetEntityHeading(tray3,GetEntityHeading(tray3)-60)
			FreezeEntityPosition(tray3, true)
		end
		if clockin == nil then
			RequestModel(GetHashKey("v_ind_tor_clockincard"))
			Wait(100)
			local clockin = CreateObject(GetHashKey("v_ind_tor_clockincard"),-1186.42, -898.41, 13.97,false,false,false)
			SetEntityHeading(clockin,GetEntityHeading(clockin)-145)
			FreezeEntityPosition(clockin, true)
		end
		if atm == nil then
			RequestModel(GetHashKey("prop_atm_01"))
			Wait(100)
			local atm = CreateObject(GetHashKey("prop_atm_01"),-1199.6, -884.99, 13.66-1.25,false,false,false)
			SetEntityHeading(atm,GetEntityHeading(atm)-145)
			FreezeEntityPosition(atm, true)
		end
	elseif Config.MLO == "LP" then
		--CLEAR PROPS
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -851111464, true)
		CreateModelHide(vector3(-1202.76, -889.01, 14.0), 1.5, -421145003, true)
		
		CreateModelHide(vector3(-1199.01, -890.5, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1196.95, -886.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1191.59, -882.02, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1195.24, -890.98, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.99, -894.32, 14.86), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.81, -881.8, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1188.73, -890.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1182.04, -894.47, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 1864388210, true)
		CreateModelHide(vector3(-1186.26, -896.37, 14.0), 1.5, 1864388210, true)
		
		CreateModelHide(vector3(-1180.42, -892.44, 14.0), 1.5, 759729215, true)
		CreateModelHide(vector3(-1180.19, -893.49, 14.0), 1.5, -775118285, true)
		
		CreateModelHide(vector3(-1200.74, -887.44, 14.0), 1.5, 1778631864, true)
		
		CreateModelHide(vector3(-1200.34, -886.73, 14.01), 1.5, -1842599357, true)
		
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 600967813, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 1049934319, true)
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 443058963, true)
		
		CreateModelHide(vector3(-1190.81, -899.94, 14.0), 1.5, 510552540, true)
		
		CreateModelHide(vector3(-1187.63, -898.52, 14.0), 1.5, 510552540, true)
		
		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1948359883, true)
		CreateModelHide(vector3(-1184.18, -895.2, 14.0), 1.5, 1388308576, true)		
				
		CreateModelHide(vector3(-1200.69, -888.19, 14.0), 1.5, 922914566, true)
		CreateModelHide(vector3(-1202.72, -888.3, 14.0), 1.5, -1732499190, true)
	
		--ADD JOB RELATED PROPS
		local tray1 = CreateObject(GetHashKey("prop_food_bs_tray_02"),-1196.3, -890.7, 14.02,false,false,false)
		SetEntityHeading(tray1,GetEntityHeading(tray1)-60)
		FreezeEntityPosition(tray1, true)
		
		local tray2 = CreateObject(GetHashKey("prop_food_bs_tray_01"),-1195.0, -892.68, 14.02,false,false,false)
		SetEntityHeading(tray2,GetEntityHeading(tray2)-60)
		FreezeEntityPosition(tray2, true)
		
		local atm = CreateObject(GetHashKey("prop_atm_01"),-1199.6, -884.99, 13.66-1.25,false,false,false)
		SetEntityHeading(atm,GetEntityHeading(atm)-145)
		FreezeEntityPosition(atm, true)
		
	end
end)

Citizen.CreateThread(function()
	-- exports['qb-target']:AddBoxZone("BurgerPay", vector3(251.75, 222.17, 106.2), 0.6, 2.0, { name="BurgerPay", heading = 340.0, debugPoly=false, minZ = 105.75, maxZ = 107.29, }, 
	-- 	{ options = { { type = "server", event = "qb-burgershot:Tickets:Sell", icon = "fas fa-receipt", label = "Cash in Receipts", job = "burgershot" }, },
	-- 	  distance = 2.0
	-- })

	if Config.MLO == "LP" then
		for k, v in pairs(Config.LPJobLocations) do
			exports['qb-target']:AddBoxZone("burgershotJob"..k, v.location, v.width, v.height, { name="burgershotJob"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, job = "burgershot", id = v.eventID }, },
				  distance = v.distance
			})
		end
		for k, v in pairs(Config.LPLocations) do
			exports['qb-target']:AddBoxZone("burgershot"..k, v.location, v.width, v.height, { name="burgershot"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, id = v.eventID }, },
				  distance = v.distance
			})
		end
		exports['qb-target']:AddCircleZone("Receipt", vector3(-1196.04, -891.38, 14.15), 0.5, { name="Receipt", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot" }, },
			  distance = 1.5
		})
		exports['qb-target']:AddCircleZone("Receipt2", vector3(-1194.7, -893.32, 14.15), 0.5, { name="Receipt2", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot", }, },
			  distance = 1.5
		})
		exports['qb-target']:AddCircleZone("Receipt3", vector3(-1193.42, -895.22, 14.15), 0.5, { name="Receipt3", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot",}, },
			  distance = 2.0
		})	
	elseif Config.MLO == "GN" then
		for k, v in pairs(Config.GNJobLocations) do
			exports['qb-target']:AddBoxZone("burgershotJob"..k, v.location, v.width, v.height, { name="burgershotJob"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, job = "burgershot", id = v.eventID }, },
				  distance = v.distance
			})
		end
		for k, v in pairs(Config.GNLocations) do
			exports['qb-target']:AddBoxZone("burgershot"..k, v.location, v.width, v.height, { name="burgershot"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = v.event, icon = v.icon, label = v.label, id = v.eventID }, },
				  distance = v.distance
			})
		end
		exports['qb-target']:AddCircleZone("Receipt", vector3(-1194.95, -893.15, 14.15), 0.5, { name="Receipt", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot" }, },
			  distance = 1.5
		})
		exports['qb-target']:AddCircleZone("Receipt2", vector3(-1193.97, -894.67, 14.15), 0.5, { name="Receipt2", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot", }, },
			  distance = 1.5
		})
		exports['qb-target']:AddCircleZone("Receipt3", vector3(-1192.93, -896.24, 14.15), 0.5, { name="Receipt3", debugPoly=false, useZ=true, },
		{ options = { { event = "qb-burgershot:client:Charge", icon = "fas fa-credit-card", label = "Ödeme Noktası", job = "burgershot",}, },
			  distance = 2.0
		})	
	end
end)

RegisterNetEvent('qb-burgershot:toggleDuty', function()
	onDuty = not onDuty
	TriggerServerEvent('QBCore:ToggleDuty')
end)

RegisterNetEvent('qb-burgershot:washHands')
AddEventHandler('qb-burgershot:washHands',function()
    QBCore.Functions.Progressbar('washing_hands', 'Ellerini Yıkıyorsun.', 5000, false, false, { disableMovement = true, disableCarMovement = true, disableMouse = false, disableCombat = false, },
	{ animDict = "mp_arresting", anim = "a_uncuff", flags = 8, }, {}, {}, function()
		TriggerEvent('QBCore:Notify', "Ellerini Yıkadın!", 'success')
	end, function()
        TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi", 'error')
    end)
end)

RegisterNetEvent('qb-burgershot:MakeItem', function(data)
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else
		if data.item == "slicedpotato" or data.item == "slicedonion" or data.item == "cheesewrap" or data.item == "chickenwrap" or data.item == "shotfries" or data.item == "shotrings" or data.item == "shotnuggets" or data.item == "burgermeat" or data.item == "milkshake" or data.item == "heartstopper" or data.item == "bleeder" or data.item == "torpedo" or data.item == "meatfree" or data.item == "moneyshot" then
			QBCore.Functions.TriggerCallback('qb-burgershot:get:'..data.item, function(amount) 
				if not amount then TriggerEvent('QBCore:Notify', "Doğru malzemelere sahip değilsin!", 'error') else FoodProgress(data.item) end		
			end)
		end
	end
end)

RegisterNetEvent('qb-burgershot:Stash')
AddEventHandler('qb-burgershot:Stash',function(data)
	TriggerServerEvent("inventory:server:OpenInventory", "stash", data.id)
	TriggerEvent("inventory:client:SetCurrentStash", data.id)
end)

RegisterNetEvent('qb-burgershot:shop')
AddEventHandler('qb-burgershot:shop',function()
	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else
		TriggerServerEvent("inventory:server:OpenInventory", "shop", "burgershot", Config.Items)
	end
end)

-- // Functions \\

function FoodProgress(ItemMake)
	if ItemMake == "water_bottle" or ItemMake == "bscoke" or ItemMake == "milkshake" or ItemMake == "bscoffee" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"
		animflag = 8
	elseif ItemMake == "rimjob" or ItemMake == "creampie" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 3500
		animDictNow = "mp_ped_interaction"
		animNow = "handshake_guy_a"	
		animflag = 8
	elseif ItemMake == "slicedpotato" or ItemMake == "slicedonion" then
		QBCore.Functions.TriggerCallback('qb-burgershot:amount:'..ItemMake, function(cb) amount = cb end)
		bartext = "Hazırlanıyor : "..amount.." "..QBCore.Shared.Items[ItemMake].label
		bartime = amount * 2000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 3
	elseif ItemMake == "cheesewrap" or ItemMake == "chickenwrap" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 8000
		animDictNow = "anim@heists@prison_heiststation@cop_reactions"
		animNow = "cop_b_idle"
		animflag = 8
	elseif ItemMake == "shotfries" or ItemMake == "shotrings" or ItemMake == "shotnuggets" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "mp_arresting"
        animNow = "a_uncuff"
		animflag = 8
	elseif ItemMake == "burgermeat" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 5000
        animDictNow = "amb@prop_human_bbq@male@base"
        animNow = "base"
		animflag = 8
	elseif ItemMake == "heartstopper" or ItemMake == "bleeder" or ItemMake == "torpedo" or ItemMake == "meatfree" or ItemMake == "moneyshot" then
		bartext = "Hazırlanıyor : "..QBCore.Shared.Items[ItemMake].label
		bartime = 12500
		animDictNow = "mini@repair"
		animNow = "fixing_a_ped"			
		animflag = 8
	end
	
	QBCore.Functions.Progressbar('making_food', bartext, bartime, false, false, {
		disableMovement = true, --
		disableCarMovement = true,
		disableMouse = false,
		disableCombat = true,
	}, {
		animDict = animDictNow,
		anim = animNow,
		flags = animflag,
	}, {}, {}, function()  
		TriggerServerEvent('qb-burgershot:GetFood', ItemMake)
		StopAnimTask(GetPlayerPed(-1), animDictNow, animNow, 1.0)
	end, function() -- Cancel
		TriggerEvent('inventory:client:busy:status', false)
		TriggerEvent('QBCore:Notify', "İptal Edildi!", 'error')
	end)
end

-- // Utilities \\ 

RegisterNetEvent('qb-burgershot:Ticket:Menu', function()
    exports['qb-menu']:openMenu({ 
		{ isMenuHeader = true, header = "Burgershot Payment", txt = "Do you want trade your tickets for payment?" },	
        { header = "Yes", server = true, params = { event = "qb-burgershot:Tickets:Sell" } },
        { header = "No", params = { event = "qb-burgershot:Tickets:Sell:no" } },
    })
end)

RegisterNetEvent('qb-burgershot:Menu:ChopBoard', function()
    exports['qb-menu']:openMenu({ 
		{ isMenuHeader = true, header = "Kesme Tahtası" },
        { header = QBCore.Shared.Items['slicedpotato'].label, txt = "- "..QBCore.Shared.Items['potato'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'slicedpotato' } } },
        { header = QBCore.Shared.Items['slicedonion'].label, txt = "- "..QBCore.Shared.Items['onion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'slicedonion' } } },
        { header = QBCore.Shared.Items['chickenwrap'].label, txt = "- "..QBCore.Shared.Items['shotnuggets'].label.."<br>- "..QBCore.Shared.Items['lettuce'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'chickenwrap' } } },
        { header = QBCore.Shared.Items['cheesewrap'].label, txt = "- "..QBCore.Shared.Items['cheddar'].label.."<br>- "..QBCore.Shared.Items['lettuce'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'cheesewrap' } } },
    })
end)

RegisterNetEvent('qb-burgershot:Menu:Fryer', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Fritoz" },
        { header = QBCore.Shared.Items['shotfries'].label, txt = "- "..QBCore.Shared.Items['slicedpotato'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'shotfries' } } },
        { header = QBCore.Shared.Items['shotrings'].label, txt = "- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'shotrings' } } },
        { header = QBCore.Shared.Items['shotnuggets'].label, txt = "- "..QBCore.Shared.Items['frozennugget'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'shotnuggets' } } },
    })
end)

RegisterNetEvent('qb-burgershot:Menu:Grill', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Burger Izgarası" },
        { header = QBCore.Shared.Items['burgermeat'].label, txt = "- "..QBCore.Shared.Items['burgerpatty'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'burgermeat' } } }, 
    })
end)

RegisterNetEvent('qb-burgershot:Menu:Prepare', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Yemek Hazırla" },
        { header = QBCore.Shared.Items['heartstopper'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'heartstopper' } } },
        { header = QBCore.Shared.Items['bleeder'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'bleeder' } } }, 
        { header = QBCore.Shared.Items['torpedo'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'torpedo' } } },  
        { header = QBCore.Shared.Items['meatfree'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'meatfree' } } },  
        { header = QBCore.Shared.Items['moneyshot'].label, txt = "- "..QBCore.Shared.Items['burgerbun'].label.."<br>- "..QBCore.Shared.Items['cheddar'].label.."<br> - "..QBCore.Shared.Items['lettuce'].label.."<br>- "..QBCore.Shared.Items['burgermeat'].label.."<br>- "..QBCore.Shared.Items['slicedonion'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'moneyshot' } } },  
    })
end)

RegisterNetEvent('qb-burgershot:Menu:Drink', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "İçecek Makinesi" },
        { header = QBCore.Shared.Items['water_bottle'].label, params = { event = "qb-burgershot:JustGive", args = { id = 'water_bottle' } } },
        { header = QBCore.Shared.Items['bscoke'].label, params = { event = "qb-burgershot:JustGive", args = { id = 'bscoke' } } },
        { header = QBCore.Shared.Items['bscoffee'].label, params = { event = "qb-burgershot:JustGive", args = { id = 'bscoffee' } } },
        { header = QBCore.Shared.Items['milkshake'].label, txt = "- "..QBCore.Shared.Items['milk'].label.."<br>- "..QBCore.Shared.Items['icecream'].label, params = { event = "qb-burgershot:MakeItem", args = { item = 'milkshake' } } },
    })
end)
RegisterNetEvent('qb-burgershot:Menu:Cabinet', function()
    exports['qb-menu']:openMenu({
		{ isMenuHeader = true, header = "Yiyecek Dolabı" },
        { header = "", txt = QBCore.Shared.Items['rimjob'].label, params = { event = "qb-burgershot:JustGive", args = { id = 'rimjob' } } },
        { header = "", txt = QBCore.Shared.Items['creampie'].label, params = { event = "qb-burgershot:JustGive", args = { id = 'creampie' } } },
    })
end)

RegisterNetEvent('qb-burgershot:JustGive', function(data) 	if not onDuty then TriggerEvent('QBCore:Notify', "Mesai\'de Değilsin!", 'error') else FoodProgress(data.id) end end)

RegisterNetEvent('qb-burgershot:client:Charge', function()
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
        TriggerServerEvent('qb-burgershot:server:Charge', dialog.citizen, dialog.price)
    end
end)

