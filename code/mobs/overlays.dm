mob/proc/AddOverlays(obj/game/O)
	var/icon/I
	if(active_h)
		I = new('overlays.dmi',"[O.icon_state]_l")
	else
		I = new('overlays.dmi',"[O.icon_state]_r")
	overlays += I

mob/proc/RemoveOverlays(obj/game/O)
	var/icon/I
	if(active_h)
		I = new('overlays.dmi',"[O.icon_state]_l")
	else
		I = new('overlays.dmi',"[O.icon_state]_r")
	overlays -= I

mob/proc/Invert_Remove_Overlays(obj/game/O)
	var/icon/I
	if(active_h)
		I = new('overlays.dmi',"[O.icon_state]_r")
	else
		I = new('overlays.dmi',"[O.icon_state]_l")
	overlays -= I

mob/proc/Add_Clothes_Overlays(obj/game/item/O)
	var/obj/overlays/I = new
	I.icon = 'clothes.dmi'
	I.icon_state = "[O.icon_state]"
	I.layer = O.ov_layer
	overlays += I

mob/proc/Remove_Clothes_Overlays(obj/game/item/O)
	var/obj/overlays/I = new
	I.icon = 'clothes.dmi'
	I.icon_state = "[O.icon_state]"
	I.layer = O.ov_layer
	overlays -= I

obj/overlays
	layer = FLOAT_LAYER


mob/proc/FallDown()
	for(l_equip in contents)
		src.RemoveAct(l_equip)
		l_equip:loc = loc
	for(r_equip in contents)
		src.RemoveAct(r_equip)
		r_equip:loc = loc

	var/matrix/M = matrix()
	M.Turn(90)
	transform = M
	move = 0
	stance = 0
	density = 0

mob/proc/GetUp()
	var/matrix/M = matrix()
	M.Turn(0)
	transform = M
	move = 1
	stance = 1
	density = 1




