datum/controller/master_controller //OH YEAAAH


var/controller_generation = 0 //How many times our current MC has cycled.
var/datum/controller/master_controller //Our current controller.
var/last_tick = world.time
var/last_tick_duration = 0
var/rest_ticks = 2
var/last_processed
var/state = 0

datum/controller/master_controller
	New()
		if(master_controller)
			del(master_controller)
		master_controller = src
		Cycle()


proc/Cycle()
	state = 1
	spawn(0)
		set background = 1
		while(1)
			if(state)
				last_tick_duration = (world.time - last_tick) / 10
				last_tick = world.time
				controller_generation++


				last_processed = "Mobs"
				for(var/mob/M in world)
					M.life_process()

				sleep(rest_ticks)
				last_processed = "Misc Shit"
				for(var/obj/game/item/organ/O in world)
					O.process()



			sleep(10)


mob/Stat()
	if(statpanel("Controller"))
		stat("Last Tick Duration",last_tick_duration)
		stat("Last Processed",last_processed)
		stat("Generation",controller_generation)

