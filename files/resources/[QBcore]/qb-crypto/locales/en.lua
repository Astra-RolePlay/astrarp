local Translations = {
    error = {
        you_dont_have_a_cryptostick = 'Kripto çubuğunuz yok',
        cryptostick_malfunctioned = 'Kripto çubuğu arızalandı'
    },
    success = {
        you_have_exchanged_your_cryptostick_for = 'Kripto çubuğunuzu şununla takas ettiniz: %{amount} QBit(s)'
    },
    credit = {
        there_are_amount_credited = 'Kredilendirilen %{amount} Qbit(s) var!',
        you_have_qbit_purchased = '%{dataCoins} Qbit(s) satın aldınız!'
    },
    depreciation = {
        you_have_sold = '%{bitCoins} Qbit(s) sattınız!'
    },
    text = {
        enter_usb = '[E] - USB TAK',
        system_is_rebooting = 'Sistem yeniden baslatılıyor - %{rebootInfoPercentage} %',
        you_have_not_given_a_new_value = 'Yeni bir değer vermemişsiniz.. Güncel değerler: %{crypto}',
        this_crypto_does_not_exist = 'Bu Kripto mevcut değil :(, mevcut: Qbit',
        you_have_not_provided_crypto_available_qbit = 'Kripto sağlamadınız, mevcut: Qbit',
        the_qbit_has_a_value_of = 'Qbitin bir değeri vardır: %{crypto}',
        you_have_with_a_value_of = 'Şu değere sahip: %{playerPlayerDataMoneyCrypto} QBitiniz var: %{mypocket},-'
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
