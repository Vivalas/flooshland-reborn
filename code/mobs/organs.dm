datum/organs
	var/mob/holder
	var/list/organs = list()




datum/organ
	var/organs/holder
	var/mob/owner

	var/name = "Organ" //the name of the organ as displayed when out of body
	var/obj/game/item/organ/physical //the object the organ is when out of the body
	var/health = 100 //the health of the organ
	var/alive = 1 //is the organ alive?

	proc/on_life() //code that gets run on the host mob's life tick
		if(!alive)
			return



//UNIVERSAL ORGANS (that /most/ creatures /should/ have)


datum/organ/brain
	name = "Brain"
	health = 50


datum/organ/heart
	name = "Heart"
