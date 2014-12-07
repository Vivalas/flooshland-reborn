
mob/proc/Die()
	dead = 1
	UpdateStat()
	FallDown()
	src << "\red\bold YOU HAVE DIED! \red\bold"
	Emote("gasps one last breath as they fall to the ground and stiffen")
	if(key)
		var/mob/other/ghost/G = new(loc)
		src.client.mob = G




mob/proc/Stun(N)
	stunned = N
	FallDown()
	src << "\red\bold You stutter and drop to the floor."
	Emote("shakes wildly and drops to the floor.")


mob/proc/Irradiate(var/N)
	if(N > radiation)
		radiation = N


mob/proc/life_process() //this handles all the bleeding, damaging, suffocating, etc. of the mob
	if(dead)
		return

	if(blood < 3000)
		if(prob(4))
			src << "\red You feel lightheaded."
	if(blood_loss)
		blood -= rand(blood_loss - 5, blood_loss + 5) //for variation
		dev_oxy = ((blood * 100)/def_blood)

	var/suc = 0
	for(var/datum/organ/crucial in crucial_organs) //make sure we have all of our vital organs
		for(var/datum/organ/active in organs.organs)
			if(active.alive && active.type == crucial.type)
				suc++

	if(suc < crucial_organs.len) Die() //not having one of your crucial organs instantly kills you




	for(var/datum/organ/active in organs.organs)
		active.on_life()




	var/dmg = blunt + tissue + toxic

	if(dmg >= crit_threshold)
		brain += 0.5

	if(brain >= brain_death_threshold)
		Die()

	if(atonement) Magick() //no mana fro you you muggle you
