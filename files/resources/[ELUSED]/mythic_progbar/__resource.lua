shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
ui_page('html/index.html') 
client_scripts {
    'client/main.lua'
}
files {
    'html/index.html',
    'html/css/style.css',
    'html/js/script.js'
}
exports {
    'Progress',
    'ProgressWithStartEvent',
    'ProgressWithTickEvent',
    'ProgressWithStartAndTick'
}