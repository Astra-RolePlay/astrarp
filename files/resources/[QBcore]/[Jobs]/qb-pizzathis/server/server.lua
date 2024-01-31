local QBCore = exports['qb-core']:GetCoreObject()

--Pizza Boxes
QBCore.Functions.CreateUseableItem("capricciosabox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)
QBCore.Functions.CreateUseableItem("diavolabox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)
QBCore.Functions.CreateUseableItem("marinarabox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)
QBCore.Functions.CreateUseableItem("margheritabox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)
QBCore.Functions.CreateUseableItem("prosciuttiobox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)
QBCore.Functions.CreateUseableItem("vegetarianabox", function(source, item) TriggerEvent("qb-pizzathis:OpenBox", source, item.name) end)

RegisterServerEvent('qb-pizzathis:GetFood')
AddEventHandler('qb-pizzathis:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	if ItemMake == "bolognese" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "calamari" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "meatball" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)
	elseif ItemMake == "alla" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pasta'], "remove", 1) 
		Player.Functions.RemoveItem('pasta', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['vodka'], "remove", 1) 
		Player.Functions.RemoveItem('vodka', 1)
	elseif ItemMake == "pescatore" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['squid'], "remove", 1) 
		Player.Functions.RemoveItem('squid', 1)
		
	elseif ItemMake == "capricciosabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['olives'], "remove", 1) 
		Player.Functions.RemoveItem('olives', 1)
	elseif ItemMake == "diavolabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['salami'], "remove", 1) 
		Player.Functions.RemoveItem('salami', 1)		
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "marinarabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "margheritabox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)
	elseif ItemMake == "prosciuttiobox" then
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzmushrooms'], "remove", 1) 
		Player.Functions.RemoveItem('pizzmushrooms', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['ham'], "remove", 1) 
		Player.Functions.RemoveItem('ham', 1)
	elseif ItemMake == "vegetarianabox" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzabase'], "remove", 1) 
		Player.Functions.RemoveItem('pizzabase', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mozz'], "remove", 1) 
		Player.Functions.RemoveItem('mozz', 1)	    
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['lettuce'], "remove", 1) 
		Player.Functions.RemoveItem('lettuce', 1)
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['basil'], "remove", 1) 
		Player.Functions.RemoveItem('basil', 1)
	elseif ItemMake == "pizzabase" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['pizzadough'], "remove", 1) 
		Player.Functions.RemoveItem('pizzadough', 1)
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sauce'], "remove", 1) 
		Player.Functions.RemoveItem('sauce', 1)
	elseif ItemMake == "ham" or ItemMake == "salami" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['meat'], "remove", 1) 
		Player.Functions.RemoveItem('meat', 1)
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1)
end)

RegisterServerEvent('qb-pizzathis:OpenBox')
AddEventHandler('qb-pizzathis:OpenBox', function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if item == "capricciosabox" then slices = "capricciosa"
	elseif item == "diavolabox" then slices = "diavola"
	elseif item == "marinarabox" then slices = "marinara"
	elseif item == "margheritabox" then slices = "margherita"
	elseif item == "prosciuttiobox" then slices = "prosciuttio"
	elseif item == "vegetarianabox" then slices = "vegetariana" end
	--This removes the box
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[item], "remove", 1) 
	Player.Functions.RemoveItem(item, 1)
	Wait(1000)
	--This gives the slices
	Player.Functions.AddItem(slices, 6, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[slices], "add", 6) 
end)


---ITEM REQUIREMENT CHECKS
--Food
QBCore.Functions.CreateCallback('qb-pizzathis:get:bolognese', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:calamari', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:meatball', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:alla', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pasta') ~= nil  and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('vodka') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:pescatore', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('squid') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-pizzathis:get:margheritabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:marinarabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:prosciuttiobox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:diavolabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('salami') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:capricciosabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('ham') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzmushrooms') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('olives') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:vegetarianabox', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzabase') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mozz') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('lettuce') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('basil') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-pizzathis:get:ham', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-pizzathis:get:salami', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('meat') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-pizzathis:get:pizzabase', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('pizzadough') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sauce') ~= nil then cb(true) else cb(false) end end)


-- // Register \\ 

RegisterServerEvent('qb-pizzathis:Tickets:Give')
AddEventHandler('qb-pizzathis:Tickets:Give', function(amount)
    for k, v in pairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(v)
        if Player ~= nil then
            if Player.PlayerData.job.name == 'pizzathis' and Player.PlayerData.job.onduty then
				if amount >= Config.MinAmountforTicket then
					Player.Functions.AddItem('burger-ticket', 1, false, {["quality"] = nil})
					TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Pizza This receipt received', 'success')
					TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['burger-ticket'], "add", 1) 
				elseif amount < Config.MinAmountforTicket then
					TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "Amount too low, didn't receive a receipt", "error")
				end
			end
        end
    end
end)

RegisterServerEvent('qb-pizzathis:Tickets:Sell')
AddEventHandler('qb-pizzathis:Tickets:Sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName("burger-ticket") ~= nil then
		tickets = Player.Functions.GetItemByName("burger-ticket").amount
		pay = (tickets * Config.PayPerTicket)
		Player.Functions.RemoveItem('burger-ticket', tickets)
		Player.Functions.AddMoney('bank', pay, 'pizzathis-payment')
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burger-ticket'], "remove", tickets)
		TriggerClientEvent('QBCore:Notify', src, "Tickets: "..tickets.." Total: $"..pay, 'success')
	else 
		TriggerClientEvent('QBCore:Notify', src, "No tickets to trade", 'error')
	end
end)

RegisterServerEvent("qb-pizzathis:server:Charge", function(citizen, price)
    local biller = QBCore.Functions.GetPlayer(source)
    local billed = QBCore.Functions.GetPlayer(tonumber(citizen))
    local amount = tonumber(price)
	if billed ~= nil then
		if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
			if amount and amount > 0 then
				exports.oxmysql:insert(
					'INSERT INTO phone_invoices (citizenid, amount, society, sender, sendercitizenid) VALUES (?, ?, ?, ?, ?)',
					{billed.PlayerData.citizenid, amount, biller.PlayerData.job.name,
					 biller.PlayerData.charinfo.firstname, biller.PlayerData.citizenid})
				TriggerClientEvent('qb-phone:RefreshPhone', billed.PlayerData.source)
				TriggerClientEvent('QBCore:Notify', source, 'Fatura Başarıyla Gönderildi.', 'success')
				TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'Yeni Fatura Alındı.')
				
			else TriggerClientEvent('QBCore:Notify', source, '0\'ın Üzerinde Geçerli Bir Tutar Olmalıdır', 'error')	end
		else TriggerClientEvent('QBCore:Notify', source, 'Kendine Fatura Kesemezsin!', 'error') end
	else TriggerClientEvent('QBCore:Notify', source, 'Oyuncu Aktif Değil!', 'error') end
end)

RegisterNetEvent("qb-pizzathis:server:removeitem", function(itemName)
	local Player = QBCore.Functions.GetPlayer(source)
	Player.Functions.RemoveItem(itemName, 1)
end)