Config = {}

Config.CommandPermission = 'god' -- permission level for creating new doors
Config.AdminAccess = false -- Enable admins to unlock any door
Config.AdminPermission = 'god' -- The permission needed to get AdminAccess if it is enabled
Config.Warnings = false -- if true it will show warnings in the console when certain requirements aren't met
Config.FallbackDistance = 3.0 -- Distance to fall back on when it is not set
Config.EnableSounds = true -- Enable sounds when unlocking/locking doors (doors triggered by scripts can have the sound manually disabled)
Config.EnableAnimation = true -- Enable the animation when unlocking/locking doors (doors triggered by scripts can have the animation manually disabled)
Config.SaveDoorDialog = true -- Saves the door dialogue popup between door saves
Config.PersistentDoorStates = false -- Persists the door state between server restarts
Config.PersistentSaveInternal = 60000 -- How often door states are saved to the file system, in miliseconds. 

Config.ChangeColor = true -- Change the color of the box of the popup text based on if it is locked or not
Config.DefaultColor = 'rgb(36, 36, 36)' -- The default color of the box of the popup text if Config.ChangeColor is false
Config.LockedColor = 'rgb(219 58 58)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is locked
Config.UnlockedColor = 'rgb(27 195 63)' -- The color of the box of the popup text if Config.ChangeColor is true and the door is unlocked
Config.UseDoorLabelText = false -- Will use the LABEL field as the nui text instead of locked/unlocked
Config.DoorDebug = false -- Enable DRAWTEXT in the world at the coords where the door 'center' is
Config.RemoteTriggerDistance = 15.0 -- This is how far from your camera the raycast will go to try to hit something solid
Config.RemoteTriggerMinDistance = 5.0 -- This is the minimum distance required for the raycast hit to count near a door. It will take the larger two between this and 'distance' option

Config.Consumables = { ['ticket'] = 1, ['paperclip'] = 1 } -- The items will get removed once used on a door that has the item on it

--[[ -- Configuration Options
Config.DoorList['configname-identifier'] = {
	fixText = false, -- Adjusts guess of center of door
	textCoords = vector3(x, y, z) -- Set the text coordinates to a specific location
	setText = true -- Use with above setting
		distance = 2.0, -- Max interact distance
		lockpick = true, -- Alows for lockpicking
	allAuthorized = true, -- Anyone can use door
	authorizedJobs = { ['police']=0, ['bcso']=0, ['sasp]=0 } -- Authorize door access based on job grade
	authorizedGangs = { ['vagos']=0, ['ballas']=0 } -- Authorize door access based on gang grade
	authorizedCitizenIDs = { 'ABC123', 'DEF456' } -- Authorize door access based on citizenid
	items = {'item_1','item_2'} -- Authorize based on items. Must have all items in this list.
		doorLabel = 'Cloakroom', -- Label of room that shows up when nearby
		locked = true, -- Default lock state
		audioRemote = true, -- Play sound from the player instead of the door
		audioLock = {['file'] = 'metal-locker.ogg', ['volume'] = 0.6}, -- Play sound on door lock
		audioUnlock = {['file'] = 'metallic-creak.ogg', ['volume'] = 0.7}, -- Play sound on door unlock
		autoLock = 1000, -- Auto lock after this many miliseconds
		doorRate = 1.0,  -- Time till auto closes? Needs more testing
	cantUnlock = true -- Set to true to not allow the player to unlock the door, only lock it. This means a script will have to trigger the unlock.
	pickable = true, -- Can use a lockpick to unlock, only need if true
	hideLabel = true, -- Set to true to hide the popup label, for hiding doors ;)
		remoteTrigger = true, -- If you want to be able to remote trigger a door with H, put this here 
} 
]]

Config.DoorStates = {}
Config.DoorList = {
	{
		objName = 'hei_v_ilev_bk_gate2_pris',
		objCoords  = vec3(261.83, 221.39, 106.41),
		textCoords = vec3(261.83, 221.39, 106.41),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5,
	},
	--door2 for pacific opened with thermite right near the vault door
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(252.98, 220.65, 101.8),
		textCoords = vec3(252.98, 220.65, 101.8),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objYaw = 160.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- door3 for pacific opened with thermite after passing the door near vault
	{
		objName = 'hei_v_ilev_bk_safegate_pris',
		objCoords  = vec3(261.68, 215.62, 101.81),
		textCoords = vec3(261.68, 215.62, 101.81),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objYaw = -110.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 1 opened with security card A
	{
		objName = 'v_ilev_cbankvaulgate01',
		objCoords  = vec3(-105.77, 6472.59, 31.81),
		textCoords = vec3(-105.77, 6472.59, 31.81),
		objYaw = 45.0,
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Paleto Door 2 opened with thermite
	{
		objName = 'v_ilev_cbankvaulgate02',
		objCoords  = vec3(-106.26, 6476.01, 31.98),
		textCoords = vec3(-105.5, 6475.08, 31.99),
		objYaw = -45.0,
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- First Pacific Door opened with lockpick
	{
		objName = 'hei_v_ilev_bk_gate_pris',
		objCoords  = vec3(257.41, 220.25, 106.4),
		textCoords = vec3(257.41, 220.25, 106.4),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Second Pacific Door opened with lockpick
	{
		objName = 'v_ilev_bk_door',
		objCoords  = vec3(265.19, 217.84, 110.28),
		textCoords = vec3(265.19, 217.84, 110.28),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objYaw = -20.0,
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(314.61, -285.82, 54.49),
		textCoords = vec3(313.3, -285.45, 54.49),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(148.96, -1047.12, 29.7),
		textCoords = vec3(148.96, -1047.12, 29.7),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-351.7, -56.28, 49.38),
		textCoords = vec3(-351.7, -56.28, 49.38),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-1208.12, -335.586, 37.759),
		textCoords = vec3(-1208.12, -335.586, 37.759),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Fleeca Door opened with lockpick
	{
		objName = 'v_ilev_gb_vaubar',
		objCoords  = vec3(-2956.18, 483.96, 16.02),
		textCoords = vec3(-2956.18, 483.96, 16.02),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = true,
		distance = 1.5
	},
	-- Prison Door 1
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1844.9, 2604.8, 44.6),
		textCoords = vec3(1844.9, 2608.5, 48.0),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 2
	{
		objName = 'prop_gate_prison_01',
		objCoords  = vec3(1818.5, 2604.8, 44.6),
		textCoords = vec3(1818.5, 2608.4, 48.0),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 13
	},
	-- Prison Door 3
	{
		objName = 'prop_gate_prison_01',
		objCoords = vec3(1799.237, 2616.303, 44.6),
		textCoords = vec3(1795.941, 2616.969, 48.0),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 10
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 135.00006103516,
		objCoords = vector3(-446.3145, 6001.389, 31.83744),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 225.01422119141,
		objCoords = vector3(-435.0605, 6009.784, 24.85843),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 134.9815826416,
		objCoords = vector3(-451.0211, 6006.034, 31.99549),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 45.000080108643,
		objCoords = vector3(-440.6023, 6013.479, 24.8007),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = 631614199,
		objHeading = 44.927597045898,
		objCoords = vector3(-449.1, 6015.742, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-455.5055, 6015.458, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-453.333, 6013.285, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-451.1761, 6011.128, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = 631614199,
		objHeading = 315.00006103516,
		objCoords = vector3(-448.9944, 6008.946, 24.82108),
		locked = true,
		maxDistance = 2.0,
		fixText = false
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 225.14221191406,
		objCoords = vector3(-437.8179, 6012.475, 24.8007),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		objHash = -2023754432,
		objHeading = 225.00004577637,
		objCoords = vector3(-443.7829, 6001.062, 24.84448),
		locked = true,
		maxDistance = 2.0,
		fixText = true
	
	},
	
	-- 	ŞERİF ÇİFT KAPILILAR
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 224.92175292969, objCoords = vector3(-443.5417, 6002.614, 31.86633)},
			{objHash = -2023754432, objHeading = 44.986377716064, objCoords = vector3(-445.3718, 6000.777, 31.86633)}
		},
		
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = false,
		maxDistance = 2.0,
		doors = {
			{objHash = -1501157055, objHeading = 135.00006103516, objCoords = vector3(-444.4985, 6017.06, 31.86633)},
			{objHash = -1501157055, objHeading = 315.04901123047, objCoords = vector3(-442.66, 6015.222, 31.86633)}
		},
		
	},
	
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 314.95138549805, objCoords = vector3(-449.5486, 6008.556, 31.86633)},
			{objHash = -2023754432, objHeading = 134.84490966797, objCoords = vector3(-447.7093, 6006.717, 31.86633)}
		},
		
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 225.07875061035, objCoords = vector3(-452.5156, 6011.426, 31.87728)},
			{objHash = -2023754432, objHeading = 45.112838745117, objCoords = vector3(-454.3589, 6009.582, 31.87728)}
		},
		
	},
	{
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		maxDistance = 2.0,
		doors = {
			{objHash = -2023754432, objHeading = 44.901054382324, objCoords = vector3(-440.9697, 6003.875, 24.8748)},
			{objHash = -2023754432, objHeading = 225.06289672852, objCoords = vector3(-439.1431, 6005.702, 24.86486)}
		},
		
	},


--HASTANE
{
	authorizedJobs = { ['ambulance']=0, ['offambulance']=0 },
	objHash = -770740285,
	objHeading = 44.3,
	objCoords = vector3(-256.52, 6314.24, 32.47),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},


---SANDY SHORES SHERİFF
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1859.0, 3694.94, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1860.9, 3691.64, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	objHash = -1927754726,
	objHeading = 300.0,
	objCoords = vector3(1862.76, 3688.41, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	objHash = -1927754726,
	objHeading = 300.08,
	objCoords = vector3(1859.7, 3686.64, 30.41),
	locked = false,
	maxDistance = 2.0,
	fixText = true

},
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	objHash = -2023754432,
	objHeading = 209.2,
	objCoords = vector3(1857.25, 3690.3, 34.42),
	locked = true,
	maxDistance = 2.0,
	fixText = true

},
{
		authorizedJobs = { 'police', 'sheriff','sasp' },
	locked = true,
	maxDistance = 2.0,
	doors = {
		{objHash = -2023754432, objHeading = 209.1, objCoords = vector3(1849.4, 3691.21, 34.42)},
		{objHash = -2023754432, objHeading = 28.92, objCoords = vector3(1847.13, 3689.95, 34.42)}
	},
	
},

	{
		textCoords = vec3(434.81, -981.93, 30.89),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = false,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'v_ilev_ph_door01',
				objYaw = -90.0,
				objCoords = vec3(434.7, -980.6, 30.8)
			},

			{
				objName = 'v_ilev_ph_door002',
				objYaw = -90.0,
				objCoords = vec3(434.7, -983.2, 30.8)
			}
		}
	},

	--outside doors
	{
		objName = 'prop_fnclink_03gate5',
		objCoords = vec3(1796.322, 2596.574, 45.565),
		textCoords = vec3(1796.322, 2596.574, 45.965),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1821.677, 2477.265, 45.945),
		textCoords = vec3(1821.677, 2477.265, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1760.692, 2413.251, 45.945),
		textCoords = vec3(1760.692, 2413.251, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1543.58, 2470.252, 45.945),
		textCoords = vec3(1543.58, 2470.25, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1659.733, 2397.475, 45.945),
		textCoords = vec3(1659.733, 2397.475, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords = vec3(1537.731, 2584.842, 45.945),
		textCoords = vec3(1537.731, 2584.842, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1571.964, 2678.354, 45.945),
		textCoords = vec3(1571.964, 2678.354, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1650.18, 2755.104, 45.945),
		textCoords = vec3(1650.18, 2755.104, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1771.98, 2759.98, 45.945),
		textCoords = vec3(1771.98, 2759.98, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1845.7, 2699.79, 45.945),
		textCoords = vec3(1845.7, 2699.79, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	{
		objName = 'v_ilev_gtdoor',
		objCoords  = vec3(1820.68, 2621.95, 45.945),
		textCoords = vec3(1820.68, 2621.95, 45.945),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Bolingbroke Extra
	-- To Offices
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1819.129, 2593.64, 46.09929),
		textCoords = vec3(1843.3, 2579.39, 45.98),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To Changingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 360.0,
		objCoords  = vec3(1827.365, 2587.547, 46.09929),
		textCoords = vec3(1835.76, 2583.15, 45.95),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To CrimChangingroom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1826.466, 2585.271, 46.09929),
		textCoords = vec3(1835.77, 2589.76, 45.95),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.0
	},
	-- To CheckingRoom
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 0.0,
		objCoords  = vec3(1827.521, 2583.905, 45.28576),
		textCoords = vec3(1828.638, 2584.675, 45.95233),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2
	},
	-- Checking Gate
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 270.0,
		objCoords  = vec3(1837.714, 2595.185, 46.09929),
		textCoords = vec3(1837.714, 2595.185, 46.09929),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- To CheckingRoomFromCheck
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1837.697, 2585.24, 46.09929),
		textCoords = vec3(1837.697, 2585.24, 46.09929),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- To SecondCheckGate
	{
		objName = 'v_ilev_gtdoor',
		objYaw = 90.0,
		objCoords  = vec3(1845.198, 2585.24, 46.09929),
		textCoords = vec3(1845.198, 2585.24, 46.09929),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = false,
		pickable = false,
		distance = 1.5
	},
	-- To MainHall
	{
		objName = 'v_ilev_ph_door002',
		objYaw = 90.0,
		objCoords  = vec3(1791.18, 2593.11, 546.15),
		textCoords = vec3(1791.18, 2593.11, 546.15),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- To VisitorRoom
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vec3(1784, 2599, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vec3(1786, 2600, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3(1785.83, 2609.59, 45.99),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 182.0,
				objCoords = vec3(1785, 2610, 46),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 0.0,
				objCoords = vec3(1787, 2610, 46),
			}
		}
	},
	{
		textCoords = vec3(1779.67, 2601.83, 50.71),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 1.5,
				objCoords = vec3(1781, 2602, 51),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 180.0,
				objCoords = vec3(1778, 2602, 51),
			}
		}
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vec3(1780, 2596, 51),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1',
		objYaw = 0.0,
		objCoords  = vec3(1787, 2621, 46),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door2',
		objYaw = 270.0,
		objCoords  = vec3(1788, 2606, 51),
		textCoords = vec3(1785.808, 2590.02, 44.79703),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3(1791.08, 2593.76, 46.18),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door1',
				objYaw = 272.0,
				objCoords = vec3(1791.1140136719, 2592.50390625, 46.3132473297119),
			},

			{
				objName = 'prison_prop_door1a',
				objYaw = 90.0,
				objCoords = vec3(1791, 2595, 46),
			}
		}
	},
	-- To DoctorRoom
	{
		objName = 'v_ilev_ph_gendoor002',
		objYaw = 90.0,
		objCoords  = vec3(1786.4, 2579.8, 45.97),
		textCoords = vec3(1786.4, 2579.8, 45.97),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 1.0
	},
	-- HallGate
	{
		objName = 'prison_prop_door2',
		objYaw = 0.0,
		objCoords  = vec3(1786, 2567, 46),
		textCoords = vec3(1778.91, 2568.91, 46.07),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- HallGate 2
	{
		objName = 'prison_prop_door1',
		objYaw = 270.0,
		objCoords  = vec3(1792, 2551, 46),
		textCoords = vec3(1773.49, 2568.9, 46.07),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		textCoords = vec3( 1781.72, 2552.07, 49.57),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.5,
		doors = {
			{
				objName = 'prison_prop_door2',
				objYaw = 269.5,
				objCoords = vec3(1782, 2551, 50),
			},

			{
				objName = 'prison_prop_door2',
				objYaw = 90.0,
				objCoords = vec3(1782, 2553, 50),
			}
		}
	},
	-- Gate To Work
	{
		objName = 'prison_prop_door2',
		objYaw = 90.0,
		objCoords  = vec3(1786, 2552, 50),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- Cell Maindoor
	{
		objName = 'prison_prop_door2',
		objYaw = 180.0,
		objCoords  = vec3(1785, 2550, 46),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	{
		objName = 'prison_prop_door1a',
		objYaw = 270.0,
		objCoords  = vec3(1776, 2551, 46),
		textCoords = vec3(1760.89, 2578.51, 46.07),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 2.0
	},
	-- Police front gate
	{
		objName = 'prop_facgate_07b',
		objYaw = -90.0,
		objCoords  = vec3(419.99, -1025.0, 28.99),
		textCoords = vec3(419.9, -1021.04, 30.5),
		authorizedJobs = { 'police', 'sheriff','sasp' },
		locked = true,
		pickable = false,
		distance = 20
	},
	-- Luxury Cars
	-- Entrance Doors
	{
		textCoords = vec3(-803.0223, -223.8222, 37.87975),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry2',
				objYaw = 120.0,
				objCoords = vec3(-803.0223, -222.5841, 37.87975)
			},

			{
				objName = 'prop_doorluxyry2',
				objYaw = -60.0,
				objCoords = vec3(-801.9622, -224.5203, 37.87975)
			}
		}
	},
	-- Side Entrance Doors
	{
		textCoords = vec3(-777.1855, -244.0013, 37.333889),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 3.5,
		doors = {
			{
				objName = 'prop_doorluxyry',
				objYaw = -160.0,
				objCoords = vec3(-778.1855, -244.3013, 37.33388)
			},

			{
				objName = 'prop_doorluxyry',
				objYaw = 23.0,
				objCoords = vec3(-776.1591, -243.5013, 37.33388)
			}
		}
	},
	-- Garage Doors
	{
		textCoords = vec3(-768.1264, -238.9737, 37.43247),
		authorizedJobs = { 'cardealer', 'police' },
		locked = true,
		pickable = false,
		distance = 13.0,
		doors = {
			{
				objName = 'prop_autodoor',
				objCoords = vec3(-770.6311, -240.0069, 37.43247)
			},

			{
				objName = 'prop_autodoor',
				objCoords = vec3(-765.6217, -237.9405, 37.43247)
			}
		}
	},
	-- Pickle Rental
	-- Front door 1
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.71276, -1392.778, 29.63847),
		textCoords = vec3(-22.31276, -1392.778, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = -180.0,
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Front door 2
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-32.67987, -1392.064, 29.63847),
		textCoords = vec3(-32.10987, -1392.064, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 0.0,
		locked = true,
		pickable = false,
		distance = 2.5
	},
	-- Door to cellar
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-24.22668, -1403.067, 29.63847),
		textCoords = vec3(-24.22668, -1402.537, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = false,
		distance = 1.5
	},
	-- Back door
	{
		objName = 'apa_prop_apa_cutscene_doorb',
		objCoords  = vec3(-21.27107, -1406.845, 29.63847),
		textCoords = vec3(-21.27107, -1406.245, 29.63847),
		authorizedJobs = { 'cardealer' },
		objYaw = 90.0,
		locked = true,
		pickable = false,
		distance = 2.0
	},
}
