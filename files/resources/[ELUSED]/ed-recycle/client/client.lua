local QBCore = exports['qb-core']:GetCoreObject()

local Models = {
    1437508529,
    -819563011,
    -289082718,
    1437508529,
    1614656839,
    -289082718,
    1437508529,
    1614656839,
    -130812911,
    -93819890,
    1329570871,
    1143474856,
    -228596739,
    -468629664,
    -1426008804,
    -1187286639,
    -1096777189,
    -413198204,
    437765445,
    122303831,
    1748268526,
    998415499,
    234941195,
    -2096124444,
    1792999139,
    -341442425,
    -329415894,
    -1830793175,
    -654874323,
    1010534896,
    651101403,
    909943734,
    1919238784,
    274859350,
    751349707,
    1627301588,
    1388415578,
    1813879595,
    1098827230,
    1388308576,
    600967813,
    1948359883,
    -1681329307,
    -96647174,
    811169045,
    -14708062,
    354692929,
    673826957,
    375956747,
    1233216915,
    -85604259,
    -115771139,
    -1998455445,
    577432224,
    684586828,
    218085040,
    666561306,
    -58485588,
    -206690185,
    1511880420,
    682791951,
    -1587184881
}

Citizen.CreateThread(function()
    exports['qb-target']:AddTargetModel(Models,  {
        options = {
            {
                type = "client",
                event = "ed-recycle:mix-garbage",
                icon = "fas fa-dumpster",
                label = "Çöpü Karıştır",
            },
            {
                type = "client",
                event = "ed-recycle:see-garbage",
                icon = "fas fa-dumpster",
                label = "Çöpün İçine Bak",
            },
        },
        distance = 1.0,
    })
end)



local mixgarbage = false
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(1000)
		if mixgarbage then
			Citizen.Wait(60000) -- 1 Dakika
			mixgarbage = false
            QBCore.Functions.Notify('Tekrar Çöp Karıştırabilirsin!', "success")
		end 
	end
end)

RegisterNetEvent('ed-recycle:mix-garbage')
AddEventHandler('ed-recycle:mix-garbage', function()
    if not mixgarbage then
        mixgarbage = true
        QBCore.Functions.Progressbar("mix_garbage", "Çöpü Karıştırıyorsun.", 8000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "amb@prop_human_bum_bin@base",
            anim = "base",
            flags = 33,
        }, {}, {}, function()
            TriggerServerEvent("ed-recycle:giveitem", src)
        end, function()
        end)
    else
        QBCore.Functions.Notify('1 Dakikada Bir Çöpü Karıştırabilirsin!', "error")
    end
end)

RegisterNetEvent('ed-recycle:see-garbage')
AddEventHandler('ed-recycle:see-garbage', function()
local nearGarbage = checkNearGarbage()
    if nearGarbage then
        local id = ObjToNet(nearGarbage)
        TriggerEvent("inventory:client:SetCurrentStash", "Trash_"..id, source)
        TriggerServerEvent("inventory:server:OpenInventory", "stash", "Trash_"..id, {maxweight = 20000, slots = 5})
    end
end)

function checkNearGarbage()
    local found = false
    local Ped = PlayerPedId()
    local Entity, Dist = QBCore.Functions.GetClosestObject()
    if Dist < 2 then
        for i=1, #Models do
            if GetEntityModel(Entity) == Models[i] then
                found = Entity
                break
            end
        end
    end
    return found
end