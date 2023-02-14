local recompensaLevel = CreatureEvent("recompensaLevel")

local table = 
{
	-- [level] = type = "item", id = {ITEM_ID, QUANTIDADE}, msg = "MENSAGEM"},
	-- [level] = type = "bank", id = {QUANTIDADE, 0}, msg = "MENSAGEM"},
	-- [level] = type = "addon", id = {ID_ADDON_FEMALE, ID_ADDON_MALE}, msg = "MENSAGEM"},
	-- [level] = type = "mount", id = {ID_MOUNT, 0}, msg = "MENSAGEM"},

	[80] = {type = "bank", id = {50000, 0}, msg = "congratulations you have earned 5 crystal coins directly to your bank for reaching level 80!"},	
	[100] = {type = "addon", id = {157, 153}, msg = "congratulations you have earned Beggar for reaching the level 100"},
	[140] = {type = "bank", id = {150000, 0}, msg = "congratulations you have earned 15 crystal coins directly to your bank for reaching level 140!"},
	[175] = {type = "mount", id = {370, 0}, msg = "congratulations you have earned War Bear mount for reaching the level 175"},
	[215] = {type = "bank", id = {250000, 0}, msg = "congratulations you have earned 25 crystal coins directly to your bank for reaching level 215!"},
	[240] = {type = "addon", id = {140, 132}, msg = "congratulations you have earned Nobleman for reaching the level 240"},
	[270] = {type = "bank", id = {300000, 0}, msg = "congratulations you have earned 30 crystal coins directly to your bank for reaching level 270!"},
	[305] = {type = "mount", id = {371, 0}, msg = "congratulations you have earned Black Sheep mount for reaching the level 305"},
	[320] = {type = "bank", id = {400000, 0}, msg = "congratulations you have earned 40 crystal coins directly to your bank for reaching level 320!"},
	[360] = {type = "bank", id = {800000, 0}, msg = "congratulations you have earned 80 crystal coins directly to your bank for reaching level 360!"},
	[400] = {type = "addon", id = {147, 143}, msg = "congratulations you have earned Barbarian for reaching the level 400"},
	[425] = {type = "bank", id = {1000000, 0}, msg = "congratulations you have earned 100 crystal coins directly to your bank for reaching level 452!"},
	[450] = {type = "item", id = {37317, 150}, msg = "congratulations you have earned 150 tibia coins for reaching the level 450"},
	[475] = {type = "bank", id = {1500000, 0}, msg = "congratulations you have earned 150 crystal coins directly to your bank for reaching level 475!"},
	[515] = {type = "item", id = {34109, 1}, msg = "congratulations you have earned 1 bag you desire for reaching the level 515"},
	[535] = {type = "addon", id = {270, 273}, msg = "congratulations you have earned Jester for reaching the level 535"},
	[550] = {type = "bank", id = {2000000, 0}, msg = "congratulations you have earned 200 crystal coins directly to your bank for reaching level 550!"},
	[600] = {type = "item", id = {37317, 250}, msg = "congratulations you have earned 250 tibia coins for reaching the level 600"},	
	[620] = {type = "mount", id = {387, 0}, msg = "congratulations you have earned Donkey mount for reaching the level 620"},	
	[635] = {type = "item", id = {39546, 1}, msg = "congratulations you have earned 1 primal bag for reaching the level 630"},
	[650] = {type = "mount", id = {389, 0}, msg = "congratulations you have earned Uniwheel mount for reaching the level 650"},
	[710] = {type = "item", id = {37317, 250}, msg = "congratulations you have earned 250 tibia coins for reaching the level 710"}
}

local storage = 1500

function recompensaLevel.onAdvance(player, skill, oldLevel, newLevel)

	if skill ~= SKILL_LEVEL or newLevel <= oldLevel then
		return true
	end

	for level, _ in pairs(table) do
		if newLevel >= level and player:getStorageValue(storage) < level then
			if table[level].type == "item" then	
				player:addItem(table[level].id[1], table[level].id[2])
			elseif table[level].type == "bank" then
				player:setBankBalance(player:getBankBalance() + table[level].id[1])
			elseif table[level].type == "addon" then
				player:addOutfitAddon(table[level].id[1], 3)
				player:addOutfitAddon(table[level].id[2], 3)
			elseif table[level].type == "mount" then
				player:addMount(table[level].id[1])
			else
				return false
			end
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, table[level].msg)
			player:setStorageValue(storage, level)
		end
	end
	player:save()
	return true
end

recompensaLevel:register()