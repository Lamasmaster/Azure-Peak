/datum/advclass/veteran/spy
	name = "Ex-Spy"
	tutorial = "You didn't serve on the frontlines, you were an informant, a spy, an assassin. You wove your way through enemy courts, finding information, neutralizing loose ends. You lived old in a career that many die young. It's a miracle you stand here today. You specialize in knives, whips, and stealth."
	outfit = /datum/outfit/job/roguetown/vet/spy
	subclass_languages = list(/datum/language/thievescant)
	cmode_music = 'sound/music/cmode/nobility/combat_spymaster.ogg'
	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_CICERONE, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_INT = 3,// you are int-maxxing, especially if you go old.
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1,
		STATKEY_STR = -2
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_APPRENTICE,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/lockpicking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/tracking = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/stealing = SKILL_LEVEL_EXPERT,
	)

// The sneaker. Not really typical, but hey, wildcard. Wanna-be Spymaster. I guess that just makes them a normal spy, or, once one.

/datum/outfit/job/roguetown/vet/spy/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/white
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/puritan
	pants = /obj/item/clothing/under/roguetown/tights/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes
	beltl = /obj/item/rogueweapon/whip
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel/black
	belt = /obj/item/storage/belt/rogue/leather/knifebelt/iron
	cloak = /obj/item/clothing/cloak/raincloak/mortus
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/silver/elvish = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/storage/keyring/guardcastle = 1,
		/obj/item/reagent_containers/glass/bottle/rogue/poison = 1,
		/obj/item/lockpickring/mundane,
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/combat/knives, 5, TRUE) ///Having Master Knives is extremely negligible for a singular role that isn't even meant to be combative.
		H.adjust_skillrank_up_to(/datum/skill/combat/swords, 4, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/misc/sneaking, 6, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/bows, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/misc/climbing, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/misc/stealing, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/whipsflails, 6, TRUE)
		H.change_stat(STATKEY_SPD, 1) // You get -2 speed from being old. You are still in the negative stat wise from picking old.
		H.change_stat(STATKEY_PER, 2) // You get -2 perception from being old. I want you to at least have a positive perception, to represent that you're observant. The highest perception you can get with this is a 13, so I think we'll be okayed.
	H.verbs |= /mob/proc/haltyell
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Retirement.")
