local tpkillboss = CreatureEvent("tpkillboss")
local enemyNames = {
    [1] = "Goshnar's Megalomania"
}

local function removeTeleport(position)
    local spawnedTeleport = Tile(position):getItemById(28672)
    if spawnedTeleport then
        spawnedTeleport:remove()
        position:sendMagicEffect(CONST_ME_POFF)
    end
 
    return true
end

local function formatString(s)
    s = string.gsub(s, "[%d%p%c%s]", "")
    s = s:lower()
 
    return s
end

function tpkillboss.onKill(creature, target)
    if not target or not target:isMonster() then
        return true
    end
 
    local f = false
    local t = formatString(target:getName())
    for _, v in ipairs(enemyNames) do
        if t == formatString(v) then
            f = true
        end
    end
 
    if not f then
        return true
    end

    local teleportSpawn = Position(33710, 31627, 14) -- Position for teleport to spawn
    removeTeleport(teleportSpawn)
    teleportSpawn:sendMagicEffect(CONST_ME_TELEPORT)
 
    local item = Game.createItem(28672, 1, teleportSpawn)
    if item:isTeleport() then
        local teleportTo = Position(33688, 31706, 14) -- Teleport destination
        item:setDestination(teleportTo)
    end

    target:say('Take the teleport before they disappear! 60 segund', TALKTYPE_MONSTER_SAY, 0, 0, teleportSpawn)
    addEvent(removeTeleport, 60000, teleportSpawn)
 
    return true
end
tpkillboss:register()