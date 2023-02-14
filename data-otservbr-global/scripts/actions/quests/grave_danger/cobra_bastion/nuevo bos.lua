local info = {
	bossName = "The Moonlight Aster",
	middle = Position(32940, 32679, 2), -- lugar antes de entrar a la sala del boss
	fromPos = Position(32940, 32676, 2), -- area norte para limpiar sala
	toPos = Position(32946, 32682, 2), -- area surth para limpiar sala
	exitPos = Position(32949, 32679, 2),
	timer = Storage.GraveDanger.CobraBastion.ScarlettTimer,

}

local nuevoboss1 = Action()
function nuevoboss1.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local playersTable = {}
	if item:getUniqueId() == 40128 then
		if player:doCheckBossRoom(info.bossName, info.fromPos, info.toPos) then
			for x = info.middle.x - 1, info.middle.x + 1 do
				for y = info.middle.y - 1, info.middle.y + 1 do
					local sqm = Tile(Position(x, y, 2))
					if sqm and sqm:getGround():getId() == 18013 then
						local player_ = sqm:getTopCreature()
						if player_ and player_:isPlayer() then
							if player_:getStorageValue(info.timer) > os.time() then
								player_:getPosition():sendMagicEffect(CONST_ME_POFF)
								player_:sendCancelMessage('You are still exhausted from your last battle.')
								return true
							end
							table.insert(playersTable, player_:getId())
						end
					end
				end
			end
			for _, p in pairs(playersTable) do
				local nPlayer = Player(p)
				if nPlayer then
					nPlayer:teleportTo(Position(32945, 32679, 2)) -- posicion de la sala donde el player es teletrasportado
					nPlayer:setStorageValue(info.timer, os.time() + 1*1*1)
				end
			end
			local scarlett = Game.createMonster("The Moonlight Aster", Position(32941, 32679, 2))

			addEvent(kickPlayersAfterTime, 30*60*1000, playersTable, info.fromPos, info.toPos, info.exitPos)
		end
	end
	return true
end

nuevoboss1:uid(40128)
nuevoboss1:register()