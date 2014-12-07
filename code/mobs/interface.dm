mob/verb/Say(m as text)
	if(!ChkActive())
		return
	Message(m)

mob/verb/Me(m as text)
	if(!ChkActive())
		return
	Emote(m)


mob/verb/Toggle_Stance()
	if(!ChkActive())
		return
	if(stance)
		FallDown()
	else
		GetUp()



mob/verb/Pull(atom/movable/A in view(1))
	if(!ChkActive())
		return
	if(!istype(A))
		return
	s_pull(A)



mob/verb/Examine(atom/A in view())
	if(!istype(A)) return
	if(istype(A, /area)) return
	src << "\bold [A.name] <BR> \blue[A.desc]"

mob/Stat()
	if(atonement)
		stat("<U>MAGIC</U>")
		stat("Atonement:",atonement)
		stat("Magic Level:",level)
		stat("EXP:","[magic_xp]/[level_threshold]")
		stat("EXP to next level:",level_threshold-magic_xp)
		stat("Mana:","[mana]/[max_mana]")


