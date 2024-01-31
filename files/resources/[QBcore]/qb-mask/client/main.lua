local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local wearing = false
local masks = Config.masks
local MaskBlip = nil
local ped = {}

AddEventHandler('onResourceStart', function(resource)
   if resource ~= GetCurrentResourceName() then return end
   PlayerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnGangUpdate', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

local function SetupItems()
    local products = Config.masks
    local curGang
    local items = {}
    local slot = 0

    for k,v in pairs(products) do
        curGang = v.gang
        slot = slot + 1
        if curGang then goto gangCheck end

        items[#items + 1] = { name = k, price = v.price, amount = 10, info = {}, type = "item", slot = slot,}

        goto nextIteration

        :: gangCheck ::
        if PlayerData.gang.name ~= 'none' then
            items[#items + 1] = { name = k, price = v.price, amount = 10, info = {}, type = "item", slot = slot,}
        end

        :: nextIteration ::
    end
    return items
end

local function openShop(shop)
    local ShopItems = {}
    ShopItems.items = {}
    ShopItems.label = "Masks Shop"

    ShopItems.items = SetupItems()

    for k in pairs(ShopItems.items) do
        ShopItems.items[k].slot = k
    end

    TriggerServerEvent("inventory:server:OpenInventory", "shop", "MaskShop_" .. shop, ShopItems)
end

RegisterNetEvent("ik-masks:client:openShop", function(data)
    openShop(data.shopnr)
end)

RegisterNetEvent('masks:client:wear', function(itemName)
    local ped = PlayerPedId()
    if not wearing then
        QBCore.Functions.Progressbar("puton_mask", "Maske'yi Giyiyorsun.", 100, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 16,
        }, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 1, masks[itemName].variation, masks[itemName].palette)
            wearing = true
            StopAnimTask(ped, "mp_masks@standard_car@ds@", "put_on_mask", 1.0)
        end)
    elseif wearing then
        QBCore.Functions.Progressbar("putoff_mask", "Maske'yi Çıkarıyorsun.", 100, false , true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = 'mp_masks@standard_car@ds@',
            anim = 'put_on_mask',
            flags = 16,
        }, {}, {}, function() -- Done
            SetPedComponentVariation(ped, 1, 0, 0)
            wearing = false
            StopAnimTask(ped, "mp_masks@standard_car@ds@", "put_on_mask", 1.0)
        end)
    end
end)

