local messageBroad = CreatureEvent("messageBroad33")

function messageBroad.onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)    

    local monstre = "Darkfang"
   
 
    if monster:getName() == monstre then
       Game.broadcastMessage("Felicidades "..killer:getName().." has matado al boss  " ..monster:getName().. " ! ")
     end
 

    return true
end
messageBroad:register()