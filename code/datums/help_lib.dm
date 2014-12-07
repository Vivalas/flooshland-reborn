atom
	var/secret = 0 //won't show up in help library, rather pointless since this is open source... hm....
	var/detailed_desc = "" //detailed description found in help lib verb

var/list/lib_objects = list()

proc/build_lib_dir()
	for(var/i in typesof(/mob))
		lib_objects += new i
	for(var/i in typesof(/obj/game))
		lib_objects += new i



mob/verb/Help()
	var/dat
	for(var/atom/A in lib_objects)
		if(A.secret||!A.detailed_desc) continue
		dat += "<B><h1>[A.name]</h1></B><HR>"
		dat += "[A.detailed_desc]<BR>"
		usr << browse(dat, "window=help;can_resize=0;size=700x400")


//LIBRARY DEFINITIONS
mob

	standard/floosh
		detailed_desc = "What you are, basically, they have many special powers. They have a special \
		 gland in their chest called the Elexis that converts waste into useful chemicals. Not even CO2 from cellular processes \
		  is wasted. As such, Flooshae have no kidneys or liver, and no not have to urinate or crap. \
		   There are also many other special features that Flooshae have, like the ability to digest nearly anything, l\
		    and amazing regenerative powers."


obj
	game/item/organ/heart
		detailed_desc = "An organ in most organisms used to pump and circulate a bodily fluid known as blood, which acts \
		as a medium for transport of gases and reagents around the body."

	game/item/organ/brain
		detailed_desc = "An organ in almost all organisms that controls and regulates bodily function. Damage to this \
		is usually very catastrophic and is the only cause of death. Damage to the brain can be impaired via \
		blunt trauma, loss of oxygen, and toxins in the blood stream. Of course, decapitation and other things \
		will also kill you."
