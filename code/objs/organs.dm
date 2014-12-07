obj/game/item/organ
	icon = 'organs.dmi'
	desc = "Yuck, this should probably be inside the body!"
	var/health = 100

	var/alive = 1

	var/dead_icon

	proc/process()
		if(!alive)
			return
		health--
		if(health <= 0)
			alive = 0
			if(dead_icon) icon_state = dead_icon
			name = "Dead [name]"


	brain
		name = "Brain"
		icon_state = "brain"


	heart
		name = "Heart"
		icon_state = "heart"
		dead_icon = "heart_dead"
		health = 20

