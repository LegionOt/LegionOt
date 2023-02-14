local effects = {
    {position = Position(32369, 32242, 7), text = 'Welcome to Dracora-Global!'},
	{position = Position(32365, 32236, 7), text = 'TRAINERS', effect = 201},
	{position = Position(32373, 32236, 7), text = 'NPCS', effect = 201},
    {position = Position(32369, 32238, 7), text = 'Items Iniciales!'},
	{position = Position(32357, 32226, 7), text = 'Utamo Pots! 100k!'},
	{position = Position(32357, 32225, 7), text = 'Addon doll! 25kk'},
	 
}



local animatedText = GlobalEvent("AnimatedText") 

function animatedText.onThink(interval)

    for i = 1, #effects do

        local settings = effects[i]

        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)

        if #spectators > 0 then

            if settings.text then

                for i = 1, #spectators do

                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)

                end

            end

            if settings.effect then

                settings.position:sendMagicEffect(settings.effect)

            end

        end

    end

   return true

end



animatedText:interval(4550)

animatedText:register()