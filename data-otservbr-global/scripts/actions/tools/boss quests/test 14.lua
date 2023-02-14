local config = {
		bosses = {
		{'Imp Intruder', 'Invading Demon', 'Ravenous Beyondling', 'Rift Breacher', 'Rift Minion', 'Rift Spawn', 'Yalahari Despoiler'},
		{'Imp Intruder', 'Invading Demon', 'Ravenous Beyondling', 'Rift Breacher', 'Rift Minion', 'Rift Spawn', 'Yalahari Despoiler'},
		{'Imp Intruder', 'Invading Demon', 'Ravenous Beyondling', 'Rift Breacher', 'Rift Minion', 'Rift Spawn', 'Yalahari Despoiler'}

		
	},
	positions = {
		-- other bosses
		Position(32716, 32732, 11),
		Position(32716, 32740, 11),
		Position(32736, 32732, 11),
		Position(32736, 32741, 11),
		Position(32721, 32744, 11),
		Position(32731, 32744, 11),
		Position(32726, 32739, 11),

		Position(32716, 32732, 11),
		Position(32716, 32740, 11),
		Position(32736, 32732, 11),
		Position(32736, 32741, 11),
		Position(32721, 32744, 11),
		Position(32731, 32744, 11),
		Position(32726, 32739, 11),
		

	},
		
    duration = 1, -- time till reset, in minutes
    level_req = 1, -- minimum level to do quest
    min_players = 1, -- minimum players to join quest
    timeStorage = 722, -- id of lever before pulled
    pulled_id = 1946 -- id of lever after pulled
}

local function summonBoss(name, position)
	Game.createMonster(name, position)
	position:sendMagicEffect(CONST_ME_TELEPORT)
end


local player_positions = {
	[1] = {fromPos = Position(32676, 32743, 11), toPos = Position(32724, 32726, 11)},
	[2] = {fromPos = Position(32676, 32744, 11), toPos = Position(32725, 32726, 11)},
	[3] = {fromPos = Position(32676, 32745, 11), toPos = Position(32726, 32726, 11)},
	[4] = {fromPos = Position(32677, 32745, 11), toPos = Position(32727, 32726, 11)},
	[5] = {fromPos = Position(32677, 32744, 11), toPos = Position(32728, 32726, 11)},
	[6] = {fromPos = Position(32677, 32743, 11), toPos = Position(32724, 32727, 11)},
	[7] = {fromPos = Position(32677, 32742, 11), toPos = Position(32725, 32727, 11)},
	[8] = {fromPos = Position(32677, 32741, 11), toPos = Position(32726, 32727, 11)},
	[9] = {fromPos = Position(32676, 32742, 11), toPos = Position(32727, 32727, 11)},
	[10] = {fromPos = Position(32676, 32741, 11), toPos = Position(32728, 32727, 11)}
}


local configg = {
    maxPlayers = 0,
    room = {fromPos = Position(32716, 32729, 11), toPos = Position(32734, 32747, 11)},
    
}

function soulllll5555512345671xArea()
   Game.createMonster("The Scourge Of Oblivion", Position(32726, 32736, 11))
   
   Game.createMonster("The Devourer of Secrets", Position(32703, 32713, 11))
   
   Game.createMonster("The Spellstealer", Position(32744, 32713, 11))
   
   Game.createMonster("Brother Chill", Position(32702, 32759, 11))
   
   Game.createMonster("Brother Freeze", Position(32711, 32759, 11))
   
   Game.createMonster("The Scion of Havoc", Position(32744, 32757, 11))
 
	return	
end

local soulllllx5555512345671 = Action()
function soulllllx5555512345671.onUse(player, item, fromPosition, target, toPosition, isHotkey)



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
			addEvent(summonBoss, (i - 1) * 10 * 1000, config.bosses[i][j], config.positions[j + (i == 1 and 2 or 0)])
		end
	end
	
	addEvent(soulllll5555512345671xArea, 500)
    clearRoom(Position(32716, 32729, 11), Position(32734, 32747, 11), true)
    return true
end
	
soulllllx5555512345671:uid(64089)
soulllllx5555512345671:register()