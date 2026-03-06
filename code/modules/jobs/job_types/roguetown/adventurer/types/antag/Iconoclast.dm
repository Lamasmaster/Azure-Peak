/datum/advclass/iconoclast //Support Cleric, Heavy armor, unarmed, miracles.
	name = "Iconoclast"
	tutorial = "Even the most devout can be swayed towards the darkness, you are the living proof of it. Lead your flock through Her Fyre to their ultimate salvation - in shroud of His greatness."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ACCEPTED_RACES
	outfit = /datum/outfit/job/roguetown/bandit/iconoclast
	category_tags = list(CTAG_BANDIT)
	maximum_possible_slots = 1 // We only want one of these.
	traits_applied = list(TRAIT_HEAVYARMOR, TRAIT_CIVILIZEDBARBARIAN, TRAIT_RITUALIST)
	subclass_stats = list(
		STATKEY_STR = 2, // Less wrestling, besides got equalize for cap
		STATKEY_CON = 2,
		STATKEY_WIL = 4, // This is our Go Big stat, we want lots of stamina for miracles and WRASSLIN.
		STATKEY_LCK = 2, //We have a total of +12 in stats. 
	)
	subclass_skills = list(
		/datum/skill/combat/maces, SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/staves, SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields, SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms, SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/whipsflails, SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_MASTER,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,  // Unarmed if we want to kick ass for the lord(you do, this is what you SHOULD DO!!)
		/datum/skill/magic/holy, SKILL_LEVEL_MASTER,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/carpentry = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/craft/sewing = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN, // We can substitute for a sawbones, but aren't as good and dont have access to surgical tools
		/datum/skill/misc/athletics = SKILL_LEVEL_LEGENDARY, //We are the True Mathlete
		/datum/skill/misc/swimming = SKILL_LEVEL_EXPERT,
	)
	cmode_music = 'sound/music/Iconoclast.ogg'

/datum/outfit/job/roguetown/bandit/iconoclast/pre_equip(mob/living/carbon/human/H)
	..()
	if (!(istype(H.patron, /datum/patron/inhumen/matthios)))	//This is the only class that forces Matthios. Needed for miracles + limited slot.
		to_chat(H, span_warning("Matthios embraces me.. I must uphold his creed. I am his light in the darkness."))
		H.set_patron(/datum/patron/inhumen/matthios)
	r_hand = /obj/item/rogueweapon/woodstaff
	head = /obj/item/clothing/head/roguetown/roguehood
	armor = /obj/item/clothing/suit/roguetown/armor/plate
	beltr = /obj/item/rogueweapon/katar
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	cloak = /obj/item/clothing/cloak/raincloak/furcloak/brown
	belt = /obj/item/storage/belt/rogue/leather
	pants = /obj/item/clothing/under/roguetown/trou/leather
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(
					/obj/item/needle/thorn = 1,
					/obj/item/natural/cloth = 1,
					/obj/item/flashlight/flare/torch = 1,
					/obj/item/ritechalk = 1,
					)
	id = /obj/item/mattcoin
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_miracles(H, cleric_tier = CLERIC_T4, passive_gain = CLERIC_REGEN_MAJOR, start_maxed = TRUE)	//Starts off maxed out.
