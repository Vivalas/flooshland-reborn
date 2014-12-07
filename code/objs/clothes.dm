#define HAT_LAYER = 7
#define GLASSES_LAYER = 6
#define SHIRT_LAYER = 5
#define OSHIRT_LAYER = 6
#define BELT_LAYER = 7
#define SHOE_LAYER = 7
#define EAR_LAYER = 5
#define BACK_LAYER = 7
#define MASK_LAYER = 5


//for flooshland as well as Sojorun I want to implement a system where all items have the posibility of being worn, not just "clothes"
obj/game/item
	var/heat_res
	var/rad_res
	var/cold_res
	var/storage_cap
	var/ov_layer
	attack_hand(mob/M)
		if(worn)
			unequip()
		else ..()

	proc/equip(obj/game/item/O,obj/gui/inv/inv_slot)
		if(!usr.ChkUse())
			return
		if(slot != inv_slot.name)
			return
		if(usr.check_slots(O) == 0)
			return
		if(usr.active_h) usr.l_equip = null
		else usr.r_equip = null
		usr.set_slots(O)
		worn = 1
		usr.Add_Clothes_Overlays(O)
		usr.UpdateInv(O,inv_slot)

	proc/unequip()
		if(!usr.ChkUse())
			return
		if(usr.active_h) usr.l_equip = src
		else usr.r_equip = src
		worn = 0
		usr.rem_slots(src)
		usr.Remove_Clothes_Overlays(src)
		usr.UpdateAct(src)

/*obj/game/item/blue_suit
	name = "Blue Suit"
	icon_state = "blue_suit"
	slot = "shirt"
	ov_layer = 5

obj/game/item/security_suit
	name = "Security Uniform"
	icon_state = "security_suit"
	slot = "shirt"
	ov_layer = 5


obj/game/item/marine_boots
	name = "Marine Boots"
	icon_state = "marine_boots"
	slot = "shoes"
	ov_layer = 7 */


