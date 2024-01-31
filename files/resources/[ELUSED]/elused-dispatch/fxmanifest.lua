
fx_version 'cerulean'
game 'gta5'

version '1.0'
description 'ELUSED DISPATCH'

shared_scripts {
    'config.lua',
    'locales/locales.lua'
}

client_script 'client/main.lua'
server_script 'server.lua'

ui_page {
    'html/alerts.html',
}

files {
	'html/alerts.html',
	'html/main.js', 
	'html/style.css',
}

export "getSpeed"           -- exports['elused-dispatch']:getSpeed
export "getStreet"          -- exports['elused-dispatch']:getStreet
export "zoneChance"         -- exports['elused-dispatch']:zoneChance('Custom', 2)
lua54 'yes'
escrow_ignore {
    'config.lua',
    'client/main.lua',
    'locales/locales.lua'
  }
