local QBCore = exports['qb-core']:GetCoreObject()

--- Target için
QBCore.Functions.CreateCallback('ed-kelepce:target-kontrol', function(source, cb, targetPlayerPed)
    local src = targetPlayerPed
    local xPlayer = QBCore.Functions.GetPlayer(src)
    if xPlayer then
        local data = {
            pkelepce = xPlayer.PlayerData.metadata.pkelepce,
            kelepce = xPlayer.PlayerData.metadata.kelepce,
            isDead = xPlayer.PlayerData.metadata.isdead,
            inLastStand = xPlayer.PlayerData.metadata.inlaststand
        }
        cb(data)
    end
end)

QBCore.Commands.Add("taşı", "Kelepçeli Oyuncuyu Taşı", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	TriggerClientEvent('ed-kelepce:client:tasi', source)
end)

QBCore.Commands.Add("ybindir", "Yaralı Oyuncuyu Araca Bindir/İndir", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	TriggerClientEvent('ed-kelepce:client:ybindir', source)
end)

QBCore.Commands.Add("yindir", "Yaralı Oyuncuyu Araca Bindir/İndir", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	TriggerClientEvent('ed-kelepce:client:ybindir', source)
end)

QBCore.Commands.Add("araç", "Kelepçeli Oyuncuyu Araca Bindir/İndir", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
	TriggerClientEvent('ed-kelepce:client:arac', source)
end)

-- Data Polis Kelepce True
RegisterServerEvent('ed-kelepce:polis-kelepce-tak-takilan')
AddEventHandler('ed-kelepce:polis-kelepce-tak-takilan', function(targetPlayerPed, playerlocation, playerheading, playerCoords)
    local xPlayer = QBCore.Functions.GetPlayer(targetPlayerPed)
    if xPlayer then
        TriggerClientEvent("ed-kelepce:polis-kelepce-tak-yakin-oyuncu-client", targetPlayerPed, playerlocation, playerheading, playerCoords, source)
        xPlayer.Functions.SetMetaData("pkelepce", true)
    end
end)

RegisterServerEvent('ed-kelepce:polis-kelepce-tak-takan')
AddEventHandler('ed-kelepce:polis-kelepce-tak-takan', function()
    local xPlayer  = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem('pkelepce', 1, xPlayer.Functions.GetItemByName("pkelepce").slot) -- Kelepçeyi Sil
end)

-- Data Normal Kelepce True
RegisterServerEvent('ed-kelepce:kelepce-tak-takilan')
AddEventHandler('ed-kelepce:kelepce-tak-takilan', function(targetPlayerPed, playerlocation, playerheading, playerCoords)
    local xPlayer  = QBCore.Functions.GetPlayer(targetPlayerPed)
    if xPlayer then
        TriggerClientEvent("ed-kelepce:kelepce-tak-yakin-oyuncu-client", targetPlayerPed, playerlocation, playerheading, playerCoords, source)
        xPlayer.Functions.SetMetaData("kelepce", true)
    end
end)

RegisterServerEvent('ed-kelepce:kelepce-tak-takan')
AddEventHandler('ed-kelepce:kelepce-tak-takan', function()
    local xPlayer  = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem('kelepce', 1, xPlayer.Functions.GetItemByName("kelepce").slot) -- Kelepçeyi Sil
    xPlayer.Functions.AddItem('kelepceanahtar', 1) -- Anahtar ver
end)

-- Data Polis Kelepceler False
RegisterServerEvent('ed-kelepce:polis-kelepce-coz-takilan')
AddEventHandler('ed-kelepce:polis-kelepce-coz-takilan', function(targetPlayerPed, playerlocation, playerheading, playerCoords)
    local xPlayer  = QBCore.Functions.GetPlayer(targetPlayerPed)
    if xPlayer then
        TriggerClientEvent("ed-kelepce:polis-kelepce-coz-yakin-oyuncu-client", targetPlayerPed, playerlocation, playerheading, playerCoords)
        xPlayer.Functions.SetMetaData("pkelepce", false)
    end
end)

RegisterServerEvent('ed-kelepce:polis-kelepce-coz-takan')
AddEventHandler('ed-kelepce:polis-kelepce-coz-takan', function()
    local xPlayer  = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem('pkelepce', 1) -- Kelepçeyi Sil
end)

-- Data Normal Kelepceler False
RegisterServerEvent('ed-kelepce:kelepce-coz-takilan')
AddEventHandler('ed-kelepce:kelepce-coz-takilan', function(targetPlayerPed, playerlocation, playerheading, playerCoords)
    local xPlayer  = QBCore.Functions.GetPlayer(targetPlayerPed)
    if xPlayer then
        TriggerClientEvent("ed-kelepce:kelepce-coz-yakin-oyuncu-client", targetPlayerPed, playerlocation, playerheading, playerCoords)
        xPlayer.Functions.SetMetaData("kelepce", false)
    end
end)

RegisterServerEvent('ed-kelepce:kelepce-coz-takan')
AddEventHandler('ed-kelepce:kelepce-coz-takan', function()
    local xPlayer  = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.RemoveItem('kelepceanahtar', 1, xPlayer.Functions.GetItemByName("kelepceanahtar").slot) -- anahtarı sil Sil
    xPlayer.Functions.AddItem('kelepce', 1) -- kelepçe ver
end)

-- İtem Kontrol
QBCore.Functions.CreateCallback('ed-kelepce:item-kontrol', function(source, cb, item)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local items = xPlayer.getInventoryItem(item)
    if items == nil then
        cb(0)
    else
        cb(items.count)
    end
end)

-- Taşıma
RegisterServerEvent('ed-kelepce:tasi-target-server')
AddEventHandler('ed-kelepce:tasi-target-server', function(targetPlayerPed)
    TriggerClientEvent("ed-kelepce:tasi-target-client", targetPlayerPed, source)
end)

RegisterServerEvent('ed-kelepce:arac-ici-koy-server')
AddEventHandler('ed-kelepce:arac-ici-koy-server', function(targetPlayerPed, type)
    if targetPlayerPed then
        TriggerClientEvent("ed-kelepce:arac-ici-koy-client", targetPlayerPed, type)
    end
end)

-- Polis Kelepçe, Polisler Anahtarı item olarak alacakları için anahtar verilmiyor
QBCore.Functions.CreateUseableItem('pkelepce', function(source)
    TriggerClientEvent("ed-kelepce:polis-kelepce-tak-client", source)
end)

QBCore.Functions.CreateUseableItem('pkelepceanahtar', function(source)
    TriggerClientEvent("ed-kelepce:polis-kelepce-coz-client", source)
end)

QBCore.Functions.CreateUseableItem('kelepce', function(source)
    TriggerClientEvent("ed-kelepce:kelepce-tak-client", source)
end)

QBCore.Functions.CreateUseableItem('kelepceanahtar', function(source)
    TriggerClientEvent("ed-kelepce:kelepce-coz-client", source)
end)

RegisterServerEvent('ed-kelepce:anim-cancel')
AddEventHandler('ed-kelepce:anim-cancel', function(takan, type)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local tPlayer = QBCore.Functions.GetPlayer(takan)
    if xPlayer then
        TriggerClientEvent("ed-kelepce:client:anim-cancel", takan)
        if type == "police" then
            xPlayer.Functions.SetMetaData("pkelepce", false)
            tPlayer.Functions.AddItem('pkelepce', 1) -- kelepçe ver
        else
            xPlayer.Functions.SetMetaData("kelepce", false)
            tPlayer.Functions.AddItem('kelepce', 1) -- kelepçe ver
        end
    end
end)