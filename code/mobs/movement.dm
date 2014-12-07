mob/Bump(atom/A)
	if(istype(A,/obj/game))
		A.Bumped(src)
	if(istype(A,/mob))
		A.Bumped(src)



atom/proc/Bumped(mob/M)



obj/game/Bumped(mob/M)
	if(weld)
		return
	var/nloc = get_step(src,M.dir)
	var/oloc = loc
	src.Move(nloc)
	M.Move(oloc)


mob/proc/s_pull(atom/movable/M)
	if(M == src)
		return
	if(!(istype(M,/obj/game)||istype(M,/mob)))
		return
	if(istype(M,/obj/game))
		if(M:weld)
			return
		if(M in src)
			return

	if(!ChkActive())
		return
	if(!pulling in view(1))
		pulling = null
	if(pulling)
		pulling = null
		return
	if(M.puller)
		M.puller = null
	pulling = M
	M.puller = src




atom/movable
	var/atom/movable/puller
	var/atom/movable/pulling

mob/Move()
	var/oloc = loc
	if(world.time < move_time)
		return
	move_time = world.time + move_delay
	if(!move)
		return
	if(!ChkActive())
		return
	if(puller)
		if(restrained&&pulling in view(1))
			return
		if(!..())
			return
		puller = null
	if(pulling)
		PullHandle(oloc)
	.=..()
	if(pulling&&oloc!=loc)
		pulling.loc = oloc


	if(tracking_blood)
		tracking_blood--
		var/obj/effect/bloody_footprints/BF = new(loc)
		BF.dir = dir



mob/proc/PullHandle(oloc)
	if(pulling)
		if(!(pulling in view(1)))
			pulling = null
			return

