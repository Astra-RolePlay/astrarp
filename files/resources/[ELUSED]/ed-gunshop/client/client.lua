local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = QBCore.Functions.GetPlayerData()

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    bank = 0
    employees = {}
    unemployed = {}
end)

RegisterNetEvent('ed-gunshop:shops')
AddEventHandler('ed-gunshop:shops',function()
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "GunShop", Config.Items)
end)

RegisterNetEvent('ed-gunshop:stash')
AddEventHandler('ed-gunshop:stash',function(data)
	id = data.stash
    TriggerServerEvent("inventory:server:OpenInventory", "stash", "Gunner_"..id)
    TriggerEvent("inventory:client:SetCurrentStash", "Gunner_"..id)
end)



Citizen.CreateThread(function()
	--Gunner 1
	exports['qb-target']:AddBoxZone("GunnerShop", vector3(14.07, -1100.38, 29.8), 0.4, 2.8, { name="GunnerShop", heading = 340, debugPoly = false, minZ = 25.7, maxZ = 29.7 }, 
		{ options = { {  event = "ed-gunshop:shops", icon = "fas fa-box-open", label = "Silah Parçası Al", job = "gunner" }, },
		  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("GunnerDepo", vector3(16.76, -1105.09, 29.8), 0.6, 5.6, { name="GunnerDepo", heading = 340, debugPoly = false, minZ = 27.85, maxZ = 31.85 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Depo", stash = "Depo_1", job = "gunner" }, },
         distance = 2.5
    })

    exports['qb-target']:AddBoxZone("GunnerTezgah", vector3(16.61, -1108.33, 29.8), 1.0, 4.8, { name="GunnerTezgah", heading = 340, debugPoly = false, minZ = 28.8, maxZ = 30.4 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Tezgah", stash = "Tezgah_1" }, },
         distance = 2.5
    })

	--Gunner 2
	exports['qb-target']:AddBoxZone("GunnerShop2", vector3(253.61, -50.66, 69.94), 0.9, 1.4, { name="GunnerShop2", heading = 340, debugPoly = false, minZ = 67.14, maxZ = 71.14 }, 
		{ options = { {  event = "ed-gunshop:shops", icon = "fas fa-box-open", label = "Silah Parçası Al", job = "gunner2" }, },
		  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("GunnerDepo2", vector3(248.77, -53.98, 69.94), 0.6, 5.2, { name="GunnerDepo2", heading = 340, debugPoly = false, minZ = 68.89, maxZ = 71.49 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Depo", stash = "Depo_2", job = "gunner2" }, },
         distance = 2.5
    })

    exports['qb-target']:AddBoxZone("GunnerTezgah2", vector3(248.43, -51.01, 69.94), 1.15, 3.65, { name="GunnerTezgah2", heading = 340, debugPoly = false, minZ = 66.24, maxZ = 70.24 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Tezgah", stash = "Tezgah_2" }, },
         distance = 2.5
    })

	--Gunner 3
	exports['qb-target']:AddBoxZone("GunnerShop3", vector3(-1302.54, -391.65, 36.7), 1.6, 0.8, { name="GunnerShop3", heading = 349, debugPoly = false, minZ = 35.7, maxZ = 36.9 }, 
		{ options = { {  event = "ed-gunshop:shops", icon = "fas fa-box-open", label = "Silah Parçası Al", job = "gunner3" }, },
		  distance = 2.0
	})

    exports['qb-target']:AddBoxZone("GunnerDepo3", vector3(-1308.89, -396.52, 36.7), 0.6, 5.2, { name="GunnerDepo3", heading = 346, debugPoly = false, minZ = 35.55, maxZ = 37.55 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Depo", stash = "Depo_3", job = "gunner3" }, },
         distance = 2.5
    })

    exports['qb-target']:AddBoxZone("GunnerTezgah3", vector3(-1309.19, -393.78, 36.7), 1.2, 3.6, { name="GunnerTezgah3", heading = 346, debugPoly = false, minZ = 35.7, maxZ = 36.9 }, 
        { options = { {  event = "ed-gunshop:stash", icon = "fas fa-box-open", label = "Tezgah", stash = "Tezgah_3" }, },
         distance = 2.5
    })

end)

-- Function

local function OpenWeaponCraftingMenu()
    local columns = {
        {
            header = "Silah Üretimi",
            icon = "fa-solid fa-person-rifle",
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Weapons) do
        local item = {}
        item.header = "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.hash].image.." width=50px style='margin-right: 2px'> " .. v.label
        local text = ""
        for k, v in pairs(v.materials) do
            text = text .. "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.item].image.." width=10px style='margin-right: 5px'> " .. v.label .. " : " .. v.amount .. " Adet <br>"
        end
        item.text = text
        item.params = {
            event = 'ed-gunshop:client:craftWeapon',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end
    columns[#columns+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(columns)
end

local function OpenAmmoCraftingMenu()
    local columns = {
        {
            header = "Mermi ve Zırh Üretimi",
            icon = "fa-solid fa-person-rifle",
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Ammo) do
        local item = {}
        item.header = "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.hash].image.." width=50px style='margin-right: 2px'> " .. v.label
        local text = ""
        for k, v in pairs(v.materials) do
            text = text .. "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.item].image.." width=10px style='margin-right: 5px'> " .. v.label .. " : " .. v.amount .. " Adet <br>"
        end
        item.text = text
        item.params = {
            event = 'ed-gunshop:client:craftAmmo',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end
    columns[#columns+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(columns)
end

local function OpenAttachmentCraftingMenu()
    local columns = {
        {
            header = "Eklenti Üretimi",
            icon = "fa-solid fa-person-rifle",
            isMenuHeader = true,
        },
    }
    for k, v in pairs(Config.Attachment) do
        local item = {}
        item.header = "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.hash].image.." width=50px style='margin-right: 2px'> " .. v.label
        local text = ""
        for k, v in pairs(v.materials) do
            text = text .. "<img src=nui://"..Config["Inv-Link"]..QBCore.Shared.Items[v.item].image.." width=10px style='margin-right: 5px'> " .. v.label .. " : " .. v.amount .. " Adet <br>"
        end
        item.text = text
        item.params = {
            event = 'ed-gunshop:client:craftAttachment',
            args = {
                type = k
            }
        }
        table.insert(columns, item)
    end
    columns[#columns+1] = {
        icon = "fa fa-mail-reply",
        header = "Kapat",
        params = {
            event = "qb-menu:client:closeMenu"
        }
    }

    exports['qb-menu']:openMenu(columns)
end


local function CraftWeapon(weapon)
    QBCore.Functions.Progressbar('crafting_weapon', Config.Weapons[weapon].label..' Üretiliyor', 4000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        }, {}, {}, function() -- Success
        QBCore.Functions.Notify(Config.Weapons[weapon].label.." üretildi", 'success')
        TriggerServerEvent('ed-gunshop:server:craftWeapon', Config.Weapons[weapon].hash)
        for k, v in pairs(Config.Weapons[weapon].materials) do
             TriggerServerEvent('ed-gunshop:server:RemoveItem', v.item, v.amount)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Üretim sürecini iptal ettiniz.', 'error')
    end)
end

local function CraftAmmo(ammo)
    QBCore.Functions.Progressbar('crafting_ammo', Config.Ammo[ammo].label..' Üretiliyor', 4000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        }, {}, {}, function() -- Success
        QBCore.Functions.Notify(Config.Ammo[ammo].label.." üretildi", 'success')
        TriggerServerEvent('ed-gunshop:server:craftAmmo', Config.Ammo[ammo].hash)
        for k, v in pairs(Config.Ammo[ammo].materials) do
             TriggerServerEvent('ed-gunshop:server:RemoveItem', v.item, v.amount)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Üretim sürecini iptal ettiniz.', 'error')
    end)
end

local function CraftAttachment(attachment)
    QBCore.Functions.Progressbar('crafting_attachment', Config.Attachment[attachment].label..' Üretiliyor', 4000, false, false, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_ped",
        }, {}, {}, function() -- Success
        QBCore.Functions.Notify(Config.Attachment[attachment].label.." üretildi", 'success')
        TriggerServerEvent('ed-gunshop:server:craftAttachment', Config.Attachment[attachment].hash)
        for k, v in pairs(Config.Attachment[attachment].materials) do
             TriggerServerEvent('ed-gunshop:server:RemoveItem', v.item, v.amount)
             TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[v.item], "remove")
        end
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        ClearPedTasks(PlayerPedId())
    end, function() -- Cancel
        ClearPedTasks(PlayerPedId())
        QBCore.Functions.Notify('Üretim sürecini iptal ettiniz.', 'error')
    end)
end


-- Events

RegisterNetEvent('ed-gunshop:client:craftWeapon', function(data)
    QBCore.Functions.TriggerCallback("ed-gunshop:server:enoughMaterials", function(hasMaterials)
        if (hasMaterials) then
            CraftWeapon(data.type)
        else
            QBCore.Functions.Notify("Yeterli malzemeniz yok.", "error")
            return
        end
    end, Config.Weapons[data.type].materials)
end)

RegisterNetEvent('ed-gunshop:client:craftAmmo', function(data)
    QBCore.Functions.TriggerCallback("ed-gunshop:server:enoughMaterials", function(hasMaterials)
        if (hasMaterials) then
            CraftAmmo(data.type)
        else
            QBCore.Functions.Notify("Yeterli malzemeniz yok.", "error")
            return
        end
    end, Config.Ammo[data.type].materials)
end)

RegisterNetEvent('ed-gunshop:client:craftAttachment', function(data)
    QBCore.Functions.TriggerCallback("ed-gunshop:server:enoughMaterials", function(hasMaterials)
        if (hasMaterials) then
            CraftAttachment(data.type)
        else
            QBCore.Functions.Notify("Yeterli malzemeniz yok.", "error")
            return
        end
    end, Config.Attachment[data.type].materials)
end)

-- Target

CreateThread(function()
    for k,v in pairs(Config.JobLocation) do
        for k, v in pairs(v) do 
            exports['qb-target']:AddBoxZone(v.name, v.loc, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = false,
                minZ = v.minZ,
                maxZ = v.maxZ
        },{
            options = {
                {
                    icon = 'fas fa-wrench',
                    label = 'Silah Üretimi',
                    job = k,
                    action = function()
                        OpenWeaponCraftingMenu()
                    end,
                },
                {
                    icon = "fas fa-wrench",
                    label = 'Mermi Ve Zırh Üretimi',
                    job = k,
                    action = function()
                        OpenAmmoCraftingMenu()
                    end,
                },
                {
                    icon = 'fas fa-wrench',
                    label = 'Eklenti Üretimi',
                    job = k,
                    action = function()
                        OpenAttachmentCraftingMenu()
                    end,
                },
            },
                distance = 2.5
            })
        end
    end
end)


CreateThread(function()
    for k,v in pairs(Config.JobLocation2) do
        for k, v in pairs(v) do 
            exports['qb-target']:AddBoxZone(v.name, v.loc, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = false,
                minZ = v.minZ,
                maxZ = v.maxZ
        },{
            options = {
                {
                    icon = 'fas fa-wrench',
                    label = 'Silah Üretimi',
                    job = k,
                    action = function()
                        OpenWeaponCraftingMenu()
                    end,
                },
                {
                    icon = "fas fa-wrench",
                    label = 'Mermi ve Zırh Üretimi',
                    job = k,
                    action = function()
                        OpenAmmoCraftingMenu()
                    end,
                },
                {
                    icon = 'fas fa-wrench',
                    label = 'Eklenti Üretimi',
                    job = k,
                    action = function()
                        OpenAttachmentCraftingMenu()
                    end,
                },
            },
                distance = 2.5
            })
        end
    end
end)


CreateThread(function()
    for k,v in pairs(Config.JobLocation3) do
        for k, v in pairs(v) do 
            exports['qb-target']:AddBoxZone(v.name, v.loc, v.length, v.width, {
                name = v.name,
                heading = v.heading,
                debugPoly = false,
                minZ = v.minZ,
                maxZ = v.maxZ
        },{
            options = {
                {
                    icon = 'fas fa-wrench',
                    label = 'Silah Üretimi',
                    job = k,
                    action = function()
                        OpenWeaponCraftingMenu()
                    end,
                },
                {
                    icon = "fas fa-wrench",
                    label = 'Mermi ve Zırh Üretimi',
                    job = k,
                    action = function()
                        OpenAmmoCraftingMenu()
                    end,
                },
                {
                    icon = 'fas fa-wrench',
                    label = 'Eklenti Üretimi',
                    job = k,
                    action = function()
                        OpenAttachmentCraftingMenu()
                    end,
                },
            },
                distance = 2.5
            })
        end
    end
end)


-- CreateThread(function()
--     for k,v in pairs(Config.JobLocation5) do
--         for k, v in pairs(v) do 
--             exports['qb-target']:AddBoxZone(v.name, v.loc, v.length, v.width, {
--                 name = v.name,
--                 heading = v.heading,
--                 debugPoly = false,
--                 minZ = v.minZ,
--                 maxZ = v.maxZ
--         },{
--             options = {
--                 {
--                     icon = 'fas fa-wrench',
--                     label = 'Silah Üretimi',
--                     job = k,
--                     action = function()
--                         OpenWeaponCraftingMenu()
--                     end,
--                 },
--                 {
--                     icon = "fas fa-wrench",
--                     label = 'Mermi ve Zırh Üretimi',
--                     job = k,
--                     action = function()
--                         OpenAmmoCraftingMenu()
--                     end,
--                 },
--                 {
--                     icon = 'fas fa-wrench',
--                     label = 'Eklenti Üretimi',
--                     job = k,
--                     action = function()
--                         OpenAttachmentCraftingMenu()
--                     end,
--                 },
--             },
--                 distance = 2.5
--             })
--         end
--     end
-- end)

-- CreateThread(function()
--     for k,v in pairs(Config.JobLocation6) do
--         for k, v in pairs(v) do 
--             exports['qb-target']:AddBoxZone(v.name, v.loc, v.length, v.width, {
--                 name = v.name,
--                 heading = v.heading,
--                 debugPoly = false,
--                 minZ = v.minZ,
--                 maxZ = v.maxZ
--         },{
--             options = {
--                 {
--                     icon = 'fas fa-wrench',
--                     label = 'Silah Üretimi',
--                     job = k,
--                     action = function()
--                         OpenWeaponCraftingMenu()
--                     end,
--                 },
--                 {
--                     icon = "fas fa-wrench",
--                     label = 'Mermi ve Zırh Üretimi',
--                     job = k,
--                     action = function()
--                         OpenAmmoCraftingMenu()
--                     end,
--                 },
--                 {
--                     icon = 'fas fa-wrench',
--                     label = 'Eklenti Üretimi',
--                     job = k,
--                     action = function()
--                         OpenAttachmentCraftingMenu()
--                     end,
--                 },
--             },
--                 distance = 2.5
--             })
--         end
--     end
-- end)
