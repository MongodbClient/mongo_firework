local t = {};

Citizen.CreateThread(function()
    for value, string in pairs(_config.usableItems) do
        ESX.RegisterUsableItem(string, function(source)
            local xPlayer = ESX.GetPlayerFromId(source);
            t[source] = source;
            TriggerClientEvent('mongo:client:firework:handleItem', source, string);
        end)
    end
end)

RegisterNetEvent('mongo:server:firework:accept');
AddEventHandler('mongo:server:firework:accept', function(item)
    if(t[source] ~= nil) then
        t[source] = nil;
        ESX.GetPlayerFromId(source).removeInventoryItem(item, 1);
    end
end)

RegisterNetEvent('mongo:server:firework:sync');
AddEventHandler('mongo:server:firework:sync', function(x, y, z)
    TriggerClientEvent('mongo:client:firework:sync', -1, x, y, z);
end)