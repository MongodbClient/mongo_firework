Player = {
    running = false;
}


RegisterNetEvent('mongo:client:firework:handleItem');
AddEventHandler('mongo:client:firework:handleItem', function(item)
    if(not Player.running) then
        Player.running = true;
        TriggerServerEvent('mongo:server:firework:accept', item);
        local ped = GetPlayerPed(-1)
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.5, -1.02));
        RequestAnimDict('anim@mp_fireworks')
        while not HasAnimDictLoaded('anim@mp_fireworks') do
            Wait(1)
        end
        TaskPlayAnim(ped, 'anim@mp_fireworks', 'place_firework_4_cone', 8.0, -1, -1, 0, 0, 0, 0, 0)
        Wait(1250)
        ClearPedSecondaryTask(ped);

        _config.SendNotify(_config.messages['PLACED'])

        local object = GetHashKey(_config.object)
        local prop = CreateObject(object, x, y, z, true, false, true)
        SetEntityHeading(prop, GetEntityHeading(ped))
        PlaceObjectOnGroundProperly(prop)

        Wait(9000)

        TriggerServerEvent("mongo:server:firework:sync", x, y, z)

        Wait(18000)
        DeleteObject(prop)

        Player.running = false;
    else
        _config.SendNotify(_config.messages['ALREADY_RUNNING'])
    end
end)


RegisterNetEvent('mongo:client:firework:sync');
AddEventHandler('mongo:client:firework:sync', function(x, y, z)
    RequestNamedPtfxAsset(_config.particle)
    while not HasNamedPtfxAssetLoaded(_config.particle) do
        Wait(1)
	end
	UseParticleFxAssetNextCall(_config.particle)
	local particle = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(_config.particle)
	local particle2 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(_config.particle)
	local particle3 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(_config.particle)
	local particle4 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(1500)
	UseParticleFxAssetNextCall(_config.particle)
	local particle5 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 0.5 + 0.8, false, false, false, false)
	Wait(2500)
	UseParticleFxAssetNextCall(_config.particle)
	local particle6 = StartNetworkedParticleFxNonLoopedAtCoord("scr_indep_firework_fountain", x, y, z, 0.0, 0.0, 0.0, math.random() * 1.5 + 1.8, false, false, false, false)
end)