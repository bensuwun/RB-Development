--[[
	Module for adding, removing, and returning new data.
	This is stored in ServerStorage, and is mainly utilized as a server database prior to saving to the datastore.
--]]

local DataManagerModule = {}
local PlayerData = {}

function DataManagerModule.AddPlayer(Player, Data)
	PlayerData[Player] = Data
end


function DataManagerModule.RemovePlayer(Player)
	PlayerData[Player] = nil
end


function DataManagerModule.ReturnData(Player)
	return PlayerData[Player]
end

--[[
	Helper function to obtain only the inventory of the player.
--]]
function DataManagerModule.ReturnPlayerInventory(Player)
	return PlayerData[Player]["Inventory"]
end

	
return DataManagerModule
