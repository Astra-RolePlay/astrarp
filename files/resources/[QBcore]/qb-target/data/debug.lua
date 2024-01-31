local targeting = exports['qb-target']
local CurrentResourceName = GetCurrentResourceName()

AddEventHandler(CurrentResourceName..':debug', function(data)
    print('Entity: '..data.entity, 'Model: '..GetEntityModel(data.entity), 'Type: '..GetEntityType(data.entity))
    if data.remove then
        targeting:RemoveTargetEntity(data.entity, 'Hello World')
    else
        targeting:AddTargetEntity(data.entity, {
            options = {
                {
                    type = "client",
                    event = CurrentResourceName..':debug',
                    icon = "fas fa-box-circle-check",
                    label = "Selam Dünya",
                    remove = true
                },
            },
            distance = 3.0
        })
    end
end)

targeting:AddGlobalPed({
    options = {
        {
            type = "client",
            event = CurrentResourceName..':debug',
            icon = "fas fa-male",
            label = "(Debug) Ped",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalVehicle({
    options = {
        {
            type = "client",
            event = CurrentResourceName..':debug',
            icon = "fas fa-car",
            label = "(Hata ayıklama) Araç",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalObject({
    options = {
        {
            type = "client",
            event = CurrentResourceName..':debug',
            icon = "fas fa-cube",
            label = "(Hata ayıklama) Nesne",
        },
    },
    distance = Config.MaxDistance
})

targeting:AddGlobalPlayer({
    options = {
        {
            type = "client",
            event = CurrentResourceName..':debug',
            icon = "fas fa-cube",
            label = "(Hata ayıklama) Oyuncu",
        },
    },
    distance = Config.MaxDistance
})