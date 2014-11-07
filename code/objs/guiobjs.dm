mob/proc/Init_Gui()   //GUI defines
mob/proc/Add_Gui_Inv()
mob/proc/Del_Gui_Inv()
mob/proc/Update_Active_Hand()
mob/proc/UpdateAct(obj/game/O)
mob/proc/RemoveAct(obj/game/O)
mob/proc/UpdateInv(obj/game/O)
mob/proc/UpdateStat()

obj/logo
	icon = 'Star_Relic_Logo.png'
	layer = 200
	density = 0
	mouse_opacity = 0


obj/gui
	icon = 'guiicons.dmi'
	layer = 100



obj/gui/expand
	icon_state = "expand"
	screen_loc = "1,1"
	var/state = 1
	proc/Expand_Gui()
		if(state)
			usr.Del_Gui_Inv()
			icon_state = "expand2"
			state = 0
			for(var/obj/game/clothes/O in usr.client.screen)
				if(O.worn)
					O.invisibility = 101
		else
			usr.Add_Gui_Inv()
			icon_state = "expand"
			state = 1
			for(var/obj/game/O in usr.client.screen)
				O.invisibility = 0

	Click()
		Expand_Gui()



obj/gui/inv/shoes
	icon_state = "shoes"
	screen_loc = "2:-4,2:-4"

obj/gui/inv/shirt
	icon_state = "shirt"
	screen_loc = "2:-4,3:-4"

obj/gui/inv/oshirt
	icon_state = "oshirt"
	screen_loc = "3:-4,3:-4"

obj/gui/inv/back
	icon_state = "back"
	screen_loc = "1:-4,3:-4"

obj/gui/inv/gloves
	icon_state = "gloves"
	screen_loc = "1:-4,4:-4"

obj/gui/inv/mask
	icon_state = "mask"
	screen_loc = "2:-4,4:-4"

obj/gui/inv/ears
	icon_state = "ears"
	screen_loc = "3:-4,4:-4"

obj/gui/inv/eyes
	icon_state = "eyes"
	screen_loc = "2:-4,5:-4"

obj/gui/inv/hat
	icon_state = "hat"
	screen_loc = "2:-4,6:-4"

obj/gui/inv/belt
	icon_state = "belt"
	screen_loc = "3:-4,1:-4"

obj/gui/act/lhand
	icon_state = "lhand"
	screen_loc = "CENTER-1:-4,1:-4"
	Click()
		usr.Set_Active_Hand(1)

obj/gui/act/rhand
	icon_state = "rhand"
	screen_loc = "CENTER+1:-4,1:-4"
	Click()
		usr.Set_Active_Hand(0)

obj/gui/act/drop
	icon_state = "drop"
	screen_loc = "EAST:-4,1:-4"
	Click()
		usr.drop(usr.Get_Active_Hand())




obj/gui/act
	var/ssloc
	New()
		ssloc = screen_loc




obj/gui/stat/stop_pull
	icon_state = "stop"
	screen_loc = "EAST-1:-4,1:-4"
	Click()
		if(!usr.pulling)
			return
		usr.s_pull(src)

obj/gui/inv
	Click()
		var/obj/game/clothes/O = usr.Get_Active_Hand()
		if(!O)
			return
		O.equip(O,src)


obj/gui/stat/status
	icon_state = "100"
	screen_loc = "EAST:-4,CENTER:-4"