
var licensesData = [ //add new license here use same id as your license name in database.
    {
        id: 'weapon',
        color : 'red',
        description: "Silah Lisansı"
    },
    {
        id: 'driver',
        color : 'green',
        description: "Sürücü Belgesi"
    },

    {
        id: 'business',
        color : 'red',
        description: "İş Lisansı"
    },
]


var Language = {
    dashboard: "Ana Sayfa",
    incidents: "Olaylar",
    profiles: "Profiller",
    vehicles: "Araçlar",
    reports: "Raporlar",
    evidence: "Kanıt",
    warrants: "Arananlar",
    charges: "Suçlamalar",
    config: "Ayarlar",
    welcome: "Hoş geldiniz",
    badge: "Rozet: ",
    duty: "GÖREVDE",
    editprofile: "Profili Düzenle",
    submitevi: "Kanıt Gönder",
    createreport: "Rapor Oluştur",
    editreport: "Raporu Düzenle",
    editvehicle: "Araç Düzenle",
    bolo: "BOLO",
    invreport: "Araştırma Raporu",
    civreport: "Sivil Rapor",
    reporttype: "Rapor Türü",
    search: "Ara",
    approved: "Onaylandı",
    papproval: "Onay Bekliyor",
    rapproval: "Onay Reddedildi",
    expirein: "sona erer",
    ago: "önce",
    officerin: "İlgili Memurlar",
    personin: "İlgili Kişi",
    criminalsc: "Suçlu Ekle",
    vehiclein: "İlgili Araç",
    documenthere: "Belge içeriği buraya girilir",
    warrsec: "Aranan başarıyla uygulandı",
    maintitle: "Başlık",
    imgurl: "Profil Resmi URL",
    profileloaded: "Profil, Vatandaş Kimlik Numarası ile yüklendi",
    profilesaved: "Profil, Vatandaş Kimlik Numarası ile kaydedildi",
    licenseRemoved: "Lisans Kaldırıldı",
    evidencealready: 'Kanıt zaten eklenmiş! 1',
    evidencenot: "Kanıt bulunamadı!",
    evidenceid: "Kanıt Kimliği",
    evidenceass: 'Kanıt atanmış Kimlik 1',
    assievi: "Kanıt Ata",
    assign: "ATA",
    createevi: "Kanıt Oluştur",
    type: "Tür",
    imgurl2: "Resim URL",
    description: "Açıklama",
    evicreated: "Kimlikle oluşturulan Kanıt",
    create: "OLUŞTUR",
    close: "KAPAT",
    name: "İsim",
    stateid: "Kimlik",
    alreadyin: "ZATEN EKLENDİ",
    add: "EKLE",
    editcharges: "Suçlamaları Düzenle",
    arrwarr: "Tutuklama Kararı",
    reductions: "Azalmalar",
    inprg: "Devam Ediyor",
    expired: "Süresi Dolmuş",
    expires: "Süresi Dolacak",
    guilty: "Suçlu İtirafı",
    processed: "İşlenmiş",
    month: "ay(lar)",
    final: "Nihai",
    incsaved: "Olay, Kimlik ile kaydedildi",
    incloaded: 'Olay, Kimlik ile yüklendi 1',
    reportloaded: "Rapor, Kimlik ile yüklendi",
    reportsaved: "Rapor, Kimlik ile kaydedildi",
    photo: "Fotoğraf",
    bullets: "Mermiler",
    blood: "Kan",
    vehicle: "Araç",
    other: "Diğer",
    evidencesaved: "Kanıt, Kimlik ile oluşturuldu",
    extendedsidebar: "Genişletilmiş Kenar Çubuğu",
    dtheme: "Karanlık Tema",
    save: "KAYDET",
    mrights: "Susma hakkına sahipsiniz. Söylediğiniz her şey mahkemede aleyhinize kullanılabilir. Bir avukata sahip olma hakkına sahipsiniz. Bir avukat sağlanamıyorsa, size bir avukat temin edilecektir. Anladınız mı? Bu hakları anladığınızı düşünerek bana konuşmak ister misiniz?",
    configsaved: "Ayarlar Başarıyla Kaydedildi",
    success: "Başarılı",
    error: "Hata",
    empty: "Boş Alanlar",
    assperson: "Kişi Ata",
    citizenid: 'Vatandaş Kimlik Numarası',
    incident: "Olay",
    report: "Rapor",
    incin: "İlgili Olaylar",
    reportinv: "İlgili Raporlar",
    fine: "Ceza",
    seized: "El Konulan",
    vsaved: "Araç, Plaka Kimliği ile kaydedildi",
    vloaded: "Araç, Plaka Kimliği ile yüklendi",
    vimage: "Araç Resim URL",
    vowner: "Sahip",
    vmodel: "Model"
}

var mdtLogo = "https://cdn.discordapp.com/attachments/804364568511512626/851695091877150740/CityofLosSantos.png"


var mdtCharges = [{
        name: "Basit Yaralama",
        fine: 500,
        time: 5,
        color: "yeşil",
        description: "Silah kullanmadan başka bir kişiye zarar vermeye teşebbüs eder veya gerçekleştirir."
    }, {
        name: "Yaralama",
        fine: 700,
        time: 10,
        color: "yeşil",
        description: "Başka bir kişiye ciddi fiziksel zarar verir, başka bir kişiyi yaklaşan ciddi fiziksel zararla tehdit eder veya fiziksel temas sağlar ki bu kabul edilebilir veya tahrik edici olarak kabul edilebilir."
    }, {
        name: "Suça Yardım ve Yataklık",
        fine: 1e3,
        time: 10,
        color: "yeşil",
        description: "Başka birinin suç işlemesine yardımcı olan bir kişi."
    }, {
        name: "Ağırlaştırılmış Yaralama",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Silah kullanarak birine ciddi veya ağır bir şekilde fiziksel zarar vermeye teşebbüs eder veya gerçekleştirir."
    }, {
        name: "Cinsel Saldırı",
        fine: 2e4,
        time: 20,
        color: "kırmızı",
        description: "Cinsel saldırı, bir kişinin diğer bir kişiyi onun rızası olmadan kasıtlı olarak cinsel olarak dokunması veya bir kişiyi iradesi dışında cinsel bir eyleme zorlaması veya zorlamasıdır."
    }, {
        name: "Gönülsüz Adam Öldürme",
        fine: 2e3,
        time: 20,
        color: "yeşil",
        description: "Kasıtsız veya kazara başka bir kişiyi öldürmek."
    }, {
        name: "Araçla Adam Öldürme",
        fine: 3e3,
        time: 30,
        color: "yeşil",
        description: "Araç kullanarak kasıtsız veya kazara başka bir kişiyi öldürmek."
    }, {
        name: "Gönüllü Adam Öldürme",
        fine: 5e3,
        time: 35,
        color: "kırmızı",
        description: "Kasıtlı olarak bir başka kişiyi fiziksel olarak incitmek amacıyla kasıtsız veya kazara başka bir kişiyi öldürmek."
    }, {
        name: "İkinci Derece Cinayet",
        fine: 1e4,
        time: 40,
        color: "kırmızı",
        description: "Başka bir kişiyi öldürmek amacıyla kasıtlı olarak öldürme."
    }, {
        name: "Birinci Derece Cinayet",
        fine: 15e3,
        time: 50,
        color: "kırmızı",
        description: "Premeditasyon ve düşünceyle bir başka kişiyi öldürmek amacıyla kasıtlı olarak öldürme."
    }, {
        name: "Hukuka Aykırı Hapis",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Herhangi bir alanda haklı veya rızalı bir neden olmaksızın bir kişinin hareketini sınırlar."
    }, {
        name: "Kaçırma",
        fine: 2500,
        time: 20,
        color: "yeşil",
        description: "Başka bir kişiyi kaçırır ve onları istemeyerek bir süre boyunca ellerinde tutar."
    }, {
        name: "Kamu Görevlisini Kaçırma",
        fine: 3500,
        time: 25,
        color: "yeşil",
        description: "Bir Kamu Görevlisini kaçırır ve onları istemeyerek bir süre boyunca ellerinde tutar."
    }, {
        name: "Rehine Alma",
        fine: 1250,
        time: 10,
        color: "yeşil",
        description: "Bir kişiyi tehdit ederek veya onları kaçış veya kişisel kazanç için kaldıraç olarak kullanma niyeti veya ilanıyla birlikte ellerinde tutma."
    }, {
        name: "Suç Tehdidi",
        fine: 1e3,
        time: 5,
        color: "yeşil",
        description: "Bir kişi, başka bir kişiye ölüm veya ciddi fiziksel zarara yol açacak bir suç tehdidinde bulunursa."
    }, {
        name: "Sorumsuz Tehlike Yaratma",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Kendi hayatına veya başka birinin hayatına karşı umursamazlık."
    }, {
        name: "Taciz",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Başka bir kişiyi istenmeyen sözler, eylemler, davranışlar veya jestlerle tehdit eder veya zorlar. Devam eden taciz, suça $10,000 eklenerek cezayı ağırlaştırır."
    }, {
        name: "Cinsel Taciz",
        fine: 5e3,
        time: 10,
        color: "kırmızı",
        description: "Açık veya örtük cinsel anlamlar içeren, cinsel karşılığında cinsel ilişki vaadi içeren istenmeyen veya uygunsuz bir davranış."
    }, {
        name: "Küçük Hırsızlık",
        fine: 800,
        time: 0,
        color: "yeşil",
        description: "Başka bir kişiden $1,000'den az değerde mülk çalar."
    }, {
        name: "Büyük Hırsızlık",
        fine: 2500,
        time: 10,
        color: "yeşil",
        description: "Başka bir kişiden $1,000'den fazla değerde mülk çalar."
    }, {
        name: "Keyfi Sürüş",
        fine: 1e3,
        time: 10,
        color: "yeşil",
        description: "Zevk için çalınmış bir araçta hızlı ve tehlikeli bir şekilde sürme eylemi veya pratiği."
    }, {
        name: "Büyük Hırsızlık Otomobil (A)",
        fine: 2e3,
        time: 15,
        color: "yeşil",
        description: "Başkasına ait bir aracı hukuka aykırı bir şekilde alma veya aracı sahibinin izni olmadan kullanma, aracın sahibini kalıcı veya geçici olarak araçtan mahrum bırakma niyetiyle."
    }, {
        name: "Büyük Hırsızlık Otomobil (B)",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Hükümet Araçları: Eğer P.C. 1205'te belirtilmişse, iki katı."
    }, {
        name: "Hırsızlık",
        fine: 1750,
        time: 15,
        color: "yeşil",
        description: "Bilerek bir binaya girmek veya hukuka aykırı bir şekilde orada kalmak, bir suç işleme niyetiyle."
    }, {
        name: "Soygun",
        fine: 2500,
        time: 10,
        color: "yeşil",
        description: "Bir bireyden veya işletmeden para veya mal çalma."
    }, {
        name: "Banka Soygunu",
        fine: 3500,
        time: 15,
        color: "yeşil",
        description: "Bir bankayı, kuyumcu veya finans kurumunu soyma veya soyma teşebbüsü."
    }, {
        name: "Federal Banka Soygunu",
        fine: 5e3,
        time: 20,
        color: "yeşil",
        description: "FDIC tarafından sigortalanan kurumları (Pac Standard ve Vangelico's) soyma."
    }, {
        name: "Şantaj",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Tehdit veya güç kullanarak maddi veya malî kazanç elde etme."
    }, {
        name: "Dolandırıcılık",
        fine: 5e3,
        time: 15,
        color: "yeşil",
        description: "Maddi veya kişisel kazanç elde etmeyi amaçlayarak haksız yere aldatma."
    }, {
        name: "Kimlik Taklidi",
        fine: 2e3,
        time: 15,
        color: "yeşil",
        description: "Başka bir kişiyi taklit eden kişi, bu durumda bu kişiyi hukuki veya cezai sorumluluk altına sokabilecek, sahte bir isim altında imza atma veya başka bir kişinin belgesini sağlama."
    }, {
        name: "Devlet Çalışanı Taklidi",
        fine: 4e3,
        time: 30,
        color: "yeşil",
        description: "Bir devlet çalışanını taklit eden kişi, bu durumda bu kişiyi hukuki veya cezai sorumluluk altına sokabilecek, kendi adlarına imza atma veya başka bir kişinin belgesini sağlama ve yetki kullanma."
    }, {
        name: "Yargıç Taklidi",
        fine: 1e4,
        time: 35,
        color: "kırmızı",
        description: "Bir yargıcı taklit eden kişi."
    }, {
        name: "Sahtecilik",
        fine: 2500,
        time: 15,
        color: "kırmızı",
        description: "Herhangi bir sahte hükümet belgesine sahip olma veya oluşturma, bunlar arasında kimlik kartları ve plakalar da bulunmaktadır."
    }, {
        name: "Tekel Karşıtı",
        fine: 5e3,
        time: 30,
        color: "kırmızı",
        description: "Tekeli yaratmaya yönelik hareketler suç olarak kabul edilir. Buna, tekeli elde etmek veya elde tutmak amacıyla yürütülen avcı eylemler, sınırlı pazarlarda fiyat sabitleme (Otomobil Satışları, Mağaza Dükkanları ve Tamirhane Merkezleri) veya bir rakibin stokunu kötü niyetle sabote etme de dahildir. Bu taktikleri gerçekleştiren bir işletmeyi yöneten, onun için çalışan veya hisse senetlerini (çoğunluk veya azınlık) alan her birey, bu eylemlerin bildirilmediği takdirde suçlu bulunabilir, bu eylemlerin gerçekleştiğinden haberdar olduklarında bile."
    }, {
        name: "Mülkiyete Tecavüz",
        fine: 800,
        time: 5,
        color: "yeşil",
        description: "Hükümet tesisleri veya özel mülkiyetin bilerek girilmesi veya hukuka aykırı bir şekilde orada kalınması. (Polis karakolları, askeri tesisler, Braddock Çiftliği vb.)"
    }, {
        name: "Suç İşlemede Kullanılan Eşyaların Bulundurulması",
        fine: 1e3,
        time: 10,
        color: "yeşil",
        description: "Bir suç işlemede kullanılan herhangi bir eşyanın bulundurulması, suçlu kast, kabahat veya ihlal içerebilir. Bu, Advance çilingirler, çilingirler, Tuner, Termite, VPN'yi içerir."
    }, {
        name: "Kundakçılık",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Mala veya kişilere kasıtlı ve kötü niyetli bir şekilde yangın veya karbonlaştırma yapma."
    }, {
        name: "Vandalizm",
        fine: 1500,
        time: 0,
        color: "yeşil",
        description: "Sahip olmadıkları bir mülke kasıtlı olarak zarar verme."
    }, {
        name: "Hükümet Mülkiyetine Zarar Verme",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Hükümet mülkiyetine kasıtlı olarak zarar verme."
    }, {
        name: "Rüşvet",
        fine: 3e3,
        time: 10,
        color: "yeşil",
        description: "Bir kamu görevlisine, böyle bir kamu görevlisinin oy, görüş, karar, eylem, karar veya takdirini etkileyecek bir anlaşma veya anlayış üzerine herhangi bir fayda verir veya vermeyi kabul etme."
    }, {
        name: "Mahkeme Ayıbı",
        fine: 5e3,
        time: 50,
        color: "kırmızı",
        description: "Hukuk mahkemesine ve memurlarına karşı saygısız davranma veya itaatsizlik etme eylemi, mahkemenin otoritesi, adaleti ve itibarına karşı olan davranış biçimi. Süre/Ceza Yargıcın Takdirine Bağlıdır."
    }, {
        name: "Çalıntı Malın Suçlu Olarak Bulundurulması",
        fine: 1e3,
        time: 5,
        color: "yeşil",
        description: "Rapor edilen çalıntı herhangi bir fiziksel mülkün bulundurulması."
    }, {
        name: "Kaçma",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Kendi isteğiyle hükümetin gözetiminden kaçma."
    }, {
        name: "Cezaevi Kaçışı",
        fine: 8e3,
        time: 40,
        color: "yeşil",
        description: "Mahkûmları kurtarmak amacıyla belirlenmiş hükümet binalarına izinsiz girmek."
    }, {
        name: "Düzensiz Davranış",
        fine: 1e3,
        time: 5,
        color: "yeşil",
        description: "Kamu rahatsızlık yaratmaya niyetlenen davranışlarda bulunma."
    }, {
        name: "Yalan Tanıklık",
        fine: 7e3,
        time: 20,
        color: "kırmızı",
        description: "Bilerek yemin altında sözlü veya yazılı olarak yalan söyleme eylemi, yargı süreçlerinde."
    }, {
        name: "Mahkeme Kararını İhlal",
        fine: 5e3,
        time: 20,
        color: "kırmızı",
        description: "Mahkeme emrinde yazılı şartları kasıtlı olarak ihlal etme."
    }, {
        name: "Duruşmaya Çıkmama",
        fine: 1e4,
        time: 20,
        color: "kırmızı",
        description: "Mahkemeye çağrıldığında duruşmaya çıkmama."
    }, {
        name: "Hukuka Aykırı Uygulama",
        fine: 1e4,
        time: 15,
        color: "kırmızı",
        description: "Uygun devlet lisansı olmadan hukuk veya tıp uygulama."
    }, {
        name: "Zimmete Para Geçirme",
        fine: 1e4,
        time: 20,
        color: "kırmızı",
        description: "Belirli bir amaç için kullanılan fonları çalar veya kötüye kullanma."
    }, {
        name: "Komplonun Misdemeanor Hali",
        fine: 2e3,
        time: 0,
        color: "yeşil",
        description: "Küçük bir suçu işlemek üzere bir komplo eylemi (Tanıma için tanımı görüntüleyin). Bu aynı zamanda [Wobbler] olarak adlandırılır."
    }, {
        name: "Dolandırıcılık Komplosu",
        fine: 3e3,
        time: 15,
        color: "yeşil",
        description: "Bir kişiyi paradan veya mülkten dolandırmak amacıyla bir komplo eylemi (Tanıma için tanımı görüntüleyin). Bu durum, davanın gerçeklerine ve suç geçmişine bağlı olarak kabahat veya suç olarak dosyalanabilir."
    },{

        name: "Koruma Kararının İhlali",
        fine: 3500,
        time: 20,
        color: "yeşil",
        description: "Yasal bir koruma kararını ihlal etmek."
    }, {
        name: "Maske Takmama Yasası",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "Kasten bir maske takar ve bunu kamusal bir kuruluşta (Polis karakolları, hastaneler, adliyeler) veya kanun uygulama görevini engelleme amacıyla çıkarmayı reddeder."
    }, {
        name: "İzin Olmadan İşletme",
        fine: 1e4,
        time: 10,
        color: "kırmızı",
        description: "Geçerli bir izin gerektiren bir faaliyetin yasa dışı olarak işletilmesi. Ceza, izin fiyatının %110'unu aşamaz."
    }, {
        name: "Barış Memuruna Karşı Direnme",
        fine: 800,
        time: 0,
        color: "yeşil",
        description: "Kasten, herhangi bir barış memurunun yasal bir emrine, işaretine veya yönlendirmesine uymayı reddetme veya başaramama."
    }, {
        name: "Huzuru Bozma",
        fine: 1500,
        time: 0,
        color: "yeşil",
        description: "Kamu yerinde yasadışı olarak kavga etmek veya başka bir kişiye meydan okumak. Başkalarını yüksek ve mantıksız bir gürültüyle rahatsız etmek; eğer bunu kasten ve kötü niyetle yaparsa. Kamusal bir yerde ahlaki olmayan sözler kullanmak, eğer sözler muhtemelen hemen şiddetli bir tepkiye neden olacaksa."
    }, {
        name: "Sahte Bildirim",
        fine: 1e3,
        time: 5,
        color: "yeşil",
        description: "Sahte veya mevcut olmayan bir suçu bildirmek."
    }, {
        name: "Adaleti Engelleme",
        fine: 8e3,
        time: 15,
        color: "yeşil",
        description: "Suç işlendikten veya suçlanıldıktan sonra suçun keşif, yakalama, mahkumiyet veya cezasıyla kasıtlı olarak oynama."
    }, {
        name: "Ayaklanma Tahrik Etme",
        fine: 1e4,
        time: 30,
        color: "yeşil",
        description: "Dört kişiden az olmayan bir grupla şiddetli davranışa neden olan bir etkinlik/toplantı düzenlemek."
    }, {
        name: "Bağırsakçılık",
        fine: 2e3,
        time: 0,
        color: "yeşil",
        description: "Açık bir amaç olmaksızın kasıtlı olarak durma veya beklemek."
    }, {
        name: "Oynama",
        fine: 750,
        time: 5,
        color: "yeşil",
        description: "Başka bir kişi veya varlık malına kasten müdahale etme veya anlamlı bir rahatsızlık veya haksız erişim sağlama niyetiyle oynama. P.C. 1204'ten bir öğe ile suçüstü yakalanmalıdır."
    }, {
        name: "Delil Karartma",
        fine: 1e4,
        time: 25,
        color: "kırmızı",
        description: "Mahkeme sürecinde devam eden bir durumu etkileyebilecek büyük bir rahatsızlık yaratma niyetiyle suç mahallinden elde edilen delillerle oynama."
    }, {
        name: "Hayvanlara Zulüm",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Kasten ve kasıtlı olarak bir hayvana zarar verme veya onu öldürme."
    }, {
        name: "Dikkatsiz Sürüş",
        fine: 1500,
        time: 10,
        color: "yeşil",
        description: "Başkalarının güvenliği konusunda kasti veya istemli bir ihmal veya eylemlerinin potansiyel sonuçları konusunda istemli bir ihmal olmadan sürüş yapma"
    }, {
        name: "Hükümet Yolsuzluğu",
        fine: 2e4,
        time: 20,
        color: "kırmızı",
        description: "Devlet yetkililerinin veya ağ bağlantılarının meşru olmayan özel/kişisel kazanç için güçlerini kullanması."
    }, {
        name: "Özçekimcilik",
        fine: 1e3,
        time: 15,
        color: "yeşil",
        description: "Kanunen atanmış bir grup veya kişi tarafından yasal yetki olmaksızın yapılan yasa dışı yürütme."
    }, {
        name: "Hükümet Büyük Hırsızlık",
        fine: 3e3,
        time: 10,
        color: "kırmızı",
        description: "Değeri 2000.00 dolardan fazla olan devlet mülkünün yasa dışı alınması. Araçlar için P.C. 2203 (B) bakın."
    }, {
        name: "Yasadışı Toplanma",
        fine: 5e3,
        time: 5,
        color: "yeşil",
        description: "Dört kişiden az olmayan bir grupla şiddetli davranışa neden olan bir etkinlik/toplantıya katılma."
    }, {
        name: "Sınıf A Kontrollü Madde Bulundurma",
        fine: 2500,
        time: 10,
        color: "yeşil",
        description: "Metamfetamin bulundurma"
    }, {
        name: "Sınıf A Kontrollü Madde İle Dağıtmak İçin Bulundurma",
        fine: 4500,
        time: 15,
        color: "yeşil",
        description: "Metamfetamin satışı veya ticareti."
    }, {
        name: "Sınıf B Kontrollü Madde Bulundurma",
        fine: 1e3,
        time: 10,
        color: "yeşil",
        description: "Kokain ve oksikontin bulundurma."
    }, {
        name: "Sınıf B Kontrollü Madde İle Dağıtmak İçin Bulundurma",
        fine: 4500,
        time: 5,
        color: "yeşil",
        description: "Kokain ve oksikontin satışı veya ticareti."
    }, {
        name: "Sınıf C Kontrollü Madde Bulundurma",
        fine: 1500,
        time: 5,
        color: "yeşil",
        description: "Geçerli bir izin olmadan marihuana bulundurma."
    }, {
        name: "Sınıf C Kontrollü Madde İle Dağıtmak İçin Bulundurma",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Geçerli bir satış izni olmadan marihuana satışı, ticareti veya teklif etme."
    }, {
        name: "Narkotik Madde Bulundurmak İçin Kasıtlı",
        fine: 3e3,
        time: 10,
        color: "yeşil",
        description: "Kontrollü bir madde satma."
    }, {
        name: "Yasadışı Araçlar Bulundurma",
        fine: 2e3,
        time: 10,
        color: "yeşil",
        description: "Yasadışı araçlar veya malzemeler. P.C. 1204b'ye bakınız."
    }, {
        name: "Fuhuş",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "Fuhuş hizmetlerini ödeme karşılığında teklif etme veya fuhuş için ödeme teklif etme."
    }, {
        name: "Suçlu Olarak Ateşli Silah Bulundurma - Sınıf 1",
        fine: 2e3,
        time: 5,
        color: "yeşil",
        description: "Yasa dışı bir Sınıf 1 Silah bulundurma; Walther P99 | Tabanca"
    }, {
        name: "Suçlu Olarak Ateşli Silah Bulundurma - Sınıf 2",
        fine: 4e3,
        time: 15,
        color: "yeşil",
        description: "Sınıf 2 silah bulundurma; P.C. 1202'ye bakınız."
    }, {
        name: "Suçlu Olarak Ateşli Silah Bulundurma - Sınıf 3",
        fine: 5e3,
        time: 15,
        color: "yeşil",
        description: "Sınıf 3 silah bulundurma; P.C. 1203'e bakınız."
    }, {
        name: "Ateşli Silahın Suçlu Kullanımı",
        fine: 2e3,
        time: 15,
        color: "yeşil",
        description: "Kanuni bir neden olmaksızın ateşli bir silahı ateşleme."
    }, {
        name: "Korkutma",
        fine: 1500,
        time: 20,
        color: "yeşil",
        description: "Başka bir kişinin varlığında kaba, öfkeli veya tehdit edici bir şekilde öldürücü bir silah çekmek veya sergilemek yasaktır ve bu öz savunma veya birinin savunması değilse."
    }, {
        name: "Otoyol veya Serbest Yolda Yasadışı Durma",
        fine: 1500,
        time: 10,
        color: "yeşil",
        description: "Başka bir kişinin varlığında kaba, öfkeli veya tehdit edici bir şekilde öldürücü bir silah çekmek veya sergilemek yasaktır ve bu öz savunma veya birinin savunması değilse."
    }, {
        name: "Gözaltına Karşı Direnme",
        fine: 1e3,
        time: 5,
        color: "yeşil",
        description: "Bir polis memurundan kaçmak için yürüyerek kaçma."
    },{
        name: "Kaldırımsız Yol Geçişi",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "Kaldırım kullanmadan bir yolu geçme."
    }, {
        name: "Terörizm",
        fine: 4e4,
        time: 100,
        color: "kırmızı",
        description: "Patlayıcılar, hastalık veya aşırı şiddet kullanarak kitlesel yıkıma neden olma."
    }, {
        name: "Alkol veya Uyuşturucu Etkisi Altında Araç Kullanma",
        fine: 750,
        time: 5,
        color: "yeşil",
        description: "Uyuşturucu veya alkol etkisi altında araç kullanma."
    }, {
        name: "Kaçma",
        fine: 1250,
        time: 5,
        color: "yeşil",
        description: "Bir polis memurundan kaçmak için araç kullanma, yakalanmaktan, gözaltına alınmaktan veya tutuklanmaktan kaçınmak."
    }, {
        name: "Dikkatsizce Kaçma",
        fine: 1500,
        time: 10,
        color: "yeşil",
        description: "Bir polis memurundan araçla tehlikeli bir şekilde kaçmak, gözaltına alınmaktan, gözaltına alınmaktan veya tutuklanmaktan kaçınmak için sivillerin yaşamına karşı açıkça sorumsuz bir tutumu gösteren bir şekilde kaçmak. Bu suç zaten Kaçma ve Dikkatsiz Tehlikeli Sürüşü ima eder, birbirine eklenmez."
    }, {
        name: "Acil Durum Aracına Yol Vermeme",
        fine: 1e3,
        time: 0,
        color: "yeşil",
        description: "Sirenler etkinleştirildiğinde acil durum aracının yanına çekilmeme."
    }, {
        name: "Trafik Kontrol Cihazlarına Uymama",
        fine: 750,
        time: 0,
        color: "yeşil",
        description: "Düzenleyici olarak tanımlanan bir işarete veya sinyale uymama."
    }, {
        name: "Çalışmayan Araç",
        fine: 1e3,
        time: 0,
        color: "yeşil",
        description: "Çalışmayan bir araçla sürme, örneğin kırık camlar, yasa dışı cam filmi (tamamen siyah camlar), kapılar vb."
    }, {
        name: "İhmalci Sürüş",
        fine: 800,
        time: 0,
        color: "yeşil",
        description: "İhmalci bir şekilde sürme, güvenliğe uygun dikkat veya ilgi eksikliğini gösterme."
    }, {
        name: "Dikkatsiz Sürüş",
        fine: 1e3,
        time: 10,
        color: "yeşil",
        description: "Dikkatsiz ve insan hayatına karşı brüt ihmal ile sürüş."
    }, {
        name: "Üçüncü Derece Hız Aşımı",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "0 ila 35 mph arasında aşırı hız."
    }, {
        name: "İkinci Derece Hız Aşımı",
        fine: 800,
        time: 0,
        color: "yeşil",
        description: "36 ila 55 mph arasında aşırı hız."
    }, {
        name: "Birinci Derece Hız Aşımı",
        fine: 1e3,
        time: 0,
        color: "yeşil",
        description: "55 mph'den daha fazla aşırı hız. Sürücü belgesi kaldırılabilecektir."
    }, {
        name: "Araçsız Araç Kullanma",
        fine: 1e3,
        time: 0,
        color: "yeşil",
        description: "Uygun bir lisans olmadan araba kullanma."
    }, {
        name: "Yasadışı Dönüş",
        fine: 750,
        time: 0,
        color: "yeşil",
        description: "Şehir sınırları içinde veya trafik şeritlerini geçen bir U dönüşü yapma."
    }, {
        name: "Yasadışı Sollama",
        fine: 800,
        time: 0,
        color: "yeşil",
        description: "Başka bir aracı bir omuz, orta bölme veya kesik çizgilerle sollama. Sollama, karşı yönden gelen herhangi bir aracın güvenli işleyişini engellemeden tamamen yapılmalıdır."
    }, {
        name: "Şeridi Koruma Yükümlülüğünü İhlal",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "Araç kullanımında uygun bir şeridi koruma yükümlülüğünü yerine getirememe."
    }, {
        name: "Yasadışı Dönüş",
        fine: 600,
        time: 0,
        color: "yeşil",
        description: "Bir durak işareti veya kırmızı ışıkta tam ve tam bir duraksamadan dönme veya trafiğe ve yaya trafiğine öncelik verememe. Soldan dönüşlerin yasaklandığı yerde sol dönüş yapma."
    }, {
        name: "Durma Yükümlülüğünü İhlal",
        fine: 500,
        time: 0,
        color: "yeşil",
        description: "İlan edilmiş bir durak işaretinde veya kırmızı ışıkta tam ve tam bir duraksama yapmama. Kırmızıda sağa dönüş, tam bir duraksama yapıldıktan sonra ve trafiğe ve yayalara öncelik verildikten sonra izinlidir."
}];