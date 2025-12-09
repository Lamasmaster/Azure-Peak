/datum/crafting_recipe/roguetown/armorsmithing
	abstract_type = /datum/crafting_recipe/roguetown/armorsmithing
	tools = list(/obj/item/rogueweapon/hammer)
	skillcraft = /datum/skill/craft/armorsmithing
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/armorsmithing/hauberkcuirass_ancient
	name = "cuirass, hauberked, ancient"
	result = list(/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/cuirassed/ancient)
	reqs = list(/obj/item/clothing/suit/roguetown/armor/plate/cuirass/paalloy = 1,  /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/paalloy = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/armorsmithing/hauberkcuirass_iron
	name = "cuirass, hauberked, iron"
	result = list(/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/cuirassed/iron)
	reqs = list(/obj/item/clothing/suit/roguetown/armor/plate/cuirass/iron = 1,  /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/armorsmithing/hauberkcuirass_steel
	name = "cuirass, hauberked, steel"
	result = list(/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/cuirassed)
	reqs = list(/obj/item/clothing/suit/roguetown/armor/plate/cuirass = 1,  /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk = 1)
	craftdiff = 4
