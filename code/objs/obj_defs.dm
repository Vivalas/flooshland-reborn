obj/game
	var/hull //"hp" of object?
	var/dres //dmg resistance?
	var/eres //explosion resistance?
	var/equip = 1 //can be picked up?
	var/weld = 0 //can be moved around?
	var/wear = 0 //can be worn?
	var/slot //applies only if said object is wearable
	var/worn //is it currently being worn?
	var/subfloor = 0 //does it go under floor tiles?



/*

Flooshland Object System:

All objects in the game that can be interacted with normally are under /obj/game


/obj/game/item is for handhelds

/obj/game/machine is for stationary objects that require power to work

/obj/game/mapping is for decoration objects and other oddities such as trees, bushes, furniture



obj/game/special is for anything else not covered here

*/