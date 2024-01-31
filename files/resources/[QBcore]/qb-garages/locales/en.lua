local Translations = {
    error = {
        no_vehicles = "Bu konumda araç yok!",
        not_impound = "Aracınız garajda değil",
        not_owned = "Bu aracı park edemezsin",
        not_correct_type = "Bu tip bir aracı burada depolayamazsın",
        not_enough = "Yetersiz para",
        no_garage = "Yok",
        too_far_away = "Park alanından uzaktasın",
        occupied = "Otopark zaten dolu",
        all_occupied = "Tüm park yerleri dolu",
        no_vehicle = "Park edecek araç yok",
        no_house_keys = "Bu evin garajının anahtarlarına sahip değilsin",
    },
    success = {
        vehicle_parked = "Araç Park Edildi",
    },
    menu = {
        header = {
            house_garage = "Ev Garajı",
            house_car = "Ev Garajı %{value}",
            public_car = "Genel Garaj %{value}",
            public_sea = "Halka Açık Kayıkhane %{value}",
            public_air = "Genel Hangar %{value}",
            job_car = "İş Garajı %{value}",
            job_sea = "İş Kayıkhane %{value}",
            job_air = "İş Hangarı %{value}",
            gang_car = "Çete garajı %{value}",
            gang_sea = "Çete Kayıkhanesi %{value}",
            gang_air = "Çete hangarı %{value}",
            depot_car = "Depo %{value}",
            depot_sea = "Depo %{value}",
            depot_air = "Depo %{value}",
            vehicles = "Mevcut Araçlar",
            depot = "%{value} [ $%{value2} ]",
            garage = "%{value} [ %{value2} ]",
        },
        leave = {
            car = "Garajdan Çık",
            sea = "Bot Garajından Çık",
            air = "Hangardan Çık",
            job = "Garajdan Çık"
        },
        text = {
            vehicles = "Garajdaki Araçları Göster",
            depot = "Plaka: %{value}<br>Benzin: %{value2} | Motor: %{value3} | Kaporta: %{value4}",
            garage = "Durum: %{value}<br>Benzin: %{value2} | Motor: %{value3} | Kaporta: %{value4}",
        }
    },
    status = {
        out = "Dışarda",
        garaged = "Garajda",
        impound = "Çekilmiş",
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
