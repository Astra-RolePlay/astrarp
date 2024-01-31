Translations = Translations or {
    notifications = {
        ["char_deleted"] = "Karakter silindi!",
        ["deleted_other_char"] = "%{citizenid} Vatandaş kimliğine sahip karakteri başarıyla sildiniz.",
        ["forgot_citizenid"] = "Vatandaş kimliği girmeyi unuttunuz!",
    },

    commands = {
        -- /deletechar
        ["deletechar_description"] = "Başka bir oyuncunun karakterini siler",
        ["citizenid"] = "Vatandaşlık numarası",
        ["citizenid_help"] = "Silmek istediğiniz karakterin Vatandaş Kimliği",

        -- /logout
        ["logout_description"] = "Karakterden Çıkış Yap",

        -- /closeNUI
        ["closeNUI_description"] = "Çoklu NUI'yi kapat"
    },

    misc = {
        ["droppedplayer"] = "QBCore ile bağlantınız kesildi"
    },

    ui = {
        -- Main
        characters_header = "Karakterlerim",
        emptyslot = "Boş Yuva",
        play_button = "Oyna",
        create_button = "Karakter Oluştur",
        delete_button = "Karakter Sil",

        -- Character Information
        charinfo_header = "Karakter Bilgileri",
        charinfo_description = "Karakterinizle ilgili tüm bilgileri görmek için bir karakter yuvası seçin.",
        name = "Adı",
        male = "Erkek",
        female = "Kadın",
        firstname = "İsim",
        lastname = "Soyism",
        nationality = "Uyruk",
        gender = "Cinsiyet",
        birthdate = "Doğum günü",
        job = "Mesleği",
        jobgrade = "Mesleği Rütbesi",
        cash = "Nakit",
        bank = "Banka",
        phonenumber = "Telefon numarası",
        accountnumber = "Hesap Numarası",

        chardel_header = "Karakter Kaydı",

        -- Delete character
        deletechar_header = "Karakteri Sil",
        deletechar_description = "Karakterinizi Silmek İstediğinizden Emin misiniz?",

        -- Buttons
        cancel = "Geri",
        confirm = "Onayla",

        -- Loading Text
        retrieving_playerdata = "Oyuncu verilerini alınıyor",
        validating_playerdata = "Oyuncu verilerinin doğrulanıyor",
        retrieving_characters = "Karakterler alınıyor",
        validating_characters = "Karakterler doğrulanıyor",

        -- Notifications
        ran_into_issue = "Bir sorunla karşılaştık",
        profanity = "Adınızda veya uyruğunuzda bir tür küfür / kötü kelime kullanmaya çalışıyorsunuz!",
        forgotten_field = "Alanlardan birini veya birkaçını girmeyi unutmuşsunuz gibi görünüyor!"
    }
}

Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
