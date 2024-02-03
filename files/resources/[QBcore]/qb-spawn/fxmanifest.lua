shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'QB-Spawn'
version '1.2.0'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
    'config.lua',
    '@qb-apartments/config.lua',
}
client_script 'client.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua'
}
ui_page 'html/index.html'
files {
    'html/index.html',
    'html/style.css',
    'html/vue.js',
    'html/reset.css'
}
lua54 'yes'
