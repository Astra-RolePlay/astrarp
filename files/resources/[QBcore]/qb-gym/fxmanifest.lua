
fx_version 'cerulean'
game 'gta5'

ui_page 'html/ui.html'

files {
    'html/ui.html',
    'html/css/*.css',
    'html/js/*.js',
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
    'config.lua'
}

client_scripts {
    'client/functions.lua',
    "client/gym.lua",
    'config.lua',
}

exports {
    "SkillMenu",
    "UpdateSkill",
    "GetCurrentSkill",
    "UpdateSkillRemove"
}