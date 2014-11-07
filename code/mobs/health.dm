
mob/proc/Die()
	dead = 1
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

	if(!oxygen)
		oxy += rand(2,5) + dev_oxy
		if(prob(4))
			src << "\red You gasp for air!"
			Emote("gasps for air")

	var/dmg = oxy + tox + brute + burn
	if(stunned)
		stunned -= rand(0,3)
		if(stunned < 0)
			stunned = 0
		if(!stunned)
			src << "\green You recover."
	switch(dmg)
		if(60 to 100)
			move_delay = 5
		if(101 to 150)
			if(prob(8))
				if(stance)

					FallDown()
					Emote("collapses")
					src << "\red\bold You collapse."
			if(prob(8))
				Emote("mumbles")
			oxy += rand(1,2)

		if(151 to 199)
			if(prob(8))
				if(!stunned)
					Stun(rand(3,10))
			if(prob(8))
				if(stance)

					FallDown()
					Emote("collapses")
					src << "\red\bold You collapse."
			if(prob(8))
				Emote("mumbles")
			oxy += rand(1,2)
	if(dmg >= 200)
		Die()

	switch(radiation)
		if(1 to 100)
			if(prob(5))
				Emote("shivers")
			tox += rand(0,1)
		if(101 to 300)
			if(prob(4))
				Emote("shivers")
			if(prob(2)&&stance)
				Emote("collapses")
				stunned = 10
				FallDown()
			if(prob(4))
				Emote("vomits")
				new/obj/effect/vomit(loc)
			tox += rand(0,2)
	if(radiation > 300)
		if(prob(10))
			Emote("vomits")
			new/obj/effect/vomit(loc)
		if(prob(6))
			Emote("shivers")
		if(prob(4)&& stance)
			Emote("collapses")
			stunned = 20
			FallDown()
		tox += rand(0,3)
	if(radiation)
		radiation--
	UpdateStat()

