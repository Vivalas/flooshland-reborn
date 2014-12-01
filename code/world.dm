world
	loop_checks  = 0
	mob = /mob/other/new_player
	turf = /turf/floor/grass

world/New() //TODO: move


turf
	New()
		if(world.time < 1)
			return
		sd_LumReset()