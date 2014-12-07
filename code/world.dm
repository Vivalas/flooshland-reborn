world
	loop_checks  = 0
	mob = /mob/other/new_player
	turf = /turf/floor/grass

world/New()

	new/datum/controller/master_controller
	sleep(1)
	build_lib_dir()

turf
	New()
		if(world.time < 1)
			return
		sd_LumReset()