local messageBroad = CreatureEvent("messageBroad32")

function messageBroad.onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)    

    local monstre = "Bloodback"
   
 
    if monster:getName() == monstre then
       Game.broadcastMessage("Felicidades "..killer:getName().." has matado al boss  " ..monster:getName().. " ! ")
     end
 

    return true
end
messageBroad:register()