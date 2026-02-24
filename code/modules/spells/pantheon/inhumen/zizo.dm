// T0: Extinquish lights/fires in area around you scaling on your HOLY skill.

/obj/effect/proc_holder/spell/self/zizo_snuff
	name = "Snuff Lights"
	desc = "Extinguish all lights in range, with your Miracles skill increasing range."
	releasedrain = 10
	chargedrain = 0
	chargetime = 0
	chargedloop = /datum/looping_sound/invokeholy
	invocations = list("exhales a dark grey smog, choking any lights nearby.")
	invocation_type = "emote"
	sound = 'sound/magic/zizo_snuff.ogg'
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "snufflight"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 20 SECONDS
	miracle = TRUE
	devotion_cost = 30
	range = 2

/obj/effect/proc_holder/spell/self/zizo_snuff/cast(list/targets, mob/user = usr)
	. = ..()
	if(!ishuman(user))
		revert_cast()
		return FALSE
	var/checkrange = (range + user.get_skill_level(/datum/skill/magic/holy)) //+1 range per holy skill up to a potential of 8.
	for(var/obj/O in range(checkrange, user))
		O.extinguish()
	for(var/mob/M in range(checkrange, user))
		for(var/obj/O in M.contents)
			O.extinguish()
	return TRUE

// T0: (fires a bone splinter at a target for brute and bleeding if you're not holding bones in your other hand, fires a significantly stronger bone lance if you are)

/obj/effect/proc_holder/spell/invoked/projectile/profane
	name = "Profane Bolt"
	desc = "Fire forth a splinter of unholy bone, tearing flesh and causing bleeding. If you hold pieces of bone in your other hand, you will coax a much stronger lance of bone into being."
	clothes_req = FALSE
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "profane"
	range = 8
	associated_skill = /datum/skill/magic/arcane
	projectile_type = /obj/projectile/magic/profane
	chargedloop = /datum/looping_sound/invokeholy
	invocation_type = "none"
	releasedrain = 30
	chargedrain = 0
	chargetime = 15
	recharge_time = 10 SECONDS
	hide_charge_effect = TRUE // Left handed magick babe

/obj/effect/proc_holder/spell/invoked/projectile/profane/miracle
	miracle = TRUE
	devotion_cost = 15
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/projectile/profane/fire_projectile(mob/living/user, atom/target)
	current_amount--

	var/obj/item/held_item = user.get_active_held_item()
	var/big_cast = FALSE
	if (istype(held_item, /obj/item/natural/bundle/bone))
		var/obj/item/natural/bundle/bone/bonez = held_item
		if (bonez.use(1))
			projectile_type = /obj/projectile/magic/profane/major
			big_cast = TRUE
	else if (istype(held_item, /obj/item/natural/bone))
		qdel(held_item)
		projectile_type = /obj/projectile/magic/profane/major
		big_cast = TRUE
	else if (istype(held_item, /obj/item/natural/bundle/bone))
		var/obj/item/natural/bundle/bone/boney_bundle = held_item
		if (boney_bundle.use(1))
			projectile_type = /obj/projectile/magic/profane/major
			big_cast = TRUE

	var/obj/projectile/P = new projectile_type(user.loc)
	P.firer = user
	P.preparePixelProjectile(target, user)
	P.fire()

	if (big_cast)
		user.visible_message(span_danger("[user] conjures and hurls a vicious lance of bone towards [target]!"), span_notice("I hurl a vicious lance of bone at [target]!")) 						//hehe. vicious lance of bone
	else
		user.visible_message(span_danger("[user] swings their arm in a wide arc, hurling a splinter of bone towards [target]!"), span_notice("I fling a shard of profaned bone at [target]!"))

	projectile_type = initial(projectile_type)

/obj/projectile/magic/profane
	name = "profaned bone splinter"
	icon_state = "chronobolt"
	damage = 25
	armor_penetration = 10
	damage_type = BRUTE
	nodamage = FALSE
	var/embed_prob = 20

/obj/projectile/magic/profane/major
	name = "profaned bone lance"
	damage = 50
	armor_penetration = 20 //It's blunt so keep that in mind
	embed_prob = 40

/obj/projectile/magic/profane/on_hit(atom/target, blocked)
	. = ..()
	if (iscarbon(target) && prob(embed_prob))
		var/mob/living/carbon/carbon_target = target
		var/obj/item/bodypart/victim_limb = pick(carbon_target.bodyparts)
		var/obj/item/bone/splinter/our_splinter = new
		victim_limb.add_embedded_object(our_splinter, FALSE, TRUE)

/obj/item/bone/splinter
	name = "bone splinter"
	embedding = list(
		"embed_chance" = 100,
		"embedded_pain_chance" = 25,
		"embedded_fall_chance" = 5,
	)

/obj/item/bone/splinter/dropped(mob/user, silent)
	. = ..()
	to_chat(user, span_danger("[src] crumbles into dust..."))
	qdel(src)

// T0: Fires off a short ranged sticky projectile that immobilizes it's target - BUGGY VISUAL

/obj/effect/proc_holder/spell/invoked/gravecall
	name = "Gravecall"
	desc = "Call forth skeletal hands to hold down your foes."
	clothes_req = FALSE
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "zizograsp"
	range = 4
	associated_skill = /datum/skill/magic/holy
	chargedloop = /datum/looping_sound/invokeholy
	invocation_type = "none"
	releasedrain = 30
	chargedrain = 0
	chargetime = 15
	recharge_time = 30 SECONDS
	hide_charge_effect = TRUE // Left handed magick babe

	var/delay = 14
	var/damage = 60
	var/area_of_effect = 2

/obj/effect/temp_visual/trapskeleton
	icon = 'icons/effects/effects.dmi'
	icon_state = "frost"
	light_outer_range = 2
	light_color = "#D02A3A"
	duration = 11
	layer = MASSIVE_OBJ_LAYER

/obj/effect/temp_visual/gravecall
	icon = 'icons/effects/effects.dmi'
	icon_state = "shieldsparkles"
	name = "rising deadite hands"
	desc = "Get out of the way!"
	randomdir = FALSE
	duration = 1 SECONDS
	layer = MASSIVE_OBJ_LAYER

/obj/effect/proc_holder/spell/invoked/gravecall/cast(list/targets, mob/user)
	var/turf/T = get_turf(targets[1])

	var/turf/source_turf = get_turf(user)
	if(T.z > user.z)
		source_turf = get_step_multiz(source_turf, UP)
	if(T.z < user.z)
		source_turf = get_step_multiz(source_turf, DOWN)

	for(var/turf/affected_turf in get_hear(area_of_effect, T))
		if(!(affected_turf in get_hear(range, source_turf)))
			continue
		new /obj/effect/temp_visual/trapskeleton(affected_turf)
	playsound(T, 'sound/combat/wooshes/blunt/wooshhuge (2).ogg', 80, TRUE, soundping = TRUE) // it kinda sounds like cold wind idk

	sleep(delay)
	var/play_cleave = FALSE

	for(var/turf/affected_turf in get_hear(area_of_effect, T))
		new /obj/effect/temp_visual/gravecall(affected_turf)
		if(!(affected_turf in get_hear(range, source_turf)))
			continue
		for(var/mob/living/L in affected_turf.contents)
			if(L.anti_magic_check())
				L.visible_message(span_warning("The grip fades away around [L]!"))
				playsound(get_turf(L), 'sound/magic/magic_nulled.ogg', 100)
				continue
			if(spell_guard_check(L, TRUE))
				L.visible_message(span_warning("[L] endures the grip!"))
				continue
			play_cleave = TRUE
			if(ishuman(L))
				L.adjustBruteLoss(damage)
				L.Immobilize(4 SECONDS)
				playsound(T, 'sound/combat/fracture/fracturedry (1).ogg', 80, TRUE, soundping = TRUE)
			else
				L.adjustBruteLoss(damage + 20)
				L.Immobilize(8 SECONDS)
				playsound(T, 'sound/combat/fracture/fracturedry (1).ogg', 80, TRUE, soundping = TRUE)
			playsound(affected_turf, "genslash", 80, TRUE)
			to_chat(L, "<span class='userdanger'>The hands grip against you!</span>")

	if(play_cleave)
		playsound(T, 'sound/combat/newstuck.ogg', 80, TRUE, soundping = TRUE) // this also kinda sounds like ice ngl

	return TRUE

// T1: Transfers blood from a person to yourself - reversed blood transfer miracle more or less - DOESN'T SEEM TO REDUCE TARGETS BLOOD POOL ON HIGH LEVELS

/obj/effect/proc_holder/spell/invoked/zizo_drain
	name = "Lyfe Transfer"
	desc = "Transfers the blood from a victim to me with inhumen magycks. Ratio of transfer scales with holy skill."
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "lyfedrain"
	releasedrain = 30
	chargedrain = 0
	chargetime = 0
	range = 4
	ignore_los = FALSE
	warnie = "sydwarning"
	movement_interrupt = TRUE
	sound = 'sound/magic/bloodheal.ogg'
	invocation_type = "none"
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = FALSE
	recharge_time = 1 MINUTES
	miracle = TRUE
	devotion_cost = 50
	var/blood_price = 5
	var/blood_vol_restore = 7.5 //30 every 2 seconds.
	var/vol_per_skill = 1	//54 with legendary
	var/delay = 0.5 SECONDS

/obj/effect/proc_holder/spell/invoked/zizo_drain/cast(list/targets, mob/user = usr)
	if(ishuman(targets[1]))
		var/mob/living/carbon/human/target = targets[1]
		var/mob/living/carbon/human/UH = user
		if(NOBLOOD in target.dna?.species?.species_traits)
			to_chat(UH, span_warning("They have no blood to provide."))
			revert_cast()
			return FALSE

		if(UH.blood_volume >= BLOOD_VOLUME_NORMAL)
			to_chat(UH, span_warning("My lyfeblood is at capacity. There is no need."))
			revert_cast()
			return FALSE

		if(HAS_TRAIT(target, TRAIT_PSYDONITE))
			target.visible_message(span_info("[target] stirs for a moment, the miracle dissipates."), span_notice("A dull warmth swells in your heart, only to fade as quickly as it arrived."))
			user.playsound_local(user, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			playsound(target, 'sound/magic/PSY.ogg', 100, FALSE, -1)
			return FALSE

		target.visible_message(span_warning("Tiny strands of red link between [target] and [UH], blood being transferred!"))
		playsound(UH, 'sound/magic/bloodheal_start.ogg', 100, TRUE)
		var/user_skill = UH.get_skill_level(associated_skill)
		var/user_informed = FALSE
		switch(user_skill)	//Bleeding happens every life(), which is every 2 seconds. Multiply these numbers by 4 to get the "bleedrate" equivalent values.
			if(SKILL_LEVEL_APPRENTICE)
				blood_price = 3.75
			if(SKILL_LEVEL_JOURNEYMAN)
				blood_price = 2.5
			if(SKILL_LEVEL_EXPERT)
				blood_price = 2
			if(SKILL_LEVEL_MASTER)
				blood_price = 1.625
			if(SKILL_LEVEL_LEGENDARY)
				blood_price = 1.25
		if(user_skill > SKILL_LEVEL_NOVICE)
			blood_vol_restore += vol_per_skill * user_skill
		var/max_loops = round(target.blood_volume / blood_price, 1) * 2	// x2 just in case the user is trying to fill themselves up while using it.
		var/datum/beam/bloodbeam = user.Beam(target,icon_state="blood",time=(max_loops * 5))
		for(var/i in 1 to max_loops)
			if(target.blood_volume > (BLOOD_VOLUME_SURVIVE / 2))
				if(do_after(UH, delay))
					UH.blood_volume = min((target.blood_volume + blood_vol_restore), BLOOD_VOLUME_NORMAL)
					target.blood_volume = max((UH.blood_volume - blood_price), 0)
					if(target.blood_volume >= BLOOD_VOLUME_NORMAL && !user_informed)
						to_chat(UH, span_info("I'm at a healthy blood level, but I can keep going."))
						user_informed = TRUE
				else
					target.visible_message(span_warning("Severs the bloodlink from [target]!"))
					bloodbeam.End()
					return TRUE
			else
				UH.visible_message(span_warning("Severs the bloodlink from [target]!"))
				bloodbeam.End()
				return TRUE
		bloodbeam.End()
		return TRUE
	revert_cast()
	return FALSE

// T2: carbon spawn

/obj/effect/proc_holder/spell/invoked/raise_undead_guard/miracle
	name = "Raise Deadite"
	desc = "Raises a singular, weak deadite."
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "skeleton"
	chargetime = 3 SECONDS
	miracle = TRUE
	devotion_cost = 75

// T2: just use lesser animate undead for now

/obj/effect/proc_holder/spell/invoked/raise_undead_formation/miracle
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "skeleton_formation"
	miracle = TRUE
	devotion_cost = 75
	cabal_affine = TRUE
	to_spawn = 1

// T3: tames bio_type = undead mobs

/obj/effect/proc_holder/spell/invoked/tame_undead/miracle
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "deadite_tame"
	miracle = TRUE
	devotion_cost = 100

// T3: Rituos (usable once per sleep cycle, allows you to choose any 1 arcane spell to use for the duration w/ an associated devotion cost. each time you change it, 1 of your limbs is skeletonized, if all of your limbs are skeletonized, you gain access to arcane magic. continuing to use rituos after being fully skeletonized gives you additional spellpoints). Gives you the MOB_UNDEAD flag (needed for skeletonize to work) on first use.

/obj/effect/proc_holder/spell/invoked/rituos
	name = "Rituos"
	desc = "Do a zizoid ritual that skeletonises a part of your body, granting you one spell until your next rest. Once your whole body has become skeletonised, you gain full access to the Arcyne, bolstering your knowledge of spells with each additional ritual."
	clothes_req = FALSE
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "rituos"
	associated_skill = /datum/skill/magic/arcane
	chargedloop = /datum/looping_sound/invokeholy
	chargedrain = 0
	chargetime = 50
	releasedrain = 90
	no_early_release = TRUE
	movement_interrupt = TRUE
	recharge_time = 2 MINUTES
	var/list/excluded_bodyparts = list(/obj/item/bodypart/head)
	var/list/to_skeletonize = list(
		/obj/item/bodypart/l_arm::name = BODY_ZONE_L_ARM, 
		/obj/item/bodypart/r_arm::name = BODY_ZONE_R_ARM,
		/obj/item/bodypart/l_leg::name = BODY_ZONE_L_LEG,
		/obj/item/bodypart/r_leg::name = BODY_ZONE_R_LEG,
		)
	hide_charge_effect = TRUE

/obj/effect/proc_holder/spell/invoked/rituos/miracle
	miracle = TRUE
	devotion_cost = 120
	associated_skill = /datum/skill/magic/holy

/obj/effect/proc_holder/spell/invoked/rituos/cast(list/targets, mob/living/carbon/user)
	if(!LAZYLEN(to_skeletonize) && tgui_alert(user, "Restore skeleton bodyparts?", "FINISHED RITUOS", list("Nae", "Yae")) == "Yae")
		skeletonize_bodyparts(user)
		return TRUE

	if(user.mind?.has_rituos)
		to_chat(user, span_warning("I have not the mental fortitude to enact the Lesser Work again. I must rest first..."))
		return FALSE

	var/bodypart_choice = tgui_input_list(user, "Which bodypart will be sacrificed?", "SACRIFICE", to_skeletonize)
	
	if(!bodypart_choice)
		return FALSE

	var/list/choices = list()
	var/list/spell_choices = GLOB.learnable_spells
	for(var/i = 1, i <= spell_choices.len, i++)
		var/obj/effect/proc_holder/spell/spell_item = spell_choices[i]
		if(spell_item.spell_tier > 3)
			continue
		choices["[spell_item.name]"] = spell_item

	choices = sortList(choices)

	var/choice = input("Choose an arcyne expression of the Lesser Work") as null|anything in choices
	var/obj/effect/proc_holder/spell/item = choices[choice]

	if (!choice || !item)
		return FALSE

	if (!(user.mob_biotypes & MOB_UNDEAD))
		user.visible_message(span_warning("The pallor of the grave descends across [user]'s skin in a wave of arcyne energy..."), span_boldwarning("A deathly chill overtakes my body at my first culmination of the Lesser Work! I feel my heart slow down in my chest..."))
		user.mob_biotypes |= MOB_UNDEAD
		to_chat(user, span_smallred("I have forsaken the living. I am now closer to a deadite than a mortal... but I still yet draw breath and bleed."))
	
	var/obj/item/bodypart/part = user.get_bodypart(to_skeletonize[bodypart_choice])

	if(part)
		part.skeletonize(FALSE)
		user.update_body_parts()
		user.visible_message(span_warning("Faint runes flare beneath [user]'s skin before [user.p_their()] flesh suddenly slides away from [user.p_their()] [part.name]!"), span_notice("I feel arcyne power surge throughout my frail mortal form, as the Rituos takes its terrible price from my [part.name]."))

	if(user.mind?.rituos_spell)
		to_chat(user, span_warning("My knowledge of [user.mind.rituos_spell.name] flees..."))
		user.mind.RemoveSpell(user.mind.rituos_spell)
		user.mind.rituos_spell = null

	user.mind.has_rituos = TRUE
	to_skeletonize -= bodypart_choice

	if(!LAZYLEN(to_skeletonize))
		finalize(user)
		return TRUE
	
	to_chat(user, span_notice("The Lesser Work of Rituos floods my mind with stolen arcyne knowledge: I can now cast [item.name] until I next rest..."))
	user.mind.rituos_spell = item
	user.mind.AddSpell(new item)

	return TRUE

/obj/effect/proc_holder/spell/invoked/rituos/proc/finalize(mob/living/carbon/human/user)
	var/obj/item/bodypart/torso = user.get_bodypart(BODY_ZONE_CHEST)
	torso?.skeletonize(FALSE)
	user.update_body_parts()

	user.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
	user.grant_language(/datum/language/undead)
	user.mind?.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
	user.mind?.adjust_spellpoints(18)
	user.visible_message(span_boldwarning("[user]'s form swells with terrible power as they cast away almost all of the remnants of their mortal flesh, arcyne runes glowing upon their exposed bones..."), span_notice("I HAVE DONE IT! I HAVE COMPLETED HER LESSER WORK! I stand at the cusp of unspeakable power, but something is yet missing..."))

	ADD_TRAIT(user, TRAIT_NOHUNGER, "[type]")
	ADD_TRAIT(user, TRAIT_NOBREATH, "[type]")
	ADD_TRAIT(user, TRAIT_ARCYNE_T3, "[type]")

	if(prob(33))
		to_chat(user, span_small("...what have I done?"))

/obj/effect/proc_holder/spell/invoked/rituos/proc/skeletonize_bodyparts(mob/living/carbon/human/user)
	for(var/obj/item/bodypart/part as anything in user.bodyparts)
		if(is_type_in_list(part, excluded_bodyparts))
			continue

		part.skeletonize(FALSE)

	user.update_body_parts()

// T3: Churn living more or less, don't look too deep into it, there isn't much else TO it - STILL NEEDS CLEANED UP CODE

/obj/effect/proc_holder/spell/targeted/zizo_churn
	name = "Churn Living"
	desc = "Explode a living being by sundering their lux, greater effect for those already without it."
	range = 7	//Entire screen, does not matter though since it uses something else to determine it
	action_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_icon = 'icons/mob/actions/zizomiracles.dmi'
	overlay_state = "churn_living"
	releasedrain = 30
	chargetime = 10 SECONDS //Seems long but scales with Holy skill
	recharge_time = 60 SECONDS
	max_targets = 0 //How many targets can we hit with each cast of this, scales with Holy skill.
	cast_without_targets = TRUE
	req_items = list(/obj/item/clothing/neck/roguetown/psicross)
	sound = 'sound/magic/soulsteal.ogg'
	associated_skill = /datum/skill/magic/holy
	invocations = list("Your existence is forfeit!", "Kneel before Her might!", "Perish in Her name!", "Death hath come for thee!")
	invocation_type = "shout"
	miracle = TRUE
	devotion_cost = 100

/obj/effect/proc_holder/spell/targeted/zizo_churn/cast(list/targets,mob/living/user = usr)
	if(user && user.mind)
		for(var/i in 1 to user.get_skill_level(/datum/skill/magic/holy))
			max_targets += 1
			range += 1
			chargetime -= 1 SECONDS
	for(var/mob/living/L in targets)
		/*if(!L.mind?)
			return FALSE*/
		if(L.stat == DEAD)
			return FALSE
		if((L.mob_biotypes |= MOB_UNDEAD))
			if(spell_guard_check(L, TRUE))
				L.visible_message(span_warning("[L] resists being churned!"))
				return FALSE
			if(istype(L.patron, /datum/patron/inhumen/zizo))
				L.visible_message(span_warning("[L] resists being churned!"))
				return FALSE
			if(HAS_TRAIT(L, TRAIT_SILVER_BLESSED)) //This will always take precedence and is the most powerful effect it has
				to_chat(L, "<font color='red'>ᛦ ZIZO GRIPS MY BLESSED HEART!! ᛦ</font>")
				L.visible_message(span_warning("[L] writhes in pain!"))
				L.emote("cry")
				L.Stun(5 SECONDS)
				explosion(get_turf(L), devastation_range = 1, heavy_impact_range = 2, light_impact_range = 1, flame_range = 2, smoke = FALSE)
				return TRUE
			if(L.has_status_effect(/datum/status_effect/debuff/devitalised))
				to_chat(L, "<font color='red'>ᛦ ZIZO REACHES FOR MY SOUL!! ᛦ</font>")
				L.visible_message(span_warning("[L] writhes in pain!"))
				L.emote("whimper")
				L.Stun(3 SECONDS)
				explosion(get_turf(L), heavy_impact_range = 2, light_impact_range = 1, flame_range = 2, smoke = TRUE)//Placeholders for testing, should be direct damage.
				return TRUE
			if(!L.has_status_effect(/datum/status_effect/debuff/devitalised) && !HAS_TRAIT(L, TRAIT_SILVER_BLESSED))
				to_chat(L, "<font color='red'>ᛦ ZIZO SUNDERS MY LUX APART!! ᛦ</font>")
				L.visible_message(span_warning("[L] writhes in pain!"))
				if(!L.has_status_effect(/datum/status_effect/debuff/devitalised/zizo))
					L.apply_status_effect(/datum/status_effect/debuff/devitalised/zizo)
				explosion(get_turf(L), heavy_impact_range = 1, light_impact_range = 1, flame_range = 1, smoke = FALSE)
				return TRUE
		else
			L.visible_message(span_warning("[L] resists being churned!"))
	..()
	return TRUE
