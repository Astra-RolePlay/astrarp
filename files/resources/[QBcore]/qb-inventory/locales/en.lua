local Translations = {
    progress = {
        ["crafting"] = "Üretiliyor.",
        ["snowballs"] = "Kartopu yapıyorsun.",
    },
    notify = {
        ["failed"] = "Başarısız",
        ["canceled"] = "İptal edildi",
        ["vlocked"] = "Araç kilitlendi",
        ["notowned"] = "Bu öğeye sahip değilsiniz!",
        ["missitem"] = "Bu öğe sizde yok!",
        ["nonb"] = "Yakında kimse yok!",
        ["noaccess"] = "Erişilemez",
        ["nosell"] = "Bu ürünü satamazsınız.",
        ["itemexist"] = "Öğe mevcut değil?",
        ["notencash"] = "Yeterli paran yok.",
        ["noitem"] = "Doğru öğelere sahip değilsiniz.",
        ["gsitem"] = "Kendine eşya veremezsin!",
        ["tftgitem"] = "Eşya vermek için çok uzaktasınız!",
        ["infound"] = "Vermeye çalıştığınız ürün bulunamadı!",
        ["iifound"] = "Yanlış öğe bulundu tekrar deneyin!",
        ["gitemrec"] = "Aldınız ",
        ["gitemfrom"] = " kişi ",
        ["gitemyg"] = "Verdiniz ",
        ["gitinvfull"] = "Diğer oyuncuların envanteri dolu!",
        ["giymif"] = "Envanterin dolu!",
        ["gitydhei"] = "Öğeden yeterince sahip değilsin.",
        ["gitydhitt"] = "Aktarmak için yeterli öğeniz yok.",
        ["navt"] = "Geçerli bir tür değil.",
        ["anfoc"] = "Argümanlar doğru doldurulmamış.",
        ["yhg"] = "Eşya verildi. ",
        ["cgitem"] = "Öğe verilmedi!",
        ["idne"] = "Öğe mevcut değil.",
        ["pdne"] = "Oyuncu aktif değil.",
    },
    inf_mapping = {
        ["opn_inv"] = "Envanteri aç",
        ["tog_slots"] = "Tuş takımı yuvalarını değiştirir",
        ["use_item"] = "Yuvadaki öğeyi kullanır ",
    },
    menu = {
        ["vending"] = "Otomat",
        ["craft"] = "Üret",
        ["o_bag"] = "Çantayı Aç",
    },
    interaction = {
        ["craft"] = "~g~E~w~ - Üret",
    },
    label = {
        ["craft"] = "Üretme",
        ["a_craft"] = "Parça Üretme",
    },
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
