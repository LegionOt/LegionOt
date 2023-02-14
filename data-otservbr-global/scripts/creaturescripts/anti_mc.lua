local AccForIp= 3

local creatureevent = CreatureEvent("anti_mc")

function creatureevent.onLogin(player)
	local mc = 0
	for _, check in ipairs(Game.getPlayers()) do
		if player:getIp() == check:getIp() then
			mc = mc + 1
			if mc > AccForIp then
				return false
			end
		end
	end

	if mc == AccForIp then
		player:sendTextMessage(MESSAGE_STATUS_CONSOLE_RED, "You have reached the maximum limit of " .. AccForIp .. " players per IP.")
	end

	return true
end

creatureevent:register()