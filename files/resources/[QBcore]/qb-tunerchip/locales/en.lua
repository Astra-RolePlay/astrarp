local Translations = {
    success = {
        this_vehicle_has_been_tuned = "Bu Araç Ayarlandı",
    },
    text = {
        this_is_not_the_idea_is_it = "Bu fikir değil, değil mi?",
        connecting_nos = "NOS Bağlanıyor...",
    },
    error = {
        tunerchip_vehicle_tuned = "TunerChip v1.05: Araç Ayarlandı!",
        this_vehicle_has_not_been_tuned = "Bu Araç Ayarlanmadı",
        no_vehicle_nearby = "Yakınlarda Araç Yok",
        tunerchip_vehicle_has_been_reset = "TunerChip v1.05: Araç sıfırlandı!",
        you_are_not_in_a_vehicle = "Bir Araçta Değilsiniz",
        you_cannot_do_that_from_this_seat = "Bu koltuktan yapamazsınız!",
        you_already_have_nos_active = "Zaten aktif bir NOS'unuz var",
        canceled = "İptal Edildi",
    },  
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
