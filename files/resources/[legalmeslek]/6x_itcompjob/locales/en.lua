local Translations = {
    label = {
        ["shop"] = "Dükkan",
        ["reqjob"] = "İş Talep Et",
        ["finishjob"] = "İşi Bitir",
        ["entry"] = "Giriş",
        ["exit"] = "Çıkış",
        ["checkpc"] = "PC'yi Kontrol Et",
        ["delivery"] = "Teslim Et",
        ["startdelivery"] = "Satış İstasyonu"
    },

    notify = {
        ["jobinprogress"] = "İşiniz hala devam ediyor.",
        ["recivedlocation"] = "Çağrı konumu aldınız.",
        ["alreadychecked"] = "Bu parçayı zaten kontrol ettiniz.",
        ["imnotbroken"] = "Bu parça bozuk değil.",
        ["donthaveitem"] = "Ürününüz yok.",
        ["alreadyfixed"] = "Bu PC'yi zaten tamir ettiniz",
        ["notfinish"] = "Henüz bitirmediniz!",
        ["needtostartjob"] = "İşi önce başlatmalısınız!",
        ["needtocheckmon"] = "İlk önce Monitör'ü kontrol etmelisiniz!",
        ["needtocheckgpu"] = "İlk önce Grafik Kartı'nı kontrol etmelisiniz!",
        ["needtocheckcpu"] = "İlk önce İşlemci'yi kontrol etmelisiniz!",
        ["neworder"] = "Yeni sipariş adresiniz işaretlendi",
        ["ondelivery"] = "Zaten teslimatta",
        ["realy"] = "Satışa hazır mısınız?",
        ["finish"] = "Satış Tamamlandı",
        ["notselling"] = "Henüz satışa başlamadınız",
        ["notfinish"] = "Teslimatı tamamlamak için araçta olmalısınız",
        ["packetsell"] = "Sipariş teslim ediliyor",
        ["needitem"] = "Gerekli ürünler eksik.",
        ["deliverynotify"] = "Hamburger siparişinizden kazandığınız: $",
        ["success"] = "Başarı"
    },

    mail = {
        ["sender"] = "Bay Smith",
        ["subject"] = "IT CEO",
        ["message"] = "İyi iş! Parayı almak için şirkete geri dön."
    },

    qbmenu = {
        ["avboptions"] = "Mevcut Seçenekler",
        ["checkmonitor"] = "Monitörü Kontrol Et",
        ["checkgpu"] = "GPU'yu Kontrol Et",
        ["checkcpu"] = "CPU'yu Kontrol Et",
        ["checkssd"] = "SSD'yi Kontrol Et",
        ["checktxt"] = "Araç Kutusu",
        ["imbroken"] = "Sanırım burada bir sorun var, bu yüzden değiştirmem daha iyi olur.",
        ["replaceit"] = "Bu parçayı değiştir",
        ["needtodeliver"] = "Teslim etmeniz gerekiyor:",
        ["tolocation"] = "Haritadaki konuma",
        ["deliver"] = "[E] Teslim Et",
        ["confirm"] = "Onayla",
        ["wdmoney"] = "Parayı Çek",
        ["cash"] = "Nakit",
        ["bank"] = "Banka",
        ["closeheader"] = "Kapat (ESC)"
    },

    progress = {
        ["checkingpart"] = "Kontrol ediliyor..",
        ["replacingpart"] = "Parça değiştiriliyor..",
        ["packetselling"] = "Paket satılıyor.."
    }
}
Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})