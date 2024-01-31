local Translations = {
    error = {
        canceled = 'İptal edildi',
        max_ammo = 'Maksimum Cephane Kapasitesi',
        no_weapon = 'Silahın yok.',
        no_support_attachment = 'Bu silah bu eklentiyi desteklemiyor.',
        no_weapon_in_hand = 'Elinde silah yok.',
        weapon_broken = 'Bu silah kırık ve kullanılamaz.',
        no_damage_on_weapon = 'Bu silah hasar görmemiş..',
        weapon_broken_need_repair = 'Silahınız kırıldı, tekrar kullanabilmeniz için tamir etmeniz gerekiyor.',
        attachment_already_on_weapon = 'Zaten bir %{value} silahın üzerinde.'
    },
    success = {
        reloaded = 'Şarjor Dolduruldu!'
    },
    info = {
        loading_bullets = 'Mermi Dolduruluyor.',
        repairshop_not_usable = 'Tamirhane şu anda ~r~NOT~w~ kullanılabilir.',
        weapon_will_repair = 'Silahınız tamir edilecek.',
        take_weapon_back = '[E] - Silahı Geri Al',
        repair_weapon_price = '[E] Tamir Silahı, ~g~$%{value}~w~',
        removed_attachment = 'Kaldırdınız %{value} senin silahından!',
        hp_of_weapon = 'Silahınızın dayanıklılığı'
    },
    mail = {
        sender = 'Tyrone',
        subject = 'Tamirat',
        message = 'Senin %{value} tamir edildi yerden alabilirsiniz. <br><br> Barış dışarı madafaka'
    },
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
