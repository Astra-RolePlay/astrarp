editableFunctions = {}

editableFunctions.getName = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.firstname
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src); if not player then return false end
        return player.get('firstName')
    end,
}

editableFunctions.getSurname = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.lastname
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src); if not player then return false end
        return player.get('lastName')
    end,
}

editableFunctions.getNationality = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.nationality
    end,
    ['esx'] = function(src)
        return sh._t('unknown')
    end
}

editableFunctions.getCID = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.citizenid
    end,
    ['esx'] = function(src)
        return sh._t('unknown')
    end
}

editableFunctions.getGender = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.gender == 1 and 'female' or 'male'
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src); if not player then return false end
        local gender = player.get('sex')
        if not gender then return false end
        return gender == 'f' and 'female' or 'male'
    end,
}

editableFunctions.getDOB = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.birthdate
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src); if not player then return false end
        return player.get('dateofbirth')
    end,
}

editableFunctions.getDriverType = {
    ['qb'] = function(src)
        return sh._t('drive')
    end,
    ['esx'] = function(src)
        local licenses = {}
        TriggerEvent('esx_license:getLicenses', src, function(licensesData)
            local licenseTypes = {['drive'] = true, ['drive_bike'] = true, ['drive_truck'] = true}
            for type, data in pairs(licensesData) do
                if licenseTypes[type] then
                    table.insert(licenses, #licenses + 1, sh._t(type))
                end
            end
        end)
        Wait(1000)
        return table.concat(licenses, ' - ')
    end
}

editableFunctions.getSignature = {
    ['qb'] = function(src)
        local player = QBCore.Functions.GetPlayer(src); if not player then return false end
        return player.PlayerData.charinfo.firstname..player.PlayerData.charinfo.lastname
    end,
    ['esx'] = function(src)
        local player = ESX.GetPlayerFromId(src); if not player then return false end
        local firstName = player.get('firstName')
        local lastName = player.get('lastName')
        return firstName..lastName
    end,
}

setmetatable(editableFunctions, {
    __call = function(self, fnNAME, ...)
        return self[fnNAME][cfg.framework:lower()](...)
    end
})