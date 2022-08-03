# kbfw-fakeplates
qb-fakeplates i made this sript for my sever Just think that lets share with YOU Guys


#qb-fakeplate

made it For my server so i was thinking About You Guys Also need This So i Shared With You Guys

Showcase = https://youtu.be/SQEX0xaS7Bo

........................./////////////if you love this just join my discord and tell me more ideas. like this/////////////////.........................



                                              discord link = https://discord.gg/ctda6rk7VF


........................./////////////if you love this just join my discord and tell me more ideas. like this//////////////.........................



replace your screw driver set with mine or just change useble item false to trur

['screwdriverset'] 				 = {['name'] = 'screwdriverset', 			    ['label'] = 'Toolkit', 					['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'screwdriverset.png', 		['unique'] = false, 	['useable'] = true, 	['shouldClose'] = false,   ['combinable'] = nil,   ['description'] = 'Very useful to screw... screws...'},

-----------------//////////////////////////////////add these item to qb-core/item.lua//////////////////////////-------------------------

["license_plate"] 				 = {["name"] = "license_plate", 			["label"] = "Plate", 					["weight"] = 0, 		["type"] = "item", 		["image"] = "plate.png", 				    ["unique"] = true, 		["useable"] = true, 	['shouldClose'] = false,    	["combinable"] = nil,   ["description"] = "Plate for vehicle"},



-----------------------------//////////////////////////////////add this to qb-inventory server.lua///////////////////////////////////-------------------------------


	elseif itemData["name"] == "license_plate" then
		info.plate = tostring(QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(2) .. QBCore.Shared.RandomInt(2) .. QBCore.Shared.RandomStr(2))




-----------------------------//////////////////////////////////add this to qb-inventory app.js///////////////////////////////////-------------------------------

        } else if (itemData.name == "license_plate") {
            $(".item-info-title").html("<p>" + itemData.label + "</p>");
            $(".item-info-description").html('<p>Plate: ' + itemData.info.plate + '</p>');


-----------------------------//////////////dependency/////////////////////////////----------------------- 

qb-core
ps-ui
ps-dispacth

-----------------------------//////////////enjoy Guys............/////////////////////////////----------------------- 


for any support join discord
kbfw labs.....


........................./////////////if you love this just join my discord and tell me more ideas. like this//////////////.........................



                                              discord link = https://discord.gg/ctda6rk7VF


........................./////////////if you love this just join my discord and tell me more ideas. like this//////////////.........................







