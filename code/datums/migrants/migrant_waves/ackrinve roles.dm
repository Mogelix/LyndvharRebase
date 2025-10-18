/datum/migrant_role/ackrinve/necromancer
	name = "Ackrinval Necromancer"
	greet_text = "Use your dark magic to bring RUIN upon the lands of the Pantheon and DEFILE their Temples"
	outfit = /datum/outfit/job/roguetown/ackrinve/necromancer
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
/datum/outfit/job/roguetown/underdark/halberdier/pre_equip(mob/living/carbon/human/H)
	H.mind.current.faction += "[H.name]_faction"
	H.set_patron(/datum/patron/inhumen/zizo)
	head = /obj/item/clothing/head/roguetown/aventine
	shoes = /obj/item/clothing/shoes/roguetown/boots/leather/reinforced
	pants = /obj/item/clothing/under/roguetown/heavy_leather_pants
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/heavy
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	mask = /obj/item/clothing/mask/rogue/facemask/burningeyes
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/aventine
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/reagent_containers/glass/bottle/rogue/manapot
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	beltl = /obj/item/rogueweapon/huntingknife/idagger/silver/elvish
	backl = /obj/item/storage/backpack/rogue/satchel/short
	backr = /obj/item/rogueweapon/woodstaff/diamond
	backpack_contents = list(
		/obj/item/spellbook_unfinished/pre_arcyne = 1,
		/obj/item/roguegem/amethyst = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch/lantern/prelit = 1,
		/obj/item/necro_relics/necro_crystal = 2,
		/obj/item/rogueweapon/scabbard/sheath = 1,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 1,	//Small health vial
		)
	H.change_stat("perception", 3)
	H.change_stat("speed", 1)
	H.change_stat("intelligence", 4)
	H.change_stat("endurance", 3)
	H.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
	H.adjust_skillrank(/datum/skill/magic/arcane , 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 4, TRUE)
	H.adjust_skillrank(/datum/skill/craft/alchemy, 4, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/eyebite)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/bonechill)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/minion_order)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/gravemark)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead_formation/necromancer)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/raise_undead_guard)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/convert_heretic)
	H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/tame_undead)
	H.dna.species.soundpack_m = new /datum/voicepack/male/wizard()
	if(H.age == AGE_OLD)
		H.adjust_skillrank_up_to(/datum/skill/magic/arcane, SKILL_LEVEL_MASTER, TRUE)
		H.mind?.adjust_spellpoints(6)
	ADD_TRAIT(H, TRAIT_ARCYNE_T4, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MAGEARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GRAVEROBBER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ALCHEMY_EXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDICINE_EXPERT, TRAIT_GENERIC)

/datum/migrant_role/ackrinve/knight
	name = "Death Knight"
	greet_text = "You serve the Necromancer which leads your party, do their complete bidding and bring RUIN to LYNDVHAR"
	outfit = /datum/outfit/job/roguetown/ackrinve/knight
	allowed_races = RACES_SHUNNED_UP

/datum/migrant_role/ackrinve/knight/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	skeletonize()

/datum/outfit/job/roguetown/ackrinve/knight/pre_equip(mob/living/carbon/human/H)
	..()
	H.set_patron(/datum/patron/inhumen/zizo)
	armor = /obj/item/clothing/suit/roguetown/armor/plate/full/zizo
	pants = /obj/item/clothing/under/roguetown/platelegs/zizo
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/zizo
	wrists = /obj/item/clothing/wrists/roguetown/bracers
	gloves = /obj/item/clothing/gloves/roguetown/plate/zizo
	head = /obj/item/clothing/head/roguetown/helmet/heavy/zizo
	neck = /obj/item/clothing/neck/roguetown/gorget/steel
	r_hand = /obj/item/rogueweapon/sword/long/zizo
	mask = /obj/item/clothing/mask/rogue/facemask/steel

	H.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	H.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
	H.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.adjust_skillrank(/datum/skill/misc/tracking, 4, TRUE)
	H.change_stat("strength", 3) //have much fear
	H.change_stat("perception", 1)
	H.change_stat("intelligence", 2)
	H.change_stat("constitution", 4)
	H.change_stat("endurance", 4)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_OUTLANDER, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_ZOMBIE_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STRENGTH_UNCAPPED, TRAIT_GENERIC)
	

