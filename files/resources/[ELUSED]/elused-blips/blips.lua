local blips = {
  { title = "BOŞ MEKANİK",                            colour = 27, id = 446, x = -373.41,  y = -123.34,  z = 38.68 },
  { title = "South Side Ballas",                      colour = 27, id = 429, x = 101.75,   y = -1937.75, z = 20.8 },
  { title = "BOŞ HOOD",                               colour = 3,  id = 429, x = -178.97,  y = -1546.43, z = 35.14 },
  { title = "BOŞ HOOD",                               colour = 3,  id = 429, x = 288.86,   y = -1740.2,  z = 28.95 },
  -- { title = "Conta ST",                  colour = 5,  id = 429, x = -104.04,  y = -1593.1,  z = 31.52 },
  -- { title = "909 ST",                    colour = 8,  id = 429, x = 444.5,    y = -1501.19, z = 29.31 },
  { title = "Black Piru Stones Nations",              colour = 1,  id = 429, x = -66.18,   y = -1520.44, z = 34.33 },
  { title = "Black Market",                           colour = 8,  id = 566, x = -663.86,  y = -937.07,  z = 21.83 },
  { title = "BOŞ HOOD",                               colour = 29, id = 429, x = 1297.215, y = -1724.93, z = 53.966 },
  -- { title = "Blancos Family",            colour = 29, id = 492, x = -106.23,  y = 827.78,   z = 235.72 },
  { title = "BOŞ MEKANİK #1",                            colour = 8,  id = 446, x = 532.35,   y = -180.85,  z = 54.32 },
  { title = "BOŞ MEKANİK #2",                            colour = 29, id = 446, x = 489.21,   y = -1313.27, z = 29.26 },
  { title = "BOŞ MEKANİK #3",                            colour = 1,  id = 446, x = 942.36,   y = -972.94,  z = 39.5 },
  { title = "BOŞ MEKANİK #4",                            colour = 1,  id = 446, x = 1148.33,  y = -771.61,  z = 57.57 },
  { title = "BOŞ MEKANİK #5",                            colour = 1,  id = 446, x = 135.76,   y = -3032.85, z = 7.04 },
  { title = "BOŞ MEKANİK #6",                            colour = 1,  id = 446, x = 1174.82,  y = 2646.45,  z = 37.77 },
  { title = "BOŞ HOOD",                               colour = 4,  id = 429, x = 356.46,   y = -1691.12, z = 32.53 },


  -- Malikaneler
  { title = "Rockford Hill | Malikane [BTC]",         colour = 29, id = 492, x = -822.77,  y = -29.38,   z = 38.65,  ymap = "ed_rockfordh02" },
  { title = "Banham Canyon | Ev [BTC / IC]",          colour = 29, id = 492, x = -2799.42, y = 1428.42,  z = 100.93, ymap = "CanyonHouse" },
  { title = "Pacific Bluff | Saray Yavrusu [BTC]",    colour = 1,  id = 492, x = -2992.88, y = 72.37,    z = 11.61,  ymap = "PacificBluffs" },
  { title = "Vinewood Hills | Malikane [BTC]",        colour = 29, id = 492, x = -146.04,  y = 913.11,   z = 235.67, ymap = "mansion2" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1458.46, y = -1117.31, z = 3.48,   ymap = "BeachHouse" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1439.42, y = -1164.97, z = 3.05,   ymap = "BeachHouse" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1441.13, y = -1196.5,  z = 3.61,   ymap = "BeachHouse" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1440.79, y = -1232.44, z = 4.53,   ymap = "BeachHouse" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1429.65, y = -1268.45, z = 4.84,   ymap = "BeachHouse" },
  { title = "Vespucci Beach Site | Ev [BTC / IC]",    colour = 29, id = 492, x = -1404.52, y = -1295.11, z = 4.93,   ymap = "BeachHouse" },
  { title = "Tongva Hills | Malikane [BTC]",          colour = 29, id = 492, x = -2605.88, y = 1679.19,  z = 141.44, ymap = "Designer_House" },
  { title = "West Vinewood | Villa [BTC]",            colour = 29, id = 492, x = -350.21,  y = 425.11,   z = 110.86, ymap = "CityHouse9" },
  { title = "Perfect Drive / Vinewood | Villa [BTC]", colour = 29, id = 492, x = -713.22,  y = 490.15,   z = 109.11, ymap = "blackhouse" },
  { title = "West Eclipse Blv. | Villa [BTC]",        colour = 29, id = 492, x = -1182.56, y = 283.29,   z = 69.5,   ymap = "CartelHouse" },
  { title = "Senora Rd. | Malikane [BTC]",            colour = 29, id = 492, x = 1391.2,   y = 1153.67,  z = 114.44, ymap = "rizeli" },

  --
  { title = "Şantiye Alanı",                          colour = 47, id = 643, x = -97.12,   y = -1015.13, z = 27.28 }
}

local blipsArea = {
  { title = "Deneme Hood", colour = 27, x = 107.04, y = -1902.0, z = 20.8, width = 300.0, height = 250.0, rotation = -45 }
}


Citizen.CreateThread(function()
  for _, info in pairs(blipsArea) do
    -- info.blip = AddBlipForArea(107.04, -1942.0, 20.8, 100.0, 50.0)
    info.blip = AddBlipForArea(info.x, info.y, info.z, info.width, info.height)
    SetBlipRotation(info.blip, info.rotation)
    SetBlipColour(info.blip, 0xFF00FF80)
    SetBlipDisplay(info.blip, 3)
  end

  -- SetBlipRotation(blip, 0)
  --SetBlipColour(blip, 0xFF00FF80)

  for _, info in pairs(blips) do
    info.blip = AddBlipForCoord(info.x, info.y, info.z)
    SetBlipSprite(info.blip, info.id)
    SetBlipDisplay(info.blip, 4)
    SetBlipScale(info.blip, 0.7)
    SetBlipColour(info.blip, info.colour)
    SetBlipAsShortRange(info.blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(info.title)
    EndTextCommandSetBlipName(info.blip)
  end
end)
