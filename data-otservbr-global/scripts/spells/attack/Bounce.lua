local combats = {}
local spellConfig = {
    combat = COMBAT_DEATHDAMAGE,
    distanceEffect = CONST_ANI_DEATH,
    effect = CONST_ME_MORTAREA,
    bounces = {
        max = 7,
        chance = 40,
        baseMult = 0.1,
        levelMult = 0.1,
        magicMult = 0.1
    }
}
for i = 1, spellConfig.bounces.max do
    combats[i] = Combat()
    combats[i]:setParameter(COMBAT_PARAM_TYPE, spellConfig.combat)
    combats[i]:setParameter(COMBAT_PARAM_EFFECT, spellConfig.effect)
    function onGetFormulaValues(player, level, magicLevel)
        local min = ((level * (1.0 + (spellConfig.bounces.levelMult * i))) + (magicLevel * (1.0 + (spellConfig.bounces.magicMult * i)))) * (1.0 + (spellConfig.bounces.baseMult * i))
        local max = ((level * (1.2 + (spellConfig.bounces.levelMult * i))) + (magicLevel * (1.2 + (spellConfig.bounces.magicMult * i)))) * (1.2 + (spellConfig.bounces.baseMult * i))
        return -min, -max
    end
    combats[i]:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
end
local function getClosedTarget(player, cid, targets)
    local targets = targets or {}
    if #targets >= spellConfig.bounces.max then
        return targets
    end
    local c = Creature(cid)
    if c then
        targets[#targets +1] = cid
        local spectators = Game.getSpectators(c:getPosition(), false, false, 4, 4, 4, 4)
        table.sort(spectators, function(a, b) return a:getPosition():getDistance(c:getPosition()) < b:getPosition():getDistance(c:getPosition()) end)
        for _, spectator in pairs(spectators) do
            local sid = spectator:getId()
            if (spectator:isMonster() or (spectator:isPlayer() and not player:hasSecureMode())) and not table.contains(targets, sid) then
                return getClosedTarget(player, sid, targets)
            end
        end
    end
    return targets
end
local spell = Spell(SPELL_INSTANT)
function spell.onCastSpell(creature, variant)
    local targets = getClosedTarget(creature, variant:getNumber())
    for i, tid in pairs(targets) do
        if i ~= 1 and math.random(100) > spellConfig.bounces.chance then
            break
        end
        addEvent(function(cid, tid, atid)
            local player = Player(cid)
            if player then
                local target = Creature(tid)
                if target then
                    if not atid then
                        player:getPosition():sendDistanceEffect(target:getPosition(), spellConfig.distanceEffect)
                    else
                        local atarget = Creature(atid)
                        if atarget then
                            atarget:getPosition():sendDistanceEffect(target:getPosition(), spellConfig.distanceEffect)
                        end
                    end
                    combats[i]:execute(creature, Variant(tid))
                end
            end
        end, 200 * i-1, creature:getId(), tid, targets[i-1])
    end
    return #targets > 0
end
spell:name("Bounce Spell")
spell:words("Ricochet Spell")
spell:group("attack")
spell:vocation("sorcerer", "druid", "paladin", "knight", "master sorcerer", "elder druid", "royal paladin", "elite knight")
spell:id(87)
spell:cooldown(1000)
spell:level(450)
spell:range(6)
spell:manaPercent(13)
spell:needTarget(true)
spell:blockWalls(true)
spell:isPremium(true)
spell:register()