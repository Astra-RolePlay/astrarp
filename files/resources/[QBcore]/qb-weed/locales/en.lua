local Translations = {
    error = {
        process_canceled = "İptal Edildi",
        plant_has_died = "Bitki öldü. Bitkiyi çıkarmak için ~r~ E ~w~'ye basın.",
        cant_place_here = "Buraya Yerleştirilemez",
        not_safe_here = "Burası Güvenli Değil, Evinizi Deneyin",
        not_need_nutrition = "Bitkinin Beslenmeye İhtiyacı Yoktur",
        this_plant_no_longer_exists = "Bu bitki artık yok mu?",
        house_not_found = "Ev Bulunamadı",
        you_dont_have_enough_resealable_bags = "Yeterince Açılıp Kapanabilir Çantanız Yok",
    },
    text = {
        sort = 'Çesit:',
        harvest_plant = 'Bitkiyi hasat etmek için ~g~ E ~w~ye basın.',
        nutrition = "Beslenme:",
        health = "Saglık:",
        harvesting_plant = "Hasat Tesisi",
        planting = "Saksı koyuyorsun",
        feeding_plant = "Besleme Tesisi",
        the_plant_has_been_harvested = "Bitki hasat edildi",
        removing_the_plant = "Saksıyı kaldırdıyorsun",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
