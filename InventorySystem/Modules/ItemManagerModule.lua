--[[
	Contains the database of all items for the game. Stored in ServerStorage, so data is safe.
	Includes helper function to filter a set of items bsaed on their category.
--]]

local ItemManagerModule = {}

ItemManagerModule.Categories = {
	PRIMARY = "Primary",
	SECONDARY = "Secondary",
	MELEE = "Melee",
	MISC = "Misc"
}

local categories = ItemManagerModule.Categories

ItemManagerModule.ItemMap = {
	-------------[[ PRIMARY WEAPONS ]]-----------------
	["Luger"] = {
		Name = "Luger",
		Description = "Your very first weapon.",
		Type = categories.PRIMARY,
		BasePrice = 400,
		ImageId = "rbxassetid://10040685620"		-- To be used in displaying in GUI
	},
	-------------[[ SECONDARY WEAPONS ]]-----------------
	["Revolver"] = {
		Name = "Revolver",
		Description = "A good secondary weapon.",
		Type = categories.SECONDARY,
		BasePrice = 100,
		ImageId = "rbxassetid://10040689932"
	},

	--------------[[ MELEE WEAPONS ]]-------------------
	["Knife"] = {
		Name = "Knife",
		Description = "Your very first knife.",
		Type = categories.MELEE,
		BasePrice = 0,
		ImageId = "rbxassetid://10041346110",
	},

	--------------[[ OTHER ITEMS ]]-------------------
	
}

--[[
	From a given itemName and category, retrieve information about that item.
	Information includes description, base_price, imageID
	@param items 		Dictionary 		Represents a player's inventory which we want to filter by category.
	@param category 	String			Category name
	
	@return Array of item informations
--]]
function ItemManagerModule.filterItemsByCategory(items, category)
	-- No filter, return all
	if not category then
		return items
		
	-- Filter player inventory
	else
		local filteredItems = {}
		for itemName, _ in pairs(items) do
			local mappedItem = ItemManagerModule.ItemMap[itemName]
			if not mappedItem then
				warn("Error: Item name of ".. itemName .. " not found in ItemManagerModule")
			else
				if mappedItem.Type == category then
					table.insert(filteredItems, mappedItem)
				end
			end
		end
		return filteredItems
	end
end

return ItemManagerModule
