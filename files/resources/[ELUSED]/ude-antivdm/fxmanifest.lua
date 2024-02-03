shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version "cerulean"
games { "gta5" }
lua54 "yes"
shared_script "@es_extended/imports.lua"
client_scripts {
    "client/cl_main.lua",
    "client/cl_functions.lua",
}
shared_scripts {
    "config.lua"
}
