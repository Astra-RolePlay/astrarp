local QBCore = exports['qb-core']:GetCoreObject()

local izinler = {
    ["PUO32188"] = "PQJ63638",
    ["PQJ63638"] = "PUO32188"
}
   
RegisterServerEvent('ed-erp:ok')
AddEventHandler('ed-erp:ok', function(gonderen)
    local xPlayer = QBCore.Functions.GetPlayer(source)
    local tPlayer = QBCore.Functions.GetPlayer(gonderen)
    izinler[xPlayer.PlayerData.citizenid] = tPlayer.PlayerData.citizenid
    izinler[tPlayer.PlayerData.citizenid] = xPlayer.PlayerData.citizenid
    TriggerClientEvent("QBCore:Notify", gonderen, "Oyuncu E-RP isteğini Kabul Etti", "success")
end)

RegisterServerEvent('ed-erp:cancel')
AddEventHandler('ed-erp:cancel', function(gonderen)
    TriggerClientEvent("QBCore:Notify", gonderen, "Oyuncu E-RP isteğini Reddetti", "error")
end)

RegisterServerEvent('ed-erp:clear-anim')
AddEventHandler('ed-erp:clear-anim', function(targetId)
    TriggerClientEvent("ed-erp:client:clear-anim", targetId)
end)

QBCore.Commands.Add(Config.OpenMenuCommand, "Oyuncuya E-RP Menüsü Açtırır!", {}, false, function(source)
    TriggerClientEvent('ed-erp:openmenu', source)
end)

QBCore.Commands.Add(Config.OpenCommand, "Oyuncuya E-RP İzni Gönderir!", {{name="id", help="Oyuncu ID"}}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local tPlayer = QBCore.Functions.GetPlayer(tonumber(args[1]))
    if tPlayer then 
        local xPlayer = QBCore.Functions.GetPlayer(source) 
        if checkDistance(source, tPlayer.PlayerData.source) then
            if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                TriggerClientEvent("QBCore:Notify", source, "Zaten Bu Oyuncu İle E-RP İznin Var", "error")
            else
                TriggerClientEvent("ed-erp:izin", tPlayer.PlayerData.source, source, xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname)
                TriggerClientEvent("QBCore:Notify", source, "Oyuncuya İstek Gönderildi")
            end
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
    end
end)

QBCore.Commands.Add(Config.CancelCommand, "E-RP İzni Verilmiş Oyuncunun İznini İptal Eder!", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    local izinVerilen = izinler[xPlayer.PlayerData.citizenid]
    if izinVerilen then
        izinler[xPlayer.PlayerData.citizenid] = nil
        izinler[izinVerilen] = nil
        TriggerClientEvent("QBCore:Notify", source, "E-RP İzinleri İptal Ettin!", "error")
    end
end)

QBCore.Commands.Add("p1", "Pozisyon 1(Erkek)", {}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                local xPlayer = QBCore.Functions.GetPlayer(source) 
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, false, false, 15, "rcmpaparazzo_2", "shag_loop_poppy", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, false, false, 15, "rcmpaparazzo_2", "shag_loop_a", true, tPlayer.PlayerData.source, false, -0.18, -0.18)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p2", "Pozisyon 2(Araç)(Erkek)", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, false, false, 1, "misscarsteal2pimpsex", "pimpsex_hooker", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, false, true, 1, "misscarsteal2pimpsex", "pimpsex_punter", true, tPlayer.PlayerData.source, true, 0.60, 0.46)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p3", "Pozisyon 3(Erkek)", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, false, false, 1, "misscarsteal2pimpsex", "shagloop_hooker", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, false, false, 1, "misscarsteal2pimpsex", "shagloop_pimp", true, tPlayer.PlayerData.source, true, 0.38, 0.15)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p4", "Pozisyon 4(Erkek) (Araç)", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, true, false, 1, "oddjobs@assassinate@vice@sex", "frontseat_carsex_loop_f", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, true, true, 1, "oddjobs@assassinate@vice@sex", "frontseat_carsex_loop_m", false, tPlayer.PlayerData.source)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p5", "Pozisyon 5(Erkek) (Araç)", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, true, true, 1, "random@drunk_driver_2", "cardrunksex_loop_f", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, true, false, 1, "random@drunk_driver_2", "cardrunksex_loop_m", false, tPlayer.PlayerData.source)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p6", "Pozisyon 6(Erkek) (Araç)", {}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, true, false, 32, "mini@prostitutes@sexnorm_veh", "bj_loop_prostitute", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, true, true, 49, "mini@prostitutes@sexnorm_veh", "bj_loop_male", false, tPlayer.PlayerData.source)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

QBCore.Commands.Add("p7", "Pozisyon 7(Erkek) (Araç)", {}, true, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    local xPlayer = QBCore.Functions.GetPlayer(source) 
    if izinler[xPlayer.PlayerData.citizenid] then
        local tPlayer = QBCore.Functions.GetPlayerByCitizenId(izinler[xPlayer.PlayerData.citizenid])
        if tPlayer then 
            if checkDistance(source, tPlayer.PlayerData.source) then
                if izinler[tPlayer.PlayerData.citizenid] == xPlayer.PlayerData.citizenid then
                    TriggerClientEvent("ed-erp:animasyon", tPlayer.PlayerData.source, true, false, 32, "oddjobs@towing", "f_blow_job_loop", false, xPlayer.PlayerData.source)
                    TriggerClientEvent("ed-erp:animasyon", xPlayer.PlayerData.source, true, true, 49, "oddjobs@towing", "m_blow_job_loop", false, tPlayer.PlayerData.source)
                else
                    TriggerClientEvent("QBCore:Notify", source, "Oyuncu İle E-RP İznin Yok!", "error")
                end
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Oyuncu Online Değil", "error")
        end
    else
        TriggerClientEvent("QBCore:Notify", source, "Herhangi Bir Oyuncu İle ERP İznin Yok!", "error")
    end
end)

function checkDistance(player, target)
    local PlayerPos = GetEntityCoords(GetPlayerPed(player))
    local TargetPos = GetEntityCoords(GetPlayerPed(target))
    if #(PlayerPos - TargetPos) < 3 then
        return true
    else
        TriggerClientEvent("QBCore:Notify", player, "Oyuncu Yakınında Değil", "error")
        return false
    end
end