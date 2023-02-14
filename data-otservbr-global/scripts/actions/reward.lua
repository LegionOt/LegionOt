local soulredd = Action()
local str =  1641

 local rewards = {
  { item = 34082, count = 1 },
  { item = 34083, count = 1 },
  { item = 34084, count = 1 },
  { item = 34085, count = 1 },
  { item = 34086, count = 1 },
  { item = 34087, count = 1 },
  { item = 34088, count = 1 },
  { item = 34089, count = 1 },
  { item = 34090, count = 1 },
  { item = 34091, count = 1 },
  { item = 34092, count = 1 },
  { item = 34093, count = 1 },
  { item = 34094, count = 1 },
  { item = 34095, count = 1 },
  { item = 34096, count = 1 },
  { item = 34097, count = 1 },
  { item = 34098, count = 1 },
  { item = 34099, count = 1 }
} 

function soulredd.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	
		if player:getStorageValue(str) < 1 then
			
			
			 local random = math.random(1, #rewards)
     player:addItem(rewards[random].item, rewards[random].count)
     player:sendTextMessage(36, 'You have found '.. item:getName(rewards[random].item) ..'')
     player:sendTextMessage(36, 'You have found '.. rewards[random].item ..'')
			
			
			
			player:setStorageValue(str, 1)
		else
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Usted ya recogio esta quest.")
		end
	
	return true
end

soulredd :uid(3957)
soulredd :register()