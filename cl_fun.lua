RegisterNetEvent('VehicleSpawn')
AddEventHandler('VehicleSpawn', function(Vehicle)

	TriggerEvent("chatMessage", "SYSTEM", {255,0,0}, "Vous avez fais apparaître un/une "..Vehicle)

  	local hash = GetHashKey(Vehicle)

	RequestModel(hash)

	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Citizen.Wait(0)
	end

	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
	local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
	SetVehicleNumberPlatetext(vehicle, Vehicle)
end)

RegisterNetEvent('repairCar')
AddEventHandler('repairCar', function() 
	local currentVehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	SetVehicleFixed(currentVehicle)
end)

RegisterNetEvent('colorCar')
AddEventHandler('colorCar', function(colora, colorb)  
	local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), false)
	if(vehicle == nil) then
		TriggerEvent("chatMessage", "SYSTEM", {255,0,0}, "Vous devez être dans un vehicle")
	else
		TriggerEvent("chatMessage", "SYSTEM", {255,0,0}, colora.."|"..colorb)
		SetVehicleColours(vehicle, colora, colorb)
	end
end)

RegisterNetEvent('changeModel')
AddEventHandler('changeModel', function(idmodel) 

	TriggerEvent("chatMessage", "SYSTEM", {255,0,0}, "changement de skin ...("..idmodel..")")

	if DoesEntityExist(GetPlayerPed(-1)) then
	local model = GetHashKey(idmodel)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Citizen.Wait(0)
	end
	SetPlayerModel(PlayerId(), model)
	SetModelAsNoLongerNeeded(model)
end
end)

RegisterNetEvent('giveGun')
AddEventHandler('giveGun', function(nameG) 
	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey(nameG), 1000, false)
end)

RegisterNetEvent('bourre')
AddEventHandler('bourre', function(param)
	SetPedIsDrunk(GetPlayerPed(-1), param)
end)

RegisterNetEvent('giveDiscord')
AddEventHandler('giveDiscord', function()
	TriggerEvent("chatMessage", "SYSTEM", {255,0,0}, "Discord : https://discord.gg/sZmnH9X")
end)

RegisterNetEvent('getPos')
AddEventHandler('getPos', function()
	local pos = GetEntityCoords(GetPlayerPed(-1))
	local string = "{x = " .. pos.x .. ",y = " .. pos.y .. ",z = " .. pos.z-1 .. " },\n"
	TriggerEvent('chatMessage', 'SYSTEM', {255, 0, 0}, 'Your position is :'..string);
end)