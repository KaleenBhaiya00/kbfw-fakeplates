local QBCore = exports['qb-core']:GetCoreObject()

print("MADE WITH LOVE BY KBFW LABS..")

-----------------------/////////////////////time function///////////////--------------------

function time()
	local time = GetClockHours()
	if time > Config.Night[1] or time < Config.Night[2] then
		return true 
	end
	return false
end


-------------------------///////////////////////////////remove plate///////////////////////////------------------------------------
RegisterNetEvent("kbfw-plate:removePlate")
AddEventHandler("kbfw-plate:removePlate", function()
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate =  GetVehicleNumberPlateText(vehicle)
    local vehCoords = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(PlayerPedId())
    local nearby = #(pos - vehCoords) <= 3.5

    NetworkHasControlOfEntity(vehicle)
    NetworkRequestControlOfEntity(vehicle)

    if nearby and time() then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            local ped = PlayerPedId()
            local pedPos = GetEntityCoords(ped)
            local screw = `prop_tool_screwdvr03`
            local bone = GetPedBoneIndex(ped, 0x6F06)
            screw2 = CreateObject(screw, pedPos, true)
            AttachEntityToEntity(screw2, ped, bone, 0.1, 0.04, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
            if result then
                exports['ps-ui']:Circle(function(success)
                    if success then
        
                    QBCore.Functions.Progressbar("plateremove", "Removing Plate..", math.random(7500, 12000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        anim = "machinic_loop_mechandplayer",
                        flags = 0,
                    }, {}, {}, function() -- Done
                        ClearPedTasks(PlayerPedId())
                        TriggerServerEvent('kbfw-plate:addPlate', plate)
                        DeleteEntity(screw2)
                        DeleteEntity(screw)
                        Wait(500)
                        SetVehicleNumberPlateText(vehicle, "")
                    end, function() -- Cancel
                        ClearPedTasks(PlayerPedId())
                          DeleteEntity(screw2)
                        DeleteEntity(screw)
                       
                        QBCore.Functions.Notify("Process Cancele", "error")
                        DeleteEntity(screw2)
                        DeleteEntity(screw)
                    end)
                else
                    QBCore.Functions.Notify("You Failed MotherFuker", "error")
                    exports['ps-dispatch']:SuspiciousActivity()
                    print("fail")
                    DeleteEntity(screw2)
                    DeleteEntity(screw)
                end
            end, 2, 20)
                    
            else
                QBCore.Functions.Notify("You don\'t have the right tools.", "error")
            end
        end, 'screwdriverset')
    else
        QBCore.Functions.Notify('No vehicle nearby Or Its Not That Dark', "error", 2500)
    end
end)

--------------------------////////////////////////////install plate//////////////////////////---------------------------

RegisterNetEvent('kbfw-plate:installPlate')
AddEventHandler('kbfw-plate:installPlate', function(data)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local plate =  GetVehicleNumberPlateText(vehicle)
    local vehCoords = GetEntityCoords(vehicle)
    local pos = GetEntityCoords(PlayerPedId())
    local nearby = #(pos - vehCoords) <= 3.5

    NetworkHasControlOfEntity(vehicle)
    NetworkRequestControlOfEntity(vehicle)

    if nearby then
        QBCore.Functions.TriggerCallback('QBCore:HasItem', function(result)
            local ped = PlayerPedId()
            local pedPos = GetEntityCoords(ped)
            local plateprop = `p_num_plate_02`
            local bone = GetPedBoneIndex(ped, 0x188E)
            plateprop2 = CreateObject(plateprop, pedPos, true)
            AttachEntityToEntity(plateprop2, ped, bone, 0.1, 0.04, 0, 80.0, 120.0, 160.0, true, true, false, true, 1, true)
            if result then
                exports['ps-ui']:Circle(function(success)
                    if success then
        
                        print("success")
                QBCore.Functions.Progressbar("installing", "Checking plate..", math.random(7500, 12000), false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    flags = 0,
                }, {}, {}, function() -- Done
                    QBCore.Functions.Progressbar("installing", "Installing Plate..", math.random(7500, 12000), false, true, {
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {
                        animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                        anim = "machinic_loop_mechandplayer",
                        flags = 0,
                    }, {}, {}, function() -- Done
                        DeleteEntity(plateprop2)
                        DeleteEntity(plateprop)
                        ClearPedTasks(PlayerPedId())
                        SetVehicleNumberPlateText(vehicle, data)
                        TriggerServerEvent('kbfw-plate:takePlate')
                        TriggerServerEvent('kbfw-plate:addPlate', plate)
                    end, function() -- Cancel
                        DeleteEntity(plateprop2)
                        DeleteEntity(plateprop)
                        ClearPedTasks(PlayerPedId())
                        QBCore.Functions.Notify("Process Canceled", "error")
                    end)
                end, function() -- Cancel
                    DeleteEntity(plateprop2)
                    DeleteEntity(plateprop)
                    ClearPedTasks(PlayerPedId())
                    QBCore.Functions.Notify("Process Canceled", "error")
                end)

            else
                QBCore.Functions.Notify("You Failed MotherFuker", "error")
                ClearPedTasks(PlayerPedId())
                DeleteEntity(plateprop2)
                DeleteEntity(plateprop)
                print("fail")
            end
        end, 2, 20)

            else
                QBCore.Functions.Notify("You don\'t have the right tools.", "error")
            end
        end, 'screwdriverset')
    else
        QBCore.Functions.Notify('No vehicle nearby', "error", 2500)
    end
end)


