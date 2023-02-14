local backPositions = {
	{ actionId = 24999, toPos = Position(32972, 32227, 7), effect = CONST_ME_SMALLPLANTS },
	{ actionId = 25000, toPos = Position(32192, 31419, 2), effect = CONST_ME_ICEATTACK },
	{ actionId = 25001, toPos = Position(33059, 32716, 5), effect = CONST_ME_ENERGYHIT },
	{ actionId = 25002, toPos = Position(32911, 32336, 15), effect = CONST_ME_MAGIC_RED },
	{ actionId = 15004, toPos = Position(33527, 32301, 4), effect = CONST_ME_ENERGYHIT },
	{ actionId = 15002, toPos = Position(33586, 32263, 7), effect = CONST_ME_MAGIC_RED },
	{ actionId = 15001, toPos = Position(33431, 32277, 7), effect = CONST_ME_ICEATTACK },
	{ actionId = 15003, toPos = Position(33540, 32209, 7), effect = CONST_ME_SMALLPLANTS },
	{ actionId = 25003, toPos = Position(33636, 32841, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25004, toPos = Position(33544, 32912, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25005, toPos = Position(33764, 32909, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25006, toPos = Position(33546, 32912, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25007, toPos = Position(33563, 32862, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25008, toPos = Position(33548, 32913, 15), effect = CONST_ME_ICEATTACK },
	{ actionId = 25009, toPos = Position(33781, 31601, 14), effect = CONST_ME_ICEATTACK },
	{ actionId = 25010, toPos = Position(32515, 32537, 12), effect = CONST_ME_ICEATTACK },
	{ actionId = 25011, toPos = Position(33118, 32252, 10), effect = CONST_ME_ICEATTACK },
	{ actionId = 25012, toPos = Position(33137, 32353, 5), effect = CONST_ME_ICEATTACK },
	{ actionId = 25013, toPos = Position(33090, 32280, 12), effect = CONST_ME_ICEATTACK },
	{ actionId = 25014, toPos = Position(33092, 32315, 11), effect = CONST_ME_ICEATTACK },
	{ actionId = 25015, toPos = Position(33876, 31884, 8), effect = CONST_ME_ICEATTACK },
	{ actionId = 25016, toPos = Position(33852, 31820, 8), effect = CONST_ME_ICEATTACK },
	{ actionId = 25017, toPos = Position(33850, 31814, 8), effect = CONST_ME_ICEATTACK },
	{ actionId = 25018, toPos = Position(34016, 31889, 8), effect = 244 },
	{ actionId = 25019, toPos = Position(32210, 32298, 6), effect = 244 },
	{ actionId = 25020, toPos = Position(32418, 32458, 7), effect = 244 }, -- aun en test
	{ actionId = 25021, toPos = Position(32527, 32489, 11), effect = 244 },
	{ actionId = 25022, toPos = Position(33453, 31031, 8), effect = 244 },
	{ actionId = 25023, toPos = Position(32430, 32168, 8), effect = 244 },
	{ actionId = 25024, toPos = Position(33521, 31044, 8), effect = 244 },
	{ actionId = 25025, toPos = Position(33515, 31044, 8), effect = 244 },
	{ actionId = 25026, toPos = Position(32316, 31943, 7), effect = 244 },

}

local feyristExit = Action()

function feyristExit.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	for _, feyrist in pairs(backPositions) do
		if item.actionid == feyrist.actionId then
			player:teleportTo(feyrist.toPos)
			player:getPosition():sendMagicEffect(feyrist.effect)
			return true
		end
	end
end

feyristExit:aid(24999, 25000, 25001, 15002, 15004, 25002, 15001, 15003, 25003, 25004, 25005, 25006, 25007, 25008, 25009, 25010, 25011, 25012, 25013, 25014, 25015, 25016, 25017, 25018, 25019, 25020, 25021, 25022, 25023, 25024, 25025, 25026)
feyristExit:register()
