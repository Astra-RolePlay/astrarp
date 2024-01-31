local QBCore = exports['qb-core']:GetCoreObject()


QBCore.Commands.Add("kucakla", "Yakındaki Oyuncuyu Kucakla", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    TriggerClientEvent("ed-kucakla:kontrol", source, "kucak")
end)

QBCore.Commands.Add("rehinal", "Yakındaki Oyuncuyu Rehin Al", {}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
TriggerClientEvent("ed-kucakla:kontrol", source, "rehin")
end)

RegisterServerEvent('ed-kucakla:server:oyuncu-2-anim')
AddEventHandler('ed-kucakla:server:oyuncu-2-anim', function(targetSource, tip)
    TriggerClientEvent("ed-kucakla:client:oyuncu-2-anim", targetSource, tip, source)
end)

RegisterServerEvent('ed-kucakla:server:anim-iptal')
AddEventHandler('ed-kucakla:server:anim-iptal', function(targetSource)
    TriggerClientEvent("ed-kucakla:client:anim-iptal", targetSource)
end)

RegisterServerEvent('ed-kucakla:server:rehin-birak')
AddEventHandler('ed-kucakla:server:rehin-birak', function(targetSource, tip)
    TriggerClientEvent("ed-kucakla:client:rehin-birak", targetSource, tip)
end)
