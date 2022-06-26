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
