local Translations = {
    success = {
        you_have_been_clocked_in = "Giriş yaptınız",
    },
    text = {
        point_enter_warehouse = "[E] Depoya Gir",
        enter_warehouse= "Depoya Gir",
        exit_warehouse= "Depodan Çık",
        point_exit_warehouse = "[E] Depodan Çık",
        clock_out = "[E] Çıkış Yap",
        clock_in = "[E] Giriş Yap",
        hand_in_package = "Paketi Teslim Et",
        point_hand_in_package = "[E] Paketi Teslim Et",
        get_package = "Paket Al",
        point_get_package = "[E] Paket Al",
        picking_up_the_package = "Paketi Alıyorsun",
        unpacking_the_package = "Paketi Açıyorsun",
    },
    error = {
        you_have_clocked_out = "Çıkış yaptınız"
    },
}


if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
