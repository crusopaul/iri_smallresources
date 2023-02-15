local parked = 0.8
local vehicle = 0.5
local multiplier = 0.5
local peds = 0.5
local scenario = 0.5


CreateThread(function()
	while true do
		SetParkedVehicleDensityMultiplierThisFrame(parked)
		SetVehicleDensityMultiplierThisFrame(vehicle)
		SetRandomVehicleDensityMultiplierThisFrame(multiplier)
		SetPedDensityMultiplierThisFrame(peds)
		SetScenarioPedDensityMultiplierThisFrame(scenario, scenario) -- Walking NPC Density
		Wait(0)
	end
end)

function DecorSet(Type, Value)
    if Type == 'parked' then
        parked = Value
    elseif Type == 'vehicle' then
        vehicle = Value
    elseif Type == 'multiplier' then
        multiplier = Value
    elseif Type == 'peds' then
        peds = Value
    elseif Type == 'scenario' then
        scenario = Value
    end
end

exports('DecorSet', DecorSet)
