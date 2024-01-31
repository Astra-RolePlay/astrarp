local QBCore = exports['qb-core']:GetCoreObject()

local function knoesdevelopment(notifType, message, title, serversource)
    local src = serversource or source
    if Config.Framework.Notifications == 'qb' or 'tnj' then
        if notifType == 1 then
            TriggerClientEvent('QBCore:Notify', src, message, 'success')
        elseif notifType == 2 then
            TriggerClientEvent('QBCore:Notify', src, message, 'primary')
        elseif notifType == 3 then
            TriggerClientEvent('QBCore:Notify', src, message, 'error')
        end
    elseif Config.Framework.Notifications == 'okok' then
        if notifType == 1 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'success')
        elseif notifType == 2 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'info')
        elseif notifType == 3 then
            TriggerClientEvent('okokNotify:Alert', src, title, message, 5000, 'error')
        end
    elseif Config.Framework.Notifications == 'mythic' then
        if notifType == 1 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'success', text = message, length = 5000})
        elseif notifType == 2 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'inform', text = message, length = 5000})
        elseif notifType == 3 then
            TriggerClientEvent('mythic_notify:client:SendAlert:custom', src, { type = 'error', text = message, length = 5000})
        end
    elseif Config.Framework.Notifications == 'chat' then
        TriggerClientEvent('chatMessage', src, message)
    end
end

local function MedicalAid(serversource)
    local src = serversource or source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney(Config.IllegalMedical.PaymentType, Config.IllegalMedical.PaymentCost)
    knoesdevelopment(1, "Vay canına, yardım edilmek için sertifikanız var gibi görünüyor!", Config.IllegalMedical.OkOkNotificationTitle, src)
    TriggerClientEvent("hospital:client:Revive", src)
    Wait(2500 * 10)
    if Config.Framework.Logs then
        TriggerEvent('qb-log:server:CreateLog', 'knoesdevelopment', 'Kullanıcı Sağlığına Yardım Edildi', 'green', '**Player : **'..GetPlayerName(src)..'\n**MoneyType : **'..Config.IllegalMedical.PaymentType..' **Amount : **'..Config.IllegalMedical.PaymentCost)
    end
    knoesdevelopment(2, Config.IllegalMedical.PedName.." Sağlık Sorunlarınızda size yardımcı oldu...", Config.IllegalMedical.OkOkNotificationTitle, src)
end

local function MedicalAidInjuries(serversource)
    local src = serversource or source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveMoney(Config.MedicalAidInjuries.PaymentType, Config.MedicalAidInjuries.PaymentCost)
    knoesdevelopment(1, "Vay canına, yardım edilmek için sertifikanız var gibi görünüyor!", Config.IllegalMedical.OkOkNotificationTitle, src)
    TriggerClientEvent("hospital:client:HealInjuries", src, "full")
    Wait(2500 * 10)
    if Config.Framework.Logs then
        TriggerEvent('qb-log:server:CreateLog', 'knoesdevelopment', 'Kullanıcı Yaralanmalarına Yardım Edildi', 'green', '**Player : **'..GetPlayerName(src)..'\n**MoneyType : **'..Config.MedicalAidInjuries.PaymentType..' **Amount : **'..Config.IllegalMedical.PaymentCost)
    end
    knoesdevelopment(2, Config.IllegalMedical.PedName.." Sağlık Sorunlarınızda size yardımcı oldu...", Config.IllegalMedical.OkOkNotificationTitle, src)
end

RegisterNetEvent('ed-buyukanne:server:hug', function(coords)
    TriggerClientEvent("ed-buyukanne:client:hug", -1, coords)
end)

RegisterNetEvent('ed-buyukanne:server:idle', function(coords)
    TriggerClientEvent("ed-buyukanne:client:idle", -1, coords)
end)

RegisterNetEvent('ed-buyukanne:server:MedicalAid', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local HasCash = Player.Functions.GetMoney("cash")
    local HasBank = Player.Functions.GetMoney("bank")
    local HasCrypto = Player.Functions.GetMoney("crypto")
    local HasItem = Player.Functions.GetItemByName(Config.IllegalMedical.Item)
    if Config.IllegalMedical.PaymentType == 'cash' or Config.IllegalMedical.PaymentType == 'bank' or Config.IllegalMedical.PaymentType == 'crypto' then
        if Config.IllegalMedical.PaymentType == 'cash' and HasCash >= Config.IllegalMedical.PaymentCost then
            MedicalAid(src)
        elseif Config.IllegalMedical.PaymentType == 'bank' and HasBank >= Config.IllegalMedical.PaymentCost then
            MedicalAid(src)
        elseif Config.IllegalMedical.PaymentType == 'crypto' and HasCrypto >= Config.IllegalMedical.PaymentCost then
            MedicalAid(src)
        else
            knoesdevelopment(3, "Para olmadan gerçekten yardım almaya çalışıyorsun, Deli misin!?", Config.IllegalMedical.OkOkNotificationTitle, src)
        end
    elseif Config.IllegalMedical.PaymentType == 'item' then
        if HasItem then
            Player.Functions.RemoveItem(Config.IllegalMedical.Item, Config.IllegalMedical.ItemAmount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.IllegalMedical.Item], "remove", Config.IllegalMedical.ItemAmount)
            knoesdevelopment(1, "Vay canına, yardım edilmek için sertifikanız var gibi görünüyor!", Config.IllegalMedical.OkOkNotificationTitle, src)
            TriggerClientEvent("hospital:client:Revive", src)
            Wait(2500 * 10)
            knoesdevelopment(2, Config.IllegalMedical.PedName.." Sağlık Sorunlarınızda size yardımcı oldu...", Config.IllegalMedical.OkOkNotificationTitle, src)
            if Config.Framework.Logs then
                TriggerEvent('qb-log:server:CreateLog', 'knoesdevelopment', 'Kullanıcı Sağlığına Yardım Edildi', 'green', '**Player : **'..GetPlayerName(src)..'\n**MoneyType : **'..Config.IllegalMedical.PaymentType..' **Amount : **'..Config.IllegalMedical.PaymentCost)
            end
        else
            knoesdevelopment(3, "Temel Öğelere sahip değilmişsiniz gibi görünüyor!?", Config.IllegalMedical.OkOkNotificationTitle, src)
        end
    end
end)

RegisterNetEvent('ed-buyukanne:server:MedicalAidInjuries', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local HasCash = Player.Functions.GetMoney("cash")
    local HasBank = Player.Functions.GetMoney("bank")
    local HasCrypto = Player.Functions.GetMoney("crypto")
    local HasItem = Player.Functions.GetItemByName(Config.IllegalMedical.Item)
    if Config.IllegalMedicalTarget.InjuryTarget == true then
        if Config.MedicalAidInjuries.PaymentType == 'cash' or Config.MedicalAidInjuries.PaymentType == 'bank' or Config.MedicalAidInjuries.PaymentType == 'crypto' then
            if Config.MedicalAidInjuries.PaymentType == 'cash' and HasCash >= Config.MedicalAidInjuries.PaymentCost then
                MedicalAidInjuries(src)
            elseif Config.MedicalAidInjuries.PaymentType == 'bank' and HasBank >= Config.MedicalAidInjuries.PaymentCost then
                MedicalAidInjuries(src)
            elseif Config.MedicalAidInjuries.PaymentType == 'crypto' and HasCrypto >= Config.MedicalAidInjuries.PaymentCost then
                MedicalAidInjuries(src)
            else
                knoesdevelopment(3, "Para olmadan gerçekten yardım almaya çalışıyorsun, Deli misin!?", Config.IllegalMedical.OkOkNotificationTitle, src)
            end
        elseif Config.MedicalAidInjuries.PaymentType == 'item' then
            if HasItem then
                Player.Functions.RemoveItem(Config.MedicalAidInjuries.Item, Config.MedicalAidInjuries.ItemAmount)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Config.MedicalAidInjuries.Item], "remove", Config.MedicalAidInjuries.ItemAmount)
                knoesdevelopment(1, "Vay canına, yardım edilmek için sertifikanız var gibi görünüyor!", Config.IllegalMedical.OkOkNotificationTitle, src)
                TriggerClientEvent("hospital:client:HealInjuries", src, "full")
                Wait(2500 * 10)
                if Config.Framework.Logs then
                    TriggerEvent('qb-log:server:CreateLog', 'knoesdevelopment', 'Kullanıcı Yaralanmalarına Yardım Edildi', 'green', '**Player : **'..GetPlayerName(src)..'\n**MoneyType : **'..Config.MedicalAidInjuries.PaymentType..' **Amount : **'..Config.IllegalMedical.PaymentCost)
                end
                knoesdevelopment(2, Config.IllegalMedical.PedName.." Sağlık Sorunlarınızda size yardımcı oldu...", Config.IllegalMedical.OkOkNotificationTitle, src)
            else
                knoesdevelopment(3, "Temel Öğelere sahip değilmişsiniz gibi görünüyor!?", Config.IllegalMedical.OkOkNotificationTitle, src)
            end
        end
    else
        knoesdevelopment(2, "Ahhh, peki şu anda Tıbbi Yaralanmalarınıza yardımcı olamam...", Config.IllegalMedical.OkOkNotificationTitle, src)
    end
end)
