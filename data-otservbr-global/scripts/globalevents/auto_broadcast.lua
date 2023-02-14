local AutoBroadCast = GlobalEvent("text")
function AutoBroadCast.onThink(interval, lastExecution)
    local messages = {

	"[Daily Exercise Reward]: Con el comando !exercise recibes un arma de entrenamiento. Puedes hacer este comando cada 12 horas, tomando el arma dependiendo de la habilidad que tenga mayor nivel, estas armas te llegaran directamente a la Inbox Store.",

    "[Exercise Weaponds]: Se cambiaron las cargas de armas de entrenamiento de [50 a 600]-[500 a 1800]-[1800 a 3600]-[14400 a 18000]",

	"[Tournament Coins]: Ahora por estar online recibes tournament tokens con el que puedes canjear por algunos articulos en la tienda.",

	"[Vocation Reward]: A partir del nivel 80+ recibiras recompensas que te ayudaran en el servidor.",

	"[Buy House]: Modificamos el comando para comprar casas ahora para poder usar este comando tienes que tener nivel 100+",

	"[Daily Reward]: No olvides cobrar tus recompensas diarias todos los dias,  asi tendras beneficios extras por estar en zona de proteccion",

	"[Ricochet Spell]: El nuevo hechizo magico Ricochet ya esta disponible para jugadores de nivel 450 o superior. Esta magia tiene un consumo de mana del 13 % con una probabilidad de rebote del 40 % y está disponible para todas las vocaciones..",

	"[Avatar Spell]: La nueva magia de avatar ya esta disponible para jugadores de nivel 300+.",
	
	"[Mount y Addons]: Las monturas y los addons se consiguen igual como en tibia rl, tienes la opcion de pagar 25kk por un Addon doll o Mount doll.",
	
	"[Donaciones]: Las donaciones favor de confirmarlas a dracoraglobal@gmail.com con su nombre de el juego y su comprobante de pago o al whatsapp +18098629012 o +19566800968. Gracias for su contribucion!",

	"[Charms y Bestiary]: Tambien contamos con el servido de charms y bestiary por pesos mexicanos, favor de ponerse en contacto con ADMIN[Dracora] para mas informacion.",

}
    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_GAME_HIGHLIGHT) 
    return true
end
AutoBroadCast:interval(300000)
AutoBroadCast:register()