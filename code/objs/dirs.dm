obj/game/dir
obj/game/dir/window
	icon = 'icons/obj/objs.dmi'
	icon_state = "window"

turf/Enter(mob/M)
	var/obj/game/dir/W
	for(W in contents)
		if(W.dir == M.dir) return 0
	return ..()

turf/Exit(mob/M)
	var/obj/game/dir/W
	for(W in contents)
		if(OppositeDirection(W.dir) == M.dir) return 0
	return ..()









proc/OppositeDirection(dir)
	switch(dir)
		if(NORTH) return SOUTH
		if(SOUTH) return NORTH
		if(WEST)  return EAST
		if(EAST)  return WEST






proc/Get_Rel_Dir(atom/A,atom/B)
	if(A.x > B.x) return EAST
	if(A.x < B.x) return WEST
	if(A.y > B.y) return NORTH
	if(A.y < B.y) return SOUTH