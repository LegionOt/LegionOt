local messageBroad = CreatureEvent("messageBroad")

function messageBroad.onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)    

    local monstre = "King Tibianoss"
   
 
    if monster:getName() == monstre then
       Game.broadcastMessage("Felicidades "..killer:getName().." has matado al boss  " ..monster:getName().. " ! ")
     end
 

    return true
end
messageBroad:register()