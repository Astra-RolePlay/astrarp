local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('ed-birthdaycake:openmenu', function(abicim)
  local Menu = {
      {
          header = "Pasta İşlemleri",
          icon = "fas fa-birthday-cake",
          isMenuHeader = true,
      },
      {
          header = "Pastayı Tek Elinle Tut",
          icon = "fas fa-hand-holding",
          txt = "Pastayı Tek Elinle Tutabilirsin.",
          params = {
              event = "ed-birthdaycake:tekel",
          }
      },
      {
          header = "Pastayı İki Elinle Tut",
          icon = "	fas fa-hands",
          txt = "Pastayı İki Elinle Tutabilirsin.",
          params = {
              event = "ed-birthdaycake:ikiel",
          }
      },
      {
          header = "Pastayı Kes",
          icon = "fas fa-cheese",
          txt = "Pastayı 10 Dilime Böl.",
          params = {
              event = "ed-birthdaycake:pastayikes",
          }
      },
      {
        header = "Pastayı Bırak",
        icon = "fas fa-birthday-cake",
        txt = "Elinde Duran Pastayı Bırakabilirsin.",
        params = {
            event = "ed-birthdaycake:pastayibirak",
        }
    },
  }
  Menu[#Menu+1] = {
    header = "Kapat",
    icon = "fa fa-mail-reply",
      params = {
          event = "qb-menu:client:closeMenu"
      }
  }
  exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('ed-birthdaycake:pastayibirak', function(abicim)
  TriggerEvent('animations:client:EmoteCommandStart', {"c"})
  QBCore.Functions.Notify("Pastayı Bıraktın.", "success")
  TriggerEvent("qb-menu:client:closeMenu")
end)

RegisterNetEvent('ed-birthdaycake:ikiel', function(abicim)
  TriggerEvent('animations:client:EmoteCommandStart', {"dgpasta"})
  QBCore.Functions.Notify("Tekrar Pastayı Kullanarak Pastayı Elinden Bırakabilirsin.", "inform")
  TriggerEvent("qb-menu:client:closeMenu")
end)

RegisterNetEvent('ed-birthdaycake:tekel', function(abicim)
  TriggerEvent('animations:client:EmoteCommandStart', {"dgpasta2"})
  QBCore.Functions.Notify("Tekrar Pastayı Kullanarak Pastayı Elinden Bırakabilirsin.", "inform")
  TriggerEvent("qb-menu:client:closeMenu")
end)

RegisterNetEvent('ed-birthdaycake:pastayikes', function(abicim)
  TaskStartScenarioInPlace(PlayerPedId(), 'CODE_HUMAN_MEDIC_TEND_TO_DEAD', 0, true)
  QBCore.Functions.Progressbar("pasta_kes", "Pastayı Dilimliyorsun.", 10000, false, true, {
    disableMovement = true,
    disableCarMovement = true,
    disableMouse = false,
    disableCombat = true,
  }, {}, {}, {}, function() -- Done
      TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items["birthdaycake"], "remove")
      TriggerServerEvent('ed-birthdaycake:RemoveItem', "birthdaycake")
      TriggerServerEvent('ed-birthdaycake:AddItem', src)
      QBCore.Functions.Notify("Pastayı Başarılıyla Dilimledin.", "success")
      ClearPedTasksImmediately(PlayerPedId())
  end, function() -- Cancel
      ClearPedTasksImmediately(PlayerPedId())
      QBCore.Functions.Notify("İşlem iptal edildi.", "error")
  end)
end)


RegisterNetEvent("qb-hud:GiveMoney", function(id)

  local deposit = exports['qb-input']:ShowInput({
      header = "Para Transferi",
      submitText = "Onayla",
      inputs = {
          {
              type = 'number',
              isRequired = true,
              name = 'amount',
              text = "Oyuncuya para ver"
          }
      }
  })
  if deposit then
      if not deposit.amount then return end
      RequestAnimDict('mp_common', function()
          TaskPlayAnim(PlayerPedId(), 'mp_common', 'givetake2_a', 5.0, 1.5, 1.0, 48, 0.0, 0, 0, 0)
      end)
      TriggerServerEvent("qb-hud:GiveMoneyServer", GetPlayerServerId(NetworkGetEntityOwner(id.entity)), tonumber(deposit.amount))
  end

end)