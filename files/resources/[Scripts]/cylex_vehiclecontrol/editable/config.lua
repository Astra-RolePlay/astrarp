Config = {
    Language = "en",
    FuelDecor = "_FUEL_LEVEL",
    Command = "vehicleControl",
    SongMinimumDistance = 25.0, --Minimum distance at which they can hear the sound (Recommended: 15.0 - 25.0)

    Parts = {
        -- If you want to enable door control for everyone, return true, if you want to disable it for everyone, return false
        -- If you want to enable it for specific job, return job.name == "jobname"
        -- If you want to enable it for specific job and grade, return job.name == "jobname" and job.grade and job.grade.level == "grade" end
        -- Example return job.name == "mechanic" and job.grade and job.grade.level > 0
        ["doorControlEnabled"] = function(playerData)
            return true 
        end,
        ["mediaEnabled"] = function(playerData)
            return true
        end,
        ["extraEnabled"] = function(playerData)
            local job = playerData.job
            -- return job.name == "mechanic"
            return true
        end,
        ["neonEnabled"] = function(playerData)
            local job = playerData.job
            --return job.name == "mechanic" and job.grade and job.grade.level > 0
            return true
        end,
    },

    OpenKey = "F12",
    Notify = function(msg, type) 
        TriggerEvent("QBCore:Notify", msg, type) -- Change notification event with your own notification event.
    end
}

RegisterCommand(Config.Command, function()
    TriggerEvent('cylex_vehiclecontrol:client:openMenu', true)
end)

CreateThread(function()
    RegisterKeyMapping(Config.Command, 'Open vehiclecontrol', 'keyboard', Config.OpenKey)
end)