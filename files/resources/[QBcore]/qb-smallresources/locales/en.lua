local Translations = {
    afk = {
        will_kick = 'Sen AFK\'sın ve tekmeleneceksin ',
        time_seconds = ' saniye!',
        time_minutes = ' dakika(s)!'
    },
    wash = {
        in_progress = "Araç yıkanıyor.",
        wash_vehicle = "[E] Araç Yıka",
        wash_vehicle_target = "Araç Yıkama",
        dirty = "Araç kirli değil",
        cancel = "İptal edildi.",
    },
    consumables = {
        eat_progress = "Yiyorsun.",
        drink_progress = "İçiyorsun.",
        liqour_progress = "Alkol içiyorsun.",
        coke_progress = "Hızlıca kokluyorsun.",
        crack_progress = "Çekiyorsun..",
        ecstasy_progress = "Yutuyorsun",
        healing_progress = "İyileştirme",
        meth_progress = "Meth kullanıyorsun",
        joint_progress = "İç babam iç..",
        use_parachute_progress = "Paraşüt takıyorsun..",
        pack_parachute_progress = "Paraşüt paketliyor..",
        no_parachute = "Paraşütün yok!",
        armor_full = "Zaten yeterince zırhın var!",
        armor_empty = "Yelek giymiyorsun..",
        armor_progress = "Vücut zırhını giymek..",
        heavy_armor_progress = "Vücut zırhı giymek..",
        remove_armor_progress = "Vücut zırhını çıkarma..",
        canceled = "İptal edildi..",
    },
    cruise = {
        unavailable = "Hız sabitleyici kullanılamıyor",
        activated = "Seyir Etkinleştirildi: ",
        deactivated = "Seyir Devre Dışı Bırakıldı",
    },
    editor = {
        started = "Kayda Başladı!",
        save = "Kayıtlı Kayıt!",
        delete = "Silinen Kayıt!",
        editor = "Daha sonra timsah!"
    },
    firework = {
        place_progress = "Nesne yerleştirme..",
        canceled = "İptal edildi..",
        time_left = "Havai fişek bitti ~r~"
    },
    seatbelt = {
        use_harness_progress = "Yarış Kemerinin Tak",
        remove_harness_progress = "Yarış Kemerini Çıkarma",
        no_car = "Arabada değilsin."
    },
    teleport = {
        teleport_default = 'Asansör Kullan'
    },
    pushcar = {
        stop_push = "[E] İtmeyi Durdur"
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})