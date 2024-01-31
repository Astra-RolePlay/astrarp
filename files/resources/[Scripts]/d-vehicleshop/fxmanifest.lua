fx_version 'adamant'
game 'gta5'
description 'D-Vehicleshop from Deun Services'
version '1.2'
ui_page 'html/main.html'

lua54 'yes'

server_script {
  "shared.lua",
  "@mysql-async/lib/MySQL.lua",
  'locale.lua',
  'locales/*.lua',

  "config/config.lua",
  "config/Vehicles.lua",

  "server/*.lua",
}

client_script {
  "shared.lua",
  'locale.lua',
  'locales/*.lua',

  "config/config.lua",

  "client/*.lua",
}

shared_script {
  '@d-logging/log.lua',
  -- '@es_extended/imports.lua',
}

files {
  'html/main.html',
  'html/js/*.js',
  'html/js/locales/*.js',
  'html/css/*.css',
  'html/images/*.png',
  'html/images/icons/*.png',
  'html/fonts/*.woff',
  'html/fonts/*.ttf',
  'html/fonts/Roboto/*.ttf',
}

escrow_ignore {
  "config/*.lua",
  "server/suser.lua",
  "client/cuser.lua",
  'locales/*.lua',
}

dependency '/assetpacks'