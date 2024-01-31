Config = {
	Lan = "en", -- Pick your language here
	Debug = false, -- Set to true to show green debug boxes to help track
	img = "qb-inventory/html/images/", -- Set this to the directory for your inventory image files
	JimShops = false, -- If using my free script jim-shops, enable this to use it with the mechanic stores.
	JimMenu = true, -- If using my free edit of qb-menu enable this.
	distkph = false, -- Set to false to read distance travelled in Miles.

-- Main variables
	isVehicleOwned = false, -- Keep this true if you only want changes to be made to owned vehicles
	RequiresJob = true,  -- Do the specfic items require the mechanic job?
	LocationRequired = false, -- Are the mecahnics locked to specific locations?
	LocationBlips = true, -- Enable to grab the blip locations from locations.lua
	CosmeticsJob = false, -- Do vehicle cosmetics require a mechanic job role?
	FreeRepair = false,  -- Are repairs free? True means yes
	StashRepair = true, -- Enable for repair materials to be removed from a job stash (disabled if RequiresJob = false)
	Stores = true, -- Set true to turn on shop storage features
	Crafting = true, -- Set true to turn on crafting features
	StashCraft = false,  -- Set true to grab materials from mechaincs stash for crafting
	PreviewPhone = true, -- Enable this is preview menu generates an email, False if you want to give an item
	PreviewJob = false, -- Enable this if you want /preview to require a Job Role
	PreviewLocation = false, -- Enable this if you want to lock /preview to a job location (ignored if LocationRequired is false)

	PhoneMail = "qb", 	-- If PreviewPhone is true, change this to choose the correct phone system
						-- "qb" = use qb-phone for emails
						-- "gks" = use gks-phone for emails

	CosmeticRemoval = true, -- If "true" items will be removed on successful application of a mod
							-- If "false" items will not be removed on use.

	ShowOdo = true, -- Wether the distance is showed in car by default
	OdoLocation  = "bottom-right", 	-- Where the Odometer will show,
									-- "left", "right", "top", "top-left", "top-right", "bottom", "bottom-left", "bottom-right"
-- Player vehicle repair config
	ManualRepairCost = 5000, -- Set this to a high amount to get people to talk to mechanics rather than use automated systems
	ManualRepairCostBased = true, 	-- Set this to true if you want the cost to ALWAYS be the amount set at "ManualRepairCost"
									-- Set this to false if you want it to "ManualRepairCost" to be the max and cost is calculated by damage

	ManualRepairBased = true, -- Set this to true if you want to set the repair cost to be based on QBCore.Shared.Vehicle costs(overrides the cost setting above)
	ManualRepairPercent = 5,	-- Set this to the percent of the vehicle price (Only works if ManualRepairBased is true)
								-- Default is 5% because $200,000 would be $10,000 max to repair by this system
								-- 5% of a $10,000 car would be $500

	repairEngine = true, -- Set this to true if automated repairs also repair engine (not just body)
	repairExtras = false, -- Set this to true for automated repairs to also repair extra damages (if mechanicjob is available and repairEngine is true)

	requireDutyCheck = false, -- if set to true, the repair bench will only be usable if there are no mechanics in the server ON DUTY
	dutyMessage = "There is a Mechanic on duty!", -- This is the notification that pops up when a person tries to repair when a mechanic is on duty, choose what you want for it.

	repairAnimate = true, -- Better than staring at a progress bar, "damaged" parts will be removed and replaced. Making it look more authentic
	repairSpeed = 1500, -- The time between each task while using repairAnimate. 1500 Seems to be a reasonable time for it

-- NOS STUFF
	NosRefillCharge = 1000, -- amount in dollars required to refill a nos can

	NosTopSpeed = 15.0, -- Enabling this adds a multiplier to the top speed of the vehicle
						-- Set this to "-1.0" to disable this
						-- This doesn't affect the boost acceleration
	NosBoostPower = { -- NOS boost acceleration power
		5.0, -- Level 1
		10.0, -- Level 2
		15.0, -- Level 3
	},

	NosBindings = {
		60, -- Switch mode button - Default: 36 "LEFT CTRL"
		21, -- Activate NOS/Purge - Default: 21 "LEFT SHIFT"
		172, -- Boost/Purge UP - Default: 10 "PAGE UP"
		173, -- Boost/Purge Down - Default: 11 "PAGE DOWN"
	},

	NitrousUseRate = 0.4, 
	NitrousCoolDown = 5000,
	CooldownConfirm = true,
	nosDamage = true,
	boostExplode = true,

	-- Effects
	EnableFlame = true, -- True adds exhaut flame effects while boosting
	EnableTrails = true, -- True adds taillight effects while boosting
	EnableScreen = true, -- True adds screen effects while boosting

	skillcheck = "qb-ui",
	explosiveFail = true, 		-- Better not fail that skill check. (1 in 10 chance of explosion)
	explosiveFailJob = false, 	-- if true, mechanics can trigger an explosion

-- nosBar() stuff
	nosBarColour = true, -- "true" to set nosBars to use colour, "false" for white and grey
	nosBarFull = "▓", -- The symbol to be used for a "full" segment of the bar
	nosBarEmpty = "░", -- The symbol to be used for an "empty" segment of the bar
}

-- No touch
Loc = {}
Crafting = {}
Stores = {}
if Config.JimMenu then Config.img = "" end