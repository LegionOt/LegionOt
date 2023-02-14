local jademount = Action()
function jademount.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if player:getStorageValue(Storage.PhantasmalJade) < 1 and player:getItemCount(34072) >= 4 and player:getItemCount(34073) >= 1 and player:getItemCount(34074) >= 1 then
		player:addMount(167)
		player:removeItem(34072, 4)
		player:removeItem(34073, 1)
		player:removeItem(34074, 1)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, 'You get a Phantasmal Jade to accompany you on your journey.')
		player:setStorageValue(Storage.PhantasmalJade, 1)
	else
		player:say("You already have this mount.")
	end
	return true
end

jademount:id(34072, 34073, 34074)
jademount:register()
