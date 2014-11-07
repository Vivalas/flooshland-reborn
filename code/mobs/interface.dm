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