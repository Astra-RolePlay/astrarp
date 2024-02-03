shared_script '@ulasdmrc/shared_fg-obfuscated.lua'
shared_script '@ulasdmrc/ai_module_fg-obfuscated.lua'
shared_script "@nevo-scripts/cl_errorlog.lua"

ui_page 'index.html'

files {
  "index.html",
  "scripts.js",
  "css/style.css"
}
client_script {
  "client.lua",
}

export "taskBar"
export "closeGuiFail"