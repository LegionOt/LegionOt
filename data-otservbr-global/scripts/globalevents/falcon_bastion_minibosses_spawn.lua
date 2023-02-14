local offsetPosition = Position(33369, 31338, 5)

local bosses = {
	["Preceptor Lazare"] = {
		bossPosition = Position(33373, 31348, 3),
		centerPosition = Position(33373, 31348, 3),
		range = {x = 15, y = 15},
	},
	["Grand Commander Soeren"] = {
		bossPosition = Position(33376, 31320, 2),
		centerPosition = Position(33376, 31320, 2),
		range = {x = 15, y = 15},
	},
	["Grand Chaplain Gaunder"] = {
		bossPosition = Position(33370, 31327, 5),
		centerPosition = Position(33370, 31327, 5),
		range = {x = 15, y = 15},
	},
	["Grand Canon Dominus"] = {
		bossPosition = Position(33384, 31282, 6),
		centerPosition = Position(33384, 31282, 6),
		range = {x = 15, y = 15},
	},
}

local function extendedCheckIfHasBoss(name)
	local data = bosses[name]
	if not data then return false end
	local hasBoss = Creature(name)
	if not hasBoss then
		return false
	end
	local p1 = hasBoss:getPosition()
	if p1:getDistance(data.bossPosition) > 50 then
		return false
	end
	local range = data.range
	local specs = Game.getSpectators(data.bossPosition, data.centerPosition, false, false, range.x, range.x, range.y, range.y)
	for _, spec in pairs(specs) do
		if spec:getName() == name then
			return true
		end
	end
	return false
end

local falconBastionMini = GlobalEvent("falconBastionMiniBossesSpawn")
function falconBastionMini.onThink(interval, lastExecution)
    for name, data in pairs(bosses) do
		if not extendedCheckIfHasBoss(name) then
			Game.createMonster(name, data.bossPosition, true, true)
		end
	end
    return true
end

falconBastionMini:interval(900000)
falconBastionMini:register()