local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    ['default'] = 'https://discord.com/api/webhooks/1095245375914377318/YsI2I8v3MuOrLbNLfeIh1akOZXVq9wNotY0guJIOVkHP-ejHn8T8GAggK9qCQ9f6n70Q',
    ['testwebhook'] = 'https://discord.com/api/webhooks/1095245375914377318/YsI2I8v3MuOrLbNLfeIh1akOZXVq9wNotY0guJIOVkHP-ejHn8T8GAggK9qCQ9f6n70Q',
    ['playermoney'] = '',
    ['playerinventory'] = '',
    ['robbing'] = '',
    ['cuffing'] = '',
    ['drop'] = '',
    ['trunk'] = '',
    ['stash'] = '',
    ['glovebox'] = '',
    ['banking'] = '',
    ['vehicleshop'] = '',
    ['vehicleupgrades'] = '',
    ['shops'] = '',
    ['dealers'] = '',
    ['storerobbery'] = '',
    ['bankrobbery'] = '',
    ['powerplants'] = '',
    ['death'] = 'https://discord.com/api/webhooks/1095245658836979782/4EDB6wa3zAx3R0QqwLI0i_ZxovFj8gVW9TH46oFOEaK-AaXu-zeyCwj_JMzHJJhJWFr1',
    ['joinleave'] = 'https://discord.com/api/webhooks/1095245571964543007/ZPy399Hs8LMWaAa-hKoq3INbmvliNf3xqVk8gfaNKtbvRGW_RcBMVlSh2pfhGJkOSsWy',
    ['ooc'] = '',
    ['report'] = 'https://discord.com/api/webhooks/1095249700929667082/EVuvA_rqv-17PMspTqouPLcEbzxr4R_wzn6-C5Onj8EoqmwxBDu_9nczS5pJthf73Nib',
    ['me'] = '',
    ['pmelding'] = '',
    ['112'] = '',
    ['bans'] = '',
    ['anticheat'] = '',
    ['weather'] = 'https://discord.com/api/webhooks/1195097715202330715/rWCoOTBeChXyPWGHZ53vt2bjEU8pS6cVziRafcvHrMKnHxjWSfEexDkWpRyQ7ytvvJSM',
    ['moneysafes'] = '',
    ['bennys'] = '',
    ['bossmenu'] = '',
    ['robbery'] = '',
    ['casino'] = '',
    ['traphouse'] = '',
    ['911'] = '',
    ['palert'] = '',
    ['house'] = '',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('qb-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = 'SARP LOG',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/852671870460624927/1095241722562363412/sarplog.png',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'SARP LOG', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'SARP LOG', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

QBCore.Commands.Add('testwebhook', 'Sunucudan Test Log Gönderir.', {}, false, function()
    TriggerEvent('qb-log:server:CreateLog', 'testwebhook', 'Test Webhook', 'default', 'Loglar Çalışıyor!')
end, 'god')
