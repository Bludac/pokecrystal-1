	db POLIWAG ; 060

	db  70,  50,  40,  60,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, NORMAL ; type
	db 255 ; catch rate
	db 77 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db DRY_SKIN
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/poliwag/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_WATER_1, EGG_WATER_1 ; egg groups

	; tm/hm learnset
	tmhm HEADBUTT, CURSE, TOXIC, HIDDEN_POWER, SNORE, BLIZZARD, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, RETURN, PSYCHIC_M, DOUBLE_TEAM, SWAGGER, SLEEP_TALK, DEFENSE_CURL, REST, ATTRACT, THIEF, SURF, WHIRLPOOL, WATERFALL, ICE_BEAM
	; end
