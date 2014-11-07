obj/game/attack_hand(mob/M)
	if(src in M.contents)
		if(M.l_equip == src)
			M.l_equip = null
			M.r_equip = src
		else if(M.r_equip == src)
			M.l_equip = src
			M.r_equip = null
		M.RemoveAct(src)
		M.Invert_Remove_Overlays(src)
	M.pickup(src)
