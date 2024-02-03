shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
description 'QB-Skillbar'
version '1.0.0'
ui_page "html/index.html"
client_script 'client/main.lua'
files {
    'html/index.html',
    'html/script.js',
    'html/style.css',
    'html/VerdanaBold.ttf'
}
dependencies {
    'qb-core'
}
lua54 'yes'