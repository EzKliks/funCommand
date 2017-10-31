AddEventHandler('chatMessage', function(player, color, message)
    if message:sub(1, 6) == '/spawn' then
        TriggerClientEvent('VehicleSpawn', player, message:sub(8))
        CancelEvent()
    end
    if message:sub(1) == '/discord' then
    	TriggerClientEvent('giveDiscord', player)
    	CancelEvent()
    end
    if message:sub(1) == '/repair' then
    	TriggerClientEvent('repairCar', player)
    	CancelEvent()
    end
    if message:sub(1,6) == '/color' then
    	TriggerClientEvent('colorCar', player, message:sub(8,9), message:sub(11,12))
    	CancelEvent()
    end
    if message:sub(1, 5) == '/skin' then
    	TriggerClientEvent('changeModel', player, message:sub(7))
    	CancelEvent()
	end
	if message:sub(1,7) == '/bourre' then
		TriggerClientEvent('bourre', player, message:sub(9))
		CancelEvent()
	end
	if message:sub(1,4) == '/gun' then
		TriggerClientEvent('giveGun', player, message:sub(6))
		CancelEvent()
	end
    if message:sub(1) == '/getPos' then
        TriggerClientEvent('getPos', player)
        CancelEvent()
    end
end)