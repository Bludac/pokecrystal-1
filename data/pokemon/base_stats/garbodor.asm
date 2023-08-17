	db GARBODOR ; 252

	db 98, 116,  100,  92,  73, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp
	db NO_ITEM, NUGGET ; items
	db GENDER_F50 ; gender ratio
	db CORROSION
	db 20 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/garbodor/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_FAST ; growth rate
	dn EGG_INDETERMINATE, EGG_INDETERMINATE ; egg groups

	; tm/hm learnset
	tmhm DYNAMICPUNCH, CURSE, TOXIC, ZAP_CANNON, HIDDEN_POWER, SUNNY_DAY, SNORE, HYPER_BEAM, PROTECT, GIGA_DRAIN, ENDURE, FRUSTRATION, THUNDER, RETURN, MUD_SLAP, DOUBLE_TEAM, ICE_PUNCH, SWAGGER, SLEEP_TALK, SLUDGE_BOMB, FIRE_BLAST, THUNDERPUNCH, REST, ATTRACT, THIEF, FIRE_PUNCH, FLAMETHROWER, THUNDERBOLT
	; end
