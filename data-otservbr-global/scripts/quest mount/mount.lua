local str =  2006

local mount_id = 194 

local mount = Action()
function mount.onUse(player, item, fromPosition, target, toPosition, isHotkey)

if player:getStorageValue(str) < 1 then

		player:addMount(mount_id)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Has Obtenido la montura. ")
        player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
		player:setStorageValue(str, 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Usted ya recogio su mount.")
			player:getPosition():sendMagicEffect(CONST_ME_POFF)
		end
   return true
end
	
mount:uid(42339)
mount:register()

