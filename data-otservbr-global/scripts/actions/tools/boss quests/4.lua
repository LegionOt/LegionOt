local config = {
		bosses = {
		{'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros'},
		{'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros'},
		{'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros'},
		{'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros', 'Squire of Nictros'},  
		{'Retainer of Baeloc', 'Retainer of Baeloc', 'Retainer of Baeloc'}
		
	},
	positions = {
		-- other bosses
		Position(33420, 31435, 13),
		Position(33426, 31435, 13),
		Position(33420, 31441, 13),
		Position(33428, 31441, 13),
		
		Position(33423, 31439, 13),
		Position(33422, 31435, 13),
		Position(33428, 31437, 13)
		

	},
		
    duration = 1, -- time till reset, in minutes
    level_req = 1, -- minimum level to do quest
    min_players = 1, -- minimum players to join quest
    timeStorage = 704, -- id of lever before pulled
    pulled_id = 1946 -- id of lever after pulled
}

local function summonBoss(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end


local player_positions = {
    [1] = {fromPos = Position(33424, 31413, 13), toPos = Position(33422, 31432, 13)},
	[2] = {fromPos = Position(33425, 31413, 13), toPos = Position(33422, 31432, 13)},
	[3] = {fromPos = Position(33426, 31413, 13), toPos = Position(33422, 31432, 13)},
	[4] = {fromPos = Position(33427, 31413, 13), toPos = Position(33422, 31432, 13)},
	[5] = {fromPos = Position(33428, 31413, 13), toPos = Position(33422, 31432, 13)}
}


local configg = {
    maxPlayers = 0,
    room = {fromPos = Position(33421, 31432, 13), toPos = Position(33430, 31445, 13)},
    
}

function soulllll555551234567891xArea()
	Game.createMonster("Sir Baeloc", Position(33422, 31432, 13))
   
	Game.createMonster("Sir Nictros", Position(33426, 31432, 13))
 
	return	
end

local soulllllx555551234567891 = Action()
function soulllllx555551234567891.onUse(player, item, fromPosition, target, toPosition, isHotkey)



 local left, d, h, m, s = (player:getStorageValue(config.timeStorage) - os.time()), 0, 20, 0, 0
		while left >= 86400 do
			left = left - 86400
			d = d+1
		end
		while left >= 3600 do
			left = left - 3600
			h = h + 1
		end
		while left >= 60 do
			left = left - 60
			m = m + 1
		end
		while left >= 1 do
			left = left - 1
			s = s+1
		end



local function getPlayersInArea(fromPos, toPos)
    local players, playerss = {}, Game.getPlayers()
    for i = 1, #playerss do
        local player = playerss[i]
        if isInRange(player:getPosition(), fromPos, toPos) then
            table.insert(players, player)
        end
    end
    return players
end




if #getPlayersInArea(configg.room.fromPos, configg.room.toPos) > configg.maxPlayers then
        player:sendTextMessage(MESSAGE_STATUS_CONSOLE_ORANGE, 'Wait for the team to leave the room.')
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end	



    local participants, pull_player = {}, false
    for i = 1, #player_positions do
        local fromPos = player_positions[i].fromPos
        local tile = Tile(fromPos)
        if not tile then
            print(">> ERROR: Annihilator tile does not exist for Position(" .. fromPos.x .. ", " .. fromPos.y .. ", " .. fromPos.z .. ").")
            return player:sendCancelMessage("There is an issue with this quest. Please contact an administrator.")
        end

        local creature = tile:getBottomCreature()
        if creature then
            local participant = creature:getPlayer()
            if not participant then
                return player:sendCancelMessage(participant:getName() .. " is not a valid participant.")
            end

            if participant:getLevel() < config.level_req then
                return player:sendCancelMessage(participant:getName() .. " is not the required level.")
            end
			
			----------------------///////////////////aqui------------------
			 if participant:getStorageValue(config.timeStorage) > os.time() then
                return player:sendCancelMessage(participant:getName() .. " is currently on waiting time\n\nQuest Player Informations:\n\nThe Quest time left:\nDays: "..d.."\nHours: "..h.."\nMinutes: "..m.."\nSeconds: "..s.." .")
            end
			----------------------///////////////////aqui------------------

            if participant.uid == player.uid then
                pull_player = true
            end

            participants[#participants + 1] = {participant = participant, toPos = player_positions[i].toPos}
        end
    end

    if #participants < config.min_players then
        return player:sendCancelMessage("You do not have the required amount of participants.")
    end

    if not pull_player then
        return player:sendCancelMessage("You are in the wrong position.")
    end

  if player:getStorageValue(config.timeStorage) > os.time() then
      player:sendTextMessage(22, "is currently on waiting time\n\nQuest Player Informations:\n\nThe Quest time left:\nDays: "..d.."\nHours: "..h.."\nMinutes: "..m.."\nSeconds: "..s.."")
      return false
end


    for i = 1, #participants do
	
	
        participants[i].participant:teleportTo(participants[i].toPos)
        participants[i].toPos:sendMagicEffect(CONST_ME_TELEPORT)
		participants[i].participant:setStorageValue(config.timeStorage, os.time()+ config.duration*1*60)
		
		
    end
	
		for i = 1, #config.bosses do
		for j = 1, #config.bosses[i] do
			addEvent(summonBoss, (i - 1) * 60 * 1000, config.bosses[i][j], config.positions[j + (i == 1 and 2 or 0)])
		end
	end
	
	addEvent(soulllll555551234567891xArea, 500)
    clearRoom(Position(33421, 31431, 13), Position(33432, 31445, 13), true)
    return true
end
	
soulllllx555551234567891:uid(60012)
soulllllx555551234567891:register()