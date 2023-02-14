local SoulWarBossesKill = CreatureEvent("SoulWarBossesKill")

local storagesBosses = {
	["Goshnar's Malice"] = Storage.SoulWar.bossesKill.Malice,
	["Goshnar's Hatred"] = Storage.SoulWar.bossesKill.Hatred,
	["Goshnar's Spite"] = Storage.SoulWar.bossesKill.Spite,
	["Goshnar's Cruelty"] = Storage.SoulWar.bossesKill.Cruelty,
	["Goshnar's Greed"] = Storage.SoulWar.bossesKill.Cruelty,
}

function SoulWarBossesKill.onDeath(creature)
	if not creature or not creature:isMonster() then
		return true
	end

	local storage = storagesBosses[creature:getName()]
	if not storage then return true end

	for pid, info in pairs(creature:getDamageMap()) do
		local tempCreature = Creature(pid)
		if tempCreature then
			if tempCreature:isPlayer() then
				tempCreature:setStorageValue(storage, 1)
			end
		end
	end

	return true
end
SoulWarBossesKill:register()