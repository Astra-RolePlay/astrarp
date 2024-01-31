local QBCore = exports['qb-core']:GetCoreObject()

-- Depo 
Citizen.CreateThread(function()
    
    exports['qb-target']:AddBoxZone("Kanıt_Depo_1", vector3(473.9, -995.25, 26.27), 5.0, 4.8, { 
        name="Kanıt_Depo_1", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 25.27,
        maxZ = 27.87
    }, 
        { options = { {  
                event = "qb-sahpjob:Kanit", 
                icon = "fas fa-box-open", 
                label = "Kanıt Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Dna_Depo_1", vector3(480.22, -991.71, 30.69), 5.2, 0.8, { 
        name="Dna_Depo_1", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 29.54,
        maxZ = 32.14
    }, 
        { options = { {  
                event = "qb-sahpjob:Dna", 
                icon = "fas fa-dna", 
                label = "Dna Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kanıt_Depo_2", vector3(371.92, -1595.89, 25.45), 1.6, 0.6, { 
        name="Kanıt_Depo_2", 
        heading = 0.0, 
        debugPoly = false, 
        minZ = 22.85,
        maxZ = 26.85
    }, 
        { options = { {  
                event = "qb-sahpjob:Kanit", 
                icon = "fas fa-box-open", 
                label = "Kanıt Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Dna_Depo_2", vector3(368.28, -1591.21, 25.45), 4.4, 0.6, { 
        name="Dna_Depo_2", 
        heading = 320.0, 
        debugPoly = false, 
        minZ = 22.3,
        maxZ = 26.3
    }, 
        { options = { {  
                event = "qb-sahpjob:Dna", 
                icon = "fas fa-dna", 
                label = "Dna Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })
       
    exports['qb-target']:AddBoxZone("Kanıt_Depo_3", vector3(849.26, -1313.56, 28.24), 0.4, 1.4, { 
        name="Kanıt_Depo_3", 
        heading=0,
        --debugPoly=true,
        minZ=27.44,
        maxZ=29.24
    }, 
        { options = { {  
                event = "qb-sahpjob:Kanit", 
                icon = "fas fa-box-open", 
                label = "Kanıt Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Dna_Depo_3", vector3(849.52, -1310.69, 28.24), 1, 2.0, { 
        name="Dna_Depo_3", 
        heading=0,
        --debugPoly=true,
        minZ=27.24,
        maxZ=28.64
    }, 
        { options = { {  
                event = "qb-sahpjob:Dna", 
                icon = "fas fa-dna", 
                label = "Dna Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kanıt_Depo_4", vector3(1821.45, 3668.49, 34.19), 2.4, 0.8, { 
        name="Kanıt_Depo_4", 
        heading=30,
        --debugPoly=true,
        minZ=33.19,
        maxZ=35.59
    }, 
        { options = { {  
                event = "qb-sahpjob:Kanit", 
                icon = "fas fa-box-open", 
                label = "Kanıt Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Dna_Depo_4", vector3(1824.93, 3667.01, 34.19), 1.8, 2.2, { 
        name="Dna_Depo_4", 
        heading=30,
        --debugPoly=true,
        minZ=33.79,
        maxZ=34.59
    }, 
        { options = { {  
                event = "qb-sahpjob:Dna", 
                icon = "fas fa-dna", 
                label = "Dna Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Kanıt_Depo_5", vector3(-452.66, 5996.89, 37.01), 1.2, 0.8, { 
        name="Kanıt_Depo_5", 
        heading=45,
        --debugPoly=true,
        minZ=36.01,
        maxZ=37.61
    }, 
        { options = { {  
                event = "qb-sahpjob:Kanit", 
                icon = "fas fa-box-open", 
                label = "Kanıt Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

    exports['qb-target']:AddBoxZone("Dna_Depo_5", vector3(-453.6, 6000.19, 37.01), 1.2, 3.2, { 
        name="Dna_Depo_5", 
        heading=45,
        --debugPoly=true,
        minZ=36.01,
        maxZ=39.21
    }, 
        { options = { {  
                event = "qb-sahpjob:Dna", 
                icon = "fas fa-dna", 
                label = "Dna Deposu", 
                job = "sahp"
            },
        },
      distance = 2.0
    })

end)

-- Depo Event
RegisterNetEvent('qb-sahpjob:OpenStash', function(data)
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "StashOpen", 0.4)
    id = data.stash
    TriggerServerEvent('inventory:server:OpenInventory', "stash", ""..data)
    TriggerEvent('inventory:client:SetCurrentStash', ""..data)
end)

RegisterNetEvent('qb-sahpjob:Dna', function()
    local Menu = {
        {
            header = "DNA Deposu",
            isMenuHeader = true,
        },
        {
            header = "DNA Deposu No:1",
            txt = "DNA Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "DNA_1",
            }
        },
        {
            header = "DNA Deposu No:2",
            txt = "DNA Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "DNA_2",
            }
        },
        {
            header = "DNA Deposu No:3",
            txt = "DNA Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "DNA_3",
            }
        },
        {
            header = "DNA Deposu No:4",
            txt = "DNA Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "DNA_4",
            }
        },
    }
    Menu[#Menu+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-sahpjob:Kanit', function()
    local Menu = {
        {
            header = "Kanıt Deposu",
            isMenuHeader = true,
        },
        {
            header = "Kanıt Deposu No:1",
            txt = "Kanıt Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "Depo_1",
            }
        },
        {
            header = "Kanıt Deposu No:2",
            txt = "Kanıt Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "Depo_2",
            }
        },
        {
            header = "Kanıt Deposu No:3",
            txt = "Kanıt Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "Depo_3",
            }
        },
        {
            header = "Kanıt Deposu No:4",
            txt = "Kanıt Deposuna Erişebilirsiniz.",
            params = {
                event = "qb-sahpjob:OpenStash",
                args = "Depo_4",
            }
        },
    }
    Menu[#Menu+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }
    exports['qb-menu']:openMenu(Menu)
end)

RegisterNetEvent('qb-sahpjob:client:Charge', function()
    local dialog = exports['qb-input']:ShowInput({
        header = "Fatura Kes",
        submitText = "Gönder",
        inputs = {
            { type = 'number', isRequired = true, name = 'citizen', text = 'Vatandaş ID' },
            { type = 'number', isRequired = true, name = 'price', text = 'Fatura Ücreti' },
        }
    })
    if dialog then
        if not dialog.citizen or not dialog.price then return end
        TriggerServerEvent('qb-sahpjob:server:Charge', dialog.citizen, dialog.price)
    end
end)