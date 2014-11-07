mob/Login()
	Init_Gui()
	loc = locate(start_x,start_y,start_z)

	..()


mob/var/pref_list[] = list()

mob/other/new_player/Login()
	var/datum/preferences/D = new
	pref_list += D
	D.SetupScreen()
	..()



