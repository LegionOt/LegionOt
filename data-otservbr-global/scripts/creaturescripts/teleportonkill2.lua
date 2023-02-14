local tpkillboss = CreatureEvent("tpkillboss2")
local enemyNames = {
    [1] = "Lord Retro"
}

local function removeTeleport(position)
    local spawnedTeleport = Tile(position):getItemById(35502)
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

    local teleportSpawn = Position(33545, 31010, 15) -- Position for teleport to spawn
    removeTeleport(teleportSpawn)
    teleportSpawn:sendMagicEffect(CONST_ME_TELEPORT)
 
    local item = Game.createItem(35502, 1, teleportSpawn)
    if item:isTeleport() then
        local teleportTo = Position(33577, 31023, 15) -- Teleport destination
        item:setDestination(teleportTo)
    end

    target:say('Take the teleport before they disappear! 60 segund', TALKTYPE_MONSTER_SAY, 0, 0, teleportSpawn)
    addEvent(removeTeleport, 60000, teleportSpawn)
 
    return true
end
tpkillboss:register()