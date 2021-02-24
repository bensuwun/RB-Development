-- Server Script stored in ServerScriptService

local DataStoreService = game:GetService("DataStoreService")
local myDataStore = DataStoreService:GetDataStore("myDataStore")

local ManualSave = game:GetService("ReplicatedStorage"):WaitForChild("ManualSave")

game.Players.PlayerAdded:Connect(function(player)
	-- create leaderboard
	local leaderstats = Instance.new("Folder", player)
	leaderstats.Name = "leaderstats"
	
	local score = Instance.new("IntValue", leaderstats)
	local level = Instance.new("IntValue", leaderstats)
	score.Name = "Score"
	level.Name = "Level"
	
	
	-- player key
	local playerUserId = player.UserId
	
	local data
	local success, errormessage = pcall(function()
		data = myDataStore:GetAsync(playerUserId)
	end)

	if success then
		print("Load Success")
		score.Value = data.Score
		level.Value = data.Level
	else
		print("Load Failed")
		warn(errormessage)
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local playerUserId = player.UserId
	local data = {
		Score = player.leaderstats.Score.Value,
		Level = player.leaderstats.Level.Value
	}
	local success, errormessage = pcall(function()
		myDataStore:SetAsync(playerUserId, data)				-- set data (key, value)
	end)
	if success then
		print("Data successfully saved")
	else
		print("ERROR: Data not saved successfully")
		warn(errormessage)
	end
	
end)

-- For manual saving on GUI
ManualSave.OnServerInvoke = function(player)
	local playerUserId = player.UserId
	local data = {
		Score = player.leaderstats.Score.Value,
		Level = player.leaderstats.Level.Value
	}
	local success, errormessage = pcall(function()
		myDataStore:SetAsync(playerUserId, data)				-- set data (key, value)
	end)
	if success then
		return true, nil
	else
		return false, errormessage
	end
end
