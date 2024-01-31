cfg = {}
cfg.chatEvent = 'chat:addMessage'
cfg.showOn = 'seperateInterface' -- 'chat' - 'seperateInterface'
cfg.mugShot = true
cfg.showDistance = 5.0
cfg.showTimeout = 10 --second

cfg.interfacePositons = {
    ['top-left'] = { ['left'] = '0%', ['top'] = '0%' },
    ['top-center'] = { ['left'] = '50%', ['transform'] = 'translate(-50%, 0)' },
    ['top-right'] = { ['right'] = '0%', ['top'] = '0%'  },
    ['center-left'] = { ['left'] = '0%', ['top'] = '50%', ['transform'] = 'translate(0, -50%)' },
    ['center-center'] = { ['left'] = '50%', ['top'] = '50%', ['transform'] = 'translate(-50%, -50%)' },
    ['center-right'] = { ['right'] = '0%', ['top'] = '50%', ['transform'] = 'translate(0, -50%)' },
    ['bottom-left'] = { ['left'] = '0%', ['bottom'] = '0%' },
    ['bottom-center'] = { ['left'] = '50%', ['bottom'] = '0%', ['transform'] = 'translate(-50%, 0)' },
    ['bottom-right'] = { ['right'] = '0%', ['bottom'] = '0%' },
}
cfg.interfacePosition = 'center-right'

if not IsDuplicityVersion() then return end

cfg.framework = 'qb' -- qb - esx
cfg.locale = 'en'
cfg.locales = {
    ['en'] = {
        ['name'] = 'İsim',
        ['surname'] = 'Soyadı',
        ['gender'] = 'Cinsiyet',
        ['dob'] = 'Doğum Tarihi',
        ['nationality'] = 'Uyruk',
        ['citizenid'] = 'Kimlik Numarası',
        ['signature'] = 'İmza',
        ['male'] = 'Erkek',
        ['female'] = 'Kadın',
        ['type'] = 'Tip',
        ['nothavealicense'] = 'Ehliyetiniz yok',
        ['unknown'] = 'Bilinmiyor',
        ['drive'] = 'Class C',
        
        -- for esx
        ['drive_bike'] = 'Class M1',
        ['drive_truck'] = 'Class A'
    },
}

cfg.cards = {
    --qb cards
    ['idcard'] = {
        command = false, -- or 'showidcard' -- Shows the card in the information of the person using the command
        item = 'id_card', -- or false 
        useItemInfo = false,
        cardBackground = 'card',
        title = 'Kimlik bilgileri',
        fields = {
            [1] = {
                title = cfg.locales[cfg.locale]['name'],
                editableFunctionName = 'getName',
                itemInfoKey = 'firstname',
            },
            [2] = {
                title = cfg.locales[cfg.locale]['nationality'],
                editableFunctionName = 'getNationality',
                itemInfoKey = 'nationality'
            },
            [3] = {
                title = cfg.locales[cfg.locale]['surname'],
                editableFunctionName = 'getSurname',
                itemInfoKey = 'lastname'
            },
            [4] = {
                title = cfg.locales[cfg.locale]['citizenid'],
                editableFunctionName = 'getCID',
                itemInfoKey = 'citizenid'
            },
            [5] = {
                title = cfg.locales[cfg.locale]['gender'],
                editableFunctionName = 'getGender',
                itemInfoKey = 'gender'
            },
            [6] = {
                title = cfg.locales[cfg.locale]['dob'],
                editableFunctionName = 'getDOB',
                itemInfoKey = 'birthdate'
            },
            [7] = {
                title = cfg.locales[cfg.locale]['signature'],
                editableFunctionName = 'getSignature'
            }
        }
    },
    ['drivercard'] = {
        command = false, -- or 'showidcard' -- Shows the card in the information of the person using the command
        item = 'driver_license', -- or false 
        useItemInfo = false,
        cardBackground = 'card',
        title = 'Ehliyet',
        -- canShow = function(src)
        --     local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        --     return player.PlayerData.metadata["licences"]["driver"]
        -- end,
        fields = {
            [1] = {
                title = cfg.locales[cfg.locale]['name'],
                editableFunctionName = 'getName',
                itemInfoKey = 'firstname'
            },
            [2] = {
                title = cfg.locales[cfg.locale]['surname'],
                editableFunctionName = 'getSurname',
                itemInfoKey = 'lastname'
            },
            [3] = {
                title = cfg.locales[cfg.locale]['dob'],
                editableFunctionName = 'getDOB',
                itemInfoKey = 'birthdate'
            },
            [4] = {
                title = cfg.locales[cfg.locale]['type'],
                editableFunctionName = 'getDriverType',
                itemInfoKey = 'type'
            },
            [5] = {
                title = cfg.locales[cfg.locale]['gender'],
                editableFunctionName = 'getGender'
            },
            [6] = {
                title = cfg.locales[cfg.locale]['signature'],
                editableFunctionName = 'getSignature'
            }
        }
    },
    ['lawyerpass'] = {
        command = false, -- or 'showidcard' -- Shows the card in the information of the person using the command
        item = 'lawyerpass', -- or false 
        useItemInfo = false,
        cardBackground = 'card',
        title = 'Lawyer Pass',
        titleColor = 'orange',
        canShow = function(src)
            if _G['ESX'] then
                return false
            elseif _G['QBCore'] then
                local player = QBCore.Functions.GetPlayer(src); if not player then return false end
                return player.PlayerData.job.name == 'lawyer' and true or false
            end
        end,
        fields = {
            [1] = {
                title = cfg.locales[cfg.locale]['name'],
                editableFunctionName = 'getName',
            },
            [2] = {
                title = cfg.locales[cfg.locale]['surname'],
                editableFunctionName = 'getSurname',
            },
            [3] = {
                title = cfg.locales[cfg.locale]['dob'],
                editableFunctionName = 'getDOB',
            },
            [4] = {
                title = cfg.locales[cfg.locale]['gender'],
                editableFunctionName = 'getGender',
            },
            [5] = {
                title = cfg.locales[cfg.locale]['signature'],
                editableFunctionName = 'getSignature'
            }
        }
    },
    ['weaponlicense'] = {
        command = false, -- or 'showidcard' -- Shows the card in the information of the person using the command
        item = 'weaponlicense', -- or false 
        useItemInfo = false,
        cardBackground = 'card',
        title = 'Weapon License',
        titleColor = 'red',
        canShow = function(src)
            if _G['ESX'] then
                TriggerEvent('esx_license:getLicenses', src, function(licenses)
                    if licenses['weapon'] then
                        return true
                    else
                        TriggerClientEvent('sh:client:notification', src, 'error', cfg.locales[cfg.locale]['nothavealicense'])
                        return false
                    end
                end)
            elseif _G['QBCore'] then
                local player = QBCore.Functions.GetPlayer(src); if not player then return false end
                return player.PlayerData.metadata["licences"]["driver"]
            end
        end,
        fields = {
            [1] = {
                title = cfg.locales[cfg.locale]['name'],
                editableFunctionName = 'getName',
            },
            [2] = {
                title = cfg.locales[cfg.locale]['surname'],
                editableFunctionName = 'getSurname',
            },
            [3] = {
                title = cfg.locales[cfg.locale]['dob'],
                editableFunctionName = 'getDOB',
            },
            [4] = {
                title = cfg.locales[cfg.locale]['gender'],
                editableFunctionName = 'getGender',
            },
            [5] = {
                title = cfg.locales[cfg.locale]['signature'],
                editableFunctionName = 'getSignature'
            }
        }
    },
    metadataKey = 'info' -- 'info' for qb-inventory, 'metadata' for ox_inventory
}