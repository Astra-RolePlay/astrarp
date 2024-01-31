local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('heardring', function(source, item)
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if item.info.teklifeden == nil then
        TriggerClientEvent('ed-heardring:client:FirstStep', source)
        TriggerClientEvent('ed-heardring:client:Anim', source, true, false)
    else
        if xPlayer.PlayerData.citizenid == item.info.teklifeden then
            tPlayer = QBCore.Functions.GetPlayerByCitizenId(item.info.teklifalan)
            if tPlayer ~= nil then
                coords = GetEntityCoords(GetPlayerPed(tPlayer.PlayerData.source))
                TriggerClientEvent("ed-heardring:client:SecondStep", source, {x = coords.x, y = coords.y})
            else
                TriggerClientEvent("QBCore:Notify", source, "Eşin şehirde değil!", "error")
            end
        elseif xPlayer.PlayerData.citizenid == item.info.teklifalan then
            tPlayer = QBCore.Functions.GetPlayerByCitizenId(item.info.teklifeden)
            if tPlayer ~= nil then
                coords = GetEntityCoords(GetPlayerPed(tPlayer.PlayerData.source))
                TriggerClientEvent("ed-heardring:client:SecondStep", source, {x = coords.x, y = coords.y})
            else
                TriggerClientEvent("QBCore:Notify", source, "Eşin şehirde değil!", "error")
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Yüzük sana ait değil.", "error")
        end
    end
end)

RegisterServerEvent("ed-heardring:server:FirstStep")
AddEventHandler("ed-heardring:server:FirstStep",function(ply, ben)
    TriggerClientEvent("ed-heardring:client:openMenu", ply, ben)
end)

RegisterServerEvent("ed-heardring:server:Particle")
AddEventHandler("ed-heardring:server:Particle",function(cid)
    local xPlayer = QBCore.Functions.GetPlayerByCitizenId(cid)
    local src = source
    TriggerClientEvent("ed-heardring:client:Particle", -1, GetEntityCoords(GetPlayerPed(src)))
    TriggerClientEvent("ed-heardring:client:Particle", -1, GetEntityCoords(GetPlayerPed(xPlayer.PlayerData.source)))
    TriggerClientEvent('ed-heardring:client:Anim', xPlayer.PlayerData.source, false, false)
end)

RegisterServerEvent("ed-heardring:server:Anim")
AddEventHandler("ed-heardring:server:Anim",function(cid)
    local xPlayer = QBCore.Functions.GetPlayerByCitizenId(cid)
    local src = source
    TriggerClientEvent('ed-heardring:client:Anim', xPlayer.PlayerData.source, false, false)
    TriggerClientEvent('ed-heardring:client:Anim', src, false, true)

end)

RegisterServerEvent("ed-heardring:server:SecondStep")
AddEventHandler("ed-heardring:server:SecondStep", function(cid)
    local src = source
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local zPlayer = QBCore.Functions.GetPlayerByCitizenId(cid)
    local aile2 = xPlayer.PlayerData.charinfo.firstname .. " " ..xPlayer.PlayerData.charinfo.lastname .. " & " .. zPlayer.PlayerData.charinfo.firstname .. " " .. zPlayer.PlayerData.charinfo.lastname
    local info = {
        teklifeden = cid,
        teklifalan = xPlayer.PlayerData.citizenid,
        aile = aile2,
        tarih = os.date("!%d-%m-%Y"),
    }
    
    if zPlayer.Functions.RemoveItem("heardring", 1) then
        xPlayer.Functions.AddItem("heardring", 1, false, info)
        zPlayer.Functions.AddItem("heardring", 1, false, info)
    end
end)