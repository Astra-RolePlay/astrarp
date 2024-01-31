local QBCore = exports['qb-core']:GetCoreObject()
local oArray = {}
local oPlayerUse = {}

AddEventHandler('playerDropped', function()
    local oSource = source
    if oPlayerUse[oSource] ~= nil then
        oArray[oPlayerUse[oSource]] = nil
        oPlayerUse[oSource] = nil
    end
end)

RegisterServerEvent('ed-chairbed:Server:Enter')
AddEventHandler('ed-chairbed:Server:Enter', function(object, objectcoords)
    local oSource = source
    if oArray[objectcoords] == nil then
        oPlayerUse[oSource] = objectcoords
        oArray[objectcoords] = true
        TriggerClientEvent('ed-chairbed:Client:Animation', oSource, object, objectcoords)
    end
end)

RegisterServerEvent('ed-chairbed:Server:Leave')
AddEventHandler('ed-chairbed:Server:Leave', function(objectcoords)
    local oSource = source

    oPlayerUse[oSource] = nil
    oArray[objectcoords] = nil
end)

