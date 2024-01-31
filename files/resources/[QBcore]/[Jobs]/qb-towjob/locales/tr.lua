local Translations = {
    error = {
        finish_work = "Önce tüm işlerini bitir",
        vehicle_not_correct = "Bu doğru Araç değil",
        failed = "Başarısız oldun",
        not_towing_vehicle = "Çekici Aracınızda Bulunmalısınız",
        too_far_away = "Çok uzaktasın",
        no_work_done = "Henüz herhangi bir iş yapmadınız",
        no_deposit = "$%{value} Depozito gerekli",
    },
    success = {
        paid_with_cash = "Nakit ile Ödenen $%{value} Depozito",
        paid_with_bank = "Bankadan Ödenen $%{value} Depozito",
        refund_to_cash = "Nakit ile Ödenen $%{value} Depozito",
        you_earned = "$%{value} Kazandınız",
    },
    menu = {
        header = "Mevcut Kamyonlar",
        close_menu = "⬅ Menüyü Kapat",
    },
    mission = {
        delivered_vehicle = "Bir Araç Teslim Ettiniz",
        get_new_vehicle = "Yeni Araç Alınabilir",
        towing_vehicle = "Aracı kaldır.",
        goto_depot = "Aracı Hayes Deposuna Götürün",
        vehicle_towed = "Araç Çekildi",
        untowing_vehicle = "Aracı Kaldır",
        vehicle_takenoff = "Araç Kaldırıldı",
    },
    info = {
        tow = "Çekicinizin arkasına bir araç yerleştirin",
        toggle_npc = "NPC İşini Aç/Kapat",
        skick = "Kötüye kullanım girişimi",
    },
    label = {
        payslip = "Paranı Al",
        vehicle = "Araç",
        npcz = "NPC Bölgesi",
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
