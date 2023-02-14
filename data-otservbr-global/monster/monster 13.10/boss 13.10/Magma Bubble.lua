local mType = Game.createMonsterType("Magma Bubble")
local monster = {}

monster.description = "Magma Bubble"
monster.experience = 80000
monster.outfit = {
	lookType = 1413,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0
}

monster.health = 500000
monster.maxHealth = 500000
monster.race = "venom"
monster.corpse = 39709
monster.speed = 320
monster.manaCost = 0

monster.changeTarget = {
	interval = 5000,
	chance = 8
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = false,
	 
}

monster.light = {
	level = 0,
	color = 0
}

monster.summon = {
	maxSummons = 6,
	summons = {
		{name = "Lava Creature", chance = 60, interval = 1000, count = 3},
		{name = "The End of Days", chance = 70, interval = 1000, count = 3},
		{name = "Unchained Fire", chance = 70, interval = 1000, count = 3}
	}
}


monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "Crystal Coin", chance = 25000, maxCount = 22},	
	{name = "Ultimate Health Potion", chance = 25000, maxCount = 8},
	{name = "Bullseye Potion", chance = 25000, maxCount = 8},
	{name = "Ultimate Spirit Potion", chance = 25000, maxCount = 8},
	{name = "Giant Topaz", chance = 25000, maxCount = 2},
	{name = "Giant Sapphire", chance = 25000, maxCount = 2},
	{name = "Berserk Potion", chance = 25000, maxCount = 8},		
	{name = "Mastermind Potion", chance = 25000, maxCount = 12},			
	{name = "Ultimate Mana Potion", chance = 25000, maxCount = 22},												
	{name = "Terra Hood", chance = 4000},
	{name = "primal bag", chance = 1000}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = -600, maxDamage = -1300},
	{name ="combat", interval = 1500, chance = 15, type = COMBAT_EARTHDAMAGE, minDamage = -500, maxDamage = -1200, radius = 3, shootEffect = CONST_ANI_ENVENOMEDARROW, target = true},
	{name ="combat", interval = 1500, chance = 25, type = COMBAT_ENERGYDAMAGE, minDamage = -300, maxDamage = -1250, length = 4, spread = 3, effect = CONST_ME_ENERGYHIT, target = false},
	{name ="combat", interval = 1500, chance = 35, type = COMBAT_DEATHDAMAGE, minDamage = -600, maxDamage = -1550, radius = 4, effect = CONST_ME_MORTAREA, target = false},
	{name ="combat", interval = 1500, chance = 20, type = COMBAT_FIREDAMAGE, minDamage = -400, maxDamage = -1250, radius = 4, effect = CONST_ME_FIREAREA, target = false}
}

monster.defenses = {
	defense = 40,
	armor = 82
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 50},
	{type = COMBAT_ENERGYDAMAGE, percent = 50},
	{type = COMBAT_EARTHDAMAGE, percent = 50},
	{type = COMBAT_FIREDAMAGE, percent = 50},
	{type = COMBAT_LIFEDRAIN, percent = 40},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 40},
	{type = COMBAT_ICEDAMAGE, percent = 50},
	{type = COMBAT_HOLYDAMAGE , percent = 50},
	{type = COMBAT_DEATHDAMAGE , percent = 40}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onThink = function(monster, interval)
end

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType.onDisappear = function(monster, creature)
end

mType.onMove = function(monster, creature, fromPosition, toPosition)
end

mType.onSay = function(monster, creature, type, message)
end

mType:register(monster)
