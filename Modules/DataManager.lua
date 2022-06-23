local DataManager = {}

local DBConfig = require(game:GetService("ServerStorage")
	:WaitForChild("Data_Modules"):WaitForChild("DBConfig"))
local DataStoreService = game:GetService("DataStoreService")
local db = 	DataStoreService:GetDataStore(DBConfig.DBName)

--[[
	Helper function to obtain keyname of player in database
--]]
local function getKey(player)
	return "Player_"..player.UserId
end

--[[
	Get the given player's data from database.
	Parameters:
		player (Player object) - player trying to obtain data
	Returns: a table of values of currently stored data
--]]
function DataManager.getData(player)
	local success, data = pcall(function()
		return db:GetAsync(getKey(player))
	end)
	
	if success then
		return data
	else
		print("Error obtaining data of "..player.Name)
	end
end

--[[
	Updates the data of player in datastore.
	Parameters:
		player (Player object) - player trying to save data
		data (Table) - table of values to save in DB
--]]
function DataManager.saveData(player, newData)
	local success, errMessage = pcall(function()
		db:UpdateAsync(getKey(player), function(oldData)
			local saveTable = oldData or {} -- if old data is nil, start with empty table
			for key, newValue in pairs(newData) do
				saveTable[key] = newValue
			end
			return saveTable
		end)
	end)
	
	if not success then
		print("Error saving data for "..player.Name)
		print(errMessage)
	end
end


return DataManager
