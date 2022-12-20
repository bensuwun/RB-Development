--[[
	Module to create overhead GUI containing information such as:
		- Player Name, Rank
--]]

local overheadModule = {}
local bGuiProps = {
	Size = UDim2.new(12, 0, 2, 0),
	ExtentsOffset = Vector3.new(0, 4, 0),
}
local LabelProps = {
	PlayerLabelSize = UDim2.new(1, 0, 0.5, 0),
	PlayerLabelTextColor3 = Color3.new(1, 0.94902, 0.952941),
	PlayerLabelTextStrokeColor3 = Color3.new(0.0470588, 0.0470588, 0.0470588),
	RankLabelSize = UDim2.new(1, 0, 0.4, 0),
	RankLabelTextColor3 = Color3.new(0.0941176, 0.0941176, 0.0941176)
}
local groupID = 2540493

-- Create Player | Rank Overhead GUI, call on Players.PlayerAdded
function overheadModule.createOverheadGui(player)
	local bGui = Instance.new("BillboardGui")
	local playerLabel = Instance.new("TextLabel")
	local rankLabel = Instance.new("TextLabel")
	local UIListLayout = Instance.new("UIListLayout")
	local character = player.Character or player.CharacterAdded:Wait()
	local head = character:WaitForChild("Head")
	local rankName = player:GetRoleInGroup(groupID)
	
	-- Set billboard GUI properties
	bGui.Parent = character
	bGui.Adornee = head
	bGui.Size = bGuiProps.Size
	bGui.ExtentsOffset = bGuiProps.ExtentsOffset
	
	-- Set text label properties
	playerLabel.Size = LabelProps.PlayerLabelSize
	playerLabel.Text = player.Name
	playerLabel.FontFace = Font.fromEnum(Enum.Font.Roboto)
	playerLabel.FontFace.Bold = true -- doesn't work, sets to regular
	playerLabel.TextColor3 = LabelProps.PlayerLabelTextColor3
	playerLabel.TextStrokeColor3 = LabelProps.PlayerLabelTextStrokeColor3
	playerLabel.TextStrokeTransparency = 0
	playerLabel.TextScaled = true
	playerLabel.BackgroundTransparency = 1
	rankLabel.Size = LabelProps.RankLabelSize
	rankLabel.Text = rankName
	rankLabel.FontFace.Weight = Enum.FontWeight.ExtraBold
	rankLabel.TextScaled = true
	rankLabel.TextColor3 = LabelProps.RankLabelTextColor3
	rankLabel.BackgroundTransparency = 1
	
	UIListLayout.Parent = bGui
	playerLabel.Parent = bGui
	rankLabel.Parent = bGui
end


return overheadModule
