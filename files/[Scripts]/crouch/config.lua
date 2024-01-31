Config = {}

Config.CrouchKeybindEnabled = true -- If the crouching should have a keybind
Config.CrouchKeybind = 'LCONTROL' -- The default keybind for crouching
Config.CrouchOverride = true -- If true and the keybind for crouch is left control, then disable stealth mode and go straight to crouch. If false, and the keybind for crouch is left control then only enter crouch if we are already in stealth mode.
Config.CrouchKeypressTimer = 1000 -- If CrouchOverride is false and keybind for crouch is left control, then this is the max time in ms from last key press that the player can enter crouch. If is has been more then the specified time, then the player will not enter crouch but stop exit the stealth mode.

Config.CrawlKeybindEnabled = true -- If the crawling should have a keybind
Config.CrawlKeybind = 'RCONTROL' -- The default keybind for crawling

-- Localization
Config.Localization = {
    ['crouch_keymapping'] = "Eğilme",
    ['crouch_chat_suggestion'] = "Eğilme",
    ['crawl_keymapping'] = "Sürünme",
    ['crawl_chat_suggestion'] = "Sürünme"
}
