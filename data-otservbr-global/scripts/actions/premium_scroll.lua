local vipdobrya = true -- The choice is your if you want the script work then you leave it true

local vipbrya = {
    prem_days = 5, -- Edit how many days
}



local vip30 = Action()

function vip30.onUse(cid, item, fromPosition, itemEx, toPosition)
local player = Player(cid)
local days = player:getPremiumDays()

    if days > 0 then
	
        cid:sendTextMessage(19, "You have already used this item at the end of your premium you can use it again.")
    	
	else 
	
        Player(cid):addItem(3043, 200)
		player:getPosition():sendMagicEffect(31)
		cid:addPremiumDays(vipbrya.prem_days)
        cid:sendTextMessage(19, "you have obtained +5 premium days.")
        item:remove()
    
	end
end

vip30:id(14758)
vip30:register()