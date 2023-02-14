function chooseRandomFiendishMonster()
	local randomMonster
	for i=1, 10000 do
		randomMonster = Game.getRandomMonster()
		if randomMonster then
			local type = randomMonster:getType()
			if  type and 
			not randomMonster:getMaster() and
			not type:isRewardBoss() and
			type:Bestiaryrace() ~= BESTY_RACE_NONE and
			randomMonster:getInfluencedLevel() == 0 and
			not randomMonster:hasFoughtSinceSpawn() and
			type:BestiaryOccurrence() ~= BESTY_OCCURRENCE_COMMON and
			type:getLoot() and
			#type:getLoot() > 0 and
			not randomMonster:isFromRaid() and
			not FIENDISH_MONSTERS[randomMonster:getId()] then
				return randomMonster
			end
		end
	end
	return nil
end

function removeFiendishMonster(cid)
	local monster = Monster(cid)
	if not monster then return false end
	monster:setInfluencedLevel(0)
	FIENDISH_MONSTERS[cid] = nil
	createFiendishMonster()
	return true
end

function createFiendishMonster()
	local newMonster = chooseRandomFiendishMonster()
	if newMonster then
		newMonster:setInfluencedLevel(15)
		FIENDISH_MONSTERS[newMonster:getId()] = {os.time() + 1 * 60 * 60, addEvent(removeFiendishMonster, 1 * 60 * 60 * 1000, newMonster:getId())}
	else
		Spdlog.error("[Fiendish Monsters] Could not create a fiendish monster")
	end
end

local fiendishStartup = GlobalEvent("fiendishStartup")
function fiendishStartup.onStartup()
	for i=1, 3 do
		addEvent(createFiendishMonster, 5000)
	end
	return true
end
fiendishStartup:register()

local influencedKill = CreatureEvent("influencedKill")
function influencedKill.onKill(player, creature, lastHit)
	if not player:isPlayer() or not creature:isMonster() or creature:hasBeenSummoned() or creature:isPlayer() then
		return true
	end
	
	local influencedLevel = creature:getInfluencedLevel()
	
	if influencedLevel == 0 then
		return true
	end

	for cid, damage in pairs(creature:getDamageMap()) do
		local participant = Player(cid)
		if participant and participant:isPlayer() then
			if math.random(1, 100000) <= Exaltation_Forge.Config.Dust_Drop_Chance then
				local maxDust = participant:getMaximumDust()
				local actualDust = participant:getDust()
				participant:setDust(math.min(maxDust, actualDust + math.random(influencedLevel * Exaltation_Forge.Config.Dust_Drop_Min, influencedLevel * Exaltation_Forge.Config.Dust_Drop_Max)))
				participant:getPosition():sendMagicEffect(CONST_ME_BLUE_ENERGY_SPARK)
			end
			if influencedLevel == 15 then
				stopEvent(FIENDISH_MONSTERS[creature:getId()][2])
				FIENDISH_MONSTERS[creature:getId()] = nil
				addEvent(createFiendishMonster, 5 * 60 * 1000)
			end
			--[[if influencedLevel == 15 and math.random(1, 100000) <= Exaltation_Forge.Config.Sliver_Drop_Chance then
				participant:addItem(Exaltation_Forge.Config.Sliver_Id, 1)
				participant:getPosition():sendMagicEffect(CONST_ME_WHITE_ENERGY_SPARK)
			end]]
		end
	end

	return true
end
influencedKill:register()
