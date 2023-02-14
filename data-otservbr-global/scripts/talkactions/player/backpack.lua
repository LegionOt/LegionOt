local aol = TalkAction("!backpack")

function aol.onSay(player, words, param)	
    if player:removeMoneyBank(100) then
        player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
        player:addItem(2854, 1)    
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have bought an backpack for 100 gold coin!")
    else
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendCancelMessage("You do not have enough money.")
    end
end

aol:register()
