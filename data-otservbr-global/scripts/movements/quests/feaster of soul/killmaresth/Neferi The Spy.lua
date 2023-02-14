local config = {
	[32155] = {
		timeStorage = 234,
		range = 4,
		newPos = Position(33871, 31547, 8),
		bossName = 'Neferi The Spy',
		bossPos = Position(33872, 31552, 8)
	}
}

local NeferiTheSpy = MoveEvent()

function NeferiTheSpy.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = config[item.actionid]
	if not teleport then
		return
	end

	if player:getStorageValue(teleport.timer) > os.time() then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say('Tienes que esperar para desafiar a este enemigo de nuevo.!', TALKTYPE_MONSTER_SAY)
		return true
	end

	clearRoom(teleport.bossPos, teleport.range, teleport.range, fromPosition)
	local monster = Game.createMonster(teleport.bossName, teleport.bossPos, true, true)
	if not monster then
		return true
	end

	position:sendMagicEffect(CONST_ME_TELEPORT)
	player:teleportTo(teleport.newPos)
	player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	player:say(
		'You have ten minutes to kill and loot this boss. \z
		Otherwise you will lose that chance and will be kicked out.', TALKTYPE_MONSTER_SAY)
	addEvent(clearBossRoom, 60 * 10 * 1000, player.uid, monster.uid, teleport.bossPos, teleport.range, teleport.range, fromPosition)
	player:setStorageValue(teleport.timer, os.time() + 1 * 60)
	return true
end

NeferiTheSpy:type("stepin")
NeferiTheSpy:aid(32155)
NeferiTheSpy:register()