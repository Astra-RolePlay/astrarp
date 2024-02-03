shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version "cerulean"
game "gta5"
client_script 'client/client.lua'
server_script {
    'server/server.lua',
    '@oxmysql/lib/MySQL.lua',
}
shared_scripts {
    '@qb-garages/config.lua',
  }
ui_page 'web/dist/index.html'
files {
    'web/dist/index.html',
    'web/dist/**/*',
}