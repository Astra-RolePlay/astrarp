local Translations = {
    error = {
        ["missing_something"] = "Bir şeyler eksik gibi görünüyor...",
        ["not_enough_police"] = "Yeterli polis yok...",
        ["door_open"] = "Kapı zaten açık...",
        ["process_cancelled"] = "İşlem iptal edildi...",
        ["didnt_work"] = "Çalışmadı...",
        ["emty_box"] = "Kutu boş...",
    },
    success = {
        ["worked"] = "Başarılı oldu!",
    },
    info = {
        ["palert"] = "Ev Soygunu Denemesi",
        ["henter"] = "~g~E~w~ - Giriş yapmak için",
        ["hleave"] = "~g~E~w~ - Evden çıkmak için",
        ["aint"] = "~g~E~w~ - ",
        ["hsearch"] = "Aranıyor...",
        ["hsempty"] = "Boş...",
    }    
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
