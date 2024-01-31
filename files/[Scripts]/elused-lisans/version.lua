PerformHttpRequest("https://api.github.com/repos/Ellunati/elused-lisans/releases/latest", function(err, text, headers)
	Citizen.Wait(5000)
	if text then
		local info = json.encode(text) info = json.decode(text)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), "version") 
		local newestVersion = info.tag_name

		print("  ||    ELUSED NEWQB PAKET")

		if ( newestVersion ~= nil ) then
			if newestVersion ~= currentVersion then
				print("  ||    ŞUANKİ SÜRÜM: ^1" .. currentVersion .. "^0")
				print("  ||    GÜNCEL SÜRÜM: ^2" .. newestVersion .."^0\n  ||")
				print("  ||    ^1YENI GUNCELLEME TESPIT EDILDI DISCORD SUNUCUMUZDAN YENI GUNCELLEMEYİ INDIREBILIRSINIZ\n^0  \\\\")
			elseif newestVersion == currentVersion then
				print("  ||    ŞUANKİ SÜRÜM: ^2" .. currentVersion .. "^0")
				print("  ||    GÜNCEL SÜRÜM: ^2" .. newestVersion .."^0\n  ||")
				print("  ||    ELUSED NEWQB PAKET ^2 GÜNCEL PAKET TESPIT EDILDI")
			end
		else
			print("  ||    ^1There was an error getting the latest version information.\n^0  \\\\")
		end
	end
end)