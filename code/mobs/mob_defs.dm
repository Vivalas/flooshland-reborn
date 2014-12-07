mob
//	var/head = 1     //does the player have his head still?
//	var/torso = 1    //does the player have their torso still?
	var/larm = 1	 //does the player have their left arm still?
//	var/lleg = 1     //ditto
	var/rarm = 1
//	var/rleg = 1
//	var/abmon = 1    //abdomen?
//	var/oxy = 0      //teehee SS13 med system
//	var/tox = 0
//	var/brute = 0
//	var/burn = 0
	var/blunt = 0
	var/tissue = 0
	var/toxic = 0
	var/brain = 0
	var/active_h = 1  //player's active hand
	var/l_equip       //what the player has in their left and right hands, respectively
	var/r_equip
	var/hat          //inv slots
	var/shirt
	var/oshirt
	var/shoes
	var/gloves
	var/mask
	var/back
	var/eyes
	var/ear
	var/belt
	var/torso1
	var/torso2
	var/torso3
	var/dead = 0    //is the player dead?
	var/stunned = 0 //is the player stunned?
	var/restrained = 0 //is the player restrained?
	var/move = 1       //is the player able to move?
	var/conscious = 1  //is the player conscious?
	var/stance = 1     //is the player standing up or lying down? Standing = 1
	var/melee_dmg = 0 //how much brute damage does the player do in unarmed combat
	var/def_blood = 6000
	var/blood = 6000 //mililiters of blood the player has, humans have 6 liters on average.TODO: This isn't Soujourn.. there aren't any (many) humans
	var/blood_loss = 0 //In ml/s
//	var/oxygen = 1 //Is the air around the mob oxygenated?
	var/dev_oxy = 0
	var/start_x  //co-ordinates the mob spawns at. this is mostly for testing and will be removed as it is poor...
	var/start_y
	var/start_z
	var/l_icon
	var/r_icon
	var/tmp/next_click
	var/tracking_blood = 0
	var/radiation = 0
	var/attack_verb = "punches"
	var/crit_threshold = 100 //the point at which the player begins to experience brain damage
	var/brain_death_threshold = 50 //the point at which the player dies from brain damage
	var/datum/organs/organs //the organs holder of the mob
	var/list/crucial_organs = newlist() //list of organs REUQUIRED for the mob to be alive (brain)
	var/list/starting_organs = newlist() //list of organs that is spawned into the mob when it is created
//	var/list/vital_organs = list()
	//each organ has it's own function that it regulates, without this the mob (should) start to deteriorate on its own


	//Sudden Realization: This should all probably go under /mob/standard...... Meh.. whatever.. ghosts can have ghost brains I guess
	//the point of this is that unique mobs can override the default procs and have their own whatever, so ghosts would have nothing
	//in their life loop