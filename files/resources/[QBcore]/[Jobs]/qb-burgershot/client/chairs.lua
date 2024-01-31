Citizen.CreateThread(function()
	if Config.MLO == "LP" then
		for k, v in pairs(Config.LPChairs) do
			exports['qb-target']:AddBoxZone("BurgerChair"..k, v.location, v.width, v.height, { name="BurgerChair"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "qb-burgershot:Chair", icon = "fas fa-chair", label = "Otur", loc = v.location, head = v.heading, seat = v.seat }, },
				  distance = v.distance
			})
		end
	elseif Config.MLO == "GN" then
		for k, v in pairs(Config.GNChairs) do
			exports['qb-target']:AddBoxZone("BurgerChair"..k, v.location, v.width, v.height, { name="BurgerChair"..k, heading = v.heading, debugPoly=false, minZ = v.minZ, maxZ = v.maxZ, }, 
				{ options = { { event = "qb-burgershot:Chair", icon = "fas fa-chair", label = "Otur", loc = v.location, head = v.heading, seat = v.seat }, },
				  distance = v.distance
			})
		end
	end
end)

RegisterNetEvent('qb-burgershot:Chair')
AddEventHandler('qb-burgershot:Chair', function(data)
	local ped = PlayerPedId()
	TaskStartScenarioAtPosition(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER", data.loc.x, data.loc.y, data.loc.z-0.5, data.head, 0, 1, true)
	bseat = data.seat
end)

CreateThread(function()
	while true do
		local ped = PlayerPedId()
		if IsPedUsingScenario(ped, "PROP_HUMAN_SEAT_CHAIR_MP_PLAYER") then sitting = true else sitting = false end
		if sitting then
			if IsControlJustReleased(0, 202) then
				ClearPedTasks(ped)
				if Config.MLO == "LP" then
				if bseat == 1 then SetEntityCoords(ped, vector3(-1191.65, -890.75, 14.0-0.5)) end
				if bseat == 2 then SetEntityCoords(ped, vector3(-1190.89, -893.02, 14.0-0.5)) end
				if bseat == 3 then SetEntityCoords(ped, vector3(-1194.38, -887.82, 14.0-0.5)) end
				if bseat == 4 then SetEntityCoords(ped, vector3(-1192.49, -889.4, 14.0-0.5)) end
				if bseat == 5 then SetEntityCoords(ped, vector3(-1187.85, -888.24, 14.0-0.5)) end
				if bseat == 6 then SetEntityCoords(ped, vector3(-1185.97, -889.8, 14.0-0.5)) end
				if bseat == 7 then SetEntityCoords(ped, vector3(-1189.67, -884.61, 14.0-0.5)) end
				if bseat == 8 then SetEntityCoords(ped, vector3(-1188.73, -886.86, 14.0-0.5)) end
				if bseat == 9 then SetEntityCoords(ped, vector3(-1188.34, -894.03, 14.0-0.5)) end
				if bseat == 10 then SetEntityCoords(ped, vector3(-1186.77, -892.9, 14.0-0.5)) end
				if bseat == 11 then SetEntityCoords(ped, vector3(-1185.8, -892.47, 14.0-0.5)) end
				if bseat == 12 then SetEntityCoords(ped, vector3(-1184.04, -891.36, 14.0-0.5)) end
				if bseat == 13 then SetEntityCoords(ped, vector3(-1183.24, -890.69, 14.0-0.5)) end
				if bseat == 14 then SetEntityCoords(ped, vector3(-1183.48, -889.61, 14.0-0.5)) end
				if bseat == 15 then SetEntityCoords(ped, vector3(-1184.52, -888.0, 14.0-0.5)) end
				
				if bseat == 16 then SetEntityCoords(ped, vector3(-1187.37, -883.84, 14.0-0.5)) end
				if bseat == 17 then SetEntityCoords(ped, vector3(-1188.39, -882.17, 14.0-0.5)) end
				
				if bseat == 18 then SetEntityCoords(ped, vector3(-1189.22, -881.7, 14.0-0.5)) end
				
				if bseat == 19 then SetEntityCoords(ped, vector3(-1190.4, -882.07, 14.0-0.5)) end
				if bseat == 20 then SetEntityCoords(ped, vector3(-1191.92, -883.21, 14.0-0.5)) end
				
				if bseat == 21 then SetEntityCoords(ped, vector3(-1192.95, -883.87, 14.0-0.5)) end
				if bseat == 22 then SetEntityCoords(ped, vector3(-1194.53, -884.97, 14.0-0.5)) end
				
				if bseat == 23 then SetEntityCoords(ped, vector3(-1188.1, -891.89, 14.0-0.5)) end
				if bseat == 24 then SetEntityCoords(ped, vector3(-1192.24, -885.9, 14.0-0.5)) end
				
				
			elseif Config.MLO == "GN" then
				if bseat == 1 then SetEntityCoords(ped, vector3(-1189.77, -895.49, 13.97-0.5)) end
				if bseat == 2 then SetEntityCoords(ped, vector3(-1188.5, -894.65, 13.97-0.5)) end
				
				if bseat == 3 then SetEntityCoords(ped, vector3(-1187.8, -894.21, 13.97-0.5)) end
				if bseat == 4 then SetEntityCoords(ped, vector3(-1186.57, -893.4, 13.98-0.5)) end
				
				if bseat == 5 then SetEntityCoords(ped, vector3(-1185.91, -892.94, 13.97-0.5)) end
				if bseat == 6 then SetEntityCoords(ped, vector3(-1184.61, -892.06, 13.97-0.5)) end
				
				if bseat == 7 then SetEntityCoords(ped, vector3(-1185.86, -890.09, 13.97-0.5)) end
				if bseat == 8 then SetEntityCoords(ped, vector3(-1187.07, -890.97, 13.97-0.5)) end
				
				if bseat == 9 then SetEntityCoords(ped, vector3(-1187.88, -891.52, 13.97-0.5)) end
				if bseat == 10 then SetEntityCoords(ped, vector3(-1189.01, -892.38, 13.97-0.5)) end
				
				if bseat == 11 then SetEntityCoords(ped, vector3(-1181.82, -891.74, 13.97-0.5)) end
				if bseat == 12 then SetEntityCoords(ped, vector3(-1182.55, -890.72, 13.97-0.5)) end
				
				if bseat == 13 then SetEntityCoords(ped, vector3(-1183.1, -889.8, 13.97-0.5)) end
				if bseat == 14 then SetEntityCoords(ped, vector3(-1183.97, -888.61, 13.97-0.5)) end
				
				if bseat == 15 then SetEntityCoords(ped, vector3(-1187.3, -883.19, 13.97-0.5)) end
				if bseat == 16 then SetEntityCoords(ped, vector3(-1188.21, -882.02, 13.97-0.5)) end
				
				if bseat == 17 then SetEntityCoords(ped, vector3(-1189.01, -880.78, 13.97-0.5)) end
				
				if bseat == 18 then SetEntityCoords(ped, vector3(-1183.53, -887.58, 13.97-0.5)) end
				if bseat == 19 then SetEntityCoords(ped, vector3(-1182.88, -888.49, 13.97-0.5)) end
				if bseat == 20 then SetEntityCoords(ped, vector3(-1182.09, -889.55, 13.97-0.5)) end
				if bseat == 21 then SetEntityCoords(ped, vector3(-1181.54, -890.23, 13.97-0.5)) end
				if bseat == 22 then SetEntityCoords(ped, vector3(-1180.95, -891.22, 13.97-0.5)) end
				
				if bseat == 23 then SetEntityCoords(ped, vector3(-1190.02, -881.45, 13.97-0.5)) end
				if bseat == 24 then SetEntityCoords(ped, vector3(-1191.24, -882.33, 13.97-0.5)) end
				
				if bseat == 25 then SetEntityCoords(ped, vector3(-1192.05, -882.95, 13.97-0.5)) end
				if bseat == 26 then SetEntityCoords(ped, vector3(-1193.34, -883.7, 13.97-0.5)) end
				
				if bseat == 27 then SetEntityCoords(ped, vector3(-1190.02, -884.14, 13.97-0.5)) end
				if bseat == 28 then SetEntityCoords(ped, vector3(-1191.17, -885.03, 13.97-0.5)) end
				
				if bseat == 29 then SetEntityCoords(ped, vector3(-1192.01, -885.49, 13.97-0.5)) end
				if bseat == 30 then SetEntityCoords(ped, vector3(-1193.19, -886.37, 13.97-0.5)) end
				

			end
				bseat = 0
			end
		end
		Wait(7)
	end
end)

Config.LPChairs = {
	--SmallTable1
	{ location = vector3(-1191.32, -891.24, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 1},
	{ location = vector3(-1190.44, -892.65, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 2 },
	--Smalltable2
	{ location = vector3(-1193.86, -887.51, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 3 },
	{ location = vector3(-1192.97, -889.0, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 4 },
	--SmallTable3
	{ location = vector3(-1187.51, -888.73, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 5 },
	{ location = vector3(-1186.63, -890.1, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 6 },
	--Smalltable4
	{ location = vector3(-1190.06, -884.95, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 7 },
	{ location = vector3(-1189.12, -886.41, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 1.7, seat = 8 },	
	--Booth1
	{ location = vector3(-1187.39, -895.65, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 9 },
	{ location = vector3(-1187.91, -894.88, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 9 },
	{ location = vector3(-1185.64, -894.48, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 10 },
	{ location = vector3(-1186.16, -893.7, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 10 },	
	--Booth2
	{ location = vector3(-1184.9, -893.89, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 11 },
	{ location = vector3(-1185.41, -893.14, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 11 },
	{ location = vector3(-1183.13, -892.76, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 12 },
	{ location = vector3(-1183.61, -892.02, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 12 },
	--Cornerbooth1
	{ location = vector3(-1181.43, -891.74, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 3.5, seat = 13 },
	{ location = vector3(-1181.04, -889.98, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 3.5, seat = 13 },
	--booth3
	{ location = vector3(-1182.08, -888.7, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 14 },
	{ location = vector3(-1182.79, -889.18, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 14 },
	{ location = vector3(-1183.2, -886.9, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 15 },
	{ location = vector3(-1183.99, -887.45, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 15 },
	--booth4
	{ location = vector3(-1185.99, -882.97, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 16 },
	{ location = vector3(-1186.73, -883.47, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 16 },
	{ location = vector3(-1187.11, -881.18, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 17 },
	{ location = vector3(-1187.88, -881.7, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 17 },
	--Cornerbooth2
	{ location = vector3(-1187.91, -879.92, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 3.5, seat = 18 },
	{ location = vector3(-1189.74, -879.53, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 3.5, seat = 18 },
	--Booth5
	{ location =vector3(-1191.23, -880.75, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7,seat = 19 },
	{ location = vector3(-1190.7, -881.54, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 19 },	
	{ location = vector3(-1192.99, -881.91, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 20 },
	{ location = vector3(-1192.52, -882.59, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 20 },
	--Booth6
	{ location = vector3(-1193.8, -882.39, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 21 },
	{ location = vector3(-1193.24, -883.23, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 21 },
	{ location = vector3(-1195.5, -883.64, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 22 },
	{ location = vector3(-1195.02, -884.35, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 22 },	
	
	--MiddleBooth1
	{ location = vector3(-1189.56, -891.83, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 23 },
	{ location = vector3(-1189.23, -890.37, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 23 },		
	{ location = vector3(-1187.71, -890.57, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 23 },
	
	--MiddleBooth2
	{ location = vector3(-1192.64, -887.25, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 24 },
	{ location = vector3(-1191.29, -887.3, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 24 },		
	{ location = vector3(-1190.76, -886.03, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 24 },
}

Config.GNChairs = {
	--==STORE FRONT==--

	--LEFTSIDE--
	--Booth 1
	{ location = vector3(-1188.96, -896.61, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 1 },
	
	{ location = vector3(-1187.62, -895.83, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 2 },
	{ location = vector3(-1188.03, -895.21, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 2 },

	--Booth 2
	{ location = vector3(-1186.99, -895.38, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 3 },
	{ location = vector3(-1187.44, -894.72, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 3 },
	{ location = vector3(-1185.69, -894.59, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 4 },
	{ location = vector3(-1186.16, -893.88, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 4 },

	--Booth 3
	{ location = vector3(-1185.11, -894.13, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 5 },
	{ location = vector3(-1185.6, -893.44, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 5 },
	{ location = vector3(-1183.73, -893.26, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 6 },
	{ location = vector3(-1184.29, -892.62, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 6 },
	
	--Left-Middle
	--Booth 4
	{ location = vector3(-1186.67, -888.9, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 7 },
	{ location = vector3(-1186.23, -889.63, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 7 },
	{ location = vector3(-1188.04, -889.74, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 8 },
	{ location = vector3(-1187.56, -890.45, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 8 },
	
	--Booth 5
	{ location = vector3(-1188.65, -890.26, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 9 },
	{ location = vector3(-1188.18, -891.0, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 9 },
	{ location = vector3(-1189.99, -891.06, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 10 },
	{ location = vector3(-1189.49, -891.82, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 10 },

	--FRONT--
	--Booth 6
	{ location = vector3(-1183.04, -892.7, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 11 },
	{ location = vector3(-1182.37, -892.25, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 11 },
	{ location = vector3(-1183.88, -891.35, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 12 },
	{ location = vector3(-1183.22, -890.92, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 12 },
	
	--Booth 7
	{ location = vector3(-1184.37, -890.72, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 13 },
	{ location = vector3(-1183.68, -890.23, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 , seat = 13 },
	{ location = vector3(-1185.23, -889.35, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 14 },
	{ location = vector3(-1184.52, -888.88, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 14 },
	
	--Booth 8
	{ location = vector3(-1186.11, -882.36, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 15 },
	{ location = vector3(-1186.88, -882.85, 14.0), heading = 34.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 15 },
	{ location = vector3(-1186.97, -881.03, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 16 },
	{ location = vector3(-1187.79, -881.52, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 16 },
	
	--Corner Booth
	{ location = vector3(-1188.12, -879.48, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 17 },
	{ location = vector3(-1189.27, -879.22, 14.0), heading = 214.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 17 },
	
	--STOOLS
	{ location = vector3(-1183.33, -887.32, 14.27), heading = 306.11, width = 0.6, height = 0.4, minZ = 12.97, maxZ = 14.17, distance = 1.7, seat = 18 },
	{ location = vector3(-1182.56, -888.32, 14.27), heading = 306.11, width = 0.6, height = 0.4, minZ = 12.97, maxZ = 14.17, distance = 1.7, seat = 19 },
	{ location = vector3(-1181.85, -889.39, 14.27), heading = 306.11, width = 0.6, height = 0.4, minZ = 12.97, maxZ = 14.17, distance = 1.7, seat = 20 },
	{ location = vector3(-1181.27, -890.08, 14.27), heading = 306.11, width = 0.6, height = 0.4, minZ = 12.97, maxZ = 14.17, distance = 1.7, seat = 21 },
	{ location = vector3(-1180.68, -891.02, 14.27), heading = 306.11, width = 0.6, height = 0.4, minZ = 12.97, maxZ = 14.17, distance = 1.7, seat = 22 },
	
	--RIGHTSIDE--
	--Booth 9
	{ location = vector3(-1190.79, -880.32, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 23 },
	{ location = vector3(-1190.4, -880.99, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 23 },
	{ location = vector3(-1192.21, -881.16, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 24 },
	{ location = vector3(-1191.78, -881.78, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 24 },	
	
	--Booth 10
	{ location = vector3(-1192.87, -881.6, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 25 },
	{ location = vector3(-1192.37, -882.33, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 25 },
	{ location = vector3(-1194.25, -882.5, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 26 },
	{ location = vector3(-1193.75, -883.14, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 26 },		
	
	--Booth 11
	{ location = vector3(-1189.05, -885.43, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 27 },
	{ location = vector3(-1189.53, -884.74, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 27 },
	{ location = vector3(-1190.41, -886.25, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 28 },
	{ location = vector3(-1190.83, -885.54, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 28 },		
	
	--Booth 12
	{ location = vector3(-1190.99, -886.75, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 29 },
	{ location = vector3(-1191.47, -886.11, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 29 },
	{ location = vector3(-1192.44, -887.62, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 30 },
	{ location = vector3(-1192.86, -886.87, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7, seat = 30 },		
	
	--==Back Office==--
	--Changing room seats
	{ location = vector3(-1185.59, -900.64, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	{ location = vector3(-1184.95, -901.57, 14.0), heading = 123.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	{ location = vector3(-1186.66, -902.6, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	{ location = vector3(-1187.35, -901.7, 14.0), heading = 303.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	
	{ location = vector3(-1177.66, -896.3, 14.0), heading = 99.0, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	{ location = vector3(-1180.18, -897.13, 14.0), heading = 295.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
	{ location = vector3(-1179.53, -898.17, 14.0), heading = 312.93, width = 0.6, height = 0.6, minZ = 13.3, maxZ = 14.5, distance = 2.7 },
}