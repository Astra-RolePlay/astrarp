local pointBlip = function (label, color, blipID,coords)
   local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
    SetBlipSprite(blip, blipID)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.7)
    SetBlipColour(blip, color)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(label)
    EndTextCommandSetBlipName(blip)
end

local circleBlip = function(coords, radius, color)
    local blip = AddBlipForRadius(coords.x,coords.y,coords.z, radius + 0.0)
    SetBlipSprite(blip, 9)
    SetBlipColour(blip, color)
    SetBlipAlpha(blip, 80)
end

local squareBlip = function(coords, height, width, color)
    local blipArea
    blipArea = AddBlipForArea(coords.x, coords.y, coords.z, width, height)
    SetBlipRotation(blipArea, coords.w)
    SetBlipColour(blipArea, 0xFF00FF80)
    SetBlipDisplay(blipArea, 3)
    print(blipArea)
end

Citizen.CreateThread(function()
    for _, blip in pairs(blips) do
        if blip["pointBlip"]["enable"] == true then
            local pBlip = blip["pointBlip"];
            pointBlip(blip.label, pBlip["color"], pBlip["id"], pBlip["coords"])
        end
        if blip["blipAddon"] ~= nil and blip["blipAddon"]["enable"] == true then
          local aBlip = blip["blipAddon"]
          if aBlip["type"] == "circle" then
                circleBlip(aBlip.center_coords, aBlip.radius, aBlip.color)
          else
            squareBlip(aBlip.center_coords,aBlip.height,aBlip.width,aBlip.color)
        end
      end
  end
end)