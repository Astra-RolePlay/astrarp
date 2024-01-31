local QBCore = exports['qb-core']:GetCoreObject()

RegisterServerEvent("qb-gym:update")
AddEventHandler("qb-gym:update", function(data, key)
     local src = source
     local xPlayer = QBCore.Functions.GetPlayer(src)
     if xPlayer then
          xPlayer.Functions.SetMetaData("skill", data)
     end
end)