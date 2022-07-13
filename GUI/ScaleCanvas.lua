--[[
	Sets the canvas size based on the amount of children ScrollFrame has.
  Ref: https://www.youtube.com/watch?v=2H1Gho3LOUE
--]]
local scrollFrame = script.Parent
local gridLayout = scrollFrame:WaitForChild("UIGridLayout")

scrollFrame.CanvasSize = UDim2.new(0,0,0,gridLayout.AbsoluteContentSize.Y)
scrollFrame.ChildAdded:Connect(function()
	
	-- Scale the canvas by Content Size, Offset of Frame, and Cell Padding
	scrollFrame.CanvasSize = UDim2.new(0,0,0,gridLayout.AbsoluteContentSize.Y + scrollFrame.Size.Y.Offset
		+ gridLayout.CellPadding.Y.Offset
	)
  
  -- GridLayout: scrollFrame.CanvasSize = UDim2.new(0,0,0,gridLayout.AbsoluteContentSize.Y)
end)

-------------------------[[ V2. OnPropertyChange ]]-------------------------------
local gridLayout = script.Parent:WaitForChild("UIGridLayout")
local scrollFrame = script.Parent

local absoluteSize = gridLayout.AbsoluteContentSize
scrollFrame.CanvasSize = UDim2.new(0, absoluteSize.X, 0, absoluteSize.Y + 20)

local function onContentSizeChanged()
	local absoluteSize = gridLayout.AbsoluteContentSize
	scrollFrame.CanvasSize = UDim2.new(0, absoluteSize.X, 0 , absoluteSize.Y + 20)
end

gridLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(onContentSizeChanged)
