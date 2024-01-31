local Translations = {
    error = {
        not_your_vehicle = 'Bu senin aracın değil..',
        vehicle_does_not_exist = 'Araç mevcut değil',
        not_enough_money = 'Yeterli paran yok',
        finish_payments = 'Bu aracı satmadan önce borcunu ödemelisin..',
        no_space_on_lot = 'Otoparkta arabanız için yer yok!',
        not_in_veh = 'Araçta değilsiniz!',
        not_for_sale = 'Bu araç satılık değildir!',
    },
    menu = {
        view_contract = 'Sözleşmeyi Görüntüle',
        view_contract_int = '[E] Sözleşmeyi Görüntüle',
        sell_vehicle = 'Aracını Sat',
        sell_vehicle_help = 'Vatandaşlara araç sat!',
        sell_back = 'Arabayı geri sat!',
        sell_back_help = 'Arabanızı indirimli bir fiyata hemen geri satın!',
        interaction = '[E] Aracını Sat',
    },
    success = {
        sold_car_for_price = 'Arabanızı $%{value} karşılığında sattınız',
        car_up_for_sale = 'Arabanız satışa çıkarıldı! Fiyat - $%{value}',
        vehicle_bought = 'Araç Satın Alındı'
    },
    info = {
        confirm_cancel = '~g~Y~w~ - Onayla / ~r~N~w~ - İptal Et ~g~',
        vehicle_returned = 'Aracınız iade edildi',
        used_vehicle_lot = 'İkinci El Araba',
        sell_vehicle_to_dealer = '[~g~E~w~] - Aracı Satıcıya $%{value} karşılığında Sat',
        view_contract = '[~g~E~w~] - Araç Sözleşmesini Görüntüle',
        cancel_sale = '[~r~G~w~] - Araç Satışını İptal Et',
        model_price = '%{value}, Fiyat: ~g~$%{value2}',
        are_you_sure = 'Artık aracınızı satmak istemediğinizden emin misiniz?',
        yes_no = '[~g~7~w~] - Evet | [~r~8~w~] - Hayır',
        place_vehicle_for_sale = '[~g~E~w~] - Sahibinden Satılık Aracı Yerleştirin'
    },
    charinfo = {
        firstname = 'veri',
        lastname = 'yok',
        account = 'Hesap bilinmiyor..',
        phone = 'telefon numarası bilinmiyor..'
    },
    mail = {
        sender = 'Sahibinden',
        subject = 'Bir araç sattın!',
        message = '%{value2} satışından $%{value} kazandınız.'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
