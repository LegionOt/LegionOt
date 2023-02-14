







local config = {
    duration = 1, -- tiempo que dur bloqueo de la palanca ----- para otra quest
	timeStorage = 706, -- storage que bloquea la palanca ----- para otra quest
    level_req = 10, -- minimum level to do quest
    min_players = 1, -- minimum players to join quest
    lever_id = 1945, -- id of lever before pulled
    pulled_id = 1946 -- id of lever after pulled
}




local configg = {
    maxPlayers = 0,
    room = {fromPos = Position(33146, 32280, 12), toPos = Position(33158, 32293, 12)},
    
}

function Lion2xArea()
   Game.createMonster("Katex Blood Tongue", Position(33150, 32288, 12))
   
    return 
end

local lion2 = MoveEvent()

function lion2.onStepIn(creature, item, position, fromPosition)
	local player = creature:getPlayer()
	if not player then
		return true
	end



 



---------------------///// parate para agregar a otra quest-----------------------

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

---------------------///// parate para agregar a otra quest-----------------------






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



   

	
	---------------------///// parate para agregar a otra quest-----------------------
	  if player:getStorageValue(config.timeStorage) > os.time() then
      player:sendTextMessage(22, "\n\nQuest Player Informations:\n\nThe Quest time left:\nDays: "..d.."\nHours: "..h.."\nMinutes: "..m.."\nSeconds: "..s.."")
	  player:teleportTo(fromPosition)
      return false
end

  ---------------------///// parate para agregar a otra quest-----------------------


	player:teleportTo(Position(33152, 32288, 12))
		player:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
	
      
		
		---------------------///// parate para agregar a otra quest-----------------------
		
		player:setStorageValue(config.timeStorage, os.time()+ config.duration*1*60)
		
		---------------------///// parate para agregar a otra quest-----------------------
		



  addEvent(Lion2xArea, 500)
    clearRoom(Position(33146, 32280, 12), Position(33158, 32293, 12), true)

    return true
end
	
lion2:type("stepin")
lion2:aid(65108)
lion2:register()	

