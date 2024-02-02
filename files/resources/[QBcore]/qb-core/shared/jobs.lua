QBShared = QBShared or {}
QBShared.ForceJobDefaultDutyAtLogin = true -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
QBShared.QBJobsStatus = false              -- true: integrate qb-jobs into the whole of qb-core | false: treat qb-jobs as an add-on resource.
QBShared.Jobs = {}                         -- All of below has been migrated into qb-jobs
if QBShared.QBJobsStatus then return end
QBShared.Jobs = {

    -- Vatandaş Meslekleri
    ['unemployed'] = {
        label = 'Sivil',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Vatandaş',
                payment = 10
            },
        },
    },

    ['trucker'] = {
        label = 'Trucker',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 25
            },
        },
    },

    ['tow'] = {
        label = 'Towing',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Driver',
                payment = 25
            },
        },
    },

    ['reporter'] = {
        label = 'Reporter',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Journalist',
                payment = 25
            },
        },
    },

    ['garbage'] = {
        label = 'Garbage',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Collector',
                payment = 25
            },
        },
    },
    ['vineyard'] = {
        label = 'Vineyard',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Picker',
                payment = 25
            },
        },
    },

    -- Kamu Hizmetleri Meslekleri
    ['police'] = {
        label = 'LSPD',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 5000
            },
            ['1'] = {
                name = 'Officer I',
                payment = 5000
            },
            ['2'] = {
                name = 'Officer II',
                payment = 5000
            },
            ['3'] = {
                name = 'Officer III',
                payment = 5000
            },
            ['4'] = {
                name = 'Corporal',
                payment = 5000
            },
            ['5'] = {
                name = 'Detective I',
                payment = 5000
            },
            ['6'] = {
                name = 'Detective II',
                payment = 5000
            },
            ['7'] = {
                name = 'Detective III',
                payment = 5000
            },
            ['8'] = {
                name = 'Sergeant I',
                payment = 5000
            },
            ['9'] = {
                name = 'Sergeant II',
                payment = 5000
            },
            ['10'] = {
                name = 'Lieutenant I',
                payment = 5000
            },
            ['11'] = {
                name = 'Lieutenant II',
                payment = 5000
            },
            ['12'] = {
                name = 'Captain',
                payment = 5000
            },
            ['13'] = {
                name = 'Commander',
                payment = 5000
            },
            ['14'] = {
                name = 'Deputy Cheif',
                payment = 5000
            },
            ['15'] = {
                name = 'Ast. Chief',
                isboss = true,
                payment = 5000
            },
            ['16'] = {
                name = 'Cheif Of Police',
                isboss = true,
                payment = 5000
            },
        },
    },
    ['sasp'] = {
        label = 'SASP',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 2000
            },
            ['1'] = {
                name = 'Trooper I',
                payment = 2500
            },
            ['2'] = {
                name = 'Trooper II',
                payment = 3000
            },
            ['3'] = {
                name = 'Trooper III',
                payment = 3500
            },
            ['4'] = {
                name = 'Senior Trooper',
                payment = 4000
            },
            ['5'] = {
                name = 'Detective I',
                payment = 4500
            },
            ['6'] = {
                name = 'Detective II',
                payment = 5000
            },
            ['7'] = {
                name = 'Detective III',
                payment = 5500
            },
            ['8'] = {
                name = 'Sergeant I',
                payment = 6000
            },
            ['9'] = {
                name = 'Sergeant II',
                payment = 6500
            },
            ['10'] = {
                name = 'Lieutenant I',
                payment = 7000
            },
            ['11'] = {
                name = 'Lieutenant II',
                payment = 7500
            },
            ['12'] = {
                name = 'Captain',
                payment = 8000
            },
            ['13'] = {
                name = 'Commander',
                payment = 8500
            },
            ['14'] = {
                name = 'Deputy Cheif',
                payment = 9000
            },
            ['15'] = {
                name = 'Ast. Chief',
                isboss = true,
                payment = 9500
            },
            ['16'] = {
                name = 'Cheif Of Trooper',
                isboss = true,
                payment = 10000
            },
        },
    },
    ['sahp'] = {
        label = 'SAHP',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Cadet',
                payment = 2000
            },
            ['1'] = {
                name = 'Trooper I',
                payment = 2500
            },
            ['2'] = {
                name = 'Trooper II',
                payment = 3000
            },
            ['3'] = {
                name = 'Trooper III',
                payment = 3500
            },
            ['4'] = {
                name = 'Senior Trooper',
                payment = 4000
            },
            ['5'] = {
                name = 'Corporal I',
                payment = 4500
            },
            ['6'] = {
                name = 'Corporal II',
                payment = 5000
            },
            ['7'] = {
                name = 'Corporal III',
                payment = 5500
            },
            ['8'] = {
                name = 'Sergeant I',
                payment = 6000
            },
            ['9'] = {
                name = 'Sergeant II',
                payment = 6500
            },
            ['10'] = {
                name = 'Lieutenant I',
                payment = 7000
            },
            ['11'] = {
                name = 'Lieutenant II',
                payment = 7500
            },
            ['12'] = {
                name = 'Captain',
                payment = 8000
            },
            ['13'] = {
                name = 'Commander',
                payment = 8500
            },
            ['14'] = {
                name = 'Deputy Cheif',
                payment = 9000
            },
            ['15'] = {
                name = 'Ast. Chief',
                isboss = true,
                payment = 9500
            },
            ['16'] = {
                name = 'Cheif Of Trooper',
                isboss = true,
                payment = 10000
            },
        },
    },
    ['sheriff'] = {
        label = 'LSSD',
        type = "leo",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 2000
            },
            ['1'] = {
                name = 'Deputy I',
                payment = 2500
            },
            ['2'] = {
                name = 'Deputy II',
                payment = 3000
            },
            ['3'] = {
                name = 'Deputy III',
                payment = 3500
            },
            ['4'] = {
                name = 'Corporal',
                payment = 4000
            },
            ['5'] = {
                name = 'Detective I',
                payment = 4500
            },
            ['6'] = {
                name = 'Detective II',
                payment = 5000
            },
            ['7'] = {
                name = 'Detective III',
                payment = 5500
            },
            ['8'] = {
                name = 'Sergeant I',
                payment = 6000
            },
            ['9'] = {
                name = 'Sergeant II',
                payment = 6500
            },
            ['10'] = {
                name = 'Lieutenant I',
                payment = 7000
            },
            ['11'] = {
                name = 'Lieutenant II',
                payment = 7500
            },
            ['12'] = {
                name = 'Captain',
                payment = 8000
            },
            ['13'] = {
                name = 'Commander',
                payment = 8500
            },
            ['14'] = {
                name = 'Deputy Sheriff',
                payment = 9000
            },
            ['15'] = {
                name = 'Ast. Sheriff',
                isboss = true,
                payment = 9500
            },
            ['16'] = {
                name = 'Sheriff',
                isboss = true,
                payment = 10000
            },
        },
    },
    ['notillegal'] = {
        label = 'NOT ILLEGAL',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'STAJYER',
                payment = 4000
            },
            ['1'] = {
                name = 'PERSONEL',
                payment = 5000
            },
            ['2'] = {
                name = 'EKIP SORUMLUSU',
                payment = 6000
            },
            ['3'] = {
                name = 'ZARAR KARŞILAMA',
                payment = 7000
            },
            ['4'] = {
                name = 'FOUNDER',
                isboss = true,
                payment = 80000
            },
        },
    },
    ['doj'] = {
        label = 'DOJ',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'AVUKAT',
                payment = 5000
            },
            ['1'] = {
                name = 'KORUMA',
                payment = 5000
            },
            ['2'] = {
                name = 'EYALET SAVCISI',
                payment = 5000
            },
            ['3'] = {
                name = 'SAVCI',
                payment = 5000
            },
            ['4'] = {
                name = 'ADALET BAKANI',
                isboss = true,
                payment = 5000
            },
        },
    },
    ['fbi'] = {
        label = 'FBI',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'SPECIAL AGENT',
                payment = 3500
            },
            ['1'] = {
                name = 'SUPERVISOR SPECIAL AGENT',
                payment = 4500
            },
            ['2'] = {
                name = 'ASSISTANT SPECIAL AGENT',
                payment = 5500
            },
            ['3'] = {
                name = 'DIRECTOR',
                isboss = true,
                payment = 9500
            },
        },
    },
    ['realestate'] = {
        label = 'Real Estate',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çırak',
                payment = 25
            },
            ['1'] = {
                name = 'Ev satıcısı',
                payment = 75
            },
            ['2'] = {
                name = 'Ev yöneticisi',
                payment = 25
            },
            ['3'] = {
                name = 'Müdür',
                payment = 125
            },
            ['4'] = {
                name = 'Yönetici',
                isboss = true,
                payment = 150
            },
        },
    },
    ['ambulance'] = {
        label = 'EMS',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['1'] = {
                name = 'Stajyer Doktor',
                payment = 10000
            },
            ['2'] = {
                name = 'Pratisyen Doktor',
                payment = 10000
            },
            ['3'] = {
                name = 'Doktor',
                payment = 10000
            },
            ['4'] = {
                name = 'Uzman Doktor',
                payment = 10000
            },
            ['5'] = {
                name = 'Yardımcı Doçent Doktor',
                payment = 10000
            },
            ['6'] = {
                name = 'Doçent Doktor',
                payment = 10000
            },
            ['7'] = {
                name = 'Yardımcı Başhekim',
                isboss = true,
                payment = 10000
            },
            ['8'] = {
                name = 'Başhekim',
                isboss = true,
                payment = 10000
            },
        },
    },

    ['judge'] = {
        label = 'Honorary',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Judge',
                payment = 25
            },
        },
    },

    ['lawyer'] = {
        label = 'Law Firm',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Associate',
                payment = 25
            },
        },
    },

    -- İşletme Meslekleri
    ['beanmachine'] = {
        label = 'Bean Machine Cafe',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    ['catcafe'] = {
        label = 'Uwu Cafe',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    ['pizzathis'] = {
        label = 'Pizza This',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    ['burgershot'] = {
        label = 'Burger Shot',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    ['vanilla'] = {
        label = 'Vanilla Unicorn',
        defaultDuty = true,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    ['taxi'] = {
        label = 'Taksici',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },

    -- Galeri Meslekleri
    ['cardealer'] = {
        label = 'Vehicle Dealer',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Recruit',
                payment = 25
            },
            ['1'] = {
                name = 'Showroom Sales',
                payment = 75
            },
            ['2'] = {
                name = 'Business Sales',
                payment = 25
            },
            ['3'] = {
                name = 'Finance',
                payment = 125
            },
            ['4'] = {
                name = 'Manager',
                isboss = true,
                payment = 150
            },
        },
    },

    -- Mekanik Meslekleri
    ['mechanic1'] = {
        label = 'Mekanik',
        type = "mechanic",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Müdür Yrd.',
                isboss = true,
                payment = 50
            },
            ['2'] = {
                name = 'Müdür',
                isboss = true,
                payment = 50
            },
        },
    },

 ['mechanic2'] = {
        label = 'Mekanik',
        type = "mechanic",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Müdür Yrd.',
                isboss = true,
                payment = 50
            },
            ['2'] = {
                name = 'Müdür',
                isboss = true,
                payment = 50
            },
        },
    },

     ['mechanic3'] = {
        label = 'Mekanik',
        type = "mechanic",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Müdür Yrd.',
                isboss = true,
                payment = 50
            },
            ['2'] = {
                name = 'Müdür',
                isboss = true,
                payment = 50
            },
        },
    },

     ['mechanic4'] = {
        label = 'Mekanik',
        type = "mechanic",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Müdür Yrd.',
                isboss = true,
                payment = 50
            },
            ['2'] = {
                name = 'Müdür',
                isboss = true,
                payment = 50
            },
        },
    },

 ['mechanic5'] = {
        label = 'Mekanik',
        type = "mechanic",
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Müdür Yrd.',
                isboss = true,
                payment = 50
            },
            ['2'] = {
                name = 'Müdür',
                isboss = true,
                payment = 50
            },
        },
    },

    -- Silahcılar
    ['gunner'] = {
        label = 'Silahcı 1',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['gunner2'] = {
        label = 'Silahcı 2',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['gunner3'] = {
        label = 'Silahcı 3',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['gunner4'] = {
        label = 'Silahcı 4',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['gunner5'] = {
        label = 'Silahcı 5',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['gunner6'] = {
        label = 'Silahcı 6',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Çalışan',
                payment = 25
            },
            ['1'] = {
                name = 'Patron',
                isboss = true,
                payment = 50
            },
        },
    },
    ['adminn'] = {
        label = 'Admin',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = {
                name = 'Admin',
                payment = 0
            },
        },
    },
    ["itcomp"] = {
        label = "IT Comp",
        defaultDuty = false,
        grades = {
            ['1'] = {
                name = "Tekniker",
                payment = 0
            },
        },
    }
}
