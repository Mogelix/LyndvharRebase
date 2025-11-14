/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = GARRISON
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_TOLERATED_UP
	allowed_patrons = ALL_NICE_PATRONS
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	advclass_cat_rolls = list(CTAG_SQUIRE = 20)
	job_traits = list(TRAIT_SQUIRE_REPAIR)

	tutorial = "Your folks said you were going to be something, they had better aspirations for you than the life of a peasant. You practiced the basics \
		in the field alongside your friends, swordfighting with sticks, chasing rabbits with grain flail, and helping around the house lifting heavy \
		bags of grain. The Cataphract took notice of your potential and brought you on as their personal ward. You're going to be something someday."
	outfit = /datum/outfit/job/roguetown/squire
	display_order = JDO_SQUIRE
	give_bank_account = TRUE
	min_pq = -2 //squires aren't great but they can do some damage
	max_pq = null
	round_contrib_points = 1

	cmode_music = 'sound/music/combat_garrison.ogg'
	job_subclasses = list(
		/datum/advclass/squire/footman,
	)

/datum/outfit/job/roguetown/squire
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/guard
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/squire
	cloak = /obj/item/clothing/cloak/stabard/guard
	neck = /obj/item/clothing/neck/roguetown/gorget
	job_bitflag = BITFLAG_GARRISON

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	. = ..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "squire's tabard ([index])"

/datum/advclass/squire/footman
	name = "Squire"
	tutorial = "In squiring under the Cataphract to follow in their footsteps, you have been given a wide-range of tutelage that continues to be ever on-going..."
	outfit = /datum/outfit/job/roguetown/squire/footman
		
	category_tags = list(CTAG_SQUIRE)
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_DODGEEXPERT, TRAIT_BADTRAINER)
	subclass_stats = list(
		STATKEY_STR = 1,
		STATKEY_SPD = 1,
		STATKEY_PER = 1,
		STATKEY_CON = 1,
		STATKEY_INT = 1,
	)
	subclass_skills = list(
		/datum/skill/combat/maces = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/wrestling = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/unarmed = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/swords = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/swimming = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/climbing = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/athletics = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/misc/reading = SKILL_LEVEL_NOVICE,
		/datum/skill/misc/riding = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/polearms = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/squire/footman/pre_equip(mob/living/carbon/human/H)
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	gloves = /obj/item/clothing/gloves/roguetown/leather
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron
	backr = /obj/item/storage/backpack/rogue/satchel/short
	backpack_contents = list(
		/obj/item/storage/belt/rogue/pouch,
		/obj/item/reagent_containers/glass/bottle/rogue/healthpot,
		/obj/item/rogueweapon/huntingknife/idagger,
		/obj/item/rogueweapon/scabbard/sheath,
	)
	H.adjust_blindness(-3)
	if(H.mind)
		var/weapons = list("Sword","Recurve Bow")
		var/weapon_choice = input(H, "Choose your weapon.", "TAKE UP ARMS") as anything in weapons
		H.set_blindness(0)
		switch(weapon_choice)
			if("Sword")
				beltr = /obj/item/rogueweapon/scabbard/sword
				r_hand = /obj/item/rogueweapon/sword
			if("Recurve Bow")
				beltr = /obj/item/quiver/arrows
				r_hand = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve	
