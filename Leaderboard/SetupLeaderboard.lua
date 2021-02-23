-- goes to ServerScriptService

local Players = game:GetService("Players")

local function addLeaderstats(player)
	-- set up leaderboard folder
	local leaderstats = Instance.new("Folder")
	leaderstats.Name = "leaderstats"
	leaderstats.Parent = player 
	
	-- add values to leaderboard
	local score = Instance.new("IntValue")
	score.Name = "Score"
	score.Value = 0
	score.Parent = leaderstats
end

Players.PlayerAdded:Connect(addLeaderstats)
