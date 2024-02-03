shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'adamant'
game "gta5"
name 'kgv-blackjack'
description 'Playable Blackjack at the casino, similar to GTAOnline.'
author 'Xinerki - https://github.com/Xinerki/'
url 'https://github.com/Xinerki/kgv-blackjack'
shared_scripts {
	'coords.lua',
}
client_scripts{
	'client/*.lua'
} 
server_scripts{
	'server/*.lua'
} 
