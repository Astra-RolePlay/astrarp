
 
fx_version 'cerulean'
game 'gta5'
version '1.0.0'
title "Repair Kit"
description "ps-ui Repair Kit system."
author "InDream#9996"
shared_scripts {
    'config.lua',
}
server_scripts {
	'server/server.lua',
}
client_script {
	'client/client.lua',
	'config.lua',
}
