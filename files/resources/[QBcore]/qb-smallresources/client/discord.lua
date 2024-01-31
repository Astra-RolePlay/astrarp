local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
    SetDiscordAppId(1202353532720918658)
	SetDiscordRichPresenceAsset('mylogo')
        SetDiscordRichPresenceAssetText('Astra RolePlay')
        SetDiscordRichPresenceAssetSmall('mylogo')
        SetDiscordRichPresenceAssetSmallText('Astra RolePlay | 02.02.2024')

        QBCore.Functions.TriggerCallback('smallresources:server:GetCurrentPlayers', function(result)
            SetRichPresence('Oyuncular: '..result..'/1024')
        end)
        SetDiscordRichPresenceAction(0, "Astra RolePlay", "https://discord.gg/Z7d3zetDmz")
	Wait(60000)
    end
end)
