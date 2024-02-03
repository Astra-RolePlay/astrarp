shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
fx_version 'bodacious'
game 'gta5'
this_is_a_map 'yes'
lua54 'yes'

client_script {
    'client/cl_*.lua'
}

escrow_ignore {
  'client/cl_ipl.lua',
  'stream/entitysetreplacements.ytd'
}