AddEventHandler('chatMessage', function(player, color, message)
    if message:sub(1, 6) == '/spawn' then
        TriggerClientEvent('VehicleSpawn', player, message:sub(8))
        CancelEvent()
    end
end)