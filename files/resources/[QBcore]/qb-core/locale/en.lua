local Translations = {
    error = {
        not_online = 'Oyuncu çevrimiçi değil.',
        wrong_format = 'Yanlış format.',
        missing_args = 'Hiçbir argüman girilmedi. (x, y, z)',
        missing_args2 = 'Tüm argümanlar doldurulmalıdır.',
        no_access = 'Bu komuta erişimin yok.',
        company_too_poor = 'Şirketin hiç parası yok.',
        item_not_exist = 'Eşya mevcut değil.',
        too_heavy = 'Envanter çok dolu',
        location_not_exist = 'Konum mevcut değil',
        duplicate_license = 'Aynı rockstar lisansı zaten şu an sunucuda!',
        no_valid_license  = 'Geçerli bir rockstar lisans bulunamadı.',
        not_whitelisted = 'Bu sunucuda whitelistin yok.',
        server_already_open = 'sunucu zaten açık',
        server_already_closed = 'sunucu zaten kapalı',
        no_permission = 'Bunun için izniniz yok..',
        no_waypoint = 'Haritada bir yer seçili değil',
        tp_error = 'Işınlanırken Hata.',
        connecting_database_error = 'Sunucuya bağlanırken bir veritabanı hatası oluştu. (SQL sunucusu açık mı?)',
        connecting_database_timeout = 'Veritabanına bağlantı zaman aşımına uğradı. (SQL sunucusu açık mı?)',
    },
    success = {
        server_opened = 'sunucu açıldı',
        server_closed = 'Sunucu kapatıldı',
        teleported_waypoint = 'Işınlandın',
    },
    info = {
        received_paycheck = 'Maaşın yattı $%{value}',
        job_info = 'Meslek: %{value} | Rütbe: %{value2} | Mesai: %{value3}',
        gang_info = 'Gang: %{value} | Rütbe: %{value2}',
        on_duty = 'Artık görev başındasınız!',
        off_duty = 'Mesaiden Çıktın!',
        checking_ban = 'Merhaba %s. Banlı olup olmadığın kontrol ediliyor.',
        join_server = 'Merhaba %s  {Server Name}.',
        checking_whitelisted = 'Hoşgeldin %s. Son kontrolleri tamamlıyorum.',
        exploit_banned = 'Sunucuda banlısın: %{discord}',
        exploit_dropped = 'Sunucudan atıldın',
    },
    command = {
        tp = {
            help = 'Kordinata veya Oyuncuya ışınlan (Admin)',
            params = {
                x = { name = 'id/x', help = 'Kordinata veya Oyuncuya ışınlan'},
                y = { name = 'y', help = 'Y position'},
                z = { name = 'z', help = 'Z position'},
            },
        },
        tpm = { help = 'Işaretli yere ışınlan (Admin)' },
        togglepvp = { help = 'Toggle PVP on the server (Admin Only)' },
        addpermission = {
            help = 'Give Player Permissions (God Only)',
            params = {
                id = { name = 'id', help = 'ID of player' },
                permission = { name = 'permission', help = 'Permission level' },
            },
        },
        removepermission = {
            help = 'Oyuncu İzinlerini Kaldır (Yalnızca Tanrı)',
            params = {
                id = { name = 'id', help = 'Oyuncunun Kimliği' },
                permission = { name = 'permission', help = 'İzin seviyesi' },
            },
        },
        openserver = { help = 'Sunucuyu herkese aç (Yalnızca Yönetici)' },
        closeserver = {
            help = 'İzinleri olmayan kişiler için sunucuyu kapat (Yalnızca Yönetici)',
            params = {
                reason = { name = 'reason', help = 'Kapatma nedeni (isteğe bağlı)' },
            },
        },        
        car = {
            help = 'Araç çıkar (Admin)',
            params = {
                model = { name = 'Araç modeli', help = 'Çıkaracağın aracın modeli' },
            },
        },
        dv = { help = 'Aracı sil (Admin)' },
        givemoney = {
            help = 'Oyuncuya para ver (Admin Only)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                moneytype = { name = 'Gönderim Türü', help = 'Göndereceğin para (cash, bank, crypto)' },
                amount = { name = 'Tutar', help = 'Göndereceğin tutar' },
            },
        },
        setmoney = {
            help = 'Oyuncu Paranın Miktarını Ayarla (Yalnızca Yönetici)',
            params = {
                id = { name = 'id', help = 'Oyuncu Kimliği' },
                moneytype = { name = 'moneytype', help = 'Para türü (nakit, banka, kripto)' },
                amount = { name = 'amount', help = 'Para miktarı' },    
            },
        },
        job = { help = 'Mesleğini kontrol et' },
        setjob = {
            help = 'Oyuncuya Meslek Ver (Admin)',
            params = {
                id = { name = 'id', help = 'Oyuncu Id' },
                job = { name = 'Meslek', help = 'Meslek Adı' },
                grade = { name = 'Rütbe', help = 'Rütbesi' },
            },
        },
        gang = { help = 'Çeteni kontrol et' },
        setgang = {
            help = 'Oyuncuyu çeteye dahil et (Admin Only)',
            params = {
                id = { name = 'id', help = 'Oyuncu ID' },
                gang = { name = 'Çete', help = 'Çete Adı' },
                grade = { name = 'Rütbe', help = 'Rütbesi' },
            },
        },
        ooc = { help = 'OOC Sohbet Mesaj' },
        me = {
            help = 'Show local message',
            params = {
                message = { name = 'message', help = 'Message to send' }
            },
        },
    },
}


Lang = Lang or Locale:new({
    phrases = Translations,
    warnOnMissing = true
})
