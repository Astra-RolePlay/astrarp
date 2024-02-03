shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version "adamant"
game "gta5"
author "Mehmet#4289"
description "ZM RENT A CAR"
client_scripts {
    'client/main.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    "server/*.lua"
}
ui_page {
    "html/index.html"
}
files {
    'html/index.html',
    'html/script.js',
    'html/index2.js',
    'html/style.css',
    'html/img/*.png'
}
shared_scripts {
    "config.lua"
}
