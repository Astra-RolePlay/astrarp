local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
    SetDiscordAppId(969373081183346720)
	SetDiscordRichPresenceAsset('mylogo')
        SetDiscordRichPresenceAssetText('ELUSE DEV NEWQB V1')
        SetDiscordRichPresenceAssetSmall('mylogo')
        SetDiscordRichPresenceAssetSmallText('ELUSED DEV | XX.XX.2023')

        QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Oyuncular: '..result..'/1024')
        end)
        SetDiscordRichPresenceAction(0, "ELUSED DEV", "https://discord.gg/hBF2bPJb")
	Wait(60000)
    end
end)
