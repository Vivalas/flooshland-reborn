world
	loop_checks  = 0


world/New() //TODO: move


turf
	New()
		if(world.time < 1)
			return
		sd_LumReset()