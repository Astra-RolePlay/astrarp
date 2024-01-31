local QBCore = exports['qb-core']:GetCoreObject()

--#[Local Variable]#--
local currentMenuItemID = 0
local currentMenuItem = ""
local currentMenuItem2 = ""
local currentMenu = "mainMenu"

local currentCategory = 0

local currentResprayCategory = 0
local currentResprayType = 0

local currentWheelCategory = 0

local currentNeonSide = 0

local menuStructure = {}

local vehicleR = 0
local vehicleG = 0
local vehicleB = 0

--#[Local Functions]#--
local function roundNum(num, numDecimalPlaces)
    return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
end

local function toggleMenuContainer(state)
    SendNUIMessage({
        toggleMenuContainer = true,
        state = state
    })
end

local function createMenu(menu, heading, subheading)
    SendNUIMessage({
        createMenu = true,
        menu = menu,
        heading = heading,
        subheading = subheading
    })
end

local function destroyMenus()
    SendNUIMessage({
        destroyMenus = true
    })
end

local function populateMenu(menu, id, item, item2, r, g, b)
    SendNUIMessage({
        populateMenu = true,
        menu = menu,
        id = id,
        item = item,
        item2 = item2,
        r = r,
        g = g,
        b = b,
    })
end

local function finishPopulatingMenu(menu)
    SendNUIMessage({
        finishPopulatingMenu = true,
        menu = menu
    })
end

local function updateMenuHeading(menu)
    SendNUIMessage({
        updateMenuHeading = true,
        menu = menu
    })
end

local function updateMenuSubheading(menu)
    SendNUIMessage({
        updateMenuSubheading = true,
        menu = menu
    })
end

local function updateMenuStatus(text)
    SendNUIMessage({
        updateMenuStatus = true,
        statusText = text
    })
end

local function toggleMenu(state, menu)
    SendNUIMessage({
        toggleMenu = true,
        state = state,
        menu = menu
    })
end

local function updateItem2Text(menu, id, text)
    SendNUIMessage({
        updateItem2Text = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function updateItem2TextOnly(menu, id, text)
    SendNUIMessage({
        updateItem2TextOnly = true,
        menu = menu,
        id = id,
        item2 = text
    })
end

local function scrollMenuFunctionality(direction, menu)
    SendNUIMessage({
        scrollMenuFunctionality = true,
        direction = direction,
        menu = menu
    })
end

local function playSoundEffect(soundEffect, volume)
    SendNUIMessage({
        playSoundEffect = true,
        soundEffect = soundEffect,
        volume = volume
    })
end

local function isMenuActive(menu)
    local menuActive = false

    if menu == "modMenu" then
        for k, v in pairs(vehicleCustomisation) do 
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true
    
                break
            else
                menuActive = false
            end
        end
    elseif menu == "BoyaMenu" then
        for k, v in pairs(vehicleResprayOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true
    
                break
            else
                menuActive = false
            end
        end
    elseif menu == "JantlarMenu" then
        for k, v in pairs(vehicleWheelOptions) do
            if (v.category:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true
    
                break
            else
                menuActive = false
            end
        end
    elseif menu == "NeonsSideMenu" then
        for k, v in pairs(vehicleNeonOptions.neonTypes) do
            if (v.name:gsub("%s+", "") .. "Menu") == currentMenu then
                menuActive = true
    
                break
            else
                menuActive = false
            end
        end
    end

    return menuActive
end

local function updateCurrentMenuItemID(id, item, item2, r, g, b)
    currentMenuItemID = id
    currentMenuItem = item
    currentMenuItem2 = item2

    if isMenuActive("modMenu") then
        if currentCategory ~= 18 then
            PreviewMod(currentCategory, currentMenuItemID)
        end
    elseif isMenuActive("BoyaMenu") then
        PreviewColour(currentResprayCategory, currentResprayType, currentMenuItemID, r, g, b)
        vehicleR = r
        vehicleG = g
        vehicleB = b
    elseif isMenuActive("JantlarMenu") then
        if currentWheelCategory ~= -1 and currentWheelCategory ~= 20 then
            PreviewWheel(currentCategory, currentMenuItemID, currentWheelCategory)
        end
    elseif isMenuActive("NeonsSideMenu") then
        PreviewNeon(currentNeonSide, currentMenuItemID)
    elseif currentMenu == "PencereTonuMenu" then
        PreviewWindowTint(currentMenuItemID)
    elseif currentMenu == "NeonRenklerMenu" then
        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

        PreviewNeonColour(r, g, b)
    elseif currentMenu == "XenonRenklerMenu" then
        PreviewXenonColour(currentMenuItemID)
    elseif currentMenu == "CikartmalarMenu" then
        PreviewOldLivery(currentMenuItemID)
    elseif currentMenu == "PlakaRengiMenu" then
        PreviewPlateIndex(currentMenuItemID)
    end
end

--#[Global Functions]#--
function Draw3DText(x, y, z, str, r, g, b, a, font, scaleSize, enableProportional, enableCentre, enableOutline, enableShadow, sDist, sR, sG, sB, sA)
    local onScreen, worldX, worldY = World3dToScreen2d(x, y, z)
    local gameplayCamX, gameplayCamY, gameplayCamZ = table.unpack(GetGameplayCamCoords())

    if onScreen then
        SetTextScale(1.0, scaleSize)
        SetTextFont(font)
        SetTextColour(r, g, b, a)
        SetTextEdge(2, 0, 0, 0, 150)

        if enableProportional then
            SetTextProportional(1)
        end

        if enableOutline then
            SetTextOutline()
        end

        if enableShadow then
            SetTextDropshadow(sDist, sR, sG, sB, sA)
            SetTextDropShadow()
        end

        if enableCentre then
            SetTextCentre(1)
        end
        
        SetTextEntry("STRING")
        AddTextComponentString(str)
        DrawText(worldX, worldY)
    end
end

function InitiateMenus(isMotorcycle, vehicleHealth)
    local plyPed = PlayerPedId()
    local plyVeh = GetVehiclePedIsIn(plyPed, false)
    --#[Repair Menu]#--
    if vehicleHealth < 1000.0 then
        local repairCost = 0

        TriggerServerEvent("qb-customs:updateRepairCost", repairCost)
        createMenu("repairMenu", "Benny's Original Motorworks'e Hosgeldiniz", "Araci Tamir Et")
        populateMenu("repairMenu", -1, "Tamir Et", "$" .. repairCost)
        finishPopulatingMenu("repairMenu")
    end

    --#[Main Menu]#--
    createMenu("mainMenu", "Benny's Original Motorworks'e Hosgeldiniz", "Bir Kategori Secin")

    for k, v in ipairs(vehicleCustomisation) do 
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        
        if amountValidMods > 0 or v.id == 18 then
            populateMenu("mainMenu", v.id, v.category, "none")
        end
    end

    populateMenu("mainMenu", -1, "Boya", "none")

    if not isMotorcycle then
        populateMenu("mainMenu", -2, "Pencere Tonu", "none")
        populateMenu("mainMenu", -3, "Neonlar", "none")
    end

    populateMenu("mainMenu", 22, "Xenon Farlar", "none")
    populateMenu("mainMenu", 23, "Jantlar", "none")

    populateMenu("mainMenu", 24, "Cikartmalar", "none")
    populateMenu("mainMenu", 25, "Plaka Rengi", "none")
    populateMenu("mainMenu", 26, "Arac Ekstralari", "none")

    finishPopulatingMenu("mainMenu")

    --#[Mods Menu]#--
    for k, v in ipairs(vehicleCustomisation) do 
        local validMods, amountValidMods = CheckValidMods(v.category, v.id)
        local currentMod, currentModName = GetCurrentMod(v.id)

        if amountValidMods > 0 or v.id == 18 then
            if v.id == 11 or v.id == 12 or v.id == 13 or v.id == 15 or v.id == 16 then --Performance Upgrades
                local tempNum = 0
            
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Choose an Upgrade")

                for m, n in pairs(validMods) do
                    tempNum = tempNum + 1

                    if maxVehiclePerformanceUpgrades == 0 then
                        populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])

                        if currentMod == n.id then
                            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                        end
                    else
                        if tempNum <= (maxVehiclePerformanceUpgrades + 1) then
                            populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.performance.prices[tempNum])

                            if currentMod == n.id then
                                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                            end
                        end
                    end
                end
                
                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            elseif v.id == 18 then
                local currentTurboState = GetCurrentTurboState()
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Ozellestirmesi", "Turbo Ac/Kapat")

                populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Kapat", "$0")
                populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Ac", "$" .. vehicleCustomisationPrices.turbo.price)

                updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentTurboState, "Mevcut")

                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            else
                createMenu(v.category:gsub("%s+", "") .. "Menu", v.category .. " Ozellestirmesi", "Bir Mod Secin")

                for m, n in pairs(validMods) do
                    populateMenu(v.category:gsub("%s+", "") .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.cosmetics.price)

                    if currentMod == n.id then
                        updateItem2Text(v.category:gsub("%s+", "") .. "Menu", n.id, "Mevcut")
                    end
                end
                
                finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
            end
        end
    end

    --#[Respray Menu]#--
    createMenu("BoyaMenu", "Boya", "Bir Boya Kategorisi Secin")

    populateMenu("BoyaMenu", 0, "Birincil Renk", "none")
    populateMenu("BoyaMenu", 1, "Ikincil Renk", "none")
    populateMenu("BoyaMenu", 2, "Sedef Rengi", "none")
    populateMenu("BoyaMenu", 3, "Jant Rengi", "none")
    populateMenu("BoyaMenu", 4, "Ic Dizayn Rengi", "none")
    populateMenu("BoyaMenu", 5, "Gosterge Paneli Rengi", "none")

    finishPopulatingMenu("BoyaMenu")

    --#[Respray Types]#--
    createMenu("ResprayTypeMenu", "Boya Tipleri", "Bir Renk Tipi Secin")

    for k, v in ipairs(vehicleResprayOptions) do
        populateMenu("ResprayTypeMenu", v.id, v.category, "none")
    end

    finishPopulatingMenu("ResprayTypeMenu")

    --#[Respray Colours]#--
    for k, v in ipairs(vehicleResprayOptions) do 
        createMenu(v.category .. "Menu", v.category .. " Colours", "Choose a Colour")

        for m, n in ipairs(v.colours) do
            populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.respray.price, n.r, n.g, n.b)
        end

        finishPopulatingMenu(v.category .. "Menu")
    end

    --#[Wheel Categories Menu]#--
    createMenu("JantlarMenu", "Jant Kategorisi", "Bir Kategori Secin")

    for k, v in ipairs(vehicleWheelOptions) do 
        if isMotorcycle then
            if v.id == -1 or v.id == 20 or v.id == 6 then --Motorcycle Wheels
                populateMenu("JantlarMenu", v.id, v.category, "none")
            end
        else
            populateMenu("JantlarMenu", v.id, v.category, "none")
        end
    end

    finishPopulatingMenu("JantlarMenu")

    --#[Wheels Menu]#--
    for k, v in ipairs(vehicleWheelOptions) do 
        if v.id == -1 then
            local currentCustomWheelState = GetCurrentCustomWheelState()
           
            createMenu(v.category:gsub("%s+", "") .. "Menu", v.category, "Ozel Jantlari Etkinlestir/Devre Disi Birak")

            populateMenu(v.category:gsub("%s+", "") .. "Menu", 0, "Devre Disi Birak", "$0")
            populateMenu(v.category:gsub("%s+", "") .. "Menu", 1, "Etkinlestir", "$" .. vehicleCustomisationPrices.customwheels.price)

            updateItem2Text(v.category:gsub("%s+", "") .. "Menu", currentCustomWheelState, "Mevcut")

            finishPopulatingMenu(v.category:gsub("%s+", "") .. "Menu")
        elseif v.id ~= 20 then
            if isMotorcycle then
                if v.id == 6 then --Motorcycle Wheels
                    local validMods, amountValidMods = CheckValidMods(v.category, v.wheelID, v.id)

                    createMenu(v.category .. "Menu", v.category .. " Jantlar", "Bir Jant Secin")

                    for m, n in pairs(validMods) do
                        populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                    end

                    finishPopulatingMenu(v.category .. "Menu")
                end
            else
                local validMods, amountValidMods = CheckValidMods(v.category, v.wheelID, v.id)

                createMenu(v.category .. "Menu", v.category .. " Jantlar", "Bir Jant Secin")

                for m, n in pairs(validMods) do
                    populateMenu(v.category .. "Menu", n.id, n.name, "$" .. vehicleCustomisationPrices.wheels.price)
                end

                finishPopulatingMenu(v.category .. "Menu")
            end
        end
    end

    --#[Wheel Smoke Menu]#--
    local currentWheelSmokeR, currentWheelSmokeG, currentWheelSmokeB = GetCurrentVehicleWheelSmokeColour()
    createMenu("LastikDumaniMenu", "Lastik Dumani Ozellestirmesi", "Bir Renk Secin")

    for k, v in ipairs(vehicleTyreSmokeOptions) do
        populateMenu("LastikDumaniMenu", k, v.name, "$" .. vehicleCustomisationPrices.wheelsmoke.price)

        if v.r == currentWheelSmokeR and v.g == currentWheelSmokeG and v.b == currentWheelSmokeB then
            updateItem2Text("LastikDumaniMenu", k, "Mevcut")
        end
    end

    finishPopulatingMenu("LastikDumaniMenu")

    --#[Window Tint Menu]#--
    local currentWindowTint = GetCurrentWindowTint()
    createMenu("PencereTonuMenu", "Pencere Tonu Ozellestirmesi", "Bir Ton Secin")

    for k, v in ipairs(vehicleWindowTintOptions) do 
        populateMenu("PencereTonuMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.windowtint.price)

        if currentWindowTint == v.id then
            updateItem2Text("PencereTonuMenu", v.id, "Mevcut")
        end
    end

    finishPopulatingMenu("PencereTonuMenu")

    --#[Old Livery Menu]#--
    local livCount = GetVehicleLiveryCount(plyVeh)
    if livCount > 0 then
        local tempOldLivery = GetVehicleLivery(plyVeh)
        createMenu("CikartmalarMenu", "Cikartma Ozellestirmesi", "Bir Cikartma Secin")
        -- if GetVehicleClass(plyVeh) ~= 18 then
            for i=0, GetVehicleLiveryCount(plyVeh)-1 do
                populateMenu("CikartmalarMenu", i, "Cikartma", "$100")
                if tempOldLivery == i then
                    updateItem2Text("CikartmalarMenu", i, "Mevcut")
                end
            end
        -- end
        finishPopulatingMenu("CikartmalarMenu")
    end

    --#[Plate Colour Index Menu]#--

    local tempPlateIndex = GetVehicleNumberPlateTextIndex(plyVeh)
    createMenu("PlakaRengiMenu", "Plaka Rengi", "Bir Stil Seç")
    local plateTypes = {
        "Beyaz Ustune Mavi #1",
        "Siyah Ustune Sari",
        "Mavi Ustune Sari",
        "Beyaz Ustune Mavi #2",
        "Beyaz Ustune Mavi #3",
        "North Yankton",
    }
    -- if GetVehicleClass(plyVeh) ~= 18 then
        for i=0, #plateTypes-1 do
            if i ~= 4 then
                populateMenu("PlakaRengiMenu", i, plateTypes[i+1], "$1000")
                if tempPlateIndex == i then
                    updateItem2Text("PlakaRengiMenu", i, "Mevcut")
                end
            end
        end
    -- end
    finishPopulatingMenu("PlakaRengiMenu")

    --#[Vehicle Extras Menu]#--
    createMenu("AracEkstralariMenu", "Araç Ekstraları", "Ekstra Kapat/Aç")
    -- if GetVehicleClass(plyVeh) ~= 18 then
        for i=0, 12 do
            if DoesExtraExist(plyVeh, i) then
                local state = IsVehicleExtraTurnedOn(plyVeh, i) and "AÇIK" or "KAPALI"
                populateMenu("AracEkstralariMenu", i, "Ekstra "..tostring(i), state)
            else
                -- populateMenu("AracEkstralariMenu", i, "No Option", "NONE")
            end
        end
    -- end
    finishPopulatingMenu("AracEkstralariMenu")

    --#[Neons Menu]#--
    createMenu("NeonlarMenu", "Neon Ozellestirmesi", "Bir Kategori Secin")

    for k, v in ipairs(vehicleNeonOptions.neonTypes) do
        populateMenu("NeonlarMenu", v.id, v.name, "none")
    end

    populateMenu("NeonlarMenu", -1, "Neon Renkler", "none")
    finishPopulatingMenu("NeonlarMenu")

    --#[Neon State Menu]#--
    for k, v in ipairs(vehicleNeonOptions.neonTypes) do
        local currentNeonState = GetCurrentNeonState(v.id)
        createMenu(v.name:gsub("%s+", "") .. "Menu", "Neon Ozellestirmesi", "Neon Ac/Kapat")

        populateMenu(v.name:gsub("%s+", "") .. "Menu", 0, "Kapali", "$0")
        populateMenu(v.name:gsub("%s+", "") .. "Menu", 1, "Acik", "$" .. vehicleCustomisationPrices.neonside.price)

        updateItem2Text(v.name:gsub("%s+", "") .. "Menu", currentNeonState, "Mevcut")

        finishPopulatingMenu(v.name:gsub("%s+", "") .. "Menu")
    end

    --#[Neon Colours Menu]#--
    local currentNeonR, currentNeonG, currentNeonB = GetCurrentNeonColour()
    createMenu("NeonRenklerMenu", "Neon Renkler", "Bir Renk Secin")

    for k, v in ipairs(vehicleNeonOptions.neonColours) do
        populateMenu("NeonRenklerMenu", k, vehicleNeonOptions.neonColours[k].name, "$" .. vehicleCustomisationPrices.neoncolours.price)

        if currentNeonR == vehicleNeonOptions.neonColours[k].r and currentNeonG == vehicleNeonOptions.neonColours[k].g and currentNeonB == vehicleNeonOptions.neonColours[k].b then
            updateItem2Text("NeonRenklerMenu", k, "Mevcut")
        end
    end

    finishPopulatingMenu("NeonRenklerMenu")

    --#[Xenons Menu]#--
    createMenu("XenonFarlarMenu", "Xenon Far Ozellestirmesi", "Bir Kategori Secin")

    populateMenu("XenonFarlarMenu", 0, "Farlar", "none")
    populateMenu("XenonFarlarMenu", 1, "Xenon Renkler", "none")

    finishPopulatingMenu("XenonFarlarMenu")

    --#[Xenons Headlights Menu]#--
    local currentXenonState = GetCurrentXenonState()
    createMenu("FarlarMenu", "Far Ozellestirmesi", "Xenon Far Aç/Kapat")

    populateMenu("FarlarMenu", 0, "Xenon Kapat", "$0")
    populateMenu("FarlarMenu", 1, "Xenon Ac", "$" .. vehicleCustomisationPrices.headlights.price)

    updateItem2Text("FarlarMenu", currentXenonState, "Mevcut")

    finishPopulatingMenu("FarlarMenu")

    --#[Xenons Colour Menu]#--
    local currentXenonColour = GetCurrentXenonColour()
    createMenu("XenonRenklerMenu", "Xenon Renkler", "Bir Renk Secin")

    for k, v in ipairs(vehicleXenonOptions.xenonColours) do
        populateMenu("XenonRenklerMenu", v.id, v.name, "$" .. vehicleCustomisationPrices.xenoncolours.price)

        if currentXenonColour == v.id then
            updateItem2Text("XenonRenklerMenu", v.id, "Mevcut")
        end
    end

    finishPopulatingMenu("XenonRenklerMenu")
end

function DestroyMenus()
    destroyMenus()
end

function DisplayMenuContainer(state)
    toggleMenuContainer(state)
end

function DisplayMenu(state, menu)
    if state then
        currentMenu = menu
    end

    toggleMenu(state, menu)
    updateMenuHeading(menu)
    updateMenuSubheading(menu)
end

function MenuManager(state)
    if state then
        if currentMenuItem2 ~= "Mevcut" then
            if isMenuActive("modMenu") then
                if currentCategory == 18 then --Turbo
                    if AttemptPurchase("turbo") then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Not Enough Money!")
                    end
                elseif currentCategory == 11 or currentCategory == 12 or currentCategory== 13 or currentCategory == 15 or currentCategory == 16 then --Performance Upgrades
                    if AttemptPurchase("performance", currentMenuItemID) then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                else
                    if AttemptPurchase("cosmetics") then
                        ApplyMod(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                end
            elseif isMenuActive("BoyaMenu") then
                if AttemptPurchase("respray") then
                    ApplyColour(currentResprayCategory, currentResprayType, currentMenuItemID, vehicleR, vehicleG, vehicleB)
                    playSoundEffect("respray", 1.0)
                    updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                    updateMenuStatus("Satin Alindi")
                else
                    updateMenuStatus("Yeterli miktarda paran yok")
                end
            elseif isMenuActive("JantlarMenu") then
                if currentWheelCategory == 20 then
                    if AttemptPurchase("wheelsmoke") then
                        local r = vehicleTyreSmokeOptions[currentMenuItemID].r
                        local g = vehicleTyreSmokeOptions[currentMenuItemID].g
                        local b = vehicleTyreSmokeOptions[currentMenuItemID].b

                        ApplyTyreSmoke(r, g, b)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                else
                    if currentWheelCategory == -1 then --Custom Wheels
                        local currentWheel = GetCurrentWheel()

                        if currentWheel == -1 then
                            updateMenuStatus("Stok jantlarin uzerine ozel jant eklenemez")
                        else
                            if AttemptPurchase("customwheels") then
                                ApplyCustomWheel(currentMenuItemID)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                                updateMenuStatus("Satin Alindi")
                            else
                                updateMenuStatus("Yeterli miktarda paran yok")
                            end
                        end
                    else
                        local currentWheel = GetCurrentWheel()
                        local currentCustomWheelState = GetOriginalCustomWheel()

                        if currentCustomWheelState and currentWheel == -1 then
                            updateMenuStatus("Stok jantlarin uzerine ozel jant eklenemez")
                        else
                            if AttemptPurchase("wheels") then
                                ApplyWheel(currentCategory, currentMenuItemID, currentWheelCategory)
                                playSoundEffect("wrench", 0.4)
                                updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                                updateMenuStatus("Satin Alindi")
                            else
                                updateMenuStatus("Yeterli miktarda paran yok")
                            end
                        end
                    end
                end
            elseif isMenuActive("NeonsSideMenu") then
                if AttemptPurchase("neonside") then
                    ApplyNeon(currentNeonSide, currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                    updateMenuStatus("Satin Alindi")
                else
                    updateMenuStatus("Yeterli miktarda paran yok")
                end 
            else
                if currentMenu == "repairMenu" then
                    if AttemptPurchase("repair") then
                        currentMenu = "mainMenu"

                        QBCore.Functions.Progressbar("accessing_atm", "Araç tamir ediliyor", 7500, false, true, {
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                            playSoundEffect("wrench", 0.4),
                            ExitBennysRepair()
                        }, {}, {}, {}, function() -- Done
                            RepairVehicle()
                            isPlyInBennys = false
                             
                        end, function()
                            QBCore.Functions.Notify("Beceremedin!", "error")
                        end)
                        
                    else
                        updateMenuStatus("Yeterli Miktarda Paran Yok")
                    end
                elseif currentMenu == "mainMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentCategory = currentMenuItemID

                    toggleMenu(false, "mainMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "BoyaMenu" then
                    currentMenu = "ResprayTypeMenu"
                    currentResprayCategory = currentMenuItemID

                    toggleMenu(false, "BoyaMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "ResprayTypeMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentResprayType = currentMenuItemID

                    toggleMenu(false, "ResprayTypeMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "JantlarMenu" then
                    local currentWheel, currentWheelName, currentWheelType = GetCurrentWheel()

                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentWheelCategory = currentMenuItemID
                    
                    if currentWheelType == currentWheelCategory then
                        updateItem2Text(currentMenu, currentWheel, "Mevcut")
                    end

                    toggleMenu(false, "JantlarMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "NeonlarMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"
                    currentNeonSide = currentMenuItemID

                    toggleMenu(false, "NeonlarMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "XenonFarlarMenu" then
                    currentMenu = currentMenuItem:gsub("%s+", "") .. "Menu"

                    toggleMenu(false, "XenonFarlarMenu")
                    toggleMenu(true, currentMenu)
                    updateMenuHeading(currentMenu)
                    updateMenuSubheading(currentMenu)
                elseif currentMenu == "PencereTonuMenu" then
                    if AttemptPurchase("windowtint") then
                        ApplyWindowTint(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                elseif currentMenu == "NeonRenklerMenu" then
                    if AttemptPurchase("neoncolours") then
                        local r = vehicleNeonOptions.neonColours[currentMenuItemID].r
                        local g = vehicleNeonOptions.neonColours[currentMenuItemID].g
                        local b = vehicleNeonOptions.neonColours[currentMenuItemID].b

                        ApplyNeonColour(r, g, b)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                elseif currentMenu == "FarlarMenu" then
                    if AttemptPurchase("headlights") then
                        ApplyXenonLights(currentCategory, currentMenuItemID)
                        playSoundEffect("wrench", 0.4)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                elseif currentMenu == "XenonRenklerMenu" then
                    if AttemptPurchase("xenoncolours") then
                        ApplyXenonColour(currentMenuItemID)
                        playSoundEffect("respray", 1.0)
                        updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                        updateMenuStatus("Satin Alindi")
                    else
                        updateMenuStatus("Yeterli miktarda paran yok")
                    end
                elseif currentMenu == "CikartmalarMenu" then
                    local plyPed = PlayerPedId()
                    local plyVeh = GetVehiclePedIsIn(plyPed, false)
                    -- if GetVehicleClass(plyVeh) ~= 18 then
                        if AttemptPurchase("oldlivery") then
                            ApplyOldLivery(currentMenuItemID)
                            playSoundEffect("wrench", 0.4)
                            updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                            updateMenuStatus("Satin Alindi")
                        else
                            updateMenuStatus("Yeterli miktarda paran yok")   
                        end
                    -- end
                elseif currentMenu == "PlakaRengiMenu" then
                    local plyPed = PlayerPedId()
                    local plyVeh = GetVehiclePedIsIn(plyPed, false)
                    -- if GetVehicleClass(plyVeh) ~= 18 then
                        if AttemptPurchase("plateindex") then
                            ApplyPlateIndex(currentMenuItemID)
                            playSoundEffect("wrench", 0.4)
                            updateItem2Text(currentMenu, currentMenuItemID, "Mevcut")
                            updateMenuStatus("Satin Alindi")
                        else
                            updateMenuStatus("Yeterli miktarda paran yok")   
                        end
                    -- end
                elseif currentMenu == "AracEkstralariMenu" then
                    ApplyExtra(currentMenuItemID)
                    playSoundEffect("wrench", 0.4)
                    local state = IsVehicleExtraTurnedOn(GetVehiclePedIsIn(PlayerPedId(),false), currentMenuItemID) and "AÇIK" or "KAPALI"
                    updateItem2TextOnly(currentMenu, currentMenuItemID, state)
                    updateMenuStatus("Satin Alindi")
                end
            end
        else
            if currentMenu == "AracEkstralariMenu" then
                ApplyExtra(currentMenuItemID)
                playSoundEffect("wrench", 0.4)
                    local state = IsVehicleExtraTurnedOn(GetVehiclePedIsIn(PlayerPedId(),false), currentMenuItemID) and "AÇIK" or "KAPALI"
                    updateItem2TextOnly(currentMenu, currentMenuItemID, state)
                updateMenuStatus("Satin Alindi")
            end
        end
    else
        updateMenuStatus("")

        if isMenuActive("modMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "mainMenu"

            if currentCategory ~= 18 then
                RestoreOriginalMod()
            end

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("BoyaMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "ResprayTypeMenu"

            RestoreOriginalColours()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("JantlarMenu") then            
            if currentWheelCategory ~= 20 and currentWheelCategory ~= -1 then
                local currentWheel = GetOriginalWheel()

                updateItem2Text(currentMenu, currentWheel, "$" .. vehicleCustomisationPrices.wheels.price)

                RestoreOriginalWheels()
            end

            toggleMenu(false, currentMenu)

            currentMenu = "JantlarMenu"


            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        elseif isMenuActive("NeonsSideMenu") then
            toggleMenu(false, currentMenu)

            currentMenu = "NeonlarMenu"

            RestoreOriginalNeonStates()

            toggleMenu(true, currentMenu)
            updateMenuHeading(currentMenu)
            updateMenuSubheading(currentMenu)
        else
            if currentMenu == "mainMenu" or currentMenu == "repairMenu" then
                ExitBennys()
            elseif currentMenu == "BoyaMenu" or currentMenu == "PencereTonuMenu" or currentMenu == "JantlarMenu" or currentMenu == "NeonlarMenu" or currentMenu == "XenonFarlarMenu" or currentMenu == "CikartmalarMenu" or currentMenu == "PlakaRengiMenu" or currentMenu == "AracEkstralariMenu" then
                toggleMenu(false, currentMenu)

                if currentMenu == "PencereTonuMenu" then
                    RestoreOriginalWindowTint()
                end

                local plyPed = PlayerPedId()
                local plyVeh = GetVehiclePedIsIn(plyPed, false)
                if currentMenu == "CikartmalarMenu" then
                    RestoreOldLivery()
                end
                if currentMenu == "PlakaRengiMenu" then
                    RestorePlateIndex()
                end

                currentMenu = "mainMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "ResprayTypeMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "BoyaMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "NeonRenklerMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "NeonlarMenu"

                RestoreOriginalNeonColours()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "FarlarMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonFarlarMenu"

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            elseif currentMenu == "XenonRenklerMenu" then
                toggleMenu(false, currentMenu)

                currentMenu = "XenonFarlarMenu"

                RestoreOriginalXenonColour()

                toggleMenu(true, currentMenu)
                updateMenuHeading(currentMenu)
                updateMenuSubheading(currentMenu)
            end
        end
    end
end

function MenuScrollFunctionality(direction)
    scrollMenuFunctionality(direction, currentMenu)
end

--#[NUI Callbacks]#--
RegisterNUICallback("selectedItem", function(data, cb)
    updateCurrentMenuItemID(tonumber(data.id), data.item, data.item2, tonumber(data.r), tonumber(data.g), tonumber(data.b))

    --print("Current Selected Item: " .. currentMenuItemID)

    cb("ok")
end)

RegisterNUICallback("updateItem2", function(data, cb)
    currentMenuItem2 = data.item

    cb("ok")
end)