


local lion11 = MoveEvent()

function lion11.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo(Position(33123, 32241, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
	return true
end
lion11:type("stepin")
lion11:aid(65107)
lion11:register()