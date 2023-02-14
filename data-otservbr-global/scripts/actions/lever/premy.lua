local c = {
    ['item'] = 14758,  --- ID of the item
    ['amount'] = 1,  ---  Price
    ['cost'] = 5000000,  ---  Item Quantity
    uniqueID = 14759  ---  Unique Id , do not forget add it on remeres map editor and on the end of this script
}

local leverBuy = Action()
function leverBuy.onUse(player, item, fromPosition, itemEx, toPosition)
  local cid = player:getId()
    if player:removeMoney(c.cost) then
            doPlayerAddItem(cid, c.item, c.amount)
            doPlayerSendTextMessage(cid, 25,"You bought ".. c.amount .."x ".. getItemName(c.item).." for ".. c.cost .." gold")
    else
            player:sendTextMessage(MESSAGE_TRADE, "You do not have enough money!")
    end
  item:transform(c[item.itemid])
    return true
end

leverBuy:uid(14759) -- Unique id added on Remeres map editor
leverBuy:register()