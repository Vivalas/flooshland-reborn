turf/space
	icon = 'testicons.dmi'
	icon_state = "space"
	layer = TURF_LAYER - 2
	var/space_states = list("space","space_2","space_3","space_4","space_5","space_6")

	New()
		icon_state = pick(space_states)


		if(prob(rand(0.5,2)))
			var/mob/special/wurm/W = new
			W.loc = locate(rand(1,100),rand(1,100),1)





world
	mob = /mob/other/new_player


mob/special/wurm
	name = "spess wurm"
	icon = 'testicons.dmi'
	icon_state = "wurm"
	New()
		walk_rand(src,rand(20,200),2)




var/wurmnum




mob/special/wurm/Bumped()
	density = 0
	walk(src,0)
	flick("wurm_death",src)
	sleep(8)
	icon_state = "splat"
	wurmnum--
	world << "\blue [wurmnum] spess wurms remaining."

mob/standard/human/verb/GrowHair()
	var/list/styles = typesof(/datum/appearance/hair)
	styles.Remove(styles[styles.len]) //remove the parent type from the list
	var/style = input("Hair Style") in styles
	var/color = input("Hair Color") as color
	var/datum/appearance/hair/D = new style
	D.CreateHair(usr,color)

mob/standard/human/verb/EyeColor()
	var/datum/appearance/eyes/D = new
	var/color = input("Eye Color") as color
	D.CreateEyes(usr,color)

mob/standard/human/verb/SkinColor()
	var/datum/appearance/skin/D = new
	var/color = input("Skin Color") in list("White","Mixed","Black")
	D.CreateSkin(usr,color)

mob/standard/human/verb/ListAppearances()
	for(var/datum/appearance/D in src.appearance)
		world << "[D.name]"








proc/RemoveOverlays(mob/M,icon/I)
	M.overlays -= I


mob/verb/playsound()
	var/sound = input("Choose Sound") as file
	world << sound

mob/verb/alarm()
	world << "\bold This would ideally be the alarm sound for the ships when they are added."
	AlarmLoop() //Yes I know sounds can be repeadted by: sounds('clownhonk.ogg',1) but the alarm sound has an irregular delay at the end, which I will cut out later/

proc/AlarmLoop()
	world << 'sounds/alarm.wav'
	sleep(38) //peerfect
	AlarmLoop()

obj/game/wrench
	icon = 'icons/obj/objs.dmi'
	icon_state = "wrench"

obj/game/machines/machine
	icon = 'icons/obj/objs.dmi'
	icon_state = "machine"
	density = 1
	weld = 1
	off_state = "machine"
	on_state = "machine_on"
	on_consumption = 10000
	var/cycle = 0
	attack_hand()
		PowerToggle()

	process()
		if(!mode)
			return
		if(!powered)
			consumption = 0
			PowerToggle()
			return
		consumption = 10000
		if(cycle == 10)
			var/mob/special/wurm/W = new(get_step(src,EAST))
			viewers(src) << "\blue The machine clonks and spits out a spess wurm."
			cycle = 0
		cycle++



mob/verb/pull(atom/movable/M in view(1))
	if(!usr.ChkUse())
		return
	s_pull(M)




obj/orbit
	layer = TURF_LAYER - 1
	var/offset = 1
	bound_height = 3200
	bound_width = 3200
	proc/Orbit()
		for()
			var/icon/I = new('Orbit.png')
			I.Shift(SOUTH,offset,1)
			I.Scale(3200,3200)
			offset++
			src.icon = I
			sleep(10)

turf/map_border
	name = ""
	density = 1
	opacity = 1



