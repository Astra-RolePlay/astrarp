Config                  = {}
Config.DynamicWeather   = false -- Set this to false if you don't want the weather to change automatically every 10 minutes.

-- On server start
Config.StartWeather     = 'EXTRASUNNY'
Config.BaseTime         = 8
Config.TimeOffset       = 0
Config.FreezeTime       = true
Config.Blackout         = false
Config.BlackoutVehicle  = false
Config.NewWeatherTimer  = 0
Config.Disabled         = false


Config.AvailableWeatherTypes = { -- DON'T TOUCH EXCEPT IF YOU KNOW WHAT YOU ARE DOING
    'EXTRASUNNY',
    'CLEAR',
    'NEUTRAL',
    'SMOG',
    'FOGGY',
    'OVERCAST',
    'CLOUDS',
    'CLEARING',
    'RAIN',
    'THUNDER',
    'SNOW',
    'BLIZZARD',
    'SNOWLIGHT',
    'XMAS',
    'HALLOWEEN',
}
