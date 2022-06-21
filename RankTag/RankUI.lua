--// Variables
local config = require(script.Config)

--// Player Connections
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAppearanceLoaded:Connect(function(char)
		char:WaitForChild('Humanoid').DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
		
		-- Bind overhead GUI to player's character
		local new = script.RankUI:Clone()
		new.Parent = char
		new.Adornee = char:WaitForChild('Head')
		
		-- Set player name
		new.PlayerName.NameTitle.Text = player.Name
		new.PlayerName.NameShadow.Text = player.Name
		
		-- Set player rank
		new.PlayerRank.RankTitle.Text = player:GetRoleInGroup(config.GroupID)
		new.PlayerRank.RankTitle.TextColor3 = player.TeamColor.Color
		new.PlayerRank.RankShadow.Text = player:GetRoleInGroup(config.GroupID)
		
		-- Set divisions, if any
	
	end)

end)
