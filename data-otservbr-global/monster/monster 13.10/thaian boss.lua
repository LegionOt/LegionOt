local mType = Game.createMonsterType("the thaian")
local monster = {}

monster.description = "a the thaian"
monster.experience = 0
monster.outfit = {
	lookTypeEx = 32695
}

monster.health = 8650
monster.maxHealth = 8650
monster.race = "blood"
monster.corpse = 32710
monster.speed = 0
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 10
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = false,
	canWalkOnFire = false,
	canWalkOnPoison = true
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{text = "Shriiiek", yell = true}
}

monster.loot = {
	{name = "Pair of Old Bracers", chance = 540},
	{name = "Luminescent Crystal Pickaxe", chance = 5000},
	{name = "gold coin", chance = 100000, maxCount = 90},
	{name = "Blue Gem", chance = 810},
	{name = "Phantasmal Hair", chance = 3400, maxCount = 2},
	{name = "Eye of the Chasm", chance = 60500},
	{name = "Death Toll", chance = 410},
	{name = "Amber", chance = 2500},
	{name = "wyvern talisman", chance = 12300}
}

monster.attacks = {
	{name ="melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -120, condition = {type = CONDITION_POISON, totalDamage = 480, interval = 4000}},
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_FIREDAMAGE, minDamage = -160, maxDamage = -240, range = 7, radius = 4, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true},
	{name ="combat", interval = 3500, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -360, maxDamage = -440, range = 7, radius = 9, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_SLASH, target = true},
	{name ="combat", interval = 2000, chance = 45, type = COMBAT_DEATHDAMAGE, minDamage = -460, maxDamage = -540, range = 7, radius = 8, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_MORTAREA, target = true},
	{name ="combat", interval = 2500, chance = 60, type = COMBAT_HOLYDAMAGE, minDamage = -600, maxDamage = -740, range = 7, radius = 6, shootEffect = CONST_ANI_HOLY, effect = CONST_ME_ORANGETELEPORT, target = true},
	
}

monster.defenses = {
	defense = 25,
	armor = 25,
	{name ="combat", interval = 2000, chance = 15, type = COMBAT_HEALING, minDamage = 45, maxDamage = 65, effect = CONST_ME_MAGIC_BLUE, target = false}
}

monster.elements = {
	{type = COMBAT_PHYSICALDAMAGE, percent = 0},
	{type = COMBAT_ENERGYDAMAGE, percent = 20},
	{type = COMBAT_EARTHDAMAGE, percent = 100},
	{type = COMBAT_FIREDAMAGE, percent = 0},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 10},
	{type = COMBAT_HOLYDAMAGE , percent = 0},
	{type = COMBAT_DEATHDAMAGE , percent = 0}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType:register(monster)
