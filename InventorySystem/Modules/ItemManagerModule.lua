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
	["Rifle"] = {
		Name = "Rifle",
		Description = "",
		Type = categories.PRIMARY,
		BasePrice = 0,
		ImageId = ""		-- To be used in displaying in GUI
	},
	
	["Thompson"] = {
		Name = "Thompson",
		Description = "",
		Type = categories.PRIMARY,
		BasePrice = 400,
		ImageId = ""
	},
	
	-------------[[ SECONDARY WEAPONS ]]-----------------
	["Luger"] = {
		Name = "Luger",
		Description = "",
		Type = categories.PRIMARY,
		BasePrice = 0,
		ImageId = "rbxassetid://10040685620"
	},
	
	["Revolver"] = {
		Name = "Revolver",
		Description = "",
		Type = categories.SECONDARY,
		BasePrice = 0,
		ImageId = "rbxassetid://10040689932"
	},

	--------------[[ MELEE WEAPONS ]]-------------------
	["Fists"] = {
		Name = "Brass Knuckles",
		Description = "",
		Type = categories.MELEE,
		BasePrice = 0,
		ImageId = "",
	},
	
	["Knife"] = {
		Name = "Knife",
		Description = "Your very first knife.",
		Type = categories.MELEE,
		BasePrice = 0,
		ImageId = "rbxassetid://10041346110",
	},
	
	["Baton"] = {
		Name = "Baton",
		Description = "",
		Type = categories.MELEE,
		BasePrice = 0,
		ImageId = "",
	},
	
	["Brass Knuckles"] = {
		Name = "Brass Knuckles",
		Description = "",
		Type = categories.MELEE,
		BasePrice = 0,
		ImageId = "",
	},

	
	--------------[[ OTHER ITEMS ]]-------------------
	["Med Kit"] = {
		Name = "Med Kit",
		Description = "",
		Type = categories.MISC,
		BasePrice = 0,
		ImageId = "",
	},
}

--[[
	Gets the given item name's information from ItemMap.
	@param itemName		String		name of item
	
	@return Dictionary that includes item informations (only 1)
--]]
function ItemManagerModule.getItemInfo(itemName: string)
	local itemInfo = ItemManagerModule.ItemMap[itemName]
	if itemInfo == nil then
		warn("[Error]: " .. itemName .. " not found in ItemMap")
	end
	
	return itemInfo
end

--[[
	Gets all of the item informations in the given array from the ItemMap.
	@param itemNames	Array	list of item names

	@return Array that includes item informations (more than 1)
--]]
function ItemManagerModule.getItemInfos(itemNames: table)
	local itemInfos = {}
	for i, itemName in ipairs(itemNames) do
		local itemInfo = ItemManagerModule.getItemInfo(itemName)
		if itemInfo then
			table.insert(itemInfos, itemInfo)
		end
	end
	
	return itemInfos
end

--[[
	From a given list of items and a category, filter items by category and retrieve
	all information of filtered items.
	Information includes description, base_price, imageID
	@param items 		Array 			List of item names that player owns
	@param category 	String			Category name
	
	@return Array of item informations
--]]
function ItemManagerModule.getItemsByCategory(items, category)
	-- No filter, return all
	if not category then
		return items
		
	-- Filter player inventory
	else
		local filteredItems = {}
		for i, itemName in ipairs(items) do
			local mappedItem = ItemManagerModule.getItemInfo(itemName)
			if mappedItem.Type == category then
				table.insert(filteredItems, mappedItem)
			end
		end
		
		return filteredItems
	end
end

--[[
	Used to retrieve equipped item information for all item categories. 
	
	@param items	Dictionary		Items equipped by a player (primary, secondary, melee, misc)
	@return Dictionary containing each equipped item information
--]]
function ItemManagerModule.getEquippedItemsInfo(items: Dictionary)
	local itemInfos = {
		Primary = nil,
		Secondary = nil,
		Melee = nil,
		Misc = nil
	}
	
	for category, itemName in pairs(items) do
		-- If equipped, get item info for that category
		if itemName ~= nil and itemName ~= "" then
			itemInfos[category] = ItemManagerModule.getItemInfo(itemName)
		end
	end
	
	return itemInfos
end

return ItemManagerModule
