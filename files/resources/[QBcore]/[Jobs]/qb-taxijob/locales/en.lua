local Translations = {
    error = {
        ["already_mission"] = "Zaten Bir NPC Görevi Yapıyorsunuz.",
        ["not_in_taxi"] = "Takside Değilsin!",
        ["missing_meter"] = "Bu Aracın Taksimetresi Yok!",
        ["no_vehicle"] = "Bir araçta değilsin!",
        ["not_active_meter"] = "Taksimetre Aktif Değil!",
        ["no_meter_sight"] = "Görünürde Taksimetre Yok!",
    },
    success = {},
    info = {
        ["person_was_dropped_off"] = "Kişiyi Bıraktın!",
        ["npc_on_gps"] = "Müşteri, GPS'inizde Belirtildi.",
        ["go_to_location"] = "Müşteri'yi Belirtilen Yere Götürün.",
        ["vehicle_parking"] = "[E] Aracı Park Et",
        ["job_vehicles"] = "[E] İş Araçları",
        ["drop_off_npc"] = "[E] Müşteriyi Bırak",
        ["call_npc"] = "[E] Müşteriyi Al",
        ["blip_name"] = "Taksi Durağı",
        ["taxi_label_1"] = "Taksi Durağı",
        ["no_spawn_point"] = "Taksiyi getirecek yer bulunamadı.",
        ["taxi_returned"] = "Park Edildi."
    },
    menu = {
        ["taxi_menu_header"] = "Taksi Araçları",
        ["close_menu"] = "Kapat",
        ['boss_menu'] = "Patron Menüsü"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
