shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"
lua54 "yes"
author "Babicz"
version "1.0.0"
description "Handling Editor"

client_script "BabiczHandlingEditor_cl.lua"

files {
    "ui/script.js",
    "ui/index.html"
}

ui_page "ui/index.html"
