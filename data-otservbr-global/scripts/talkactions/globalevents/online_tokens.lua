local config = {
    storage = 30070,
    tokenItemId = 37317,
    tokensPerHour = 1,
    checkDuplicateIps = false
}

local onlineTokensEvent = GlobalEvent("GainTokenPerHour")

function onlineTokensEvent.onThink(interval)
    local players = Game.getPlayers()
    if #players == 0 then
        return true
    end

    local checkIp = {}
    for _, player in pairs(players) do
        local ip = player:getIp()
        if ip ~= 0 and (not config.checkDuplicateIps or not checkIp[ip]) then
            checkIp[ip] = true
            local seconds = math.max(0, player:getStorageValue(config.storage))
            if seconds >= 360 then
                player:setStorageValue(config.storage, 0)
                local item = player:addItem(config.tokenItemId, config.tokensPerHour)
                if item then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You received an Online Token for being online for 1 hour.")
                end
                return true
            end
            player:setStorageValue(config.storage, seconds +math.ceil(interval/10000))
        end
    end
    return true
end

onlineTokensEvent:interval(10000)
onlineTokensEvent:register()