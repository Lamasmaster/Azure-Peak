/datum/job/roguetown/veteran
	title = "Veteran"
	flag = VETERAN
	department_flag = WANDERERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_sexes = list(MALE, FEMALE) //same as town guard
	allowed_races = RACES_NO_CONSTRUCT //Constructs are too new to even exist long enough to be veterans, plus noble title.
	tutorial = "You've known combat your entire life. There isn't a way to kill a man you havent practiced in the tapestries of war itself. You wouldn't call yourself a hero--those belong to the men left rotting in the fields where you honed your ancient trade. You don't sleep well at night anymore, you don't like remembering what you've had to do to survive. Trading adventure for stable pay was the only logical solution, and maybe someday you'll get to lay down the blade and rest your weary body..."
	allowed_ages = list(AGE_MIDDLEAGED, AGE_OLD)
	advclass_cat_rolls = list(CTAG_VETERAN = 20)
	selection_color = JCOLOR_WANDERER
	display_order = JDO_VET
	whitelist_req = TRUE
	give_bank_account = 35
	min_pq = 5 //Should...probably actually be a veteran of at least a few weeks before trying to teach others
	max_pq = null
	round_contrib_points = 2

	cmode_music = 'sound/music/combat_veteran.ogg'
	job_subclasses = list(
		/datum/advclass/veteran/battlemaster,
		/datum/advclass/veteran/footman,
		/datum/advclass/veteran/calvaryman,
		/datum/advclass/veteran/merc,
		/datum/advclass/veteran/scout,
		/datum/advclass/veteran/spy
	)

/datum/job/roguetown/veteran/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/half/vet))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "veteran cloak ([index])"
