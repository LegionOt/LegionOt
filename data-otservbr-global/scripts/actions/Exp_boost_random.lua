local rewards = {
    { id = 36730, name = "exp boost 50%" },
    { id = 36731, name = "exp boost 100%" },
    { id = 36732, name = "exp boost 150%" },
    { id = 36733, name = "exp boost 200%" },
    { id = 36734, name = "exp boost 250%" }
}

local bagyouDesire = Action()

function bagyouDesire.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local randId = math.random(1, #rewards)
	local rewardItem = rewards[randId]

	player:addItem(rewardItem.id, 1)
	item:remove(1)

	player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You received a ' .. rewardItem.name .. '.')
	return true
end

bagyouDesire:id(36741)
bagyouDesire:register()
