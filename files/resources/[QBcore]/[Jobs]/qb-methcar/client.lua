local QBCore = exports['qb-core']:GetCoreObject()

local started = false
local progress = 0
local pause = false
local quality = 0

RegisterNetEvent('qb-methcar:stop')
AddEventHandler('qb-methcar:stop', function()
	LastVehicle = QBCore.Functions.GetClosestVehicle()
	started = false
	progress = 0
	QBCore.Functions.Notify("Üretim durdu!", "error")
	FreezeEntityPosition(LastVehicle, false)
end)

RegisterNetEvent('qb-methcar:notify')
AddEventHandler('qb-methcar:notify', function(message)
	QBCore.Functions.Notify(message)
end)

RegisterNetEvent('qb-methcar:startprod')
AddEventHandler('qb-methcar:startprod', function()
	CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
	started = true
	pause = false
	FreezeEntityPosition(CurrentVehicle, true)
	QBCore.Functions.Notify("Üretim Başladı!", "success")
end)

RegisterNetEvent('qb-methcar:smoke')
AddEventHandler('qb-methcar:smoke', function(posx, posy, posz, bool)
	if bool == 'a' then
		if not HasNamedPtfxAssetLoaded("core") then
			RequestNamedPtfxAsset("core")
			while not HasNamedPtfxAssetLoaded("core") do
				Wait(1)
			end
		end
		SetPtfxAssetNextCall("core")
		local smoke = StartParticleFxLoopedAtCoord("exp_grd_flare", posx, posy, posz + -1.0, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
		SetParticleFxLoopedAlpha(smoke, 10.1)
		SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
		Wait(60000)
		StopParticleFxLooped(smoke, 0)
	else
		StopParticleFxLooped(smoke, 0)
	end
end)
-------------------------------------------------------EVENTS NEGATIVE
RegisterNetEvent('qb-methcar:boom', function()
	playerPed = (PlayerPedId())
	local pos = GetEntityCoords((PlayerPedId()))
	pause = false
	Wait(500)
	started = false
	Wait(500)
	CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
	TriggerServerEvent('qb-methcar:blow', pos.x, pos.y, pos.z)
	TriggerEvent('qb-methcar:stop')
end)

RegisterNetEvent('qb-methcar:blowup')
AddEventHandler('qb-methcar:blowup', function(posx, posy, posz)
	AddExplosion(posx, posy, posz + 2, 15, 20.0, true, false, 1.0, true)
	if not HasNamedPtfxAssetLoaded("core") then
		RequestNamedPtfxAsset("core")
		while not HasNamedPtfxAssetLoaded("core") do
			Wait(1)
		end
	end
	SetPtfxAssetNextCall("core")
	local fire = StartParticleFxLoopedAtCoord("ent_ray_heli_aprtmnt_l_fire", posx, posy, posz-0.8 , 0.0, 0.0, 0.0, 0.8, false, false, false, false)
	Wait(6000)
	StopParticleFxLooped(fire, 0)	
end)

RegisterNetEvent('qb-methcar:drugged')
AddEventHandler('qb-methcar:drugged', function()
	local pos = GetEntityCoords((PlayerPedId()))
	SetTimecycleModifier("drug_drive_blend01")
	SetPedMotionBlur((PlayerPedId()), true)
	SetPedMovementClipset((PlayerPedId()), "MOVE_M@DRUNK@SLIGHTLYDRUNK", true)
	SetPedIsDrunk((PlayerPedId()), true)
	quality = quality - 3
	pause = false
	Wait(90000)
	ClearTimecycleModifier()
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-1police', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 1
	pause = false
	TriggerServerEvent('police:server:policeAlert', 'Kişi garip koku bildiriyor!')
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-1', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 1
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-3', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 3
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q-5', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "error")
	quality = quality - 5
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

-------------------------------------------------------EVENTS POSITIVE
RegisterNetEvent('qb-methcar:q2', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 2
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q3', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 3
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:q5', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	quality = quality + 5
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:gasmask', function(data)
	local pos = GetEntityCoords((PlayerPedId()))
	QBCore.Functions.Notify(data.message, "success")
	SetPedPropIndex(playerPed, 1, 26, 7, true)
	quality = quality + 2
	pause = false
	TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
end)

RegisterNetEvent('qb-methcar:cook', function()
	local pos = GetEntityCoords((PlayerPedId()))
	playerPed = (PlayerPedId())
	local CurrentVehicle = QBCore.Functions.GetClosestVehicle()
	if IsVehicleSeatFree(CurrentVehicle, 3) and IsVehicleSeatFree(CurrentVehicle, -1) and IsVehicleSeatFree(CurrentVehicle, 0) and IsVehicleSeatFree(CurrentVehicle, 1)and IsVehicleSeatFree(CurrentVehicle, 2) then
		TaskWarpPedIntoVehicle(PlayerPedId(), CurrentVehicle, 3)
		SetVehicleDoorOpen(CurrentVehicle, 2)
		Wait(300)
		TriggerServerEvent('qb-methcar:start')
		TriggerServerEvent('qb-methcar:make', pos.x,pos.y,pos.z)
		Wait(1000)
		quality = 0
	else
		QBCore.Functions.Notify('Mutfağınızda biri mi var?!', "error")
	end
end)

---------EVENTS------------------------------------------------------

RegisterNetEvent('qb-methcar:proses', function()
	--
	--   EVENT 1
	--
	if progress > 9 and progress < 11 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Benzin deposu sızdırıyor... şimdi ne olacak?",
				txt = "Cevabınızı aşağıdan seçin. İlerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Bantla sabitle",
				params = {
					event = "qb-methcar:q-3",
					args = {
						message = "Bu biraz düzeltti, sanırım?!"
					}
				}
			},
			{
				header = "🔴 Bırak Gitsin",
				params = {
					event = "qb-methcar:boom"
				}
			},
			{
				header = "🔴 Tüpü değiştir",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Değiştirmek en iyi çözümdü!"
					}
				}
			},
		})
	end
	--
	--   EVENT 2
	--
	if progress > 19 and progress < 21 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Yere biraz aseton döktün.. şimdi ne olacak?",
				txt = "Yanıtınızı aşağıdan seçin. İlerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Bir pencere aç	",
				params = {
					event = "qb-methcar:q-1police",
					args = {
						message = "Keskin koku insanların dikkatini çekiyor! Dikkat et!"

					}
				}
			},
			{
				header = "🔴 İçine çek",
				params = {
					event = "qb-methcar:drugged"
				}
			},
			{
				header = "🔴Gaz maskesi tak",
				params = {
					event = "qb-methcar:gasmask",
					args = {
						message = "Bu işte iyisin!"
					}
				}
			},
		})
	end
	--
	--   EVENT 3
	--
	if progress > 29 and progress < 31 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Meth çok hızlı üretiliyor, ne yaparsınız?",
				txt = "Yanıtınızı aşağıdan seçin. İlerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Daha fazla sıcaklık ekle",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Daha yüksek bir sıcaklık mükemmel dengeyi sağlar!"
					}
				}
			},
			{
				header = "🔴 Daha fazla basınç ekleyin.",
				params = {
					event = "qb-methcar:q-3",
					args = {
						message = "Basınç çok değişken.."
					}
				}
			},
			{
				header = "🔴Basıncı düşürün",
				params = {
					event = "qb-methcar:q-5",
					args = {
						message = "Batırdın!"
					}
				}
			},
		})
	end
	--
	--   EVENT 4
	--
	if progress > 39 and progress < 41 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Çok fazla aseton eklediniz, ne yapcaksınız?",
				txt = "Cevabınızı aşağıdan seçin. ilerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Hiçbişey yapma.",
				params = {
					event = "qb-methcar:q-5",
					args = {
						message = "Meth saf aseton gibi kokuyor.."
					}
				}
			},
			{
				header = "🔴 Fazla asetonu iç.",
				params = {
					event = "qb-methcar:drugged"
				}
			},
			{
				header = "🔴 Stabilize etmek için lityum ekleyin.",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Akıllısın.."
					}
				}
			},
		})
	end
	--
	--   EVENT 5
	--
	if progress > 49 and progress < 51 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Biraz mavi pigment var, kullancakmısın?",
				txt = "Cevabınızı aşağıdan seçin. ilerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Karışıma ekle!",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Aferim İyi iş..."
					}
				}
			},
			{
				header = "🔴 Bırak gitsin..",
				params = {
					event = "qb-methcar:q-1",
					args = {
						message = "Çok yaratıcı değilsin sanırım..."
					}
				}
			},
		})
	end
	--
	--   EVENT 6
	--
	if progress > 59 and progress < 61 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Filtre kirli, şimdi ne olacak?",
				txt = "Cevabınızı aşağıdan seçin. ilerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Bir kompresörle üfleyin",
				params = {
					event = "qb-methcar:q-5",
					args = {
						message = "Sıçtınız!"
					}
				}
			},
			{
				header = "🔴 Filtreyi değiştirin!",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Değiştirmek en iyi seçenekti!"
					}
				}
			},
			{
				header = "🔴 Bir fırça ile temizleyin..",
				params = {
					event = "qb-methcar:q-1",
					args = {
						message = "Yardımcı oldu.Ama yeteri kadar değil..."
					}
				}
			},
		})
	end
	--
	--   EVENT 7
	--
	if progress > 69 and progress < 71 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Yere biraz aseton döktün.. şimdi ne olacak?",
				txt = "Cevabınızı aşağıdan seçin. ilerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 İçinize çekin..",
				params = {
					event = "qb-methcar:drugged"
				}
			},
			{
				header = "🔴 Gaz maskeni tak!",
				params = {
					event = "qb-methcar:gasmask",
					args = {
						message = "İyi seçim devam et!"
					}
				}
			},
			{
				header = "🔴 Pencereyi aç!",
				params = {
					event = "qb-methcar:q-1police",
					args = {
						message = "Keskin koku insanların dikkatini çekiyor! Dikkat et!"
					}
				}
			},
		})
	end
	--
	--   EVENT 8
	--
	if progress > 79 and progress < 81 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Benzin deposu sızdırıyor... şimdi ne olacak?",
				txt = "Cevabınızı aşağıdan seçin. ilerleme:	" .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Bırak Gitsin!",
				params = {
					event = "qb-methcar:boom"
				}
			},
			{
				header = "🔴Bantla Sabitle!",
				params = {
					event = "qb-methcar:q-3",
					args = {
						message = "Bu biraz düzeltti, sanırım?!"
					}
				}
			},
			{
				header = "🔴 Tüpü değiştirin!",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Değiştirmek en iyi çözümdü!"
					}
				}
			},
		})
	end
	--
	--   EVENT 9
	--
	if progress > 89 and progress < 91 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "Gerçekten sıçman gerekiyor! Ne yapıyorsun?",
				txt = "Cevabınızı aşağıdan seçin. İlerleme: " .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Tutmaya devam et!",
				params = {
					event = "qb-methcar:q5",
					args = {
						message = "Süper İş!"
					}
				}
			},
			{
				header = "🔴 Dışarı çık orda sıç!",
				params = {
					event = "qb-methcar:q-1police",
					args = {
						message = 
						"Biri seni fark etti!"
					}
				}
			},
			{
				header = "🔴 Kahretsin!",
				params = {
					event = "qb-methcar:q-5",
					args = {
						message = "İyi değil! Her şey bok gibi kokuyor!"
					}
				}
			},
		})
	end
	--
	--   DONE
	--	
	if progress > 99 and progress < 101 then
		pause = true
		exports['qb-menu']:openMenu({
			{
				header = "İş bitti 🎉",
				txt = "" .. progress .. "%",
				isMenuHeader = true,
			},
			{
				header = "🔴 Methleri Topla!",
				params = {
					event = "qb-methcar:done",
					args = {
						message = ""
					}
				}
			}
		})
	end
end)

RegisterNetEvent('qb-methcar:done', function()
	quality = quality + 5
	started = false
	TriggerEvent('qb-methcar:stop')
	TriggerServerEvent('qb-methcar:finish', quality)
	SetPedPropIndex(playerPed, 1, 0, 0, true)
end)

-----THREADS------------------------------------------------------------------------------

CreateThread(function()
	while true do
		Wait(250)
		if started == true then
			if pause == false and IsPedInAnyVehicle(playerPed) then
				Wait(250)
				progress = progress +  1
				quality = quality + 1
				QBCore.Functions.Notify('Meth üretimi: ' .. progress .. '%')
				TriggerEvent('qb-methcar:proses')
				Wait(2000)
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(1000)
		if IsPedInAnyVehicle((PlayerPedId())) then
		else
			if started then
				playerPed = (PlayerPedId())
				CurrentVehicle = GetVehiclePedIsUsing(PlayerPedId(-1))
				pause = true
				started = false
				TriggerEvent('qb-methcar:stop')
				SetPedPropIndex(playerPed, 1, 0, 0, true)
				FreezeEntityPosition(CurrentVehicle, false)
			end
		end
	end
end)




