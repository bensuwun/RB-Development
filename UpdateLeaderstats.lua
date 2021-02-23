-- Local Script

local Sensor = game.Workspace:WaitForChild("Sensor")
local Players = game:GetService("Players")


local function addScore(partTouched)
	local partParent = partTouched.Parent
	local humanoid = partParent:FindFirstChildWhichIsA("Humanoid")
	
	-- if part touched has a humanoid
	if humanoid then
		-- get player and leaderstats
		local player = Players:GetPlayerFromCharacter(partParent)
		local leaderstats = player:FindFirstChild("leaderstats")
		
		local score = leaderstats and leaderstats:FindFirstChild("Score")
		-- if score (leaderstats) exists then
		if score then score.Value += 1 end
	end
end

Sensor.Touched:Connect(addScore)
