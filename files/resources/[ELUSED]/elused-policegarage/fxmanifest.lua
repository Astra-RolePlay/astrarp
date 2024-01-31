
fx_version 'adamant'
game 'gta5'
lua54 'yes'
author "ELUSED"
description "ED-POLICEGARAGE"
shared_scripts {
    'config.lua',
}
client_scripts {
    'client/client.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/server.lua',
}
lua54 'yes'

escrow_ignore {
    'config.lua'
  }