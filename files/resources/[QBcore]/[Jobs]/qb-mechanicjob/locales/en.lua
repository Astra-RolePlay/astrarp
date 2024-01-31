local Translations = {
    labels = {
        engine = 'Motor',
        bodsy = 'Gövde',
        radiator = 'Radyatör',
        axle = 'Tahrik mili',
        brakes = 'Frenler',
        clutch = 'Debriyaj',
        fuel = 'Yakıt tankı',
        sign_in = 'Kayıt olmak',
        sign_off = 'Bitirmek',
        o_stash = '[E] Zulayı Aç',
        h_vehicle = '[E] Aracı Gizle',
        g_vehicle = '[E] Araç Al',
        o_menu = '[E] Menüyü Aç',
        work_v = '[E] Araç Üzerinde Çalışmak',
        progress_bar = 'Tamir...',
        veh_status = 'Araç Durumu:',
        job_blip = 'Oto Bakım Tamircisi',
    },

    lift_menu = {
        header_menu = 'Araç Seçenekleri',
        header_vehdc = 'Aracın Bağlantısını Kes',
        desc_vehdc = 'Aracı Kaldırma Halinde Ayırın',
        header_stats = 'Durumu kontrol et',
        desc_stats = 'Araç Durumunu Kontrol Et',
        header_parts = 'Araç Parçaları',
        desc_parts = 'Araç Parçalarının Onarımı',
        c_menu = '⬅ Menüyü Kapat'
    },

    parts_menu = {
        status = 'Durum: ',
        menu_header = 'Parça Menüsü',
        repair_op = 'Tamirat:',
        b_menu = '⬅ Geri Menü',
        d_menu = 'Parça menüsüne geri dön',
        c_menu = '⬅ Menüyü Kapat'
    },

    nodamage_menu = {
        header = 'Hasar yok',
        bh_menu = 'Geri Menü',
        bd_menu = 'Bu Parçada Herhangi Bir Hasar Yoktur!',
        c_menu = '⬅ Menüyü Kapat'
    },

    notifications = {
        not_enough = 'Sen yapma\'t Yeteri kadar var',
        not_have = 'sen yapma\'sahip değilim',
        not_materials = 'Kasada yeterli malzeme yok',
        rep_canceled = 'Onarım iptal edildi',
        repaired = 'Tamir edildi!',
        uknown = 'Durum bilinmiyor',
        not_valid = 'Geçerli araç değil',
        not_close = 'Araca yeterince yakın değilsiniz',
        veh_first = 'Önce araçta olmalısınız',
        outside = 'Aracın dışında olmalısınız',
        wrong_seat = 'Sen sürücü ya da bisiklette değilsin',
        not_vehicle = 'Bir araçta değilsin',
        progress_bar = 'Araç tamiri..',
        process_canceled = 'İşlem iptal edildi',
        not_part = 'Geçerli bir bölüm değil',
        partrep ='Bu %{value} Tamir Edildi!',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})