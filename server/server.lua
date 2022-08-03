local QBCore = exports['qb-core']:GetCoreObject()
print("MADE WITH LOVE BY KBFW LABS..")
RegisterServerEvent('kbfw-plate:addPlate', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    info = {
        plate = data
    }
    Player.Functions.AddItem('license_plate', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['license_plate'], 'add')
end)


RegisterNetEvent('kbfw-plate:takePlate', function(data)
    local Player = QBCore.Functions.GetPlayer(source)
    Player.Functions.RemoveItem('license_plate', 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['license_plate'], 'remove')
end)



QBCore.Functions.CreateUseableItem("screwdriverset", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent("kbfw-plate:removePlate", source)
    end
end)



QBCore.Functions.CreateUseableItem("license_plate", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
    if Player.Functions.GetItemBySlot(item.slot) ~= nil then
        TriggerClientEvent('kbfw-plate:installPlate', source, item.info.plate)
    end
end)




