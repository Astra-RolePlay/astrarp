local Translations = {

error = {
    paltedot = 'Hareket halindeyken plakayı değiştiremezsiniz!',
    platedot2 = 'Araç Dışındayken Plaka Değiştiremezsiniz!',
    cooldown = 'Bu Ürünü Bu Kadar Hızlı Kullanamazsınız!',
    platenot = 'Araca takılı sahte plaka yok!',
    plateinstalled = 'Sahte Plaka Zaten Araca Takılı'
},

success = {
    youputtheplate = 'Aracın orijinal plakasını taktın',
    platechanged = 'Aracın plakasını değiştirdiniz!'
},

progress = {
    changeplate = 'Plaka Değiştiriliyor',
    plateremoving = 'Plaka Sökülüyor'
    }   
}   

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})