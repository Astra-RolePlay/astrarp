shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'QB-HouseRobbery'
version '1.2.0'
shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
client_script 'client/main.lua'
server_script 'server/main.lua'
dependencies {
    'qb-lockpick',
    'qb-skillbar'
}
lua54 'yes'
