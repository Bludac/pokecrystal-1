AbilityDamageBoost:
    push bc

    ld b, a                 ;preserves the ability for later
    ld a, BATTLE_VARS_MOVE
    call GetBattleVar       ;returns with cur move in a
    ld c, a

    ld a, b
	cp TOUGH_CLAWS
	jr nz, .ironfist
    push de
    ld a, c
    ld hl, ContactMoves
    call IsInByteArray
    pop de
    jp nc, .done
    call GetTenPercent
    add a
    add d
    ld d, a
    jp .done
.ironfist
	cp IRON_FIST
	jr nz, .megalauncher
    push de
    ld a, c
    ld hl, PunchMoves
    call IsInByteArray
    pop de
    jp nc, .done
    call GetTenPercent
    add a
    add d
    ld d, a
    jp .done
.megalauncher
	cp MEGA_LAUNCHER
	jr nz, .sharpness
    push de
    ld a, c
    ld hl, LauncherMoves
    call IsInByteArray
    pop de
    jp nc, .done
    call GetTenPercent
    add a
    add a
    add a
    add a
    add d
    ld d, a
    jp .done
.sharpness
	cp SHARPNESS
	jr nz, .technician
    push de
    ld a, c
    ld hl, SlashMoves
    call IsInByteArray
    pop de
    jp nc, .done
    call GetTenPercent
    add a
    add a
    add a
    add a
    add d
    ld d, a
    jp .done
.technician
	cp TECHNICIAN
	jr nz, .sheerforce
    ld a, d
    cp 61
    jp nc, .done
    call GetTenPercent
    add a
    add a
    add a
    add a
    add d
    ld d, a
    jp .done
.sheerforce
	cp SHEER_FORCE
	jr nz, .reckless
    ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
    and STATUS
    cp STATUS
    jr z, .done
    ld hl, wPlayerMoveStruct + MOVE_CHANCE
	ldh a, [hBattleTurn]
	and a
	jr z, .got_move_chance
	ld hl, wEnemyMoveStruct + MOVE_CHANCE
.got_move_chance
    ld a, [hl]
    and a
    jr z, .done
    call GetTenPercent
    add a
    add a
    add d
    ld d, a
    jr .done
.reckless
	cp RECKLESS
    jr nz, .galvanize
    ld a, BATTLE_VARS_MOVE_EFFECT
	call GetBattleVar
    cp EFFECT_RECOIL_HIT
    jr nz, .done
    call GetTenPercent
    add a
    add d
    ld d, a
    jr .done
.galvanize
	cp GALVANIZE
    jr nz, .analytic
    ld a, BATTLE_VARS_MOVE_TYPE
	call GetBattleVar
    and TYPE_MASK
    jr nz, .done    ; normal type is zero
    ldh a, [hBattleTurn]
    and a
    jr nz, .EnemyMoveGalvanize
    ld a, ELECTRIC
    ld [wPlayerMoveStructType], a
    jr .contGalvanize
.EnemyMoveGalvanize
    ld a, ELECTRIC
    ld [wEnemyMoveStructType], a
.contGalvanize
    call GetTenPercent
    add a
    add a
    add d
    ld d, a
    jr .done
.analytic
	cp ANALYTIC
    jr nz, .done
    ldh a, [hBattleTurn]
    and a
    jr nz, .EnemyMoveAnalytic
    ld a, [wEnemyGoesFirst]
    and a
    jr z, .done
    jr .contAnalytic
.EnemyMoveAnalytic
    ld a, [wEnemyGoesFirst]
    and a
    jr nz, .done
.contAnalytic
    call GetTenPercent
    add a
    add a
    add d
    ld d, a
.done
    pop bc
    ret

GetTenPercent:
    ld hl, TenPercent
.loopstart
    ld a, [hli]
    cp d
    jr z, .endloop
    inc hl
    jr .loopstart
.endloop
    ld a, [hl]
    ret

Resist_Immunity_AbilityCheck:        ; d is move type
    ld a, BATTLE_VARS_ABILITY_OPP
    call GetBattleVar
    cp RATTLED
    jr nz, .thickfat
    ld a, d
    cp BUG
    jr z, .rattled_trigger
    cp DARK
    jr z, .rattled_trigger
    cp GHOST
    ret nz
.rattled_trigger
    call BattleCommand_SwitchTurn
    call BattleCommand_SpeedUp
    call BattleCommand_StatUpMessage
    call BattleCommand_SwitchTurn
    ret
.thickfat
    cp THICK_FAT
    jr nz, .levitate
    ld a, d
    cp FIRE
    jr z, .thick_fat_resist
    cp ICE
    ret nz
.thick_fat_resist
    ld a, NOT_VERY_EFFECTIVE
    ld [wTypeMatchup], a
    ld a, [wTypeModifier]
    and %10000000
    add NOT_VERY_EFFECTIVE
    ld [wTypeModifier], a
    ret
.levitate
    cp LEVITATE
    jr nz, .lightningrod
    ld a, d
    cp GROUND
    ret nz
    xor a                           ; 0 is the same as no effect
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    jp .immune
.lightningrod
    cp LIGHTNINGROD
    jr nz, .sapsipper
    ld a, d
    cp ELECTRIC
    ret nz
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    call BattleCommand_SwitchTurn
    call BattleCommand_SpecialAttackUp
    call BattleCommand_StatUpMessage
    call BattleCommand_SwitchTurn
    jp .immune
.sapsipper
    cp SAP_SIPPER
    jr nz, .voltabsorb
    cp GRASS
    ret nz
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    call BattleCommand_SwitchTurn
    call BattleCommand_AttackUp
    call BattleCommand_StatUpMessage
    call BattleCommand_SwitchTurn
    jp .immune
.voltabsorb
    cp VOLT_ABSORB
    jr nz, .waterabsorb
    ld a, d
    cp ELECTRIC
    ret nz
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jp .absorbed
    ret
.waterabsorb
    cp WATER_ABSORB
    jr nz, .eartheater
    cp WATER
    ret nz
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jp .absorbed
    ret
.eartheater
    cp EARTH_EATER
    jr nz, .dryskin
    cp GROUND
    ret nz
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jp .absorbed
    ret
.dryskin
    cp DRY_SKIN
    ret nz
    cp WATER
    jr nz, .fireweak
    xor a
    ld [wTypeMatchup], a
    ld [wTypeModifier], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jp .absorbed
    ret
.fireweak
    cp FIRE
    ret nz
    ld a, MORE_EFFECTIVE
    ld [wTypeMatchup], a
    ld a, [wTypeModifier]
    and %10000000
    add MORE_EFFECTIVE
    ld [wTypeModifier], a
    ret
.immune
    inc a
.absorbed
    ld [wAttackMissed], a
    ret

ContactHitAbilities:
    ld a, BATTLE_VARS_SUBSTATUS4_OPP
	call GetBattleVar
	bit SUBSTATUS_SUBSTITUTE, a
	ret nz
    ld a, BATTLE_VARS_MOVE
    call GetBattleVar
    ld hl, ContactMoves
    call IsInByteArray
    ret nc
    ld a, BATTLE_VARS_ABILITY_OPP
    call GetBattleVar
    cp ROUGH_SKIN
    jr nz, .poisonpoint
    ld hl, GetEighthMaxHP
    call CallBattleCore
    ld hl, SubtractHPFromUser
    call CallBattleCore
    ld hl, RoughSkinText
	call StdBattleTextbox
;this is to see if the pokemon fainted from rough skin
    ld hl, wBattleMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .check_fainted
	ld hl, wEnemyMonHP
.check_fainted
	ld a, [hli]
	or [hl]
	ret nz
.fainted
	call RefreshBattleHuds
	ld c, 20
	call DelayFrames
	xor a
	ret
.poisonpoint
    cp POISON_POINT
    jr nz, .cottondown
    ld a, BATTLE_VARS_STATUS_OPP
    call GetBattleVar
    and a
    ret nz
    call BattleRandom
    call ThirtyPercentCheck
    ret nc
    call BattleCommand_SwitchTurn
    ld hl, PoisonPointText
	call StdBattleTextbox
    call BattleCommand_PoisonTarget
    call BattleCommand_SwitchTurn
    ret
.cottondown
    cp COTTON_DOWN
    jr nz, .flamebody
	ld a, SPEED
	call LowerStat
	call BattleCommand_SwitchTurn
    ld hl, CottonDownText
	call StdBattleTextbox
	call BattleCommand_StatDownMessage
	call BattleCommand_SwitchTurn
    ret
.flamebody
    cp FLAME_BODY
    ret nz
    ld a, BATTLE_VARS_STATUS_OPP
    call GetBattleVar
    and a
    ret nz
    call BattleRandom
    call ThirtyPercentCheck
    ret nc
    call BattleCommand_SwitchTurn
    ld hl, FlameBodyText
	call StdBattleTextbox
    call BattleCommand_BurnTarget
    call BattleCommand_SwitchTurn
    ret

PoisonTouch:
    ld a, BATTLE_VARS_ABILITY
    call GetBattleVar
    cp POISON_TOUCH
    ret nz
    ld a, BATTLE_VARS_STATUS_OPP
    call GetBattleVar
    and a
    ret nz
    call BattleRandom
    call ThirtyPercentCheck
    ret nc
    ld hl, PoisonTouchText
	call StdBattleTextbox
    call BattleCommand_PoisonTarget
    ret

ThirtyPercentCheck:
    call BattleRandom
    cp 30 percent
    ret

SturdyEffect:
    ;check to see if pkmn is at max hp
    call BattleCommand_SwitchTurn
    ld hl, GetMaxHP
    call CallBattleCore
    call BattleCommand_SwitchTurn
    ld hl, wEnemyMonHP
	ldh a, [hBattleTurn]
	and a
	jr z, .got_hp
	ld hl, wBattleMonHP
.got_hp
    ;this perfroms hl-bc and will set the carry flag unless they return zero
    ;since currentHP cannot be greater than maxHP
    ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
    ret c
    ;give them the endure substatus if we get this far
    push bc
    ldh a, [hBattleTurn]
	and a
    jr z, .enemy_substatus
    ld a, [wPlayerSubStatus1]
    jr .got_substatus1
.enemy_substatus
	ld a, [wEnemySubStatus1]	
.got_substatus1
    or SUBSTATUS_ENDURE
    ld b, a
    ldh a, [hBattleTurn]
	and a
    jr z, .enemy_sturdy
    ld a, b
    ld [wPlayerSubStatus1], a
    pop bc
    ret
.enemy_sturdy
    ld a, b
    ld [wEnemySubStatus1], a
    pop bc
    ret

DefiantCompetitive:
    ld a, BATTLE_VARS_ABILITY_OPP
    call GetBattleVar
    cp DEFIANT
    jr nz, .competitive
    ld a, [wLoweredStat]
    push bc
    ld b, a
    push bc
    call BattleCommand_SwitchTurn
    ld hl, DefiantText
	call StdBattleTextbox
    call BattleCommand_AttackUp2
    call BattleCommand_StatUpMessage
    call BattleCommand_SwitchTurn
    pop bc
    ld a, b
    ld [wLoweredStat], a
    pop bc
    ret
.competitive
    cp COMPETITIVE
    ret nz
    ld a, [wLoweredStat]
    push bc
    ld b, a
    push bc
    call BattleCommand_SwitchTurn
    ld hl, CompetitiveText
	call StdBattleTextbox
    call BattleCommand_SpecialAttackUp2
    call BattleCommand_StatUpMessage
    call BattleCommand_SwitchTurn
    pop bc
    ld a, b
    ld [wLoweredStat], a
    pop bc
    ret

DamageBoostingAbilities:
    db TOUGH_CLAWS
    db IRON_FIST
    db MEGA_LAUNCHER
    db SHARPNESS
    db TECHNICIAN
    db SHEER_FORCE
    db RECKLESS
    db GALVANIZE
    db ANALYTIC
    db -1
