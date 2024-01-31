RegisterNetEvent('casino:context:hit&stand', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Hit", 
            txt = "Başka kart çek",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Stand", 
            txt = "Korkak Oyna",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&doubledown', function() 
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Hit", 
            txt = "Başka kart çek",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Stand", 
            txt = "Korkak oyna",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "İkiye Katla", 
            txt = "Bahsini iki katına çıkar",
            params = {
                event = "doj:client:blackjackMenu",
                args = 3
            }
        },
    })
end)

RegisterNetEvent('casino:context:hit&split', function()
    exports['qb-menu']:openMenu({
        {
            header = "Diamond Casino Blackjack",
            isMenuHeader = true,
        },
        {
            header = "Hit", 
            txt = "Başka kart çek",
            params = {
                event = "doj:client:blackjackMenu",
                args = 1
            }
        },
        {
            header = "Stand", 
            txt = "Korkak oyna",
            params = {
                event = "doj:client:blackjackMenu",
                args = 2
            }
        },
        {
            header = "Böl", 
            txt = "Bahsini böl",
            params = {
                event = "doj:client:blackjackMenu",
                args = 4
            }
        },
    })
end)
