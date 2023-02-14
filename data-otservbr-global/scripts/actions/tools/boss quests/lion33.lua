


local lion33 = MoveEvent()

function lion33.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo(Position(33123, 32264, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
	return true
end
lion33:type("stepin")
lion33:aid(65111)
lion33:register()