Scully = {
    Framework = 'qb-core', -- Server Core = scully_core, ESX = es_extended, QBCore = qb-core, Standalone = none
    RadioColour = 'default', -- Options are default, blue, brown, cherry, coral, cyan, green, mint, orange, pink, purple, red, white and yellow
    AllowColours = true, -- Disable if you don't want people to be able to change their radio colour in-game
    ColourCommand = 'rcolour', -- Set to '' if you don't want to allow changing with a command, command is /rcolour 1-11
    EnableList = true, -- Set to false to disable the player list
    HideListCommand = 'rlist', -- Set to '' if you don't want to allow hiding the list with a command, command is /rlist
    ShowSelf = true, -- Enable if you want your own name to be shown on the radio list
    EnableEditing = true, -- Disable if you don't want to allow players to change their names and callsigns on the radio
    MicClicks = true, -- Disable if you don't want mic clicks
    RadioAnims = true, -- Disable if you don't want to use radio animations for holding the radio
    UseItem = true, -- Enable if you want to use the radio as an item, will only work for QBCore and ESX
    UseItemColours = true, -- Enable if you want to use different items for each colour, this will disable the command also
    UseKeybind = 'none', -- Set to '' if you don't want to use the radio as a keybind, can be changed here for first use only or in your fivem keybind settings
    UseCustomChannelNames = true, -- Enable if you want custom channel names to be displayed on the radio
    ChannelNames = { -- Channel names have a limit of 7 characters or they won't display
        [6.25] = 'LEO RTO',
        [6.30] = 'EMT RTO'
    },
    WhitelistedAccess = { -- What channels should be whitelisted and what jobs should have access to them?
        [1] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [2] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [3] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [4] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [5] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [6] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [7] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [8] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        },
        [9] = {
            ['police'] = true,
            ['sheriff'] = true,
            ['sasp'] = true,
            ['ems'] = true
        }
    },
    AcePerms = { -- Not needed unless Framework is set to 'none'
        'police',
        'sheriff',
        'ems'
    }
}