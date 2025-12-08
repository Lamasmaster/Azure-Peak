/datum/advclass/veteran/merc
	name = "Retired Mercenary"
	tutorial = "You were a sell-sword, a warrior of coin. Your pockets were never light, you always had a warm place to stay and food in your belly, but you knew that every battle could be your last. You're the last of your unit, and you can't help but regret it. You specialize in swords and polearms, or axes and polearms."
	outfit = /datum/outfit/job/roguetown/vet/merc

	subclass_languages = list(/datum/language/grenzelhoftian)
	cmode_music = 'sound/music/combat_grenzelhoft.ogg'
	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_WIL = 3,// two handed weapons require a LOT of stamina.
		STATKEY_STR = 2,
		STATKEY_CON = 1,
		STATKEY_INT = 1,
		STATKEY_SPD = -1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
	)

// Normal veteran start, from the olden days

/datum/outfit/job/roguetown/vet/merc
	has_loadout = TRUE

/datum/outfit/job/roguetown/vet/merc/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy/grenzelhoft // You do NOT get the BLACKSTEEL CUIRASS because yours BROKE & I hate you. Go on a personal quest to replace it or something.
	head = /obj/item/clothing/head/roguetown/grenzelhofthat
	armor = /obj/item/clothing/suit/roguetown/armor/plate/cuirass
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants/grenzelpants
	shoes = /obj/item/clothing/shoes/roguetown/grenzelhoft
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes/steel
	gloves = /obj/item/clothing/gloves/roguetown/angle/grenzelgloves
	beltl = /obj/item/rogueweapon/sword/short
	beltr = /obj/item/storage/keyring/guardcastle
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	H.verbs |= /mob/proc/haltyell
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Retirement.")

/datum/outfit/job/roguetown/vet/merc/choose_loadout(mob/living/carbon/human/H)
	. = ..()
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/axes, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/misc/athletics, 4, TRUE) // two handed weapons require a LOT of stamina.

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Zweihander","Halberd")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Zweihander")
				H.put_in_hands(new /obj/item/rogueweapon/greatsword/grenz)
				H.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
				H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
			if("Halberd")
				H.put_in_hands(new /obj/item/rogueweapon/halberd)
				H.adjust_skillrank(/datum/skill/combat/axes, 1, TRUE) // SO, fun fact. The description of the grenzel halbardier says they specialize in axes, but they get no axe skill. Maybe this guy is where that rumor came from.
				H.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
				H.equip_to_slot_or_del(new /obj/item/rogueweapon/scabbard/gwstrap, SLOT_BACK_L)
