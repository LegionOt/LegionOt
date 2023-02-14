local itemTierClassifications = {
	-- Upgrade classification 1
	[1] = {
		-- Update tier 0
		[1] = {price = 25000}
	},
	-- Upgrade classification 2
	[2] = {
		-- Update tier 0
		[1] = {price = 750000},
		-- Update tier 1
		[2] = {price = 2500000}
	},
	-- Upgrade classification 3
	[3] = {
		[1] = {price = 2000000},
		[2] = {price = 5000000},
		[3] = {price = 10000000}
	},
	-- Upgrade classification 4
	[4] = {
		[1] = {price = 4000000},
		[2] = {price = 10000000},
		[3] = {price = 20000000},
		[4] = {price = 30000000},
		[5] = {price = 50000000},
		[6] = {price = 130000000},
		[7] = {price = 420000000},
		[8] = {price = 1300000000},
		[9] = {price = 4000000000},
		[10] = {price = 7500000000}
	}
}

for classificationId, classificationTable in ipairs(itemTierClassifications) do
	local itemClassification = Game.createItemClassification(classificationId)
	local classification = {}

	-- Registers table for register_item_tier.lua interface
	classification.Upgrades = {}
	for tierId, tierTable in ipairs(classificationTable) do
		if tierId and tierTable.price then
			table.insert(classification.Upgrades, {TierId = tierId - 1, Price = tierTable.price})
		end
	end
	-- Create item classification and register classification table
	itemClassification:register(classification)
end
