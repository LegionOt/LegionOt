local messageBroad = CreatureEvent("messageBroad3")

function messageBroad.onDeath(monster, corpse, killer, mostDamageKiller, unjustified, mostDamageUnjustified)    

    local monstre = "Mad Mage"
   
 
    if monster:getName() == monstre then
       Game.broadcastMessage("Felicidades "..killer:getName().." has matado al boss  " ..monster:getName().. " ! ")
     end
 

    return true
end
messageBroad:register()