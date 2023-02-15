local disableShufflePassengerToDriver = true

CreateThread(function()
    while true do
        local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped, false) and disableShufflePassengerToDriver then
            local veh = GetVehiclePedIsIn(ped)

            if GetPedInVehicleSeat(veh, 0) == ped then
                if GetIsTaskActive(ped, 165) then
                    SetPedConfigFlag(ped, 184, true)
                    SetPedIntoVehicle(ped, veh, 0)
                end
            end
        end

        Wait(100)
    end
end)

local function shuffle()
    local ped = PlayerPedId()

    if IsPedInAnyVehicle(ped, false) then
        local veh = GetVehiclePedIsIn(ped)

        if ped == GetPedInVehicleSeat(veh, 0) then
            CreateThread(function()
                disableShufflePassengerToDriver = false
                SetPedConfigFlag(ped, 184, false)
                Wait(3000)
                disableShufflePassengerToDriver = true
            end)
        elseif GetPedInVehicleSeat(veh, -1) and GetPedInVehicleSeat(veh, 0) == 0 then
            SetPedIntoVehicle(ped, veh, 0)
        elseif GetPedInVehicleSeat(veh, 1) and GetPedInVehicleSeat(veh, 0) == 2 then
            SetPedIntoVehicle(ped, veh, 2)
        elseif GetPedInVehicleSeat(veh, 2) and GetPedInVehicleSeat(veh, 1) == 0  then
            SetPedIntoVehicle(ped, veh, 1)
        end
    else
        CancelEvent()
    end
end

RegisterCommand("shuffle", function(source, args, raw)
    shuffle()
end, false)
