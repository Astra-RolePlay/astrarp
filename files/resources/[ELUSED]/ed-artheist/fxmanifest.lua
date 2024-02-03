shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
shared_scripts {
    'config.lua'
}
server_scripts {
	'server.lua'
}
client_scripts {
	'client.lua'
}
files {
    'ui/app.js',
    'ui/index.html',
    'ui/style.css',
    'ui/*.png',
}
ui_page {
    'ui/index.html'
}
lua54 'yes'