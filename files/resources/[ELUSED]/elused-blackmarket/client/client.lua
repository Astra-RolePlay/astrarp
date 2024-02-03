local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('QBCore:Client:OnPlayerUnload', function()
    bank = 0
    employees = {}
    unemployed = {}
end)

RegisterNetEvent('elused-blackmarket:shops')
AddEventHandler('elused-blackmarket:shops', function()
    local Player = QBCore.Functions.GetPlayerData()
   
    if QBCore.Functions.HasItem('blackmarket_vip_card') then    
	TriggerServerEvent("inventory:server:OpenInventory", "shop", "Black Market", Config.Items)
    else
        QBCore.Functions.Notify('Black Key\'in olmadan kasayı açamazsın.',"error") 
    end
end)



Citizen.CreateThread(function()
	--Gunner 1
	exports['qb-target']:AddBoxZone("blackmarket", vector3(2194.25, 5594.1, 53.75), 2.0, 2.0, { name="blackmarket", heading = 340, debugPoly = false, minZ = 49.7, maxZ = 56.7 }, 
		{ options = { {  event = "elused-blackmarket:shops", icon = "fas fa-box-open", label = "Black Market" }, },
		  distance = 3.0
	})


end) 