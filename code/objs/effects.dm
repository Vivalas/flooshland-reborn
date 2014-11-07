obj/effect/blood
	mouse_opacity = 0
	icon = 'effects.dmi'
	icon_state = "splatter_1"

	New()
		var/list/states = list("splatter_1","splatter_2","splatter_3","splatter_4")
		icon_state = pick(states)


	proc/blood_track(mob/M)
		M.tracking_blood = 8

obj/effect/bloody_footprints
	mouse_opacity = 1
	icon = 'effects.dmi'
	icon_state = "blood_fprints"


obj/effect/poop
	mouse_opacity = 1
	icon = 'effects.dmi'
	icon_state = "poop_1"
	layer = MOB_LAYER + 1


obj/effect/vomit
	mouse_opacity = 1
	icon = 'effects.dmi'
	icon_state = "vomit"