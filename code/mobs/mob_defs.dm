mob
	var/head = 1     //does the player have his head still?
	var/torso = 1    //does the player have their torso still?
	var/larm = 1	 //does the player have their left arm still?
	var/lleg = 1     //ditto
	var/rarm = 1
	var/rleg = 1
	var/abmon = 1    //abdomen?
	var/oxy = 0      //teehee SS13 med system
	var/tox = 0
	var/brute = 0
	var/burn = 0
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
	var/stance = 1
	var/melee_dmg = 0 //how much brute damage does the player do in unarmed combat
	var/def_blood = 6000
	var/blood = 6000 //mililiters of blood the player has, humans have 6 liters on average.
	var/blood_loss = 0 //In ml/s
	var/oxygen = 1 //Is the air around the mob oxygenated?
	var/dev_oxy = 0
	var/start_x
	var/start_y
	var/start_z
	var/l_icon
	var/r_icon
	var/tmp/next_click
	var/tracking_blood = 0
	var/radiation = 0
	var/attack_verb = "punches"