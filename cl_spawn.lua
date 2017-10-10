RegisterNetEvent('VehicleSpawn')
AddEventHandler('VehicleSpawn', function(Vehicle)

	TriggerEvent("chatMessage", "SYSTEM", { 255,0,0}, Vehicle)

  	local hash = GetHashKey(Vehicle)

	RequestModel(hash)

	while not HasModelLoaded(hash) do
		RequestModel(hash)
		Citizen.Wait(0)
	end

	local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
	local vehicle = CreateVehicle(hash, x + 2, y + 2, z + 1, 0.0, true, false)
end)

function stringsplit(self, delimiter)
  local a = self:Split(delimiter)
  local t = {}

  for i = 0, #a - 1 do
     table.insert(t, a[i])
  end

  return t
end