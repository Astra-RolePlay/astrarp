local QBCore = exports['qb-core']:GetCoreObject()

function HasJob(job, player)
    local src = player or source
    local Player = QBCore.Functions.GetPlayer(src)
    if type(job) == "table" then
        for _, j in ipairs(job) do
            if Player.PlayerData.job.name == j then
                return true
            end
        end
    elseif job == "all" then
        return true
    elseif Player.PlayerData.job.name == job then
        return true
    end
    return false
end

RegisterServerEvent("elused-policegarage:AddData", function(type, vehicle, hash, plate, job)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if job ~= "all" and Config.BanWhenExploit and not HasJob(job) then ExploitBan(src, 'Banned for exploiting') end
    if type == "vehiclepurchased" then
        MySQL.Async.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (?, ?, ?, ?, ?, ?, ?)', {
            Player.PlayerData.license,
            Player.PlayerData.citizenid,
            vehicle,
            hash,
            '{}',
            plate,
            0
        })
    else
        ExploitBan(src, 'Banned for exploiting')
    end
end)

RegisterServerEvent('elused-policegarage:RentVehicle', function(paymenttype, finalPrice, vehiclename, vehicle, time, coordsinfo, job, station)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if job ~= "all" and Config.BanWhenExploit and not HasJob(job) then ExploitBan(src, 'Banned for exploiting') end
    if Player.Functions.GetMoney(paymenttype) >= finalPrice then
        TriggerClientEvent("elused-policegarage:SpawnRentedVehicle", src, vehicle, vehiclename, finalPrice, time, os.time(), coordsinfo['VehicleSpawn'], paymenttype, job, station)  
        Player.Functions.RemoveMoney(paymenttype, finalPrice)
        TriggerClientEvent('torpak:notify', src, vehiclename .. Config.Locals["Notifications"]["SuccessfullyRented"] .. time .. " minutes", "success")  
        if Config.UseLogs then TriggerEvent("qb-log:server:CreateLog", "default", GetCurrentResourceName(), "blue", 'New vehicle rented by: **'..GetPlayerName(src)..'** Player ID: **' ..src.. '** Rented: **' ..vehiclename.. '** For: **' ..finalPrice.. '$**'..' Rented for: **'..time .. '** minutes', false) end
    else
        TriggerClientEvent('torpak:notify', src, Config.Locals["Notifications"]["NoMoney"], "error")              
    end    
end)

RegisterServerEvent('elused-policegarage:BuyVehicle', function(data)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    if data.job ~= "all" and Config.BanWhenExploit and not HasJob(data.job) then ExploitBan(src, 'Banned for exploiting') end
    if data.paymenttype == "company" and Config.CompanyFunds['Enable'] then
        local Reciever = QBCore.Functions.GetPlayer(data.id)
        if Reciever.PlayerData.job.name == Player.PlayerData.job.name then
            if Reciever.PlayerData.job.grade.level >= data.rank then
                local account = exports['qb-management']:GetAccount(Player.PlayerData.job.name)
                if account >= data.price then
                    exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, data.price)
                    TriggerClientEvent('torpak:notify', data.buyer, "You have successfully purchased " .. data.vehiclename .. " for " .. data.name .. " using the company funds from " .. data.station, "success")  
                    TriggerClientEvent('torpak:notify', data.id, data.vehiclename .. Config.Locals["Notifications"]["SuccessfullyBought"] .. " Police Garage", "success")  
                    TriggerClientEvent("elused-policegarage:SpawnPurchasedVehicle", data.id, data.vehicle, data.coordsinfo['VehicleSpawn'], data.coordsinfo['CheckRadius'], data.job, data.useownable, data.trunkitems, data.extras, data.liveries, data.station)
                else
                    TriggerClientEvent('torpak:notify', data.buyer, Config.Locals['Notifications']['NoFunds'] .. data.vehiclename .. " money available " .. account, "error")  
                end
            else
                TriggerClientEvent('torpak:notify', data.buyer, GetPlayerName(data.id) .. Config.Locals['Notifications']['NoRank'], "error")  
            end
        else
            TriggerClientEvent('torpak:notify', data.buyer, GetPlayerName(data.id) .. Config.Locals['Notifications']['NoJob'], "error")  
        end
    else
        if Player.Functions.GetMoney(data.paymenttype) >= data.price then
            TriggerClientEvent("elused-policegarage:SpawnPurchasedVehicle", src, data.vehicle, data.coordsinfo['VehicleSpawn'], data.coordsinfo['CheckRadius'], data.job, data.useownable, data.trunkitems, data.extras, data.liveries, data.station)  
            Player.Functions.RemoveMoney(data.paymenttype, data.price)
            TriggerClientEvent('torpak:notify', src, data.vehiclename .. Config.Locals["Notifications"][("Aracını Satın Aldınız")] .. " ", "success")  
            if Config.UseLogs then TriggerEvent("qb-log:server:CreateLog", "default", GetCurrentResourceName(), "blue", 'New vehicle purchased by: **'..GetPlayerName(src)..'** Player ID: **' ..src.. '** Bought: **' ..vehiclename.. '** For: **' ..price.. '$**'..' Station rented at: **'..station..'**', false) end
        else
            TriggerClientEvent('torpak:notify', src, Config.Locals["Notifications"]["NoMoney"], "error")              
        end  
    end
end)

RegisterServerEvent('elused-policegarage:RefundRent', function(paymenttype, refund, clientsource, job)
	local src = source
	local Player = QBCore.Functions.GetPlayer(clientsource)
    if job ~= "all" and Config.BanWhenExploit and not HasJob(job) then ExploitBan(src, 'Banned for exploiting') end
    if clientsource == src then
        Player.Functions.AddMoney(paymenttype, refund)
    else
        ExploitBan(src, 'Banned for exploiting')
    end
end)

QBCore.Functions.CreateCallback('elused-policegarage:GetRealTime', function(source, cb)
    cb(os.time())
end)

function ExploitBan(id, reason)
	MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
		GetPlayerName(id),
		QBCore.Functions.GetIdentifier(id, 'license'),
		QBCore.Functions.GetIdentifier(id, 'discord'),
		QBCore.Functions.GetIdentifier(id, 'ip'),
		reason,
		2147483647,
		GetCurrentResourceName()
	})
	TriggerEvent('qb-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(id), GetCurrentResourceName(), reason), true)
	DropPlayer(id, 'You were permanently banned by the server for: ' .. reason)
end