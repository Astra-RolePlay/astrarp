QBCore = nil
local QBCore = exports['qb-core']:GetCoreObject()
msg = ""
QBCore.Commands.Add("duyuru", "Bu Komutu Sadece Yetkililer Kullanabilir", {{name ="id", help="Oyuncu ID"}}, true, function(source, args)
    local xPlayer = QBCore.Functions.GetPlayer(source) -- Hata düzeltildi (src -> source)
	if IsPlayerAceAllowed(source, "command") then
        local targetPlayerId = tonumber(args[1]) -- args[1] üzerinden hedef oyuncu ID'sini al
        if targetPlayerId then
            for i = 2, #args do
                msg = msg .. " " .. args[i]
            end

            TriggerClientEvent("announce", targetPlayerId, msg) -- Belirtilen oyuncuya duyuruyu gönder
            msg = ""
        else
            TriggerClientEvent('chatMessage', source, "Hata", "error", "Geçerli bir oyuncu ID'si belirtmelisin.")
        end
    end
end)
