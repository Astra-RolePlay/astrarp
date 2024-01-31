Config = {}

Config.JobStashs = { -- Only people with a certain job can access this
    ['BOLLY'] = {
        label = "BLACKMARKET", --Keep this together to ensure greater order.
        coords = vector3(-61231266.58, -93312312.67, 21231231.83),
        Stash = {
            personal = false, -- establish whether its personal or not
            msg = 'E - BlackMarket Deposu', -- Text 3D
            job = 'police', -- Job required
            grade = 1, -- Access to all ranks greater than or equal to 3 or 'all' for all
        },
    },
}

Config.PublicStashs = { -- All people can access this.

['6NINE'] = {
    label = "6NINE ST",
    coords = vector3(262.68, -1772.7, 28.73),
    Stash = {
        personal = true,
        msg = 'E - 6NINE KISISEL DEPO',
    },
},
['BALLAS'] = {
    label = "BALLAS",
    coords = vector3(83.45, -1973.75, 20.93),
    Stash = {
        personal = true,
        msg = 'E - BALLAS KISISEL DEPO',
    },
},
['99ST'] = {
    label = "99ST",
    coords = vector3(1269.07, -1711.19, 54.77),
    Stash = {
        personal = true,
        msg = 'E - 99ST KISISEL DEPO',
    },
},
['BLANCOS'] = {
    label = "BLANCOS",
    coords = vector3(-85.65, 834.64, 235.92),
    Stash = {
        personal = true,
        msg = 'E - BLANCOS FAMILY KISISEL DEPO',
    },
},
['CONTA'] = {
    label = "CONTA",
    coords = vector3(-97.88, -1612.36, 32.31),
    Stash = {
        personal = true,
        msg = 'E - CONTA KISISEL DEPO',
    },
},
['FAVELABM'] = {
    label = "Favela Blackmarket",
    coords = vector3(-659.75, -942.75, 21.83),
    Stash = {
        personal = true,
        msg = 'E - FAVELA BLACKMARKET KISISEL DEPO',
    },
},

['BOLYHOOD'] = {
    label = "BOLYHOOD",
    coords = vector3(548.61, -191.76, 54.48),
    Stash = {
        personal = true,
        msg = 'E - BOLYHOOD MEKANIK KISISEL DEPO',
    },
},

}