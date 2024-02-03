shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
lua54 'yes'

server_scripts {
    "core/coreConfig.lua",
    "core/serverCore.lua",
}

client_scripts {
    "core/coreConfig.lua",
    "core/clientCore.lua",
}

client_scripts {
    "locales/*.lua",
    "editable/config.lua",
    "music/client.lua",
    "client/functions.lua",
    "client/main.lua",
}

server_scripts {
    "locales/*.lua",
    "music/server.lua",

    "server/main.lua"
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/css/*.css",
    "html/img/*.png",
    "html/img/item-icon/*.png",
    "html/js/*.js",
    "html/fonts/*.otf",
    "html/fonts/*.ttf",
}

escrow_ignore {
	'locales/*.lua',
	'editable/config.lua',
	'core/coreConfig.lua',
}

dependency '/assetpacks' 