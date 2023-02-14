local setting = {
	[14515] = Position(33036, 32738, 2),
	[14516] = Position(33842, 32853, 7),
	[14517] = Position(31913, 32354, 8),
	[14518] = Position(33647, 31438, 10), -- yalahar soulwar quests
	[14519] = Position(33614, 31414, 8), -- port hoper soulwar quests
	[14520] = Position(33888, 31184, 10), -- Mirrored Nightmare  
	[14521] = Position(34011, 31013, 9), -- Claustrophobic Inferno
	[14525] = Position(33686, 31599, 14), -- boss Goshnar's Malice
	[14526] = Position(33615, 31424, 10), -- back soulwar 
	[14522] = Position(33891, 31019, 8), -- Ebb and Flow
	[14527] = Position(33782, 31634, 14), -- boss edd and flow
	[14523] = Position(33973, 31043, 11), -- Rotten Wasteland
	[14524] = Position(33860, 31831, 3), -- Furious Crater 
	[14528] = Position(33873, 31849, 4),
	[14529] = Position(33864, 31846, 5),
	[14530] = Position(33864, 31857, 6),
	[14531] = Position(33783, 31665, 14),
	[14532] = Position(32342, 32221, 7),
	[14533] = Position(33627, 31431, 10),
	[14534] = Position(33535, 31443, 8),
	[14535] = Position(33545, 31444, 8),
	[14536] = Position(33485, 31435, 8),
	[14537] = Position(33482, 31452, 9),
	[14538] = Position(33571, 31467, 9),
	[14539] = Position(33557, 31467, 9),
	[14540] = Position(33538, 31440, 9),
	[14541] = Position(33550, 31440, 9),
	[14542] = Position(33541, 31411, 9),
	[14543] = Position(33530, 31410, 9),
	[14544] = Position(32601, 31863, 9),
	[14545] = Position(32601, 31867, 9),
	[14546] = Position(33802, 32701, 8),
	[14547] = Position(33803, 32702, 7),
	[14548] = Position(33803, 32702, 7),
	[14549] = Position(33220, 31704, 7),
	[14550] = Position(33898, 31887, 8),
	[14551] = Position(33850, 31814, 8),
	[14552] = Position(32728, 32876, 7),
	[14553] = Position(34043, 31719, 10),
	[14554] = Position(33329, 31332, 9),
	[14555] = Position(33329, 31332, 9),
	[14556] = Position(33526, 31015, 9),
	[14557] = Position(33547, 31000, 8),
	[14558] = Position(33775, 31345, 7),
	[14559] = Position(32210, 32298, 6),
	[14344] = Position(32179, 31240, 14),
	
	

	
}

local teleportsoul = MoveEvent()

function teleportsoul.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end

	local toPosition = setting[item.actionid]
	if not toPosition then
		return true
	end

	player:teleportTo(toPosition)
	toPosition:sendMagicEffect(CONST_ME_WATERSPLASH)
	return true
end

teleportsoul:type("stepin")

for index, value in pairs(setting) do
	teleportsoul:aid(index)
end

teleportsoul:register()
