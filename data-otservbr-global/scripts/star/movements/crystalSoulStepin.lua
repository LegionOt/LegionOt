local crystalSoul = MoveEvent()

local function transformBack(pos)
	local tile = Tile(pos)
	if tile then
		local item = tile:getItemById(17868)
		if item then
			item:transform(38626)
			item:setActionId(60027)
		end
	end
end

function crystalSoul.onStepIn(creature, item, position, fromPosition)
	if not creature:isMonster() then
		return true
	end
	local name = creature:getName()
	
	if not (name == "Weak Soul" or name == "Strong Soul" or name == "Powerful Soul") then
		return false
	end
	
	if item:getId() == 38626 then
		creature:getPosition():sendMagicEffect(2)
		creature:remove()
		item:transform(17868)
		item:setActionId(60027)
		local pos = item:getPosition()
		addEvent(transformBack, 15000, pos)
	end
	
	return true
end

crystalSoul:type("stepin")
crystalSoul:aid(60027)
crystalSoul:register()