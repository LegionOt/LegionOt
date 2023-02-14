


local lion44 = MoveEvent()

function lion44.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

		player:teleportTo(Position(33129, 32252, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
	return true
end
lion44:type("stepin")
lion44:aid(65113)
lion44:register()