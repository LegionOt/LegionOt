


local lion22 = MoveEvent()

function lion22.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo(Position(33116, 32252, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
	return true
end
lion22:type("stepin")
lion22:aid(65109)
lion22:register()