local QBCore = exports['qb-core']:GetCoreObject()
QBCore.Functions.CreateCallback('elused-dispatch:isVehicleOwned', function(source, cb, plate)
    exports.oxmysql:execute('SELECT plate FROM player_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(result)
        if result[1] then
            cb(true)
        else
            cb(false)
        end
    end)
end)

function _U(entry)
    return Locales[Config.Locale][entry]
end

local name = ('%s %s'):format(firstname, lastname)
local title = ('%s %s'):format(firstname, lastname)
caller = name
info = title

function getCaller(src)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    return xPlayer.PlayerData.name
end

function getTitle(src)
    local xPlayer = QBCore.Functions.GetPlayer(src)
    local title = ('%s %s'):format(xPlayer.PlayerData.charinfo.firstname, xPlayer.PlayerData.charinfo.lastname)
    return title
end

local dispatchCodes = {

    melee = {
        displayCode = '10-10',
        description = _U('melee'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp','ambulance'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1
    },

    lspddown = {
        displayCode = 'KOD/0',
        description = 'LSPD | YARALI MEMUR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    lssddown = {
        displayCode = 'KOD/0',
        description = 'LSSD | YARALI MEMUR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    fbipanic = {
        displayCode = 'KOD/99',
        description = 'FBI | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    fbihelp = {
        displayCode = 'KOD/3',
        description = 'FBI | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    fbidown = {
        displayCode = 'KOD/0',
        description = 'FBI | YARALI MEMUR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },


    sahppanic = {
        displayCode = 'KOD/99',
        description = 'SAHP | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    sahphelp = {
        displayCode = 'KOD/3',
        description = 'SAHP | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    sahpdown = {
        displayCode = 'KOD/0',
        description = 'SAHP | YARALI MEMUR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    saspdown = {
        displayCode = 'KOD/0',
        description = 'SASP | YARALI MEMUR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    sasppanic = {
        displayCode = 'KOD/99',
        description = 'SASP | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    sasphelp = {
        displayCode = 'KOD/3',
        description = 'SASP | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },


    notdown = {
        displayCode = 'KOD/0',
        description = 'NOT ILLEGAL | YARALANDI',
        isImportant = 0,
        recipientList = {'notillegal'},
        blipSprite = 653,
        blipColour = 60,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },


    emsdown = {
        displayCode = 'KOD/0',
        description = 'LSMS | YARALI DOKTOR',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi', 'ambulance'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },


    storerobbery = {
        displayCode = '10-95',
        description = _U('storerobbery'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 11,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    houserobbery = {
        displayCode = '10-94',
        description = _U('houserobbery'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 350,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    carjacking = {
        displayCode = '10-90',
        description = _U('carjacking'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 651,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    lspdpanic = {
        displayCode = 'KOD/99',
        description = 'LSPD | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },



    notpanic = {
        displayCode = 'KOD/99',
        description = 'NOT ILLEGAL | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'notillegal'},
        blipSprite = 653,
        blipColour = 60,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    lssdpanic = {
        displayCode = 'KOD/99',
        description = 'LSSD | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 60,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },


    lspdhelp = {
        displayCode = 'KOD/3',
        description = 'LSPD | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    nothelp = {
        displayCode = 'KOD/3',
        description = 'NOT ILLEGAL | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'notillegal'},
        blipSprite = 653,
        blipColour = 60,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    lssdhelp = {
        displayCode = 'KOD/3',
        description = 'LSSD | DESTEK TALEBI',
        isImportant = 1,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 60,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    persondown = {
        displayCode = '10-52',
        description = _U('persondown'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 653,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-portrait'
    },

    autotheft = {
        displayCode = '10-90',
        description = _U('autotheft'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 651,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-car',
        infoM2 = 'fa-palette'
    },

    aracparcalama = {
        displayCode = '10-99',
        description = _U('aracparcalama'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 651,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-car',
        infoM2 = 'fa-palette'
    },

    speeding = {
        displayCode = '10-96',
        description = _U('speeding'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 650,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-car',
        infoM2 = 'fa-palette'
    },

    shooting = {
        displayCode = '10-77',
        description = _U('shooting'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 648,
        blipColour = 84,
        blipScale = 1.5
    },

    hunting = {
        displayCode = '10-77H',
        description = _U('hunting'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 648,
        blipColour = 84,
        blipScale = 1.5
    },

    driveby = {
        displayCode = '10-77',
        description = _U('driveby'),
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        blipSprite = 649,
        blipColour = 84,
        blipScale = 1.1,
        infoM = 'fa-car',
        infoM2 = 'fa-palette'
    }
}

RegisterCommand('testvangelico', function(playerId, args, rawCommand)
    local data = {
        displayCode = '211',
        description = 'Robbery',
        isImportant = 0,
        recipientList = {'police', 'sheriff', 'sasp', 'fbi','sahp'},
        length = '10000',
        infoM = 'fa-info-circle',
        info = 'Vangelico Jewelry Store'
    }
    local dispatchData = {
        dispatchData = data,
        caller = 'Alarm',
        coords = vector3(-633.9, -241.7, 38.1)
    }
    TriggerEvent('wf-alerts:svNotify', dispatchData)
end, false)

local blacklistedIdentifiers = {}

function Blacklisted()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if not xPlayer then
        return false
    end
    local identifier = xPlayer.PlayerData.citizenid
    for i = 1, #blacklistedIdentifiers do
        if identifier == blacklistedIdentifiers[i] then
            return true
        end
    end
    return false
end

RegisterServerEvent('wf-alerts:svNotify')
AddEventHandler('wf-alerts:svNotify', function(pData)
    if not Blacklisted(source) then
        local dispatchData
        if pData.dispatchCode == 'lspddown' then

        end
        if pData.dispatchCode == 'panic' then
            pData.caller = getCaller(source)
        end
        if not pData.dispatchCode then
            dispatchData = pData.dispatchData
        elseif dispatchCodes[pData.dispatchCode] ~= nil then
            dispatchData = dispatchCodes[pData.dispatchCode]
        end
        if not pData.info then
            pData.info = dispatchData.info
        end
        if not pData.info2 then
            pData.info2 = dispatchData.info2
        end
        if not pData.length then
            pData.length = dispatchData.length
        end
        pData.displayCode = dispatchData.displayCode
        pData.dispatchMessage = dispatchData.description
        pData.isImportant = dispatchData.isImportant
        pData.recipientList = dispatchData.recipientList
        pData.infoM = dispatchData.infoM
        pData.infoM2 = dispatchData.infoM2
        pData.sprite = dispatchData.blipSprite
        pData.colour = dispatchData.blipColour
        pData.scale = dispatchData.blipScale
        TriggerClientEvent('wf-alerts:clNotify', -1, pData)
        local n = [[

	]]
        local details = pData.dispatchMessage
        if pData.info then
            details = details .. n .. pData.info
        end
        if pData.info2 then
            details = details .. n .. pData.info2
        end
        if pData.recipientList[1] == 'police' then
            TriggerEvent('mdt:newCall', details, pData.caller, vector3(pData.coords.x, pData.coords.y, pData.coords.z),
                false)
        end
    end
end)

RegisterServerEvent('wf-alerts:svNotify911')
AddEventHandler('wf-alerts:svNotify911', function(message, caller, coords)
    if message ~= nil then
        local pData = {}
        pData.displayCode = '911'
        if caller == _U('caller_unknown') then
            pData.dispatchMessage = _U('unknown_caller')
        else
            pData.dispatchMessage = _U('call_from') .. caller
        end
        pData.recipientList = {'police', 'ambulance', 'sasp', 'fbi', 'doj', 'sheriff'}
        pData.length = 13000
        pData.infoM = 'fa-phone'
        pData.info = message
        pData.coords = vector3(coords.x, coords.y, coords.z)
        pData.sprite, pData.colour, pData.scale = 480, 84, 2.0
        TriggerClientEvent('wf-alerts:clNotify', -1, pData)
        TriggerEvent('mdt:newCall', message, caller, vector3(coords.x, coords.y, coords.z), false)
    end
end)

QBCore.Commands.Add("kod", "Polis Birimleri Kod Gönder", {{name="kod", help="Kod Seviyesi"}}, false, function(source, args) -- name, help, arguments, argsrequired,  end sonuna persmission
    TriggerClientEvent("elused-polisbidirim:kod-gonder", source, args[1])
end)