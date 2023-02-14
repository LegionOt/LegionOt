local othersPlateArmor = Action()
function othersPlateArmor.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.GhostShipQuest) == 1 then
		return false
	end

	player:setStorageValue(Storage.GhostShipQuest, 1)
	player:addItem(3043, 2)
	player:addItem(9597, 1)
	player:addItem(3549, 1)
	return true
end

othersPlateArmor:aid(8752)
othersPlateArmor:register()