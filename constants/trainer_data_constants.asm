; TrainerClassAttributes struct members (see data/trainers/attributes.asm)
rsreset
DEF TRNATTR_ITEM1           rb ; 0
DEF TRNATTR_ITEM2           rb ; 1
DEF TRNATTR_BASEMONEY       rb ; 2
DEF TRNATTR_AI_MOVE_WEIGHTS rw ; 3
DEF TRNATTR_AI_ITEM_SWITCH  rw ; 5
DEF NUM_TRAINER_ATTRIBUTES EQU _RS

; TRNATTR_AI_MOVE_WEIGHTS bit flags (wEnemyTrainerAIFlags)
; AIScoringPointers indexes (see engine/battle/ai/move.asm)
	const_def
	shift_const AI_BASIC		;no redundant moves
	shift_const AI_SETUP		;likely to use status moves on first turn, not likely otherwise
	shift_const AI_TYPES		;aware of the type chart
	shift_const AI_OFFENSIVE	;discourage non-damaging moves
	shift_const AI_SMART		;context specific scoring
	shift_const AI_OPPORTUNIST	;discourage STALL moves when the opponent is at low HP
	shift_const AI_AGGRESSIVE	;discourage all but the highest damaging move available
	shift_const AI_CAUTIOUS		;discourage residual effect moves, after the first turn
	shift_const AI_STATUS		;dismiss status moves that dont affect the player
	shift_const AI_RISKY		;use any move that will KO the target, dont use explosion moves at maxHP
DEF NO_AI EQU 0

; TRNATTR_AI_ITEM_SWITCH bit flags
	const_def
	const SWITCH_OFTEN_F     ; 0
	const SWITCH_RARELY_F    ; 1
	const SWITCH_SOMETIMES_F ; 2
	const_skip               ; 3
	const ALWAYS_USE_F       ; 4
	const UNKNOWN_USE_F      ; 5
	const CONTEXT_USE_F      ; 6

DEF SWITCH_OFTEN       EQU 1 << SWITCH_OFTEN_F
DEF SWITCH_RARELY      EQU 1 << SWITCH_RARELY_F
DEF SWITCH_SOMETIMES   EQU 1 << SWITCH_SOMETIMES_F
DEF ALWAYS_USE         EQU 1 << ALWAYS_USE_F
DEF UNKNOWN_USE        EQU 1 << UNKNOWN_USE_F
DEF CONTEXT_USE        EQU 1 << CONTEXT_USE_F

; TrainerTypes bits (see engine/battle/read_trainer_party.asm)
	const_def
	const TRAINERTYPE_MOVES_F ; 0
	const TRAINERTYPE_ITEM_F  ; 1
	const TRAINERTYPE_NICKNAME_F ; 2
	const TRAINERTYPE_DVS_F ; 3
	const TRAINERTYPE_STAT_EXP_F ; 4
	const TRAINERTYPE_VARIABLE_F ; 5
	const TRAINERTYPE_HAPPINESS_F ; 6

; Trainer party types (see data/trainers/parties.asm)
DEF TRAINERTYPE_NORMAL     EQU 0
DEF TRAINERTYPE_MOVES      EQU 1 << TRAINERTYPE_MOVES_F
DEF TRAINERTYPE_ITEM       EQU 1 << TRAINERTYPE_ITEM_F
DEF TRAINERTYPE_ITEM_MOVES EQU TRAINERTYPE_MOVES | TRAINERTYPE_ITEM
DEF TRAINERTYPE_NICKNAME   EQU 1 << TRAINERTYPE_NICKNAME_F
DEF TRAINERTYPE_DVS        EQU 1 << TRAINERTYPE_DVS_F
DEF TRAINERTYPE_STAT_EXP   EQU 1 << TRAINERTYPE_STAT_EXP_F
DEF TRAINERTYPE_VARIABLE   EQU 1 << TRAINERTYPE_VARIABLE_F
DEF TRAINERTYPE_HAPPINESS  EQU 1 << TRAINERTYPE_HAPPINESS_F

DEF PERFECT_DV EQU $11 ; treated as $FF in enemy party data
DEF PERFECT_STAT_EXP EQU $1337 ; treated as $FFFF in enemy party data
DEF MAX_HAPPINESS EQU $42 ; treated as $FF in enemy party data
DEF LV5_STAT_EXP EQU 164
DEF LV10_STAT_EXP EQU 655
DEF LV15_STAT_EXP EQU 1475
DEF LV20_STAT_EXP EQU 2621
DEF LV25_STAT_EXP EQU 4096
DEF LV30_STAT_EXP EQU 5898
DEF LV35_STAT_EXP EQU 8028
DEF LV40_STAT_EXP EQU 10486
DEF LV45_STAT_EXP EQU 13271
DEF LV50_STAT_EXP EQU 16384
DEF LV55_STAT_EXP EQU 19824
DEF LV60_STAT_EXP EQU 23593
DEF LV65_STAT_EXP EQU 27689
DEF LV70_STAT_EXP EQU 32112
DEF LV75_STAT_EXP EQU 36863
DEF LV80_STAT_EXP EQU 41942
DEF LV85_STAT_EXP EQU 47349
DEF LV90_STAT_EXP EQU 53083
DEF LV95_STAT_EXP EQU 59145
