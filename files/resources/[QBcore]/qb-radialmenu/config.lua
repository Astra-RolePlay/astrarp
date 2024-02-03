Config = {}

Config.EnableExtraMenu = false

Config.MenuItems = {
    [1] = {
        id = 'emotes',
        title = 'Animasyonlar',
        icon = 'smile',
        type = 'client',
        event = 'rp:RecieveMenu',
        shouldClose = true,
    },
    [2] = {
        id = 'blips',
        title = 'Harita',
        icon = 'map-marked-alt',
        items = {
            {
                id = 'enyakins',
                title = 'En Yakın Konum',
                icon = 'map-marked-alt',
                items = {
                    {
                        id = 'gasstation',
                        title = 'Benzinlik',
                        icon = 'gas-pump',
                        type = 'client',
                        event = 'qb-radialmenu:client:togglegas',
                        shouldClose = true
                    }, {
                    id = 'barbershop',
                    title = 'Berber',
                    icon = 'cut',
                    type = 'client',
                    event = 'qb-radialmenu:client:togglebarber',
                    shouldClose = true
                }, {
                    id = 'clothing',
                    title = 'Kıyafetci',
                    icon = 'tshirt',
                    type = 'client',
                    event = 'qb-radialmenu:client:toggleclothing',
                    shouldClose = true
                }, {
                    id = 'store',
                    title = 'Marketler',
                    icon = 'store',
                    type = 'client',
                    event = 'qb-radialmenu:client:togglestores',
                    shouldClose = true
                }, {
                    id = 'atm',
                    title = 'Atm',
                    icon = 'dollar-sign',
                    type = 'client',
                    event = 'qb-radialmenu:client:toggleatm',
                    shouldClose = true
                }, {
                    id = 'ammunation',
                    title = 'Silahcı',
                    icon = 'crosshairs',
                    type = 'client',
                    event = 'qb-radialmenu:client:togglegun',
                    shouldClose = true
                }
                }
            },
            {
                id = 'blipackapas',
                title = 'Blip Aç/Kapat',
                icon = 'map-marked-alt',
                items = {
                    {
                        id = 'store',
                        title = 'Marketler',
                        icon = 'store',
                        type = 'client',
                        event = 'blips:toggleMarket',
                        shouldClose = true
                    }, {
                    id = 'garages',
                    title = 'Garajlar',
                    icon = 'warehouse',
                    type = 'client',
                    event = 'blips:toggleGaraj',
                    shouldClose = true
                },
                    {
                        id = 'gasstation',
                        title = 'Benzinlik',
                        icon = 'gas-pump',
                        type = 'client',
                        event = 'blips:toggleBenzin',
                        shouldClose = true
                    }, {
                    id = 'barbershop',
                    title = 'Berber',
                    icon = 'cut',
                    type = 'client',
                    event = 'blips:toggleBarber',
                    shouldClose = true
                }, {
                    id = 'clothing',
                    title = 'Kıyafetci',
                    icon = 'tshirt',
                    type = 'client',
                    event = 'blips:toggleClothes',
                    shouldClose = true
                }, {
                    id = 'tattos',
                    title = 'Dövmeci',
                    icon = 'pen-fancy',
                    type = 'client',
                    event = 'blips:toggleTattoo',
                    shouldClose = true
                }, {
                    id = 'ammunation',
                    title = 'Silahcı',
                    icon = 'crosshairs',
                    type = 'client',
                    event = 'blips:toggleGunShop',
                    shouldClose = true
                }, {
                    id = 'atm',
                    title = 'ATM',
                    icon = 'dollar-sign',
                    type = 'client',
                    event = 'blips:toggleAtm',
                    shouldClose = true
                }
                }
            },
            {
                id = 'butunblip',
                title = 'Bütün Blipleri Aç/Kapat',
                icon = 'map-marked-alt',
                type = 'client',
                event = 'blips:toggleAll',
                shouldClose = true
            }
        }
    },
    [3] = {
        id = 'actions',
        title = 'Genel',
        icon = 'users',
        items = {
            {
                id = 'getintrunk',
                title = 'Bagaja Gir',
                icon = 'car',
                type = 'client',
                event = 'qb-trunk:client:GetIn',
                shouldClose = true
            },
            {
                id = 'playerinvehicle',
                title = 'Araca Bindir',
                icon = 'car-side',
                type = 'client',
                event = 'police:client:PutPlayerInVehicle',
                shouldClose = true
            },
            {
                id = 'playeroutvehicle',
                title = 'Araçtan İndir',
                icon = 'car-side',
                type = 'client',
                event = 'police:client:SetPlayerOutVehicle',
                shouldClose = true
            },
            {
                id = 'escort2',
                title = 'Taşı',
                icon = 'user-friends',
                type = 'client',
                event = 'kd-kelepce:tasi',
                shouldClose = true
            },
            {
                id = 'escort3',
                title = 'Kucakla',
                icon = 'user-friends',
                type = 'client',
                event = 'ed-kucakla:kucaklabeni',
                shouldClose = true
            },
            {
                id = 'playerinvehicle',
                title = 'Yaralı İndir/Bindir',
                icon = 'car-side',
                type = 'client',
                event = 'kd-kelepce:client:ybindir',
                shouldClose = true
            },
            {
                id = 'oyuncusoysivil',
                title = 'Soy',
                icon = 'search',
                type = 'client',
                event = 'police:client:RobPlayer',
                shouldClose = true
            },
            -- {
            --     id = 'cornerselling',
            --     title = 'Köşe Tut',
            --     icon = 'cannabis',
            --     type = 'client',
            --     event = 'qb-drugs:client:cornerselling',
            --     shouldClose = true
            -- },
            {
                id = 'dondurbea',
                title = 'Araç Çevir',
                icon = 'car-crash',
                type = 'client',
                event = 'qb-radialmenu:aracevir',
                shouldClose = true
            }

        }
    },
    [4] = {
        id = 'clothesmenu',
        title = 'Kıyafet',
        icon = 'tshirt',
        items = {
            {
                id = 'Mask',
                title = 'Maske',
                icon = 'theater-masks',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            },
            {
                id = 'Ear',
                title = 'Kulaklık',
                icon = 'deaf',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
            id = 'Neck',
            title = 'Kolye',
            icon = 'user-tie',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Shirt',
            title = 'Kıyafet',
            icon = 'tshirt',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Pants',
            title = 'Pantolon',
            icon = 'user',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'Shoes',
            title = 'Ayakkabı',
            icon = 'shoe-prints',
            type = 'client',
            event = 'qb-radialmenu:ToggleClothing',
            shouldClose = true
        }, {
            id = 'meer',
            title = 'Daha Fazla',
            icon = 'plus',
            items = {
                {
                    id = 'Hat',
                    title = 'Şapka',
                    icon = 'hat-cowboy-side',
                    type = 'client',
                    event = 'qb-radialmenu:ToggleProps',
                    shouldClose = true
                }, {
                id = 'Glasses',
                title = 'Gözlük',
                icon = 'glasses',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            },
                {
                    id = 'Vest',
                    title = 'Yelek',
                    icon = 'vest',
                    type = 'client',
                    event = 'qb-radialmenu:ToggleClothing',
                    shouldClose = true
                }, {
                id = 'Bag',
                title = 'Çanta',
                icon = 'shopping-bag',
                type = 'client',
                event = 'qb-radialmenu:ToggleClothing',
                shouldClose = true
            }, {
                id = 'Bracelet',
                title = 'Bileklik',
                icon = 'user',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }, {
                id = 'Watch',
                title = 'Saat',
                icon = 'stopwatch',
                type = 'client',
                event = 'qb-radialmenu:ToggleProps',
                shouldClose = true
            }
                -- {
                --     id = 'Gloves',
                --     title = 'Eldiven',
                --     icon = 'mitten',
                --     type = 'client',
                --     event = 'qb-radialmenu:ToggleClothing',
                --     shouldClose = true
                -- }
            }
        }
        }
    },
}

Config.JobInteractions = {
    ["police"] = {
        {
            id = 'escort',
            title = 'Taşı',
            icon = 'user-friends',
            type = 'client',
            event = 'ed-kelepce:tasi',
            shouldClose = true
        },
        {
            id = 'playeroutvehicle',
            title = 'Araca Bindir/indir',
            icon = 'car-side',
            type = 'client',
            event = 'ed-kelepce:arac',
            shouldClose = true
        },
        {
            id = 'searchplayer',
            title = 'Üst Ara',
            icon = 'search',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true
        },
        {
            id = 'revivep',
            title = 'Tedavi et',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },
        {
            id = 'checkstatus',
            title = 'K9 MENU',
            icon = 'dog',
            type = 'client',
            event = 'rl-k9:client:menu',
            shouldClose = true
        },
        {
            id = 'policeinteraction',
            title = 'Diğerleri',
            icon = 'tasks',
            items = {
                {
                    id = 'policeobjects',
                    title = 'Objeler',
                    icon = 'road',
                    items = {
                        {
                            id = 'spawnpion',
                            title = 'Koni',
                            icon = 'exclamation-triangle',
                            type = 'client',
                            event = 'police:client:spawnCone',
                            shouldClose = false
                        }, {
                        id = 'spawnhek',
                        title = 'Bariyer',
                        icon = 'torii-gate',
                        type = 'client',
                        event = 'police:client:spawnBarrier',
                        shouldClose = false
                    }, {
                        id = 'spawnschotten',
                        title = 'Hız Tabelası',
                        icon = 'sign',
                        type = 'client',
                        event = 'police:client:spawnRoadSign',
                        shouldClose = false
                    }, {
                        id = 'spawnverlichting',
                        title = 'Işık',
                        icon = 'lightbulb',
                        type = 'client',
                        event = 'police:client:spawnLight',
                        shouldClose = false
                    }, {
                        id = 'spikestrip',
                        title = 'Dikenli Tel',
                        icon = 'caret-up',
                        type = 'client',
                        event = 'police:client:SpawnSpikeStrip',
                        shouldClose = false
                    }, {
                        id = 'deleteobject',
                        title = 'Obje kaldır',
                        icon = 'trash',
                        type = 'client',
                        event = 'police:client:deleteObject',
                        shouldClose = false
                    }
                    }
                },
                {
                    id = 'takedriverlicense',
                    title = 'Ehliyet El Koy',
                    icon = 'id-card',
                    type = 'client',
                    event = 'police:client:SeizeDriverLicense',
                    shouldClose = true
                },
                {
                    id = 'jailplayer',
                    title = 'Hapis Cezası',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                },
                {
                    id = 'kamuplayer',
                    title = 'Kamu Cezası',
                    icon = 'broom',
                    type = 'client',
                    event = 'police:client:KamuPlayer',
                    shouldClose = true
                },
                {
                    id = 'changefis',
                    title = 'Fatura Kes',
                    icon = 'dollar-sign',
                    type = 'client',
                    event = 'qb-policejob:client:Charge',
                    shouldClose = true
                },
                {
                    id = 'towvehicle',
                    title = 'Aracı Çek',
                    icon = 'truck-pickup',
                    type = 'client',
                    event = 'qb-radialmenu:arac-cek',
                    shouldClose = true
                }
            }
        },
    },
    ["sasp"] = {
        {
            id = 'escort',
            title = 'Taşı',
            icon = 'user-friends',
            type = 'client',
            event = 'ed-kelepce:tasi',
            shouldClose = true
        },
        {
            id = 'playeroutvehicle',
            title = 'Araca Bindir/indir',
            icon = 'car-side',
            type = 'client',
            event = 'ed-kelepce:arac',
            shouldClose = true
        },
        {
            id = 'searchplayer',
            title = 'Üst Ara',
            icon = 'search',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true
        },
        {
            id = 'revivep',
            title = 'Tedavi et',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },
        {
            id = 'checkstatus',
            title = 'K9 MENU',
            icon = 'dog',
            type = 'client',
            event = 'rl-k9:client:menu',
            shouldClose = true
        },
        {
            id = 'policeinteraction',
            title = 'Diğerleri',
            icon = 'tasks',
            items = {
                {
                    id = 'policeobjects',
                    title = 'Objeler',
                    icon = 'road',
                    items = {
                        {
                            id = 'spawnpion',
                            title = 'Koni',
                            icon = 'exclamation-triangle',
                            type = 'client',
                            event = 'police:client:spawnCone',
                            shouldClose = false
                        }, {
                        id = 'spawnhek',
                        title = 'Bariyer',
                        icon = 'torii-gate',
                        type = 'client',
                        event = 'police:client:spawnBarrier',
                        shouldClose = false
                    }, {
                        id = 'spawnschotten',
                        title = 'Hız Tabelası',
                        icon = 'sign',
                        type = 'client',
                        event = 'police:client:spawnRoadSign',
                        shouldClose = false
                    }, {
                        id = 'spawnverlichting',
                        title = 'Işık',
                        icon = 'lightbulb',
                        type = 'client',
                        event = 'police:client:spawnLight',
                        shouldClose = false
                    }, {
                        id = 'spikestrip',
                        title = 'Dikenli Tel',
                        icon = 'caret-up',
                        type = 'client',
                        event = 'police:client:SpawnSpikeStrip',
                        shouldClose = false
                    }, {
                        id = 'deleteobject',
                        title = 'Obje kaldır',
                        icon = 'trash',
                        type = 'client',
                        event = 'police:client:deleteObject',
                        shouldClose = false
                    }
                    }
                },
                {
                    id = 'takedriverlicense',
                    title = 'Ehliyet El Koy',
                    icon = 'id-card',
                    type = 'client',
                    event = 'police:client:SeizeDriverLicense',
                    shouldClose = true
                },
                {
                    id = 'jailplayer',
                    title = 'Hapis Cezası',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                },
                {
                    id = 'kamuplayer',
                    title = 'Kamu Cezası',
                    icon = 'broom',
                    type = 'client',
                    event = 'police:client:KamuPlayer',
                    shouldClose = true
                },
                {
                    id = 'changefis',
                    title = 'Fatura Kes',
                    icon = 'dollar-sign',
                    type = 'client',
                    event = 'qb-policejob:client:Charge',
                    shouldClose = true
                },
                {
                    id = 'towvehicle',
                    title = 'Aracı Çek',
                    icon = 'truck-pickup',
                    type = 'client',
                    event = 'qb-radialmenu:arac-cek',
                    shouldClose = true
                }
            }
        },
    },
    ["sheriff"] = {
        {
            id = 'escort',
            title = 'Taşı',
            icon = 'user-friends',
            type = 'client',
            event = 'ed-kelepce:tasi',
            shouldClose = true
        },
        {
            id = 'playeroutvehicle',
            title = 'Araca Bindir/indir',
            icon = 'car-side',
            type = 'client',
            event = 'ed-kelepce:arac',
            shouldClose = true
        },
        {
            id = 'searchplayer',
            title = 'Üst Ara',
            icon = 'search',
            type = 'client',
            event = 'police:client:SearchPlayer',
            shouldClose = true
        },
        {
            id = 'revivep',
            title = 'Tedavi et',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        },
        {
            id = 'checkstatus',
            title = 'K9 MENU',
            icon = 'dog',
            type = 'client',
            event = 'rl-k9:client:menu',
            shouldClose = true
        },
        {
            id = 'policeinteraction',
            title = 'Diğerleri',
            icon = 'tasks',
            items = {
                {
                    id = 'policeobjects',
                    title = 'Objeler',
                    icon = 'road',
                    items = {
                        {
                            id = 'spawnpion',
                            title = 'Koni',
                            icon = 'exclamation-triangle',
                            type = 'client',
                            event = 'police:client:spawnCone',
                            shouldClose = false
                        }, {
                        id = 'spawnhek',
                        title = 'Bariyer',
                        icon = 'torii-gate',
                        type = 'client',
                        event = 'police:client:spawnBarrier',
                        shouldClose = false
                    }, {
                        id = 'spawnschotten',
                        title = 'Hız Tabelası',
                        icon = 'sign',
                        type = 'client',
                        event = 'police:client:spawnRoadSign',
                        shouldClose = false
                    }, {
                        id = 'spawnverlichting',
                        title = 'Işık',
                        icon = 'lightbulb',
                        type = 'client',
                        event = 'police:client:spawnLight',
                        shouldClose = false
                    }, {
                        id = 'spikestrip',
                        title = 'Dikenli Tel',
                        icon = 'caret-up',
                        type = 'client',
                        event = 'police:client:SpawnSpikeStrip',
                        shouldClose = false
                    }, {
                        id = 'deleteobject',
                        title = 'Obje kaldır',
                        icon = 'trash',
                        type = 'client',
                        event = 'police:client:deleteObject',
                        shouldClose = false
                    }
                    }
                },
                {
                    id = 'takedriverlicense',
                    title = 'Ehliyet El Koy',
                    icon = 'id-card',
                    type = 'client',
                    event = 'police:client:SeizeDriverLicense',
                    shouldClose = true
                },
                {
                    id = 'jailplayer',
                    title = 'Hapis Cezası',
                    icon = 'user-lock',
                    type = 'client',
                    event = 'police:client:JailPlayer',
                    shouldClose = true
                },
                {
                    id = 'kamuplayer',
                    title = 'Kamu Cezası',
                    icon = 'broom',
                    type = 'client',
                    event = 'police:client:KamuPlayer',
                    shouldClose = true
                },
                {
                    id = 'changefis',
                    title = 'Fatura Kes',
                    icon = 'dollar-sign',
                    type = 'client',
                    event = 'qb-policejob:client:Charge',
                    shouldClose = true
                },
                {
                    id = 'towvehicle',
                    title = 'Aracı Çek',
                    icon = 'truck-pickup',
                    type = 'client',
                    event = 'qb-radialmenu:arac-cek',
                    shouldClose = true
                }
            }
        },
    },
    ["ambulance"] = {
        {
            id = 'revivep',
            title = 'Tedavi et',
            icon = 'user-md',
            type = 'client',
            event = 'hospital:client:RevivePlayer',
            shouldClose = true
        }, {
        id = 'treatwounds',
        title = 'Yaraları iyileştir',
        icon = 'band-aid',
        type = 'client',
        event = 'hospital:client:TreatWounds',
        shouldClose = true
    }, {
        id = 'emergencybutton2',
        title = 'Acil Durum!',
        icon = 'bell',
        type = 'client',
        event = 'police:client:SendPoliceEmergencyAlert',
        shouldClose = true
    }, {
        id = 'escort',
        title = 'Taşı',
        icon = 'user-friends',
        type = 'client',
        event = 'kd-kelepce:tasi',
        shouldClose = true
    },
    },
    ["taxi"] = {
        {
            id = 'togglemeter',
            title = 'Taksi Metre Aç/Kapat',
            icon = 'eye-slash',
            type = 'client',
            event = 'qb-taxi:client:toggleMeter',
            shouldClose = false
        }, {
        id = 'togglemouse',
        title = 'Taksi Metre Başlat/Durdur',
        icon = 'hourglass-start',
        type = 'client',
        event = 'qb-taxi:client:enableMeter',
        shouldClose = true
    }, {
        id = 'npc_mission',
        title = 'NPC Görevi',
        icon = 'taxi',
        type = 'client',
        event = 'qb-taxi:client:DoTaxiNpc',
        shouldClose = true
    }
    },
    ["mechanic"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic1"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic2"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic3"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic4"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic5"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic6"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic7"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic8"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic9"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic10"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic11"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
    ["mechanic12"] = {
        {
            id = 'car1',
            title = 'Aracı Çek',
            icon = 'truck-pickup',
            type = 'client',
            event = 'qb-radialmenu:arac-cek',
            shouldClose = true
        },
        {
            id = 'car2',
            title = 'Aracı Tamir Et',
            icon = 'wrench',
            type = 'client',
            event = 'kd-repairkit:Repair',
            shouldClose = true
        },
        {
            id = 'car3',
            title = 'Aracı Temizle',
            icon = 'soap',
            type = 'client',
            event = 'kd-repairkit:Cleaning',
            shouldClose = true
        },
        {
            id = 'car4',
            title = 'Fatura Kes',
            icon = 'dollar-sign',
            type = 'client',
            event = 'qb-policejob:client:Charge',
            shouldClose = true
        },
    },
}

Config.TrunkClasses = {
    [0] = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, -- Coupes
    [1] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, -- Sedans
    [2] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- SUVs
    [3] = { allowed = true, x = 0.0, y = -1.5, z = 0.0 }, -- Coupes
    [4] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, -- Muscle
    [5] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, -- Sports Classics
    [6] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, -- Sports
    [7] = { allowed = true, x = 0.0, y = -2.0, z = 0.0 }, -- Super
    [8] = { allowed = false, x = 0.0, y = -1.0, z = 0.25 }, -- Motorcycles
    [9] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Off-road
    [10] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Industrial
    [11] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Utility
    [12] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Vans
    [13] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Cycles
    [14] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Boats
    [15] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Helicopters
    [16] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Planes
    [17] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Service
    [18] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Emergency
    [19] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Military
    [20] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 }, -- Commercial
    [21] = { allowed = true, x = 0.0, y = -1.0, z = 0.25 } -- Trains
}

Config.ExtrasEnabled = true

Config.Commands = {
    ["hırka"] = {
        Func = function() ToggleClothing("Top") end,
        Sprite = "top",
        Desc = "Take your shirt off/on",
        Button = 1,
        Name = "Torso"
    },
    ["eldiven"] = {
        Func = function() ToggleClothing("gloves") end,
        Sprite = "gloves",
        Desc = "Take your gloves off/on",
        Button = 2,
        Name = "Gloves"
    },
    ["vizör"] = {
        Func = function() ToggleProps("visor") end,
        Sprite = "visor",
        Desc = "Toggle hat variation",
        Button = 3,
        Name = "Visor"
    },
    ["çanta"] = {
        Func = function() ToggleClothing("Bag") end,
        Sprite = "bag",
        Desc = "Opens or closes your bag",
        Button = 8,
        Name = "Bag"
    },
    ["ayakkabı"] = {
        Func = function() ToggleClothing("Shoes") end,
        Sprite = "shoes",
        Desc = "Take your shoes off/on",
        Button = 5,
        Name = "Shoes"
    },
    ["yelek"] = {
        Func = function() ToggleClothing("Vest") end,
        Sprite = "vest",
        Desc = "Take your vest off/on",
        Button = 14,
        Name = "Vest"
    },
    ["saç"] = {
        Func = function() ToggleClothing("hair") end,
        Sprite = "hair",
        Desc = "Put your hair up/down/in a bun/ponytail.",
        Button = 7,
        Name = "Hair"
    },
    ["şapka"] = {
        Func = function() ToggleProps("Hat") end,
        Sprite = "hat",
        Desc = "Take your hat off/on",
        Button = 4,
        Name = "Hat"
    },
    ["gözlük"] = {
        Func = function() ToggleProps("Glasses") end,
        Sprite = "glasses",
        Desc = "Take your glasses off/on",
        Button = 9,
        Name = "Glasses"
    },
    ["kulaklık"] = {
        Func = function() ToggleProps("Ear") end,
        Sprite = "ear",
        Desc = "Take your ear accessory off/on",
        Button = 10,
        Name = "Ear"
    },
    ["kolye"] = {
        Func = function() ToggleClothing("Neck") end,
        Sprite = "neck",
        Desc = "Take your neck accessory off/on",
        Button = 11,
        Name = "Neck"
    },
    ["saat"] = {
        Func = function() ToggleProps("Watch") end,
        Sprite = "watch",
        Desc = "Take your watch off/on",
        Button = 12,
        Name = "Watch",
        Rotation = 5.0
    },
    ["bileklik"] = {
        Func = function() ToggleProps("Bracelet") end,
        Sprite = "bracelet",
        Desc = "Take your bracelet off/on",
        Button = 13,
        Name = "Bracelet"
    },
    ["maske"] = {
        Func = function() ToggleClothing("Mask") end,
        Sprite = "mask",
        Desc = "Take your mask off/on",
        Button = 6,
        Name = "Mask"
    }
}

local bags = { [40] = true, [41] = true, [44] = true, [45] = true }

Config.ExtraCommands = {
    ["pantolon"] = {
        Func = function() ToggleClothing("Pants", true) end,
        Sprite = "pants",
        Desc = "Take your pants off/on",
        Name = "Pants",
        OffsetX = -0.04,
        OffsetY = 0.0
    },
    ["tişört"] = {
        Func = function() ToggleClothing("Shirt", true) end,
        Sprite = "shirt",
        Desc = "Take your shirt off/on",
        Name = "shirt",
        OffsetX = 0.04,
        OffsetY = 0.0
    },
    ["kıyafetgiy"] = {
        Func = function()
            if not ResetClothing(true) then
                Notify('Kıyafetlerini giydin', 'success')
            end
        end,
        Sprite = "reset",
        Desc = "Hızlıca kıyafetlerini giyin",
        Name = "reset",
        OffsetX = 0.12,
        OffsetY = 0.2,
        Rotate = true
    },
    ["çantaçıkar"] = {
        Func = function() ToggleClothing("Bagoff", true) end,
        Sprite = "bagoff",
        SpriteFunc = function()
            local Bag = GetPedDrawableVariation(PlayerPedId(), 5)
            local BagOff = LastEquipped["Bagoff"]
            if LastEquipped["Bagoff"] then
                if bags[BagOff.Drawable] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            end
            if Bag ~= 0 then
                if bags[Bag] then
                    return "bagoff"
                else
                    return "paraoff"
                end
            else
                return false
            end
        end,
        Desc = "Take your bag off/on",
        Name = "bagoff",
        OffsetX = -0.12,
        OffsetY = 0.2
    }
}


Config.BarberShops = {
    vector3(-814.308, -183.823, 36.568),
    vector3(136.826, -1708.373, 28.291),
    vector3(-1282.604, -1116.757, 5.990),
    vector3(1931.513, 3729.671, 31.844),
    vector3(1212.840, -472.921, 65.208),
    vector3(-32.885, -152.319, 56.076),
    vector3(-278.077, 6228.463, 30.695),
}

Config.GasStations = {
    vector3(49.4187, 2778.793, 58.043),
    vector3(263.894, 2606.463, 44.983),
    vector3(1039.958, 2671.134, 39.550),
    vector3(1207.260, 2660.175, 37.899),
    vector3(2539.685, 2594.192, 37.944),
    vector3(2679.858, 3263.946, 55.240),
    vector3(2005.055, 3773.887, 32.403),
    vector3(1687.156, 4929.392, 42.078),
    vector3(1701.314, 6416.028, 32.763),
    vector3(179.857, 6602.839, 31.868),
    vector3(-94.4619, 6419.594, 31.489),
    vector3(-2554.996, 2334.40, 33.078),
    vector3(-1800.375, 803.661, 138.651),
    vector3(-1437.622, -276.747, 46.207),
    vector3(-2096.243, -320.286, 13.168),
    vector3(-724.619, -935.1631, 19.213),
    vector3(-526.019, -1211.003, 18.184),
    vector3(-70.2148, -1761.792, 29.534),
    vector3(265.648, -1261.309, 29.292),
    vector3(819.653, -1028.846, 26.403),
    vector3(1208.951, -1402.567, 35.224),
    vector3(1181.381, -330.847, 69.316),
    vector3(620.843, 269.100, 103.089),
    vector3(2581.321, 362.039, 108.468),
    vector3(176.631, -1562.025, 29.263),
    vector3(176.631, -1562.025, 29.263),
    vector3(-319.292, -1471.715, 30.549),
    vector3(1784.324, 3330.55, 41.253)
}

Config.Clothing = {
    vector3(1693.32, 4823.48, 41.06),
    vector3(-712.215881, -155.352982, 37.4151268),
    vector3(-1192.94495, -772.688965, 17.3255997),
    vector3(425.236, -806.008, 28.491),
    vector3(-162.658, -303.397, 38.733),
    vector3(75.950, -1392.891, 28.376),
    vector3(-822.194, -1074.134, 10.328),
    vector3(-1450.711, -236.83, 48.809),
    vector3(4.254, 6512.813, 30.877),
    vector3(615.180, 2762.933, 41.088),
    vector3(1196.785, 2709.558, 37.222),
    vector3(-3171.453, 1043.857, 19.863),
    vector3(-1100.959, 2710.211, 18.107),
    vector3(-1207.65, -1456.88, 4.3784737586975),
    vector3(121.76, -224.6, 53.56)
}

Config.Stores = {
    vector4(24.47, -1346.62, 29.5, 271.66),
    vector4(-3039.54, 584.38, 7.91, 17.27),
    vector4(-3242.97, 1000.01, 12.83, 357.57),
    vector4(1728.07, 6415.63, 35.04, 242.95),
    vector4(1959.82, 3740.48, 32.34, 301.57),
    vector4(549.13, 2670.85, 42.16, 99.39),
    vector4(2677.47, 3279.76, 55.24, 335.08),
    vector4(2556.66, 380.84, 108.62, 356.67),
    vector4(372.66, 326.98, 103.57, 253.73),
    vector4(-47.02, -1758.23, 29.42, 45.05),
    vector4(-706.06, -913.97, 19.22, 88.04),
    vector4(-1820.02, 794.03, 138.09, 135.45),
    vector4(1164.71, -322.94, 69.21, 101.72),
    vector4(1697.87, 4922.96, 42.06, 324.71),
}

Config.Atm = {
    vector3(89.75, 2.35, 68.31),
    vector3(1167.02, -456.32, 66.79),
    vector3(-386.733, 6045.953, 31.501),
    vector3(-284.037, 6224.385, 31.187),
    vector3(-135.165, 6365.738, 31.101),
    vector3(-110.753, 6467.703, 31.784),
    vector3(-94.9690, 6455.301, 31.784),
    vector3(155.4300, 6641.991, 31.784),
    vector3(174.6720, 6637.218, 31.784),
    vector3(1703.138, 6426.783, 32.730),
    vector3(1735.114, 6411.035, 35.164),
    vector3(1702.842, 4933.593, 42.051),
    vector3(1967.333, 3744.293, 32.272),
    vector3(1821.917, 3683.483, 34.244),
    vector3(1174.532, 2705.278, 38.027),
    vector3(540.0420, 2671.007, 42.177),
    vector3(2564.399, 2585.100, 38.016),
    vector3(2558.683, 349.6010, 108.050),
    vector3(2558.051, 389.4817, 108.660),
    vector3(1077.692, -775.796, 58.218),
    vector3(1139.018, -469.886, 66.789),
    vector3(1153.884, -326.540, 69.245),
    vector3(381.2827, 323.2518, 103.270),
    vector3(285.2029, 143.5690, 104.970),
    vector3(157.7698, 233.5450, 106.450),
    vector3(-164.568, 233.5066, 94.919),
    vector3(-1827.04, 785.5159, 138.020),
    vector3(-1409.39, -99.2603, 52.473),
    vector3(-1205.35, -325.579, 37.870),
    vector3(-1215.64, -332.231, 37.881),
    vector3(-2072.41, -316.959, 13.345),
    vector3(-2975.72, 379.7737, 14.992),
    vector3(-2962.60, 482.1914, 15.762),
    vector3(-2955.70, 488.7218, 15.486),
    vector3(-3044.22, 595.2429, 7.595),
    vector3(-3144.13, 1127.415, 20.868),
    vector3(-3241.10, 996.6881, 12.500),
    vector3(-3241.11, 1009.152, 12.877),
    vector3(-1305.40, -706.240, 25.352),
    vector3(-538.225, -854.423, 29.234),
    vector3(-711.156, -818.958, 23.768),
    vector3(-717.614, -915.880, 19.268),
    vector3(-526.566, -1222.90, 18.434),
    vector3(-256.831, -719.646, 33.444),
    vector3(-203.548, -861.588, 30.205),
    vector3(112.4102, -776.162, 31.427),
    vector3(112.9290, -818.710, 31.386),
    vector3(119.9000, -883.826, 31.191),
    vector3(149.4551, -1038.95, 29.366),
    vector3(-846.304, -340.402, 38.687),
    vector3(-56.1935, -1752.53, 29.452),
    vector3(-261.692, -2012.64, 30.121),
    vector3(-273.001, -2025.60, 30.197),
    vector3(314.187, -278.621, 54.170),
    vector3(-351.534, -49.529, 49.042),
    vector3(24.589, -946.056, 29.357),
    vector3(-254.112, -692.483, 33.616),
    vector3(-1570.197, -546.651, 34.955),
    vector3(-1415.909, -211.825, 46.500),
    vector3(-1430.112, -211.014, 46.500),
    vector3(33.232, -1347.849, 29.497),
    vector3(129.216, -1292.347, 29.269),
    vector3(287.645, -1282.646, 29.659),
    vector3(289.012, -1256.545, 29.440),
    vector3(295.839, -895.640, 29.217),
    vector3(1686.753, 4815.809, 42.008),
    vector3(-302.408, -829.945, 32.417),
    vector3(300.2973, -589.219, 43.261),
    vector3(-433.14, 265.18, 83.02),
    vector3(5.134, -919.949, 29.557)
}

Config.Gun = {
    vector4(-661.96, -933.53, 21.83, 177.05),
    vector4(809.68, -2159.13, 29.62, 1.43),
    vector4(1692.67, 3761.38, 34.71, 227.65),
    vector4(-331.23, 6085.37, 31.45, 228.02),
    vector4(253.63, -51.02, 69.94, 72.91),
    vector4(23.0, -1105.67, 29.8, 162.91),
    vector4(2567.48, 292.59, 108.73, 349.68),
    vector4(-1118.59, 2700.05, 18.55, 221.89),
    vector4(841.92, -1035.32, 28.19, 1.56),
    vector4(-1304.19, -395.12, 36.7, 75.03),
    vector4(-3173.31, 1088.85, 20.84, 244.18),
}
