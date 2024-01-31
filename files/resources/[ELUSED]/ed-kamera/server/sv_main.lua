local QBCore = exports['qb-core']:GetCoreObject()

-- Add Discord webhook here.
local webhook = "https://discord.com/api/webhooks/1095241309465358386/Sxu9M4Jyjc-rYpz8sNSGDvZXM8r9gJKbPYoMZi7PZ4gs-_CPV6DgDNRtyGdXI-XQSnTv"

RegisterNetEvent("ed-kamera:cheatDetect", function()
    DropPlayer(source, "Cheater Detected")
end)

RegisterNetEvent("ed-kamera:grabHook", function(Key)
    local event = ("ed-kamera:grabbed%s"):format(Key)
    TriggerClientEvent(event, source, webhook)
end)

RegisterNetEvent("ed-kamera:CreatePhoto", function(url)
    local source = source
    local player = QBCore.Functions.GetPlayer(source)
    if not player then return end
    local info = {
        image = url
    }
    player.Functions.AddItem("photo", 1, nil, info)
end)

QBCore.Functions.CreateUseableItem("camera", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("ed-kamera:useCamera", source)
    end
end)

QBCore.Functions.CreateUseableItem("photo", function(source, item)
    local source = source
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemByName(item.name) then
        TriggerClientEvent("ed-kamera:usePhoto", source, item.info.image)
    end
end)

function UseCam(source)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player.Functions.GetItemByName('camera') then
        TriggerClientEvent("ed-kamera:useCamera", src)
    else
        TriggerClientEvent('QBCore:Notify', src, "U don\'t have a camera", "error")
    end
end

exports("UseCam", UseCam)
