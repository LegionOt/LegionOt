local mType = Game.createMonsterType("Megasylvan Yselda")
local monster = {}

monster.description = "Megasylvan Yselda"
monster.experience = 35000
monster.outfit = {
	lookTypeEx = 36928,
}

monster.health = 50000
monster.maxHealth = 50000
monster.race = "undead"
monster.corpse = 37107
monster.speed = 0
monster.manaCost = 0
monster.maxSummons = 4

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
	pet = false
}

monster.light = {
	level = 0,
	color = 0
}

monster.voices = {
	interval = 5000,
	chance = 10,
}

monster.loot = {
	{name = "death toll", chance = 12500},
	{name = "yellow gem", chance = 28333},
	{name = "green gem", chance = 28333},
	{name = "luminescent crystal pickaxe", chance = 300},
	{id = 37467, chance = 300},
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
	{type = COMBAT_PHYSICALDAMAGE, percent = 70},
	{type = COMBAT_ENERGYDAMAGE, percent = 70},
	{type = COMBAT_EARTHDAMAGE, percent = 70},
	{type = COMBAT_FIREDAMAGE, percent = 70},
	{type = COMBAT_LIFEDRAIN, percent = 0},
	{type = COMBAT_MANADRAIN, percent = 0},
	{type = COMBAT_DROWNDAMAGE, percent = 0},
	{type = COMBAT_ICEDAMAGE, percent = 70},
	{type = COMBAT_HOLYDAMAGE , percent = 70},
	{type = COMBAT_DEATHDAMAGE , percent = 70}
}

monster.immunities = {
	{type = "paralyze", condition = false},
	{type = "outfit", condition = false},
	{type = "invisible", condition = true},
	{type = "bleed", condition = false}
}

mType.onAppear = function(monster, creature)
	if monster:getType():isRewardBoss() then
		monster:setReward(true)
	end
end

mType:register(monster)