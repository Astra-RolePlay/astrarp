fx_version 'cerulean'
game 'gta5'

description 'QB-SmallResources'
version '1.1.0'

shared_script 'config.lua'
server_script 'server/*.lua'
client_script 'client/*.lua'

data_file 'FIVEM_LOVES_YOU_4B38E96CC036038F' 'events.meta'
data_file 'FIVEM_LOVES_YOU_341B23A2F0E0F131' 'popgroups.ymt'
data_file 'WEAPONINFO_FILE_PATCH' 'weaponsnowball.meta'

files {
	'events.meta',
	'popgroups.ymt',
	'relationships.dat',
	'weaponsnowball.meta',
}

lua54 'yes'
use_experimental_fxv2_oal 'yes'
