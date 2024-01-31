local QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["casino_whitechip"] = 1,
}

if Config.Prune then
	MySQL.query('TRUNCATE gazino')
end

QBCore.Functions.CreateCallback('kml-gazino:server:check', function(source, cb)
	local src = source
	local kimlik = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.query('SELECT * FROM gazino WHERE kimlik = ?',
		{kimlik}, function(check)
			cb(check)
	end)
end)

QBCore.Functions.CreateCallback('kml-gazino:server:spincheck', function(source, cb)
	local src = source
	local kimlik = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.query('SELECT * FROM gazino WHERE kimlik = ?',
		{kimlik}, function(check)
			cb(check)
	end)
end)

QBCore.Functions.CreateCallback('kml-gazino:server:slotcheck', function(source, cb)
	local src = source
	local kimlik = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.query('SELECT * FROM gazino WHERE kimlik = ?',
		{kimlik}, function(check)
			cb(check)
	end)
end)

QBCore.Functions.CreateCallback('kml-gazino:server:olustur', function(source)
	local src = source
	local identifier = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.insert('INSERT INTO gazino (kimlik, spin, slot) VALUES (?, ?, ?)',{identifier, 0, 0})
end)

QBCore.Functions.CreateCallback('kml-gazino:server:spincalisti', function(source, callback)
	local src = source
	local identifier = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.query('SELECT * FROM gazino WHERE kimlik = ?',
		{identifier}, function(check)
			local spinsayis = check[1]
			local spinsayi = spinsayis['spin']
			local spinkml = tonumber(spinsayi) + 1
			MySQL.query('UPDATE gazino SET spin = ? WHERE kimlik = ?',{spinkml, identifier})
	end)
	local kontrols = true
	callback(kontrols)
end)

QBCore.Functions.CreateCallback('kml-gazino:server:slotcalisti', function(source, callback)
	local src = source
	local identifier = QBCore.Functions.GetIdentifier(src, 'license')
	MySQL.query('SELECT * FROM gazino WHERE kimlik = ?',
		{identifier}, function(check)
			local slotsayis = check[1]
			local slotsayi = slotsayis['slot']
			local slotkml = tonumber(slotsayi) + 1
			MySQL.query('UPDATE gazino SET slot = ? WHERE kimlik = ?',{slotkml, identifier})
	end)
	local kontrols = true
	callback(kontrols)
end)

RegisterServerEvent("qb-casino:server:WhiteSell")
AddEventHandler("qb-casino:server:WhiteSell", function()
    local src = source
    local price = Config.whiteChipPrice
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casino_whitechip")
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price * (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney(Config.payment, price, "sold-casino-chips")
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casino_whitechip'], "remove", Player.PlayerData.items[k].amount)
                    TriggerClientEvent('QBCore:Notify', src, "Başarıyla "..Player.PlayerData.items[k].amount.." beyaz çip sattınız: $"..price)
                    TriggerClientEvent("doj:casinoChipMenu", src)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Beyaz çipin yok...", "error")
        TriggerClientEvent("doj:casinoChipMenu", src)
    end
end)

local ItemList = {
    ["casino_redchip"] = 1,
}
RegisterServerEvent("qb-casino:server:RedSell")
AddEventHandler("qb-casino:server:RedSell", function()
    local src = source
    local price = Config.redChipPrice
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casino_redchip")
    if xItem ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price * (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney(Config.payment, price, "sold-casino-chips")
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casino_redchip'], "remove", Player.PlayerData.items[k].amount)
                    TriggerClientEvent('QBCore:Notify', src, "Başarıyla "..Player.PlayerData.items[k].amount.." kırmızı çip sattınız: $"..price)
                    TriggerClientEvent("doj:casinoChipMenu", src)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Kırmızı çipin yok...", "error")
        TriggerClientEvent("doj:casinoChipMenu", src)
    end
end)

local ItemList = {
    ["casino_bluechip"] = 1,
}
RegisterServerEvent("qb-casino:server:BlueSell")
AddEventHandler("qb-casino:server:BlueSell", function()
    local src = source
    local price = Config.blueChipPrice
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casino_bluechip")
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price * (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney(Config.payment, price, "sold-casino-chips")
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casino_bluechip'], "remove", Player.PlayerData.items[k].amount)
                    TriggerClientEvent('QBCore:Notify', src, "Başarıyla "..Player.PlayerData.items[k].amount.." mavi çip sattınız: $"..price)
                    TriggerClientEvent("doj:casinoChipMenu", src)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Mavi çipin yok...", "error")
        TriggerClientEvent("doj:casinoChipMenu", src)
    end
end)

local ItemList = {
    ["casino_blackchip"] = 1,
}
RegisterServerEvent("qb-casino:server:BlackSell")
AddEventHandler("qb-casino:server:BlackSell", function()
    local src = source
    local price = Config.blackChipPrice
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casino_blackchip")
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price * (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney(Config.payment, price, "sold-casino-chips")
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casino_blackchip'], "remove", Player.PlayerData.items[k].amount)
                    TriggerClientEvent('QBCore:Notify', src, "Başarıyla "..Player.PlayerData.items[k].amount.." siyah çip sattınız: $"..price)
                    TriggerClientEvent("doj:casinoChipMenu", src)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Siyah çipin yok...", "error")
        TriggerClientEvent("doj:casinoChipMenu", src)
    end
end)

local ItemList = {
    ["casino_goldchip"] = 1,
}
RegisterServerEvent("qb-casino:server:GoldSell")
AddEventHandler("qb-casino:server:GoldSell", function()
    local src = source
    local price = Config.goldChipPrice
    local Player = QBCore.Functions.GetPlayer(src)
    local xItem = Player.Functions.GetItemByName("casino_goldchip")
    if xItem ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    price = price * (ItemList[Player.PlayerData.items[k].name] * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem(Player.PlayerData.items[k].name, Player.PlayerData.items[k].amount, k)
                    Player.Functions.AddMoney(Config.payment, price, "sold-casino-chips")
                    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['casino_goldchip'], "remove", Player.PlayerData.items[k].amount)
                    TriggerClientEvent('QBCore:Notify', src, "Başarıyla "..Player.PlayerData.items[k].amount.." altın çip sattınız: $"..price)
                    TriggerClientEvent("doj:casinoChipMenu", src)
                end
            end
        end
    else
        TriggerClientEvent('QBCore:Notify', src, "Altın çipin yok...", "error") 
        TriggerClientEvent("doj:casinoChipMenu", src)
    end
end)
















