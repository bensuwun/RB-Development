
--[[
	Loads leaderboard when player joins
	Saves currency of players based on leaderboard values.
  Data to store: Table of values
	Times to save:
		- Every 5 minutes
		- Players leaves the game /
		- Server shutdown (game:BindToClose(function()))
--]]
local duration = 10

local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")
local DataModules = ServerStorage:WaitForChild("Data_Modules")

-- DB Manager
local DataManager = require(DataModules:WaitForChild("DataManager"))

--[[
	Helper function to create table from leaderstats and hiddenstats.
	Used for saving data to DB.
	Parameters:
		player (Player object) - player to extract leaderboard data from
	Returns:
		tabularized player data
]]
local function createTable(player)
	local player_stats = {}
	for _, stat in pairs(player.leaderstats:GetChildren()) do
		player_stats[stat.Name] = stat.Value
	end

	for _, stat in pairs(player:WaitForChild("hiddenstats"):GetChildren()) do
		player_stats[stat.Name] = stat.Value
	end
	return player_stats
end

--[[
	Setup and loads leaderboard stats of a player.
]]
local function onPlayerJoin(player)
	-- Data we want to display in leaderboard
	local leaderstats = Instance.new("Configuration")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player
	
	-- Data we want to hide in leaderboard, but still exist
	local hiddenstats = Instance.new("Configuration")
	hiddenstats.Name = "hiddenstats"
	hiddenstats.Parent = player
	
	local pounds = Instance.new("IntValue")
	pounds.Name = "Pounds"
	pounds.Parent = leaderstats
	
	local exp = Instance.new("IntValue")
	exp.Name = "Exp"
	exp.Parent = hiddenstats
	
	-- Get data from datastore and initialize values
	local dataTable = DataManager.getData(player)
	
	if dataTable then
		pounds.Value = dataTable["Pounds"]
		exp.Value = dataTable["Exp"]
	else
		pounds.Value = 0
		exp.Value = 0
	end
end

--[[
	Save player data upon exit.
--]]
local function onPlayerExit(player)
	local playerStats = createTable(player)
	DataManager.saveData(player, playerStats)
end

-- Interval saves
--while wait(duration) do
--	for i, player in pairs(Players:GetPlayers()) do
--		-- Save data
--		DataManager.saveData(player, createTable(player))
--	end
--end


Players.PlayerAdded:Connect(onPlayerJoin)
Players.PlayerRemoving:Connect(onPlayerExit)
