local Translations = {
    error = {
        negative = 'Negatif bir miktar satmaya çalışıyorsunuz?',
        no_melt = 'Eritecek bir şey vermediniz...',
        no_items = 'Yeterli eşya yok',
        inventory_full = 'Envanteriniz tüm olası öğeleri almak için çok dolu. Envanterin dolu olmadığından emin olun. Kaybedilen Eşyalar: %{value}'
    },
    success = {
        sold = '%{value} x %{value2} ürünü %{value3}$ karşılığında sattınız',
        items_received = '%{value} x %{value2} alındı',
    },
    info = {
        title = 'Kaçakçı',
        subject = 'Eşyaları Eritme',
        message = 'Eşyalarınızı eritmeyi tamamladık. İstediğiniz zaman alabilirsiniz.',
        open_pawn = 'Kaçak Eşya Dükkanını Aç',
        sell = 'Eşyaları Sat',
        sell_pawn = 'Eşyaları Kaçakçı\'ya Sat',
        melt = 'Eşyaları Erit',
        melt_pawn = 'Eritme Dükkanını Aç',
        melt_pickup = 'Eritilmiş Eşyaları Al',
        pawn_closed = 'Kaçakçı burada değil. %{value}:00 AM - %{value2}:00 PM saatleri arasında geri gelin',
        sell_items = 'Satış Fiyatı %{value}$',
        back = '⬅ Geri Dön',
        melt_item = '%{value} Eşyasını Erit',
        max = 'Maksimum Miktar %{value}',
        submit = 'Erit',
        melt_wait = '%{value} dakika verin, eşyalarınızı eriteceğim',
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
