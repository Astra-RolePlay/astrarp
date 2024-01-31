RegisterCommand("f3fix", function()
    TriggerEvent('qb-radialmenu:client:onRadialmenuClose')
end)

RegisterCommand("f2fix", function()
    TriggerEvent("qb-inventory:client:closeinv")
end)
