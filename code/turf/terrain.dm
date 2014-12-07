







turf/floor/grass
	icon = 'floors.dmi'
	icon_state = "carpet_green"
	desc = "A patch of lovely green grass."

	New()
		..()
		if(prob(10))
			icon_state = pick("grassy_2","grassy_3","grassy_4")
turf/floor/paving_tile
	icon = 'floors.dmi'
	icon_state = "paving_tile"
	desc = "A nice stone paving tile for your feet."

