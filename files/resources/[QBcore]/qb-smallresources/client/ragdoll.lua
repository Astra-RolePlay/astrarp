local isInRagdoll = false
local timer = 0

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if isInRagdoll then
			timer = 0
			SetPedToRagdoll(PlayerPedId(), 1000, 1000, 0, 0, 0, 0)
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(0, 206) and IsControlPressed(0, 205) and IsPedOnFoot(PlayerPedId()) then
			isInRagdoll = true
			Wait(500)
		elseif IsControlJustPressed(2, 73) and isInRagdoll == true then
			isInRagdoll = false
			ClearPedSecondaryTask(PlayerPedId())
			Citizen.Wait(2000)
			ClearPedSecondaryTask(PlayerPedId())
		end
	end
end)

function InRagdoll()
    return isInRagdoll
end

exports("isInRagdoll", InRagdoll)

exports("getTimer", function()
	return timer
end)

CreateThread(function()
	while true do
		timer = timer + 1
		Wait(1000)
	end
end)