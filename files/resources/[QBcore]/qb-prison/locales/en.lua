local Translations = {
    error = {
        ["missing_something"] = "Bir şeyler eksik gibi görünüyor...",
        ["not_enough_police"] = "Yeterli polis yok..",
        ["door_open"] = "Kapı zaten açık..",
        ["cancelled"] = "İşlem iptal edildi..",
        ["didnt_work"] = "İşe yaramadı..",
        ["emty_box"] = "Kutu boş..",
        ["injail"] = "Hapiste %{Time} ay kadar kalacaksınız..",
        ["item_missing"] = "Bir eşya eksik..",
        ["escaped"] = "Kaçtınız... Hemen buradan uzaklaşın!",
        ["do_some_work"] = "Cezanın azaltılması için biraz iş yapın, anlık iş: %{currentjob}",
        ["security_activated"] = "En yüksek güvenlik seviyesi etkin, hücre bloklarında kalın!"
    },
    success = {
        ["found_phone"] = "Bir telefon buldunuz..",
        ["time_cut"] = "Cezanızdan biraz süre azalttınız.",
        ["free_"] = "Serbestsiniz! Keyfini çıkarın! :)",
        ["timesup"] = "Süreniz doldu! Ziyaretçi merkezinde kendinizi çıkış yapın.",
    },
    info = {
        ["timeleft"] = "Hala yapmanız gereken... %{JAILTIME} ay",
        ["lost_job"] = "İşsizsiniz",
        ["job_interaction"] = "[E] Elektrik İşi",
        ["job_interaction_target"] = "%{job} İşi Yap",
        ["received_property"] = "Eşyalarınızı geri aldınız..",
        ["seized_property"] = "Eşyalarınız el konuldu, süreniz dolduğunda her şeyinizi geri alacaksınız..",
        ["cells_blip"] = "Hücreler",
        ["freedom_blip"] = "Cezaevi Ana Giriş",
        ["canteen_blip"] = "Yemekhane",
        ["work_blip"] = "Cezaevi İşleri",
        ["target_freedom_option"] = "Süreyi Kontrol Et",
        ["target_canteen_option"] = "Yemek Al",
        ["police_alert_title"] = "Yeni Çağrı",
        ["police_alert_description"] = "Cezaevi Hareketliliği",
        ["connecting_device"] = "Cihaz Bağlanıyor",
        ["working_electricity"] = "Kablolar Bağlanıyor"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
