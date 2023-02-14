local config = {
	[32140] = {
		timeStorage = 226,
		range = 4,
		newPos = Position(33177, 32013, 8),
		bossName = 'bloodback',
		bossPos = Position(33184, 32015, 8)
	}
}

local bloodbackEntrance = MoveEvent()

function bloodbackEntrance.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return
	end

	local teleport = config[item.actionid]
	if not teleport then
		return
	end

		 local left, d, h, m, s = (player:getStorageValue(config.timeStorage) - os.time()), 0, 1, 0, 0
		while left >= 86400 do
			left = left - 86400
			d = d+1
		end
		while left >= 3600 do
			left = left - 3600
			h = h + 1
		end
		while left >= 60 do
			left = left - 60
			m = m + 1
		end
		while left >= 1 do
			left = left - 1
			s = s+1
		end
	
	local teleport = config[item.actionid]
	if not teleport then
		return
	end
	
	if player:getStorageValue(teleport.timer) > os.time() then
		position:sendMagicEffect(CONST_ME_TELEPORT)
		player:teleportTo(fromPosition, true)
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
		player:say("se encuentra actualmente en tiempo de espera\n\nQuest Foxtail Amulet Informations:\n\nEl tiempo de espera es de:\nDays: "..d.."\nHours: "..h.."\nMinutes: "..m.."\nSeconds: "..s.." para volver a matar a bloodback ", TALKTYPE_WHISPER)
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

bloodbackEntrance:type("stepin")
bloodbackEntrance:aid(32140)
bloodbackEntrance:register()