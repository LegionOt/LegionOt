local pruebaoutfits = Action()
local str = 1000 
function pruebaoutfits.onUse(player, item)
	if player:getStorageValue(str) < 1 then 
	
		player:addOutfit(1461, 3)
		player:addOutfit(1460, 3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained your new  Formal Dress Outfits and may leave the reward room now!")
		player:setStorageValue(str,1)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ya tienes el Formal Dress Outfits !")	
		end 
end
pruebaoutfits:aid(45495)
pruebaoutfits:register()