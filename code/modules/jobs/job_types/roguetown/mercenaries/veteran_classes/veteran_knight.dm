/datum/advclass/veteran/calvaryman
	name = "Tarnished Knight"
	tutorial = "You were once a member of a knightly calvary regiment, a prestigious title. You were ontop of the world, the townspeople rejoiced when you rode through their streets. Now, all you can hear is the screams of your brothers-in-arms as they fell. You specialize in mounted warfare."
	outfit = /datum/outfit/job/roguetown/vet/calvaryman

	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_MEDIUMARMOR, TRAIT_STEELHEARTED, TRAIT_NOBLE)
	subclass_stats = list(
		STATKEY_CON = 2,
		STATKEY_WIL = 2,
		STATKEY_STR = 1,
		STATKEY_PER = 1,
		STATKEY_INT = 1,
		STATKEY_SPD = -1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/riding = SKILL_LEVEL_EXPERT,
	)

// You get a SAIGA. Saigas are pretty good, you lose out on your legendary weapon skills and you suck more on foot though.

/datum/outfit/job/roguetown/vet/calvaryman/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	armor = /obj/item/clothing/suit/roguetown/armor/plate/	// Former knights should have knightly armour.
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail
	head = /obj/item/clothing/head/roguetown/helmet/heavy/knight
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/plate
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes/steel
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/keyring/guardcastle = 1
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/combat/bows, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/maces, 5, TRUE) // You get a lot of weapon skills, but none are legendary. Jack of all trades, master of none. This is probably worse than just having legendary in one, as people rarely swap weapons mid-combat.
		H.adjust_skillrank_up_to(/datum/skill/combat/axes, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/polearms, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 5, TRUE)
	H.verbs |= /mob/proc/haltyell
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Retirement.")

	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Sword + Recurve Bow","Axe + Crossbow","Spear + Shield")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Sword + Recurve Bow")
				r_hand = /obj/item/rogueweapon/sword/long
				beltl = /obj/item/quiver/arrows
				beltr = /obj/item/rogueweapon/scabbard/sword
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve

			if("Axe + Crossbow")
				r_hand = /obj/item/rogueweapon/stoneaxe/woodcut/steel
				backl = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
				beltl = /obj/item/quiver/bolts

			if ("Spear + Shield")
				r_hand = /obj/item/rogueweapon/spear
				backl = /obj/item/rogueweapon/shield/tower/metal
