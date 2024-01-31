local QBCore = exports['qb-core']:GetCoreObject()
local CurrentCops = -0

RegisterNetEvent('police:SetCopCount')
AddEventHandler('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('QBCore:Client:OnPlayerUnload')
AddEventHandler('QBCore:Client:OnPlayerUnload', function()
    isLoggedIn = false
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
    isLoggedIn = true
end)

RegisterNetEvent('qb-police:SetCopCount')
AddEventHandler('qb-police:SetCopCount', function(Amount)
    CurrentCops = Amount
end)

RegisterNetEvent('ed-atmrobbery:client:roubar', function()
    RobAtm()
end)

function RobAtm()
	local pos = GetEntityCoords(PlayerPedId())
    local hasItem = QBCore.Functions.HasItem('trojan_usb')

	if LocalPlayer.state.isLoggedIn then
		QBCore.Functions.TriggerCallback("ed-atmrobbery:Cooldown", function(cooldown)
			if not cooldown then
				if CurrentCops >= 0 then
                    if hasItem then
                        PoliceCall()
                        exports['qb-ui']:Circle(function(success)  
                            if success then
                                ClearPedTasksImmediately(PlayerPedId())
                                HackSuccess() 
                            else
                                Citizen.Wait(1000)
                                ClearPedTasksImmediately(PlayerPedId())
                                HackFailed()
                            end
                        end, 2, 20)
                    else
                        QBCore.Functions.Notify("Bunun için Trojan USBye ihtiyacın var", "error")
                    end
				else
					QBCore.Functions.Notify("Yeterli polis yok.", "error")
				end
			else
				QBCore.Functions.Notify("Bu ATM daha önce zaten soyulmuş...")
			end
		end)
	else
		Citizen.Wait(3000)
	end
end

function RobbingTheMoney()
    Anim = true
    QBCore.Functions.Progressbar("power_hack", "Para alınıyor...", (7500), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "anim@heists@ornate_bank@grab_cash_heels",
        anim = "grab",
        flags = 16,
    }, {
       model = "prop_cs_heist_bag_02",
       bone = 57005,
       coords = { x = -0.005, y = 0.00, z = -0.16 },
       rotation = { x = 250.0, y = -30.0, z = 0.0 },


    }, {}, function() -- Done
        Anim = false
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		SetPedComponentVariation((PlayerPedId()), 5, 47, 0, 0)

    end, function() -- Cancel
        Anim = false
        StopAnimTask(PlayerPedId(), "anim@heists@ornate_bank@grab_cash_heels", "grab", 1.0)
		
    end)
    
    Citizen.CreateThread(function()
        while Anim do
            TriggerServerEvent('qb-hud:Server:gain:stress', math.random(2, 3))
            Citizen.Wait(12000)
        end
    end)
end

function HackFailed()
	QBCore.Functions.Notify("Başarısız")
    if math.random(1, 100) <= 40 then
		TriggerServerEvent("evidence:server:CreateFingerDrop", GetPedBoneCoords(PlayerPedId))
		QBCore.Functions.Notify("ATM'de parmak izi bıraktın")
	end
end

function HackSuccess()
	QBCore.Functions.Notify("Başarılı!")
    ClearPedTasksImmediately(PlayerPedId())
	RobbingTheMoney()
	TriggerServerEvent("ed-atmrobbery:success")	
    TriggerServerEvent('ed-atmrobbery:Server:BeginCooldown')
end

function PoliceCall()
    local chance = 75
    if GetClockHours() >= 0 and GetClockHours() <= 6 then
        chance = 50
    end
    if math.random(1, 100) <= chance then
        TriggerServerEvent('police:server:policeAlert', 'ATM SOYGUNU')
    end
end

local prop = {
    "prop_atm_01",
    "prop_atm_02",
    "prop_atm_03",
    "prop_fleeca_atm",
}
  exports['qb-target']:AddTargetModel(prop, {
      options = {
          {
              type = "client",
              event = "ed-atmrobbery:client:roubar",
              icon = "fas fa-user-secret",
              label = "ATM'yi Soy",
        },
    },
        distance = 2.0    
})
