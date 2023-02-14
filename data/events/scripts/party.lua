function Party:onJoin(player)
    return true
end

function Party:onLeave(player)
    return true
end

function Party:onDisband()
    return true
end

function Party:onShareExperience(exp)
    local sharedExperienceMultiplier = 2.40 --40%
    local vocationsIds = {}

    local vocationId = self:getLeader():getVocation():getBase():getId()
    if vocationId ~= VOCATION_NONE then
        table.insert(vocationsIds, vocationId)
    end

    for _, member in ipairs(self:getMembers()) do
        vocationId = member:getVocation():getBase():getId()
        if not table.contains(vocationsIds, vocationId) and vocationId ~= VOCATION_NONE then
            table.insert(vocationsIds, vocationId)
        end

    local membersList = self:getMembers()
    local size = #membersList
        sharedExperienceMultiplier = 1.0 + ((size * (5 * (size - 1) + 10)) / 100)
    end

    return (exp * sharedExperienceMultiplier) / (#self:getMembers() + 1)
end 