mob/standard/floosh
	name = "Floosh"
	desc = "A rotund yellow creature with amazing abilities!"
	icon = 'human.dmi'
	icon_state = "up"
	melee_dmg = 5
	start_x = 61
	start_y = 39
	start_z = 1
	var/list/hud_objs = list()

	var/list/appearance = list() //list of appearances assigned to mob (hair, eyes and skin currently) This is so we don't search
								 //through all of the user's contents.



//BEGIN GUI DEFINES

	Init_Gui()
		var/gui_objs[] = typesof(/obj/gui)
		for(var/i in gui_objs)
			usr.client.screen += new i
		Update_Active_Hand() //This is better than making the lhand object start as "lhand_2" which would be yucky.


	Del_Gui_Inv()
		for(var/obj/O in src.client.screen)
			if(istype(O,/obj/gui/inv))
				del O
	Add_Gui_Inv()
		var/gui_objs[] = typesof(/obj/gui/inv)
		for(var/i in gui_objs)
			src.client.screen += new i

	Update_Active_Hand()
		var/obj/gui/act/lhand/LH = /obj/gui/act/lhand
		var/obj/gui/act/rhand/RH = /obj/gui/act/rhand
		if(active_h)
			for(LH in src.client.screen)
				LH.icon_state = "lhand_2"
				for(RH in src.client.screen)
					RH.icon_state = "rhand"

		else
			for(RH in src.client.screen)
				RH.icon_state = "rhand_2"
				for(LH in src.client.screen)
					LH.icon_state = "lhand"

	UpdateAct(obj/game/O)
		if(!O)
			return
		var/hand
		if(active_h)
			hand = /obj/gui/act/lhand
		else
			hand = /obj/gui/act/rhand
		for(var/obj/gui/G in src.client.screen)
			if(G.type != hand)
				continue
			O.layer = 101
			O.screen_loc = G.screen_loc
			src.client.screen += O
			AddOverlays(O)

	UpdateInv(obj/game/clothes/O,obj/gui/inv/inv_slot)
		for(var/obj/gui/G in src.client.screen)
			if(G.type == inv_slot.type)
				O.screen_loc = G.screen_loc
				src.client.screen += O


	RemoveAct(obj/game/O)
		src.client.screen -= O
		src.RemoveOverlays(O)
		src.Invert_Remove_Overlays(O)


	UpdateStat()
		if(!key)
			return
		for(var/obj/gui/stat/status/S in src.client.screen)
			var/health = 100 - (oxy + tox + brute + burn)
			switch(health)
				if(100)
					S.icon_state = "100"
				if(60 to 99)
					S.icon_state = "high"
				if(30 to 59)
					S.icon_state = "med"
				if(0 to 29)
					S.icon_state = "low"
				if(-99 to -1)
					S.icon_state = "crit"
				else
					S.icon_state = "dead"


//END GUI DEFINES



