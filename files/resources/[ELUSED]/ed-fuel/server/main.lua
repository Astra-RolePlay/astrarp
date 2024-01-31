local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent('ed-fuel:server:Pay', function(amount)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney("cash", amount, "Fuel buy")
end)

RegisterServerEvent('ed-fuel:server:GiveJerrican', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.AddItem("weapon_petrolcan", 1, false)
    TriggerClientEvent("inventory:client:ItemBox", src, QBCore.Shared.Items["weapon_petrolcan"], "add")
end)

RegisterServerEvent('ed-fuel:server:AttachRope', function(netIdProp, coordPumps, model)
	local src = source
    local citizenid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid    
    TriggerClientEvent('ed-fuel:client:AttachRope', -1, netIdProp, coordPumps, model, citizenid)
end)

RegisterServerEvent('ed-fuel:server:DetachRope', function(src)
	local srctemp = source
    local citizenid = QBCore.Functions.GetPlayer(srctemp).PlayerData.citizenid    
    TriggerClientEvent('ed-fuel:client:DetachRope', -1, citizenid, src)
end)

RegisterNetEvent('ed-fuel:server:UpdateVehicleDateTimeIn', function(plate)
    MySQL.update('UPDATE player_vehicles SET datetimein = ? WHERE plate = ?', {os.time(), plate})
end)

QBCore.Functions.CreateCallback('ed-fuel:server:GetTimeInGarage', function(source, cb, plate)
    local result = MySQL.single.await('SELECT * FROM player_vehicles WHERE plate = ?', { plate })
    if result then
        if result.datetimein and result.datetimein ~= 0 then
            cb(os.time() - result.datetimein)
        else
            cb(false)            
        end
    else
        cb(false)
    end
end)

QBCore.Commands.Add('fuel', "Set fuel/charge for vehicle", {{name='amount', help='Amount of fuel in %'}}, false, function(source, args)
    local src = source
    local amount = tonumber(args[1])
    if not amount then
        amount = 100
    end
    TriggerClientEvent("ed-fuel:SetFuel", src, amount)
end, 'admin')