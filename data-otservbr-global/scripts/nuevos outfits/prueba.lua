local pruebaoutfits2 = Action()
local str = 1001 
function pruebaoutfits2.onUse(player, item)
	if player:getStorageValue(str) < 1 then 
	
		player:addOutfit(1372, 3)
		player:addOutfit(1371, 3)
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained your new  Rascoohan Outfits and may leave the reward room now!")
		player:setStorageValue(str,1)
		else
		player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Ya tienes el Rascoohan Outfits !")	
		end 
end
pruebaoutfits2:aid(45491)
pruebaoutfits2:register()