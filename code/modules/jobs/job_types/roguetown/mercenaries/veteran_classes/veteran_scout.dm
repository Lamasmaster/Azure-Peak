/datum/advclass/veteran/scout
	name = "Former Scout"
	tutorial = "You and your unit maneuvered ahead of the main force, ever-watchful for traps and ambushes. You never thought of what would happen should you actually walk into one. You specialize in archery and axes."
	outfit = /datum/outfit/job/roguetown/vet/scout

	category_tags = list(CTAG_VETERAN)
	traits_applied = list(TRAIT_DODGEEXPERT, TRAIT_WOODSMAN, TRAIT_STEELHEARTED)
	subclass_stats = list(
		STATKEY_PER = 3,// you are OLD you have OLD EYES. this is to counter that debuff so you can be OBSERVANT. You sacrifice your strength and armor, so.
		STATKEY_INT = 2,
		STATKEY_WIL = 1,
		STATKEY_CON = 1,
		STATKEY_SPD = 1,// You get -2 speed from being old.
		STATKEY_STR = -1
	)
	subclass_skills = list(
		/datum/skill/combat/swords = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/axes = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/shields = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_EXPERT, // I very rarely see ranged weapons outside of PVE. Maybe this'll fix that?
		/datum/skill/combat/crossbows = SKILL_LEVEL_EXPERT,
		/datum/skill/combat/whipsflails = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/sneaking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/medicine = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/tracking = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/stealing = SKILL_LEVEL_APPRENTICE,
	)

// Originally was meant to be a horse archer. I decided that was a bad idea.
// Former Bogmaster maybe? I feel like that'd be cooler than just an archer guy.

/datum/outfit/job/roguetown/vet/scout/pre_equip(mob/living/carbon/human/H)
	neck = /obj/item/clothing/neck/roguetown/gorget
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	pants = /obj/item/clothing/under/roguetown/trou/leather
	gloves = /obj/item/clothing/gloves/roguetown/fingerless_leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather
	saiga_shoes = /obj/item/clothing/shoes/roguetown/horseshoes
	beltl = /obj/item/quiver/arrows
	beltr = /obj/item/flashlight/flare/torch/lantern
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/longbow
	belt = /obj/item/storage/belt/rogue/leather/black
	cloak = /obj/item/clothing/cloak/half/vet
	backpack_contents = list(
		/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1,
		/obj/item/storage/keyring/guardcastle = 1,
		/obj/item/rogueweapon/scabbard/sheath = 1
		)
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/combat/bows, 6, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/swords, 5, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/axes, 6, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/combat/crossbows, 6, TRUE)
		H.adjust_skillrank_up_to(/datum/skill/misc/tracking, 6, TRUE)
		H.change_stat(STATKEY_PER, 2)
	H.verbs |= /mob/proc/haltyell
	H.cmode_music = 'sound/music/cmode/antag/combat_deadlyshadows.ogg' // so apparently this works for veteran, but not for advents. i dont know why.
	if(H.mind)
		SStreasury.give_money_account(ECONOMIC_RICH, H, "Retirement.")
