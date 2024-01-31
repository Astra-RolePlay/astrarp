local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('qb-casino:client:openCasinoShop', function()
    local ShopItems = {}
    ShopItems.label = "Diamond Casino Marketi"
    ShopItems.items = Config.CasinoShop
    ShopItems.slots = #Config.CasinoShop 
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop_", ShopItems)
end)

RegisterNetEvent('qb-casino:client:openCasinoShop2', function()
    local ShopItems = {}
    ShopItems.label = "Diamond Casino İçki Marketi"
    ShopItems.items = Config.CasinoShop2
    ShopItems.slots = #Config.CasinoShop2
    TriggerServerEvent("inventory:server:OpenInventory", "shop", "Vendingshop2_", ShopItems)
end)

RegisterNetEvent('doj:casinoChipMenu', function()
    TriggerEvent('drawtextui:HideUI')
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Jeton İşlemleri",
            isMenuHeader = true,
        },
        {
            header = "Tüm Beyaz Jetonları Sat", 
            txt = "Mevcut Fiyat: $"..Config.whiteChipPrice.." tanesi",
            params = {
                event = "qb-casino:server:WhiteSell",
                isServer = true,
            }
        },
        {
            header = "Tüm Kırmızı Jetonları Sat", 
            txt = "Mevcut Fiyat: $"..Config.redChipPrice.." tanesi",
            params = {
                event = "qb-casino:server:RedSell",
                isServer = true,
            }
        },
        {
            header = "Tüm Mavi Jetonları Sat", 
            txt = "Mevcut Fiyat: $"..Config.blueChipPrice.." tanesi",
            params = {
                event = "qb-casino:server:BlueSell", 
                isServer = true,
            }
        },
        {
            header = "Tüm Siyah Jetonları Sat", 
            txt = "Mevcut Fiyat: $"..Config.blackChipPrice.." tanesi",
            params = {
                event = "qb-casino:server:BlackSell",
                isServer = true,
            }
        },
        {
            header = "Tüm Altın Jetonları Sat", 
            txt = "Mevcut Fiyat: $"..Config.goldChipPrice.." tanesi",
            params = {
                
                event = "qb-casino:server:GoldSell",
                isServer = true,
            }
        },
        {
            header = "< Geri",
			txt = "",
			params = {
                event = "doj:casinoMainMenu"
            }
        },
    })
end)

CreateThread(function()
    local CasinoShop = CircleZone:Create(vector3(948.591, 34.207, 71.839), 2.0, {
        name="CasinoShop",
        heading=160,
        debugPoly=false,
        useZ=true,
    })
    CasinoShop:onPlayerInOut(function(isPointInside)
        if isPointInside then
            if Config.CasinoEmployeePrompt == 'walk-up' then 
                TriggerEvent('doj:casinoMenuHeader') 
            elseif Config.CasinoEmployeePrompt == 'peek' then
                text = '<b>Diamond Casino İşlemleri</b>'
                -- exports['textUi']:DrawTextUi('show', text)
                exports['qb-core']:DrawText(text, 'left')
                exports['qb-target']:AddTargetModel(`U_F_M_CasinoCash_01`, {
                    options = {
                        { 
                            event = "doj:casinoMainMenu",
                            icon = "fab fa-speakap",
                            label = "Gazino Çalışanıyla Konuş", 
                        },
                    },
                    distance = 3.0 
                })
            end
        else
            exports['qb-menu']:closeMenu()
            -- exports['textUi']:HideTextUi('hide')
            exports['qb-core']:HideText()
        end
    end)
end)

RegisterNetEvent('doj:casinoMenuHeader', function()
    exports['qb-menu']:showHeader({
        {
            header = "Diamond Casino Marketi",
            isMenuHeader = true,
        },
        {
            header = "Jeton İşlemleri", 
            txt = "Mevcut fiyatları gör",
            params = {
                event = "doj:casinoChipMenu",
            }
        },
        {
            header = "Markete Göz Gezdir", 
            txt = "Tekliflerimizi gör",
            params = {
                event = "qb-casino:client:openCasinoShop",
            }
        },
        {
            header = "İptal",
			txt = "",
			params = {
                event = "doj:casinoMenuHeader"
            }
        },
    })
end)

RegisterNetEvent('doj:casinoMainMenu', function()
    -- exports['textUi']:HideTextUi('hide')
    exports['qb-core']:HideText()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino",
            isMenuHeader = true,
        },
        {
            header = "Jeton İşlemleri", 
            txt = "Mevcut fiyatları gör",
            params = {
                event = "doj:casinoChipMenu",
            }
        },
        {
            header = "Markete Göz Gezdir", 
            txt = "Tekliflerimizi gör",
            params = {
                event = "qb-casino:client:openCasinoShop",
            }
        },
        {
            header = "İptal",
			txt = "",
			params = {
                event = ""
            }
        },
    })
end)

exports['qb-target']:AddCircleZone("Barmen", vector3(939.5664, 27.85628, 71.833), 1.0, {
    name="Barmen",
    heading=160,
    debugPoly=false,
    useZ=true,
}, {
    options = {
        {
            event = "qb-casino:client:openCasinoShop2", 
            icon = "fab fa-speakap",
            label = "İçkiler",
        },
    },
    distance = 3.0 
})
