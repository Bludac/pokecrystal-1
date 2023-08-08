	db GARCHOMP ; 253

	db 108, 130,  95, 102,  80,  85
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, GROUND ; type
	db 45 ; catch rate
	db 218 ; base exp
	db NO_ITEM, DRAGON_FANG ; items
	db GENDER_F50 ; gender ratio
	db ROUGH_SKIN
	db 40 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/garchomp/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_SLOW ; growth rate
	dn EGG_WATER_1, EGG_DRAGON ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, HEADBUTT, CURSE, TOXIC, ZAP_CANNON, ROCK_SMASH, HIDDEN_POWER, SNORE, BLIZZARD, HYPER_BEAM, ICY_WIND, PROTECT, RAIN_DANCE, ENDURE, FRUSTRATION, IRON_TAIL, DRAGONBREATH, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SANDSTORM, FIRE_BLAST, SWIFT, THUNDERPUNCH, DETECT, REST, ATTRACT, STEEL_WING, FIRE_PUNCH, FURY_CUTTER, FLY, SURF, STRENGTH, WHIRLPOOL, WATERFALL, FLAMETHROWER, THUNDERBOLT, ICE_BEAM
	; end
