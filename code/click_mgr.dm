/*
	Welcome to Click Manager!
	Where everything involving clicking is tied into a nice neat bundle of sanity! (which is ironic cause endlessly listening to the SS13 soundtrack
	is the only thing that allowed me to complete this file)
	~Vivalas
*/


#define CLICK_DELAY 10 //how long you must wait in between each click. SS13 uses a dynamic system that changes this based on your actions,
					  //so digging through your backpack makes a longer delay then drawing a gun. I prefer an equal delay between each
					  //action and don't want to copy more from them.

/atom/Click(location,control,params)   //Meet the middleman!
	usr.ClickOn(src, params)

/atom/DblClick(location,control,params)
	usr.DblClickOn(src,params)


mob/proc/ClickOn(var/atom/A, params)
	if(world.time < next_click)
		return
	if(!Adjacent(A))
		return
	if(!usr.ChkUse())
		return
	next_click = world.time + CLICK_DELAY
	var/atom/I = Get_Active_Item()
	if(istype(A,/mob))
		if(I)
			A.Item_Attack(I,src)
			I.PrimaryAttack(A,src)
		else UnarmedAttack(A,src)
	if(istype(A,/obj/game)||istype(A,/turf))
		if(A == I)
			A.attack_self(src)
		if(!I)
			A.attack_hand(src)
		else
			A.Item_Attack(I,src)
			if(I)
				I.PrimaryAttack(A,src)
	return




/mob/proc/DblClickOn()


/atom/proc/Adjacent(atom/ref) //bare bones
	if(get_dist(src,ref) > 1)
		return 0
	else return 1











