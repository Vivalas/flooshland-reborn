/* The Glourious Section of the code devoted to appearances. How "neat" and "organized". So far this will only work on humans,
 which is fine until we add more races. Then we can adapt this for every race which shouldn't be too much of a chore. Shouldn't is the keyword. :)
 ~Vivalas
 */



datum/appearance //used for all overlays for character customization
	var/name
	var/mob/owner//who the appearance belongs to

	hair //used for hair style and color (in retrospect this is only used for an easy reference to who the datum applies to, rather than a means of organization, since BYOND garbage collects unused datums anyways.)

	eyes //used for eye color

	skin //used for skin color

	proc/ManageList(mob/standard/human/H) //deleted multiple appearances of the same type in a mob
		for(var/datum/appearance/D in H.appearance)
			if(D == src)
				continue
			if(istype(D,src))
				H.appearance -= D
			if(D.parent_type == src.parent_type && D.parent_type == /datum/appearance/hair) //just because hair is it's own subtype
				H.appearance -= D //No the overlay for that hair style does not get removed, since it will be a long time
								  //before I add the equivilant of the SS13 mirror, so we don't worry about multiple hair overlays atm









datum/appearance/hair
	proc/CreateHair(mob/standard/human/M,h_color) //Adds a hair style to a human and colors it.
		owner = M
		color = h_color
		M.appearance += src
		var/icon/I = new('appearance_human.dmi',"[icon_s]")
		I += h_color
		//I += ConvertHairColor(h_color) /Oh look there is this new thing called the color input. How usefull.
		M.overlays += I
		ManageList(M)

	proc/ConvertHairColor(h_color) //Converts text strings to their respective hues.
		switch(h_color)
			if("Brown") return rgb(100,10,10)
			if("Hazel") return rgb(150,100,0)
			if("Blonde") return rgb(200,150,50)
			if("Red") return rgb(200,0,0)
			else return rgb(0,0,0)


	var/icon_s
	var/color



//Hair Styles
	short
		name = "Short Hair"
		icon_s = "short_h"

	block
		name = "Block Hair"
		icon_s = "block_h"

	ponytail
		name = "Ponytail"
		icon_s = "ponytail_h"

	ponytail_2
		name = "Ragged Ponytail"
		icon_s = "ponytail_2_h"


datum/appearance/eyes
	var/color

	proc/CreateEyes(mob/standard/human/M,e_color)
		owner = M
		color = e_color
		name = "[e_color] Eyes"
		M.appearance += src
		var/icon/I = new('appearance_human.dmi',"eyes")
		I += e_color
	//	I += ConvertEyeColor(e_color)
		M.overlays += I
		ManageList(M)

	proc/ConvertEyeColor(e_color)
		switch(e_color)
			if("Demented") return rgb(255,0,0)
			if("Brown") return rgb(100,10,10)
			if("Hazel") return rgb(150,100,0)
			if("Green") return rgb(0,255,0)
			if("Blue") return rgb(0,0,255)
			if("Black") return rgb(0,0,0)



datum/appearance/skin
	var/color

	proc/CreateSkin(mob/standard/human/M,s_color)
		owner = M
		color = s_color
		name = "[s_color] Skin"
		M.appearance += src
		M.icon = null
		var/icon/I = new('human.dmi',"up")
		ConvertSkinColor(I,s_color) //But we can't have wierd colored humans so players get to choose from this wonderfully
		M.icon = I					//stereotypical tri-color list.
		ManageList(M)

	proc/ConvertSkinColor(icon/I,s_color)
		switch(s_color)
			if("Mixed") return I.MapColors(rgb(135,80,35),rgb(135,80,35),rgb(165,110,35),rgb(0,0,0)) //This took forever to "perfect" and it stills looks horrible. Dont' judge, fix if you can.
			if("Black") return I.MapColors(rgb(50,10,10),rgb(50,10,10),rgb(50,10,10),rgb(0,0,0))













