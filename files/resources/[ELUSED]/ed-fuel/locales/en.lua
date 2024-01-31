local Translations = {
    info = {
        pickup_pump = "Pompayı Al/Bırak",
        buy_jerrican = "Benzin Kutusu Al/Doldur",
        mount_pump = "[~g~E~w~] Pompayı Tak",
        dismount_pump = "[~r~E~w~] Pompayı Çıkar",
        info_pump =  "Pompayı Lütfen Bir Araca Yerleştirin",
        refilling = "YAKIT DOLDURULUYOR: %{value}L<br>UCRET: $%{value2}",
        jerrican_refilling = "YAKIT: %{value}L",
        recharging = "Şarz Ediliyor: %{value}Kw<br>UCRET: $%{value2}",
        blip_fuel = "Benzinlik",
        blip_electric = "Elektirkli Araç Şarz Yeri",
    },
    message = {
        jerrican_refilled = "Benzin Kutusu Dolduruldu",
        jerrican_full = "Benzin Kutusu Dolu",
        jerrican_bought = "Benzin Kutusu Satın Aldın",
        no_money = "Yeterli Paran Yok",
        must_be_driver = "Bunu Yapmak İçin Sürücü Olmanız Gerekir",
        to_far_away = "Çok Uzaktasın Hortum Koptu"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
