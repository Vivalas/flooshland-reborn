#define TOPIC_SPAM_TIMER 3


client/Topic(href, href_list, hsrc)
	if(!usr || usr != mob)
		return

	if(next_allowed_topic_time > world.time)
		return
	next_allowed_topic_time = world.time + TOPIC_SPAM_TIMER //yes, this is an exact replica of SS13's topic system. I at least typed it out instead of copypasting.

	if( findtext(href,"<script",1,0) ) //and why not use their script injection block as well?
		return
	..()


/proc/onclose(mob/user, windowid, var/atom/ref=null)     //More cheap pickings from SS13. Why should I have to do the grunt work?
	if(!user.client) return
	var/param = "null"
	if(ref)
		param = "\ref[ref]"

	winset(user, windowid, "on-close=\".windowclose [param]\"")



/client/verb/windowclose(var/atomref as text)
	set hidden = 1
	set name = ".windowclose"


	if(atomref!="null")
		var/hsrc = locate(atomref)
		var/href = "close=1"
		if(hsrc)
			usr = src.mob
			src.Topic(href, params2list(href), hsrc)
			return




