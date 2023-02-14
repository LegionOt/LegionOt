local config = {
    [60114] = Position(33621, 31416, 10)
}

local soulWarMovimento = MoveEvent()

local storagesBosses = {
	["Goshnar's Megalomania"] = Storage.SoulWar.bossesKill.Megalomania,
}

local function bossesToDo(player)
	if not player then return end
	local toDo = {}
	for boss, storage in pairs(storagesBosses) do
		if player:getStorageValue(storage) < 1 then
			table.insert(toDo, boss)
		end
	end
	return toDo
end

function soulWarMovimento.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    
    if not player then
        return true
    end
    
    local targetPosition = config[item.uid]
    if not targetPosition then
        return true
    end
	
	local leftBosses = bossesToDo(creature)
	if #leftBosses > 0 then
		creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You need to kill the bosses: " .. table.concat(leftBosses,", "))
		creature:teleportTo(fromPosition)
		player:getPosition():sendMagicEffect(244)
		return true
	end

    player:teleportTo(Position(33621, 31409, 10))
    return true
end

soulWarMovimento:type("stepin")

for index, value in pairs(config) do
    soulWarMovimento:uid(index)
end

soulWarMovimento:register()