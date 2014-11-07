/*
		Welcome to the section of the Star Relic code devoted to the clunky character preferences.
		Clunky is Clunky.
		But it works.
		And the related datum gets recycled so there should be no clogging of the good ol' RAM.
		Hence this is good for now.
		~Vivalas
*/


datum/preferences
	var/name = "Default Joe"
	var/s_color = "White"
	var/h_color = "#000000"
	var/h_style = new/datum/appearance/hair/short
	var/e_color = "#000000"
	var/icon/preview_icon
	var/icon/preview_icon_2

datum/preferences/proc/SetupScreen()
	PreviewIcon()
	usr << browse_rsc(preview_icon,"previewicon.png")
	usr << browse_rsc(preview_icon_2,"previewicon_2.png")
	var/dat
	dat += "<B>Character Setup</B>"
	dat += "<BR><BR>Name: <A href=?src=\ref[src];name=1>[name]</A>"
	dat += "<BR>Hair Color: <A href=?src=\ref[src];hair=1>[h_color]</A>"   //Since  most players likely do not understand hexadecimal, I will replace this
	dat += "<BR>Hair Style: <A href=?src=\ref[src];hair_style=1>[h_style]</A>"
	dat += "<BR>Eye Color: <A href=?src=\ref[src];eye=1>[e_color]</A>"  //and this with little colored rectangles later on.
	dat += "<BR>Skin Color: <A href=?src=\ref[src];skin=1>[s_color]</A>"
	dat += "<img src=previewicon.png height=128 width=128 align=right><img src=previewicon_2.png height=128 width=128 align=right>"
	dat += "<B><BR><BR><A href=?src=\ref[src];finish=1>Finish</A></B>"
	usr << browse(dat,"window=Setup;can_close=0;can_minimize=0;can_resize=0;size=700x300")



datum/preferences/Topic(href, href_list)
	if(href_list["name"])
		var/o_name = name
		name = input("New Name")
		if(!name)             //stop people from having no names, which glitches the heck out of everything
			name = o_name
	if(href_list["hair"])
		h_color = input("Hair Color") as color
	if(href_list["eye"])
		e_color = input("Eye Color") as color
	if(href_list["skin"])
		s_color = input("Skin Color") in list("White","Mixed","Black")
	if(href_list["hair_style"])
		var/list/styles = list()
		for(var/H in typesof(/datum/appearance/hair))
			styles += new H
		styles -= styles[styles.len]
		h_style = input("Hair Styles") in styles
	if(href_list["finish"])
		FinishSetup()
	SetupScreen()





datum/preferences/proc/PreviewIcon()   //creates that nifty little preview icon
	var/icon/I = new('human.dmi',"up")
	var/datum/appearance/skin/S = new
	S.ConvertSkinColor(I,s_color)
	var/datum/appearance/hair/D = new h_style:type
	var/icon/H = new('appearance_human.dmi',"[D.icon_s]")
	H += h_color
	I.Blend(H,ICON_OVERLAY)
	var/icon/E = new('appearance_human.dmi',"eyes")
	E += e_color
	I.Blend(E,ICON_OVERLAY)
	preview_icon = I
	preview_icon_2 = new(I, dir = EAST)

datum/preferences/proc/FinishSetup() //finishes setup and compiles the mob with the chosen appearance
	usr << sound(null,channel=1) //turns off the lobby music
	var/mob/standard/human/M = new
	var/datum/appearance/hair/D = new h_style:type
	D.CreateHair(M,h_color)
	var/datum/appearance/eyes/E = new(M)
	E.CreateEyes(M,e_color)
	var/datum/appearance/skin/S = new(M)
	S.CreateSkin(M,s_color)
	usr << browse(null,"window=Setup")
	M.name = name
	M.key = usr.key
	del src  //destroy the preference datum, save memory, since we don't need it anymore

			//although garbage collection does this automatically. I think.


