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
        QBCore.Functions.Notify('Black Market kartın yok.',"error") 
    end
end)



Citizen.CreateThread(function()
	--Gunner 1
	exports['qb-target']:AddBoxZone("blackmarket", vector3(14.07, -1100.38, 29.8), 0.4, 2.8, { name="blackmarket", heading = 340, debugPoly = false, minZ = 25.7, maxZ = 29.7 }, 
		{ options = { {  event = "elused-blackmarket:shops", icon = "fas fa-box-open", label = "Black Market" }, },
		  distance = 2.0
	})


end) 