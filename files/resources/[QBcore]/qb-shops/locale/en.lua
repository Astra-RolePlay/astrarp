local Translations = {
    info = {
        open_shop = "[E] Market",
        sell_chips = "[E] Çip Sat"
    },
    error = {
        dealer_decline = "Satıcı size ateşli silahları göstermeyi reddediyor",
        talk_cop = "Ateşli silah ruhsatı almak için kolluk kuvvetleriyle konuşun"
    },
    success = {
        dealer_verify = "Satıcı lisansını doğruladı"
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
