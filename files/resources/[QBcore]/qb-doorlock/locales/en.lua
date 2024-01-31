local Translations = {
    error = {
        lockpick_fail = "Başarısız",
        door_not_found = "Model tanımlayıcısı alınamadı, kapı şeffif ise kapı çerçevesine doğru hedef aldığınızdan emin olun",
        same_entity = "Her iki kapı aynı varlık olamaz",
        door_registered = "Bu kapı zaten kayıtlı",
        door_identifier_exists = "Bu tanımlayıcıya sahip bir kapı zaten yapılandırmada mevcut. (%s)",
    },
    success = {
        lockpick_success = "Başarılı"
    },
    general = {
        locked = "Kilitli",
        unlocked = "Kilitsiz",
        locked_button = "[E] - Kilitli",
        unlocked_button = "[E] - Kilitsiz",
        keymapping_description = "Kapı kilidini etkileşimle aç",
        keymapping_remotetriggerdoor = "Uzaktan bir kapıyı tetikle",
        locked_menu = "Kilitli",
        pickable_menu = "Kilit açılabilir",
        cantunlock_menu = 'Kilit açılamaz',
        hidelabel_menu = 'Kapı Etiketini Gizle',
        distance_menu = "Maksimum Mesafe",
        item_authorisation_menu = "Eşya Yetkilendirmesi",
        citizenid_authorisation_menu = "Vatandaş Kimliği Yetkilendirmesi",
        gang_authorisation_menu = "Çete Yetkilendirmesi",
        job_authorisation_menu = "İş Yetkilendirmesi",
        doortype_title = "Kapı Türü",
        doortype_door = "Tek Kapı",
        doortype_double = "Çift Kapı",
        doortype_sliding = "Tek Kayar Kapı",
        doortype_doublesliding = "Çift Kayar Kapı",
        doortype_garage = "Garaj",
        dooridentifier_title = "Benzersiz Tanımlayıcı",
        doorlabel_title = "Kapı Etiketi",
        configfile_title = "Yapılandırma Dosyası Adı",
        submit_text = "Gönder",
        newdoor_menu_title = "Yeni bir kapı ekle",
        newdoor_command_description = "Kapı kilidi sistemine yeni bir kapı ekle",
        doordebug_command_description = "Hata ayıklama modunu aç/kapat",
        warning = "Uyarı",
        created_by = "oluşturan",
        warn_no_permission_newdoor = "%{player} (%{license}), izinsiz olarak yeni bir kapı eklemeye çalıştı (kaynak: %{source})",
        warn_no_authorisation = "%{player} (%{license}), yetkilendirme olmadan bir kapıyı açmaya çalıştı (Gönderilen: %{doorID})",
        warn_wrong_doorid = "%{player} (%{license}), geçersiz bir kapıyı güncellemeye çalıştı (Gönderilen: %{doorID})",
        warn_wrong_state = "%{player} (%{license}), geçersiz bir duruma güncelleme yapmaya çalıştı (Gönderilen: %{state})", 
        warn_wrong_doorid_type = "%{player} (%{license}), uygun bir kapı kimliği göndermedi (Gönderilen: %{doorID})",
        warn_admin_privilege_used = "%{player} (%{license}), yönetici yetkilerini kullanarak bir kapıyı açtı"
    }
}


Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})