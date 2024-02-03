local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('qb-uwu:GetFood')
AddEventHandler('qb-uwu:GetFood', function(ItemMake)
    local Player = QBCore.Functions.GetPlayer(source)
	--ChoppingBoard
	if ItemMake == "bmochi" then
	    Player.Functions.RemoveItem('sugar', 1) TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['blueberry'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('blueberry', 1)
	elseif ItemMake == "gmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)	
	elseif ItemMake == "omochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "pmochi" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('sugar', 1)
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "riceball" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
		Player.Functions.RemoveItem('rice', 1)
		Player.Functions.RemoveItem('nori', 1)
	elseif ItemMake == "bento" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tofu'], "remove", 1) 
		Player.Functions.RemoveItem('rice', 1)
		Player.Functions.RemoveItem('nori', 1)
		Player.Functions.RemoveItem('tofu', 1)
	--Oven
	elseif ItemMake == "nekocookie" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "nekodonut" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "cake" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('strawberry', 1)
	elseif ItemMake == "miso" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['nori'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['tofu'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['onion'], "remove", 1) 
		Player.Functions.RemoveItem('nori', 1)
		Player.Functions.RemoveItem('tofu', 1)
		Player.Functions.RemoveItem('onion', 1)
	--Coffee
	elseif ItemMake == "bobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
	elseif ItemMake == "bbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['blueberry'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('blueberry', 1)
	elseif ItemMake == "gbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['mint'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('mint', 1)
	elseif ItemMake == "obobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['orange'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('orange', 1)
	elseif ItemMake == "pbobatea" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['boba'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], "remove", 1) 
		Player.Functions.RemoveItem('boba', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('strawberry', 1)
	elseif ItemMake == "mocha" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('sugar', 1)	
	elseif ItemMake == "cakepop" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['sugar'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('sugar', 1)	
	elseif ItemMake == "pizza" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('flour', 1)	
	elseif ItemMake == "pancake" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['milk'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['strawberry'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('milk', 1)
		Player.Functions.RemoveItem('strawberry', 1)	
	elseif ItemMake == "purrito" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['flour'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['rice'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['onion'], "remove", 1) 
		Player.Functions.RemoveItem('flour', 1)
		Player.Functions.RemoveItem('rice', 1)
		Player.Functions.RemoveItem('onion', 1)
	elseif ItemMake == "ramen" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['noodles'], "remove", 1) 
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['onion'], "remove", 1) 
		Player.Functions.RemoveItem('noodles', 1)
		Player.Functions.RemoveItem('onion', 1)
	elseif ItemMake == "noodlebowl" then
	    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['noodles'], "remove", 1) Player.Functions.RemoveItem('noodles', 1)	
	end
	--This should give the item, while the rest removes the requirements
	Player.Functions.AddItem(ItemMake, 1, false, {["quality"] = nil})
	TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[ItemMake], "add", 1) 
end)


---ITEM REQUIREMENT CHECKS

QBCore.Functions.CreateCallback('qb-uwu:get:bmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('blueberry') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:pmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('strawberry') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:gmochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mint') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:omochi', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('orange') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:riceball', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('rice') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('nori') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:bento', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('rice') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('nori') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('tofu') ~= nil then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-uwu:get:nekocookie', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:nekodonut', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:cake', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('strawberry') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:miso', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('nori') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('tofu') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion') then cb(true) else cb(false) end end)


QBCore.Functions.CreateCallback('qb-uwu:get:bobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('boba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:bbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('boba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('blueberry') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:gbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('boba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('mint') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:obobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('boba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('orange') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:pbobatea', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('boba') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('strawberry') then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-uwu:get:mocha', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:cakepop', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('sugar') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:pizza', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:pancake', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('milk') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('strawberry') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:purrito', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('flour') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('rice') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion') then cb(true) else cb(false) end end)

QBCore.Functions.CreateCallback('qb-uwu:get:ramen', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('noodles') ~= nil and QBCore.Functions.GetPlayer(source).Functions.GetItemByName('onion') then cb(true) else cb(false) end end)
QBCore.Functions.CreateCallback('qb-uwu:get:noodlebowl', function(source, cb) if QBCore.Functions.GetPlayer(source).Functions.GetItemByName('noodles') ~= nil then cb(true) else cb(false) end end)


-- // Register \\ 

RegisterServerEvent('qb-uwu:Tickets:Give')
AddEventHandler('qb-uwu:Tickets:Give', function(amount)
	for k, v in pairs(QBCore.Functions.GetPlayers()) do
		local Player = QBCore.Functions.GetPlayer(v)
		if Player ~= nil then
			if Player.PlayerData.job.name == 'catcafe' and Player.PlayerData.job.onduty then
				if amount >= Config.MinAmountforTicket then
					Player.Functions.AddItem('burger-ticket', 1, false, {["quality"] = nil})
					TriggerClientEvent('QBCore:Notify', Player.PlayerData.source, 'Cat Cafe receipt received', 'success')
					TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, QBCore.Shared.Items['burger-ticket'], "add", 1) 
				elseif amount < Config.MinAmountforTicket then
					TriggerClientEvent("QBCore:Notify", Player.PlayerData.source, "Amount too low, didn't receive a receipt", "error")
				end
			end
		end
	end
end)

RegisterServerEvent('qb-uwu:Tickets:Sell')
AddEventHandler('qb-uwu:Tickets:Sell', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	if Player.Functions.GetItemByName("burger-ticket") ~= nil then
		tickets = Player.Functions.GetItemByName("burger-ticket").amount
		pay = (tickets * Config.PayPerTicket)
		Player.Functions.RemoveItem('burger-ticket', tickets)
		Player.Functions.AddMoney('bank', pay, 'catcafe-payment')
		TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['burger-ticket'], "remove", tickets)
		TriggerClientEvent('QBCore:Notify', src, "Tickets: "..tickets.." Total: $"..pay, 'success')
	else 
		TriggerClientEvent('QBCore:Notify', src, "No tickets to trade", 'error')
	end
end)

RegisterServerEvent("qb-uwu:server:Charge", function(citizen, price)
	local src = source
    local biller = QBCore.Functions.GetPlayer(src)
    local billed = QBCore.Functions.GetPlayer(tonumber(citizen))
    local amount = tonumber(price)
	if billed ~= nil then
		--if biller.PlayerData.citizenid ~= billed.PlayerData.citizenid then
        if amount and amount > 0 then

            local toFullname = billed.PlayerData.charinfo.firstname .. " " .. billed.PlayerData.charinfo.lastname
			local toIdentifier = billed.PlayerData.license
			local fromFullname =  biller.PlayerData.charinfo.firstname.." "..biller.PlayerData.charinfo.lastname
			local fromIdentifier = biller.PlayerData.license
			Wait(100)
			exports.pefcl:createInvoice(src, {
                to = toFullname,
                toIdentifier = toIdentifier,
                from = fromFullname,
                fromIdentifier = fromIdentifier,
				amount = amount,
				message = "UwU Cafe - Hesap Faturası"
			})
				TriggerClientEvent('QBCore:Notify', source, 'Fatura Başarıyla Gönderildi.', 'success')
				TriggerClientEvent('QBCore:Notify', billed.PlayerData.source, 'Yeni Fatura Alındı.')
				
			else TriggerClientEvent('QBCore:Notify', source, '0\'ın Üzerinde Geçerli Bir Tutar Olmalıdır', 'error')	end
		--else TriggerClientEvent('QBCore:Notify', source, 'Kendine Fatura Kesemezsin!', 'error') end
	else TriggerClientEvent('QBCore:Notify', source, 'Oyuncu Aktif Değil!', 'error') end
end)

QBCore.Functions.CreateUseableItem("uwupurpleplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwupurpleplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwugreenplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwugreenplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwublueplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwublueplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwubrownplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwubrownplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwuyellowplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwuyellowplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwuredplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwuredplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwugreenrareplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwugreenrareplush", source, item.name)
end)

QBCore.Functions.CreateUseableItem("uwupinkrareplush", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    TriggerClientEvent("qb-uwu:client:uwupinkrareplush", source, item.name)
end)