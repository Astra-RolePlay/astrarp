local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Functions.CreateUseableItem('birthdaycake', function(source, item)
    TriggerClientEvent("ed-birthdaycake:openmenu", source)
end)

RegisterNetEvent('ed-birthdaycake:RemoveItem', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, 1)
end)

QBCore.Functions.CreateUseableItem("slicedcake", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem("slicedcake", 1, item.slot) then return end
    TriggerClientEvent("consumables:client:Eat", source, "slicedcake")
end)

RegisterNetEvent('ed-birthdaycake:AddItem', function(item)
    local src = source
    local giveItems = "slicedcake"
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.AddItem(giveItems, 10) then
        QBCore.Functions.Notify(src, "10 Adet ".. QBCore.Shared.Items[giveItems].label.." Elde Ettin!", "success")
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[giveItems], "add", 1)
    else
        QBCore.Functions.Notify(src, "Üzerinde yeterince yer yok!", "error")
    end
end)


RegisterServerEvent("qb-hud:GiveMoneyServer", function(id, para)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local TargetId = id
    local PlayerPos = GetEntityCoords(GetPlayerPed(src))
    local Target = QBCore.Functions.GetPlayer(TargetId)
    local TargetPos = GetEntityCoords(GetPlayerPed(TargetId))
    local amount = para

    if Target ~= nil then
      if amount ~= nil then
        if amount > 0 then
          if Player.PlayerData.money.cash >= amount and amount > 0 then
            if #(PlayerPos - TargetPos) < 3 then
              if TargetId ~= source then
                Player.Functions.RemoveMoney('cash', amount, "Cash given to "..Player.PlayerData.citizenid)
                Target.Functions.AddMoney('cash', amount, "Nakit Para Aldı Parayı Veren:"..Player.PlayerData.charinfo.firstname .. " " ..Player.PlayerData.charinfo.lastname)
                TriggerClientEvent('QBCore:Notify', TargetId, Player.PlayerData.charinfo.firstname.." sana " .. amount .. "$ nakit para verdi!", 'success')
                TriggerClientEvent('QBCore:Notify', source, Target.PlayerData.charinfo.firstname.." isimli kişiye " .. amount .. "$ nakit para verdin!", 'success')
                TriggerEvent("DiscordBot:ToDiscord", "paratransfer", "Para verdi: "..amount.."$", source, TargetId)
              else
                TriggerClientEvent('chatMessage', source, "Sistem", "error", "Kendine para veremezsin!")
              end
            else
              TriggerClientEvent('chatMessage', source, "Sistem", "error", "Nakit vereceğin oyuncu yanında değil!")
            end
          else
            TriggerClientEvent('chatMessage', source, "Sistem", "error", "Yeteri kadar paran yok!")
          end
        else
          TriggerClientEvent('chatMessage', source, "Sistem", "error", "Miktar sıfırdan büyük olmalı!")
        end
      else
        TriggerClientEvent('chatMessage', source, "Sistem", "error", "Bir miktar yazman lazım!")
      end
    else
      TriggerClientEvent('chatMessage', source, "Sistem", "error", "Oyuncu online değil!")
    end
end)
