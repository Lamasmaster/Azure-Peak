
#define ENGSEC			(1<<0)

//#define CAPTAIN			(1<<0)
#define HOS				(1<<1)
//#define WARDEN			(1<<2)
#define DETECTIVE		(1<<3)
#define OFFICER			(1<<4)
#define CHIEF			(1<<5)
#define ENGINEER		(1<<6)
#define ATMOSTECH		(1<<7)
#define ROBOTICIST		(1<<8)
#define AI_JF			(1<<9)
#define CYBORG			(1<<10)


#define MEDSCI			(1<<1)

#define RD_JF			(1<<0)
#define SCIENTIST		(1<<1)
#define CHEMIST			(1<<2)
#define CMO_JF			(1<<3)
#define DOCTOR			(1<<4)
#define GENETICIST		(1<<5)
#define VIROLOGIST		(1<<6)


#define CIVILIAN		(1<<2)

#define HOP				(1<<0)
#define BARTENDER		(1<<1)
#define BOTANIST		(1<<2)
//#define COOK			(1<<3) //This is redefined below, and is a ss13 leftover.
#define JANITOR			(1<<4)
#define CURATOR			(1<<5)
#define QUARTERMASTER	(1<<6)
#define CARGOTECH		(1<<7)
//#define MINER			(1<<8) //This is redefined below, and is a ss13 leftover.
#define LAWYER			(1<<9)
#define CHAPLAIN		(1<<10)
#define CLOWN			(1<<11)
#define MIME			(1<<12)
#define ASSISTANT		(1<<13)

#define JOB_AVAILABLE 0
#define JOB_UNAVAILABLE_GENERIC 1
#define JOB_UNAVAILABLE_BANNED 2
#define JOB_UNAVAILABLE_PLAYTIME 3
#define JOB_UNAVAILABLE_ACCOUNTAGE 4
#define JOB_UNAVAILABLE_PATRON 5
#define JOB_UNAVAILABLE_RACE 6
#define JOB_UNAVAILABLE_SEX 7
#define JOB_UNAVAILABLE_AGE 8
#define JOB_UNAVAILABLE_WTEAM 9
#define JOB_UNAVAILABLE_LASTCLASS 10
#define JOB_UNAVAILABLE_JOB_COOLDOWN 11
#define JOB_UNAVAILABLE_SLOTFULL 12
#define JOB_UNAVAILABLE_VIRTUESVICE 13
#define JOB_UNAVAILABLE_PQ 14

#define DEFAULT_RELIGION "Christianity"
#define DEFAULT_DEITY "Space Jesus"

#define JOB_DISPLAY_ORDER_DEFAULT 0

#define JOB_DISPLAY_ORDER_ASSISTANT 1
#define JOB_DISPLAY_ORDER_CAPTAIN 2
#define JOB_DISPLAY_ORDER_HEAD_OF_PERSONNEL 3
#define JOB_DISPLAY_ORDER_QUARTERMASTER 4
#define JOB_DISPLAY_ORDER_CARGO_TECHNICIAN 5
#define JOB_DISPLAY_ORDER_SHAFT_MINER 6
#define JOB_DISPLAY_ORDER_BARTENDER 7
#define JOB_DISPLAY_ORDER_COOK 8
#define JOB_DISPLAY_ORDER_BOTANIST 9
#define JOB_DISPLAY_ORDER_JANITOR 10
#define JOB_DISPLAY_ORDER_CLOWN 11
#define JOB_DISPLAY_ORDER_MIME 12
#define JOB_DISPLAY_ORDER_CURATOR 13
#define JOB_DISPLAY_ORDER_LAWYER 14
#define JOB_DISPLAY_ORDER_CHAPLAIN 15
#define JOB_DISPLAY_ORDER_CHIEF_ENGINEER 16
#define JOB_DISPLAY_ORDER_STATION_ENGINEER 17
#define JOB_DISPLAY_ORDER_ATMOSPHERIC_TECHNICIAN 18
#define JOB_DISPLAY_ORDER_CHIEF_MEDICAL_OFFICER 19
#define JOB_DISPLAY_ORDER_MEDICAL_DOCTOR 20
#define JOB_DISPLAY_ORDER_CHEMIST 21
#define JOB_DISPLAY_ORDER_GENETICIST 22
#define JOB_DISPLAY_ORDER_VIROLOGIST 23
#define JOB_DISPLAY_ORDER_RESEARCH_DIRECTOR 24
#define JOB_DISPLAY_ORDER_SCIENTIST 25
#define JOB_DISPLAY_ORDER_ROBOTICIST 26
#define JOB_DISPLAY_ORDER_HEAD_OF_SECURITY 27
#define JOB_DISPLAY_ORDER_WARDEN 28
#define JOB_DISPLAY_ORDER_DETECTIVE 29
#define JOB_DISPLAY_ORDER_SECURITY_OFFICER 30
#define JOB_DISPLAY_ORDER_AI 31
#define JOB_DISPLAY_ORDER_CYBORG 32

#define NOBLEMEN		(1<<0)

#define LORD		(1<<0)
#define LADY		(1<<1)
#define PRINCE		(1<<3)
#define SUITOR		(1<<4)

#define COURTIERS		(1<<1)

#define HAND		(1<<0)
#define STEWARD		(1<<1)
#define COUNCILLOR	(1<<2)
#define JESTER		(1<<3)
#define WIZARD		(1<<4)
#define ARCHIVIST	(1<<5)
#define SENESCHAL	(1<<6)

#define RETINUE			(1<<2)

#define MARSHAL		(1<<0)
#define CAPTAIN		(1<<1)
#define KNIGHT		(1<<2)
#define SQUIRE		(1<<3)

#define GARRISON		(1<<3)

#define SERGEANT	(1<<0)
#define MANATARMS	(1<<1)
#define WARDEN		(1<<2)
#define GUARDSMAN	(1<<3)

#define CHURCHMEN		(1<<4)

#define PRIEST		(1<<0)
#define MARTYR		(1<<1)
#define TEMPLAR		(1<<2)
#define KEEPER		(1<<3)
#define DRUID		(1<<4)
#define ACOLYTE		(1<<5)
#define CHURCHLING	(1<<6)

#define BURGHERS		(1<<5)

#define MERCHANT	(1<<0)
#define GUILDMASTER (1<<1)
#define GUILDSMAN  	(1<<2)
#define TAILOR		(1<<3)
#define PHYSICIAN 	(1<<4)
#define APOTHECARY	(1<<5)
#define INNKEEPER	(1<<6)
#define NITEMASTER	(1<<7)
#define CLERK 		(1<<8)
#define CRIER		(1<<9)

#define PEASANTS		(1<<6)

#define MAGEAPPRENTICE	(1<<0)
#define SHOPHAND	(1<<1)
#define SERVANT		(1<<2)
#define COOK		(1<<3)
#define TAPSTER 	(1<<4)
#define WENCH		(1<<5)
#define FARMER		(1<<6)
#define VILLAGER	(1<<7)

#define SIDEFOLK		(1<<7)

#define VETERAN		(1<<0)
#define LUNATIC		(1<<1)
#define VAGABOND	(1<<2)
#define ORPHAN		(1<<3)
#define PILGRIM		(1<<4)
#define MIGRANT		(1<<5)

#define WANDERERS		(1<<8)

#define ADVENTURER      (1<<0)
#define TRADER			(1<<1)
#define MERCENARY		(1<<2)
#define COURTAGENT	    (1<<3)

#define INQUISITION		(1<<9)

#define PURITAN		(1<<0)
#define ABSOLVER	(1<<1)
#define ORTHODOXIST	(1<<2)

#define ANTAGONIST		(1<<10)

#define ASSASSIN	(1<<0)
#define BANDIT		(1<<1)
#define WRETCH		(1<<2)
#define DEATHKNIGHT (1<<3)
#define SKELETON	(1<<4)
#define GOBLIN		(1<<5)
#define VAMPIRE_SERVANT (1<<6)
#define VAMPIRE_GUARD (1<<7)
#define VAMPIRE_SPAWN (1<<8)

#define SLOP			(1<<11)

#define TESTER		(1<<0)

#define JCOLOR_NOBLE "#aa83b9"
#define JCOLOR_COURTIER "#81adc8"
#define JCOLOR_RETINUE "#4580a3"
#define JCOLOR_SOLDIER "#b18484"
#define JCOLOR_CHURCH "#c0ba8d"
#define JCOLOR_YEOMAN "#819e82"
#define JCOLOR_PEASANT "#b09262"
#define JCOLOR_WANDERER  "#c86e3a"
#define JCOLOR_INQUISITION "#FF0000"
#define JCOLOR_ANTAGONIST  "#7a1212"

// job display orders //

// Ducal Family
#define JDO_LORD 1
#define JDO_LADY 1.1
#define JDO_PRINCE 1.2
#define JDO_SUITOR 1.3

// Courtiers
#define JDO_HAND 2
#define JDO_STEWARD 2.1
#define JDO_COUNCILLOR 2.2
#define JDO_JESTER 2.3
#define JDO_MAGICIAN 2.4
#define JDO_ARCHIVIST 2.5
#define JDO_PHYSICIAN 2.6
#define JDO_SENESCHAL 2.7

// Retinue - Manor
#define JDO_MARSHAL 3
#define JDO_CAPTAIN 3.1
#define JDO_KNIGHT 3.2
#define JDO_SQUIRE 3.3

// Garrison - Town/Outside
#define JDO_SERGEANT 4
#define JDO_GUARD 4.1
#define JDO_WARDEN 4.2
#define JDO_TOWNGUARD 4.3

// Pantheon Church
#define JDO_PRIEST 5
#define JDO_MARTYR 5.1
#define JDO_TEMPLAR 5.2
#define JDO_KEEPER 5.3
#define JDO_DRUID 5.4
#define JDO_ACOLYTE 5.5
#define JDO_CHURCHLING 5.6

// Town Burghers
#define JDO_MERCHANT 6
#define JDO_GUILDMASTER 6.1
#define JDO_GUILDSMAN 6.2
#define JDO_TAILOR 6.3
#define JDO_INNKEEPER 6.4
#define JDO_NITEMASTER 6.5
#define JDO_CRIER 6.6
#define JDO_APOTHECARY 6.7
#define JDO_CLERK 6.8

// Town Serfs - Peasants
#define JDO_MAGEAPPRENTICE 7
#define JDO_SHOPHAND 7.1
#define JDO_SERVANT 7.2
#define JDO_COOK 7.3
#define JDO_TAPSTER 7.4
#define JDO_WENCH 7.5
#define JDO_SOILSON 7.6
#define JDO_VILLAGER 7.7

// Sidefolk - MISC jobs that don't fit any of the other categories really
#define JDO_VET 8
#define JDO_LUNATIC 8.1
#define JDO_VAGABOND 8.2
#define JDO_VAGRANT 8.3
#define JDO_PILGRIM 8.4
#define JDO_MIGRANT 8.5

// Wanderers
#define JDO_ADVENTURER 9
#define JDO_TRADER 9.1
#define JDO_COURTAGENT 9.2
#define JDO_MERCENARY 9.3

// Inquisition
#define JDO_PURITAN 10
#define JDO_ORTHODOXIST 10.1
#define JDO_ABSOLVER 10.2

// Antagonists
#define JDO_ASSASSIN 11
#define JDO_BANDIT 11.1
#define JDO_WRETCH 11.2

#define BITFLAG_HOLY_WARRIOR (1<<0)
#define BITFLAG_ROYALTY (1<<1)
#define BITFLAG_CONSTRUCTOR (1<<2)
#define BITFLAG_GARRISON (1<<3)

// START OF THE ECONOMY SECTION 
#define ECONOMIC_RICH rand(120, 140)
#define ECONOMIC_UPPER_CLASS rand(100, 120)
#define ECONOMIC_UPPER_MIDDLE_CLASS rand(80, 100)
#define ECONOMIC_LOWER_MIDDLE_CLASS rand(40, 80)
#define ECONOMIC_WORKING_CLASS rand(40, 60)
#define ECONOMIC_LOWER_CLASS rand(20, 40)
#define ECONOMIC_DESTITUTE rand(0, 6)
#define ECONOMIC_LETSGOGAMBLING pick(ECONOMIC_DESTITUTE, ECONOMIC_DESTITUTE, ECONOMIC_DESTITUTE, ECONOMIC_WORKING_CLASS, ECONOMIC_WORKING_CLASS, ECONOMIC_WORKING_CLASS, ECONOMIC_WORKING_CLASS, ECONOMIC_RICH)
// END OF THE ECONOMY SECTION

#define MANOR_ROLES \
	/datum/job/roguetown/jester,\
	/datum/job/roguetown/veteran,\
	/datum/job/roguetown/clerk,\
	/datum/job/roguetown/wapprentice,\
	/datum/job/roguetown/servant,\
	/datum/job/roguetown/butler,\
	/datum/job/roguetown/apothecary,\
	/datum/job/roguetown/magician

#define NOBLE_ROLES \
	/datum/job/roguetown/prince,\
	/datum/job/roguetown/councillor,\
	/datum/job/roguetown/physician,\
	/datum/job/roguetown/marshal,\
	/datum/job/roguetown/captain,\
	/datum/job/roguetown/hand,\
	/datum/job/roguetown/knight,\
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord,\
	/datum/job/roguetown/steward

#define KING_QUEEN_ROLES \
	/datum/job/roguetown/lady,\
	/datum/job/roguetown/lord

#define CHURCH_ROLES \
	/datum/job/roguetown/churchling,\
	/datum/job/roguetown/druid,\
	/datum/job/roguetown/monk,\
	/datum/job/roguetown/priest,\
	/datum/job/roguetown/templar

#define PEASANT_ROLES \
	/datum/job/roguetown/villager,\
	/datum/job/roguetown/nightmaiden,\
	/datum/job/roguetown/beggar,\
	/datum/job/roguetown/cook,\
	/datum/job/roguetown/knavewench,\
	/datum/job/roguetown/lunatic,\
	/datum/job/roguetown/farmer,\
	/datum/job/roguetown/orphan,\
	/datum/job/roguetown/shophand,\
	/datum/job/roguetown/bapprentice,\
	/datum/job/roguetown/prisonerb,\
	/datum/job/roguetown/hostage,\
	/datum/job/roguetown/prisonerr

#define YEOMEN_ROLES \
	/datum/job/roguetown/keeper,\
	/datum/job/roguetown/crier,\
	/datum/job/roguetown/niteman,\
	/datum/job/roguetown/archivist,\
	/datum/job/roguetown/barkeep,\
	/datum/job/roguetown/guildsmaster,\
	/datum/job/roguetown/guildsman,\
	/datum/job/roguetown/tailor,\
	/datum/job/roguetown/merchant

#define WANDERER_ROLES \
	/datum/job/roguetown/pilgrim,\
	/datum/job/roguetown/adventurer,\
	/datum/job/roguetown/mercenary/desert_rider,\
	/datum/job/roguetown/mercenary/grenzelhoft,\
	/datum/job/roguetown/bandit,\
	/datum/job/roguetown/wretch

#define GARRISON_ROLES \
	/datum/job/roguetown/bogguardsman,\
	/datum/job/roguetown/sergeant,\
	/datum/job/roguetown/gatemaster,\
	/datum/job/roguetown/manorguard,\
	/datum/job/roguetown/sheriff,\
	/datum/job/roguetown/squire,\
	/datum/job/roguetown/guardsman

#define INQUISITION_ROLES \
	/datum/job/roguetown/puritan,\
	/datum/job/roguetown/orthodoxist
