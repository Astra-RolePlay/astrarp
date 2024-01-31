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
