local Translations = {
    error = {
        no_people_nearby = "Yakınında oyuncu yok.",
        no_vehicle_found = "Araç bulunamadı.",
        extra_deactivated = "%{extra} özelliği deaktive edildi.",
        extra_not_present = "%{extra} özelliği bu araçta bulunmuyor.",
        not_driver = "Araç sürücüsü değilsin!",
        vehicle_driving_fast = "Bu araç çok hızlı gidiyor.",
        seat_occupied = "Bu koltuk dolu.",
        race_harness_on = "Yarış kemeriniz var, değiştiremezsiniz.",
        obj_not_found = "İstenilen nesne oluşturulamadı.",
        not_near_ambulance = "Bir ambulansa yakın değilsiniz.",
        far_away = "Çok uzaktasınız.",
        stretcher_in_use = "Bu sedye zaten kullanılıyor.",
        not_kidnapped = "Bu kişiyi kaçırmadın.",
        trunk_closed = "Bagaj kapalı.",
        cant_enter_trunk = "Bu bagaja giremezsiniz.",
        already_in_trunk = "Zaten bagajdasın.",
        someone_in_trunk = "Birisi zaten bagajda."
    },
    success = {
        extra_activated = "%{extra} özelliği aktive edildi.",
        entered_trunk = "Bagaja girdin."
    },
    info = {
        no_variants = "Bu özellik için herhangi bir seçenek bulunmuyor.",
        wrong_ped = "Bu ped modeli bu seçeneğe izin vermiyor.",
        nothing_to_remove = "Çıkartılacak bir kıyafetin yok.",
        already_wearing = "Herhangi bir kıyafet giymiyorsun.",
        switched_seats = "Artık %{seat} koltuğundasınız."
    },
    general = {
        command_description = "Yayılım Menüsünü Aç",
        push_stretcher_button = "~g~E~w~ - Sedye İt",
        stop_pushing_stretcher_button = "~g~E~w~ - İtmeyi Durdur",
        lay_stretcher_button = "~g~G~w~ - Sedye Üzerine Yat",
        push_position_drawtext = "Buraya İt",
        get_off_stretcher_button = "~g~G~w~ - Sedye'den İn",
        get_out_trunk_button = "[~g~E~w~] Bagajdan çık",
        close_trunk_button = "[~g~G~w~] Bagajı kapat",
        open_trunk_button = "[~g~G~w~] Bagajı aç",
        getintrunk_command_desc = "Bagaja Gir",
        putintrunk_command_desc = "Oyuncuyu Bagaja Koy"
    },
    options = {
        emergency_button = "Acil Durum Düğmesi",
        driver_seat = "Sürücü Koltuğu",
        passenger_seat = "Yolcu Koltuğu",
        other_seats = "Diğer Koltuklar",
        rear_left_seat = "Arka Sol Koltuk",
        rear_right_seat = "Arka Sağ Koltuk"        
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})