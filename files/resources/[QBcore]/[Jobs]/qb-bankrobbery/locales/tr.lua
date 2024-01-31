local Translations = {
    success = {
        success_message = "Başarılı",
        fuses_are_blown = "Sigortalar attı",
        door_has_opened = "Kapı açıldı"
    },
    error = {
        cancel_message = "İptal edildi",
        safe_too_strong = "Görünüşe göre kasa kilidi çok güçlü...",
        missing_item = "Bir öğeyi kaçırıyorsunuz...",
        bank_already_open = "Banka zaten açık...",
        minimum_police_required = "Minimum %{police} polis gerekli",
        security_lock_active = "Güvenlik kilidi aktif, kapıyı açmak şu anda mümkün değil",
        wrong_type = "%{receiver}, '%{argument}' argümanı için doğru türü almadı alınan tür: %{receivedType} alınan değer: %{receivedValue}\n beklenen tür: %{expected}",
        fuses_already_blown = "The fuses are already blown...",
        event_trigger_wrong = "%{event}%{extraInfo}, bazı koşullar karşılanmadığında tetiklendi, kaynak: %{source}",
        missing_ignition_source = "Bir ateşleme kaynağınız eksik"
    },
    general = {
        breaking_open_safe = "Kasayı açıyorsun...",
        connecting_hacking_device = "Bilgisayara Hack cihazı bağlanıyor ...",
        fleeca_robbery_alert = "Fleeca banka soygunu girişimi",
        paleto_robbery_alert = "Blain County Tasarruf banka soygunu girişimi",
        pacific_robbery_alert = "Pasifik Standart Bankası soygun girişimi",
        break_safe_open_option_target = "Güvenli Açın",
        break_safe_open_option_drawtext = "[E] Kasayı aç",
        validating_bankcard = "Kart Doğrulanıyor...",
        thermite_detonating_in_seconds = "%{time} saniye içinde termit patlayacak",
        bank_robbery_police_call = "10-90: Banka Soygunu"
    }
}

if GetConvar('qb_locale', 'en') == 'tr' then
    Lang = Lang or Locale:new({
        phrases = Translations,
        warnOnMissing = true,
        fallbackLang = Lang,
    })
end
