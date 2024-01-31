local QBCore = exports['qb-core']:GetCoreObject()

local Webhooks = {
    --- Self
    ['noclip'] = 'https://discord.com/api/webhooks/1172122105677107230/rOOpg8nSVBfEzQLFICV2SsJZt5KJ-E_ue5O0YXuzEWBtH5gTGrWzOGuqEo_QxR26y_SD',
    ['godmode'] = 'https://discord.com/api/webhooks/1172122108671819826/SUFlXhqSpEPP2sJTHrxJ_thDc2nmxY_p9-aas-NXU-DRj7lo1VDO2D_3xHlFZG95FOHU',
    ['vehicle'] = 'https://discord.com/api/webhooks/1172122110739632128/Gb9XkHsAMjf17IN2IFFU1EZYEMYtaCA8YhnUYVxmErmDo4oJImRoQUka_lpcfufYhlca',
    ['revive'] = 'https://discord.com/api/webhooks/1172122104632713267/jUfPDz4T4YTrmsi67dKNS62GEjo7xAJEnRKNmhckPpU5eG3rpPJmxqFLTWkTFnu5Fsoy',
    ['invisible'] = 'https://discord.com/api/webhooks/1172122107660996658/mOEENEGAu121ORsOyPmzRJO8KNa2QctvCcqRcC-_oyvqmqrQRah8hHwBmIDgGT88SdQ7',
    ['other'] = 'https://discord.com/api/webhooks/1171213563403186237/aB_hV82ydvVjGwBhqP9askRQUM-Ak7V2ZtwJCrIpjlQjNygCm0DqH7kwWZOwbQql1ERc',

    --- Players
    ["kill"] = 'https://discord.com/api/webhooks/1172122368626401290/Aglqt7IUoHf969vwCGu118zaYo0dIWZScw0EGijuJdz3MxcG8okOBMcL8t5O_jhcoNo6',
    ["revivep"] = 'https://discord.com/api/webhooks/1172122366487310466/-rO_tn8KLfgby3llXb9a9gm--KynkgV_WG7Ps8GtCr4fZXTvXE92MHz6UFCirpxmigpS',
    ["freeze"]= 'https://discord.com/api/webhooks/1172122365321285633/0z2N639iHzRZrdq2plN6BjOrQ36I0jEO1h1E59ma_5aHaWtVExnZ_Z5TUBU6N5mvEkqv',
    ["spectate"]= 'https://discord.com/api/webhooks/1172122369867923456/q0vIcpBBZ4qn5b5d8dXbxq4w_uidVMWw41uvMkiQCmly5Su6M-ZXo--MfI4LXxWrhidx',
    ["gotobring"]= 'https://discord.com/api/webhooks/1172122364314652692/CkfDmIUrTKishIhTBjsGwi-_lN5jy7Y2S9hWWKviV9W5o6z7-QOP5GxHJEAxbmu1tiAB',
    ["intovehicle"]= 'https://discord.com/api/webhooks/1172122570733146113/_Yf4K68wBvQibY8YDvMCWJuPMLKg5igMITNchmK5wQajg_lt265GcFKT_f6J5i9Aeysn',
    ["inventory"]= 'https://discord.com/api/webhooks/1172122575648858173/Y83QqE5NTIuzKBTWnu_DnqNsgTG7qRCoQ4-ULhAd8P2qsxlcCDZnLR1wYUkopfzvtM8p',
    ["clothing"]= 'https://discord.com/api/webhooks/1172122576848437278/w54GM5XWIqxBZElvYzUYWOkEfXZ7sqeUcLQi5DHZVUB_LmgimVW9hXdhEDm7T7hUcBD5',
    ["perms"] = 'https://discord.com/api/webhooks/1172122573992116274/eLTsI3YAlV9ZZIhBh7kpAERNVQtHtJRen3fIP3AX6n14Ykzg2aTHquc8gaXZ284qxJZK',
    ["givemoney"] = 'https://discord.com/api/webhooks/1172122572834484245/vk40RKSzEmt6ANr1SJcKFDvsm1JdQehAq2Zu_gz8jEVzJazkbyRIJFqIq3dYjF7kbOib',
    ["setmodel"] = 'https://discord.com/api/webhooks/1172122569541951569/RKHXXFOXxvE3qib4xYbw44ovZjl8igAi87Kg_bCfrLIzvu8FpFZrVUfv0wkIx1gxOBIG',

    --- Ban or Kick or Cheater
    ['kick'] = 'https://discord.com/api/webhooks/1172122755521589319/Ma7XxL9JNuu_5dm4K8WKXfeO9tZr9P5QtFbiI1F5YxN7rA_s9a0BQqXKjIxLo0QZJ4Pb',
    ['ban'] = 'https://discord.com/api/webhooks/1172122759044792331/s569OqRolmPfX0TUhvNeZPlqSc9Bbur6KKA69UW0d92vYOKBhzy7XsHpEkROIKrFB-kX',
    ['cheater'] = 'https://discord.com/api/webhooks/1171213560085479435/AfOyXOojtGdEtFET4l7iSfe3BLrrO7j1bUTdXMWO8prYPbQfcFea5cN45hBaiMM8GjMa',

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

local function postWebHook(name, title, color, message, tagEveryone)
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
                ['name'] = 'ELUSED - Admin [Logs]',
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/781483089264115712/1067103262089695232/logo_kopya.png',
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'UM - Admin [Logs]', embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = 'UM - Admin [Logs]', content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end

RegisterNetEvent('qb-adminmenu:log:minPage', function(webhook,event,color)
    local src = source
    postWebHook(webhook,event.." used",color,"**---------------------------------------------------------------**".."\n **ID:** `[" ..src.. "]`".."\n **CID:** `"..QBCore.Functions.GetPlayer(src).PlayerData.citizenid.. "`".. "\n **Player Name:** `"..GetPlayerName(src).. "`".. "\n **Discord:** " .."`"..(QBCore.Functions.GetIdentifier(src, 'discord') or 'undefined').."`".. "\n **Steam: **".."`"..(QBCore.Functions.GetIdentifier(src, 'steam') or 'undefined').."`".. "\n **License: **".."`"..(QBCore.Functions.GetIdentifier(src, 'license') or 'undefined').."`")
    Wait(100)
end)

RegisterNetEvent('qb-adminmenu:log:playersEvent', function(src,webhook,event,color,targetPlayer)
    local src = src
    local everyone = false
    if webhook == 'ban' or webhook == 'cheater' then everyone = true end
    postWebHook(webhook,event,color,"**---------------------------------------------------------------**".."\n **[Admin]** \n \n **ID:** `[" ..src.. "]`".."\n **CID:** `"..QBCore.Functions.GetPlayer(src).PlayerData.citizenid.. "`".. "\n **Player Name:** `"..GetPlayerName(src).. "`".. "\n **Discord:** " .."`"..(QBCore.Functions.GetIdentifier(src, 'discord') or 'undefined').."`".. "\n **Steam: **".."`"..(QBCore.Functions.GetIdentifier(src, 'steam') or 'undefined').."`".. "\n **License: **".."`"..(QBCore.Functions.GetIdentifier(src, 'license') or 'undefined').."`".."\n **---------------------------------------------------------------**".."\n **[Target]** \n \n **ID:** `[" ..targetPlayer.. "]`".."\n **CID:** `"..QBCore.Functions.GetPlayer(targetPlayer).PlayerData.citizenid.. "`".. "\n **Player Name:** `"..GetPlayerName(targetPlayer).. "`".. "\n **Discord:** " .."`"..(QBCore.Functions.GetIdentifier(targetPlayer, 'discord') or 'undefined').."`".. "\n **Steam: **".."`"..(QBCore.Functions.GetIdentifier(targetPlayer, 'steam') or 'undefined').."`".. "\n **License: **".."`"..(QBCore.Functions.GetIdentifier(targetPlayer, 'license') or 'undefined').."`", everyone)
    Wait(100)
end)
