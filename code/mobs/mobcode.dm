var/list/mobs() = list()

mob
	New()
		mobs += src
		organs = new/datum/organs
		organs.organs += starting_organs
	Del()
		mobs -= src


mob/proc/ChkUse()  //checks to see if a player can use their hands
	if((larm || rarm) && (!restrained&&stance)&&ChkActive())
		return 1
	else return 0

mob/proc/drop(obj/game/O)
	if(!usr.ChkActive())
		return
	if(!O)
		return
	O.layer = OBJ_LAYER
	O.loc = usr.loc
	if(active_h)
		l_equip = null
	else
		r_equip = null
	RemoveAct(O)

mob/proc/set_slots(obj/game/O)
	switch(O.slot)
		if("shirt")
			shirt = O
		if("hat")
			hat = O
		if("oshirt")
			oshirt = O
		if("mask")
			mask = O
		if("belt")
			belt = O
		if("eyes")
			eyes = O
		if("ears")
			ear = O
		if("shoes")
			shoes = O
		if("gloves")
			gloves = O

mob/proc/rem_slots(obj/game/O)
	switch(O.slot)
		if("shirt")
			shirt = null
		if("hat")
			hat = null
		if("oshirt")
			oshirt = null
		if("mask")
			mask = null
		if("belt")
			belt = null
		if("eyes")
			eyes = null
		if("ears")
			ear = null
		if("shoes")
			shoes = null
		if("gloves")
			gloves = null

mob/proc/check_slots(obj/game/O)
	switch(O.slot)
		if("shirt")
			if(shirt)
				return 0
		if("hat")
			if(hat)
				return 0
		if("oshirt")
			if(oshirt)
				return 0
		if("mask")
			if(mask)
				return 0
		if("belt")
			if(belt)
				return 0
		if("eyes")
			if(eyes)
				return 0
		if("ears")
			if(ear)
				return 0
		if("shoes")
			if(shoes)
				return 0
		if("gloves")
			if(gloves)
				return 0
		else return 1


mob/proc/pickup(obj/game/O)
	if(ChkUse() && O.equip && !O.weld) //checks to see if you can pick stuff up, and if said object is able to be picked up
		if(active_h == 1 && !l_equip && larm)  // next  3 lines and this one check to see if your hands are full
			l_equip = O
		if(active_h == 0 && !r_equip && rarm)
			r_equip = O
		 //decides which hand to put said object into based on active hand


		contents += O //moves object off the ground and into your "contents" enabling more of its functionality
		UpdateAct(O)
mob/proc/ChkActive()  //proc to check if a player is able to do something, use this instead of ChkUse() if the action doesn't involve using your hands
	if(dead||!conscious||stunned) return 0
	else return 1

mob/proc/Switch_Active_Hand()
	if(active_h) active_h = 0
	else active_h = 1
	Update_Active_Hand()

mob/proc/Set_Active_Hand(hand)
	active_h = hand
	Update_Active_Hand()
mob/proc/Get_Active_Hand()
	var/equip

	switch(active_h)

		if(1) equip = l_equip
		if(0) equip = r_equip

	return equip


mob/proc/Get_Active_Item()
	switch(active_h)
		if(1)
			return l_equip
		if(0)
			return r_equip

mob/proc/Remove_Active_Hand()
	switch(active_h)
		if(1)
			RemoveAct(l_equip)
			l_equip = null
			for(l_equip in contents)
				del l_equip
				break
		if(0)
			RemoveAct(r_equip)
			r_equip = null
			for(r_equip in contents)
				del r_equip
				break


mob/proc/UnarmedAttack(mob/M)
	view(src) << "\red\bold [src] [attack_verb] [M]!"
	M.blunt += melee_dmg
	new/obj/effect/blood(M.loc)
	viewers(src) << 'punch3.ogg'


mob/proc/Message(M)
	if(src.ChkActive())
		viewers(src) << "\bold [name]:\bold \"[M]\""

mob/proc/Emote(M)
		viewers(src) << "\bold [name]\bold [M]"



//mob types

mob/standard //regular player controlled mobs like humans, aliens, so forth
mob/special //special mobs like antag aliens, animals, etc.
mob/other //technical mobs like AI eye, start mob (for lobby), spectators, ghosts, etc. These mobs shouldn't be in the game or interact
//with the other two mobs.






