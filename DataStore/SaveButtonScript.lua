-- Local Script for Save Button GUI

--[[
	For Manual Saving in GUI
		- Must have a cooldown of 10 seconds to avoid limit break
]]

local ManualSave = game:GetService("ReplicatedStorage"):WaitForChild("ManualSave")

local saveButton = script.Parent
local cooldown = 10
local canSave = true
local saving = false
saveButton.MouseButton1Click:Connect(function(player)
	-- Save
	if canSave and not saving then
		-- need to declare a "saving" variable since RemoteFunctions do not yield until a value has been returned
		saving = true
		local success, errormessage = ManualSave:InvokeServer()
		saving = false
		if success then
			print("Save successful") -- replace with GUI
			canSave = false
			wait(cooldown)
			canSave = true
		else
			print("Saved Failed")
			warn(errormessage)
		end
	end
end)
