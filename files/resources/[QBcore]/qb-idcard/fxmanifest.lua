shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

shared_scripts {
    'cfg.lua',
    'utils.lua',
}
client_script 'client.lua'
server_scripts {
    'editable_functions.lua',
    'server.lua'
}

ui_page 'nui/index.html'

files {
    'nui/index.html',
    'nui/script.js',
    'nui/images/*.png',
}

escrow_ignore {
    'cfg.lua',
    'utils.lua',
    'client.lua',
    'editable_functions.lua',
    'server.lua'
}
dependency '/assetpacks'
