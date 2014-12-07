#define MAGIC_BASE 50




mob
	var

		magic_xp = 0
		level = 0
		mana = 0
		atonement
		max_mana = 0
		level_threshold = 0

		datum/spell_holder/spells



	proc/Set_Threshold()
		if(!level||!atonement)
			return //this shouldn't happen, panic now

		var/nl = 50
		var/i
		var/add_on = MAGIC_BASE

		for(i=1,i<level,i++)
			add_on *= 2
			nl += add_on

		return nl


	proc/Level_Up()
		level++
		level_threshold = Set_Threshold()
		max_mana = 150 * level

	proc/Gain_Exp(var/N)
		magic_xp += N
		if(magic_xp >= level_threshold)
			src << "\blue You feel enlightened.."
			Level_Up()

	proc/Magick()
		mana = min(mana + level,max_mana)

	proc/CastSpell()
		set name = "Cast Spell"
		set category = "Magic"

		var/spell = input("Choose spell to cast.") in spells.spells



		if(atonement != spell:alignment)
			src << "\red You are not educated in the ways of [spell:alignment]"
			return
		if(mana <= spell:mana_cost)
			src << "\red You feel to weak to cast this spell."
			return
		Gain_Exp(rand(spell:min_xp,spell:max_xp))
		mana -= spell:mana_cost

		spell:Cast(src)




	proc/Init_Magic()
		level = 1
		max_mana = 150
		mana = 150
		level_threshold = 50

		verbs += /mob/proc/CastSpell


	proc/Add_Spell(var/datum/spell/S)
		spells.spells += new S
		src << "\blue You have learned the [S] spell!"


datum/spell_holder
	var/mob/holder
	var/list/spells = list()


datum/spell
	var/name
	var/min_xp = 0
	var/max_xp = 0
	var/alignment
	var/mana_cost = 0

	proc/Cast()


datum/sphere
	var/name
	var/list/starting_spells = list()


	proc/Add_Spells(mob/M)
		if(M.atonement == name)
			M << "\blue You area already wise in the ways of [name]!"
			return
		if(!M.spells) M.spells = new/datum/spell_holder
		for(var/i in starting_spells)
			var/io = new i
			M.spells.spells += io
			M << "\blue You have learned the [io:name] spell!"
		M << "\green You are now wise in the ways of [name]!"

		M.Init_Magic()
		M.atonement = name