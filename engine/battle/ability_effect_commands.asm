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
    cp 60
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
    ret
.rattled_trigger
    call BattleCommand_SpeedUp
    call BattleCommand_StatUpMessage
    ret
.thickfat
    cp THICK_FAT
    jr nz, .levitate
    ld a, d
    cp FIRE
    jr z, .thick_fat_resist
    cp ICE
    ret
.thick_fat_resist
    ld a, NOT_VERY_EFFECTIVE
    ld [wTypeMatchup], a
    ret
.levitate
    cp LEVITATE
    jr nz, .lightningrod
    ld a, d
    cp GROUND
    ret
    xor a                           ; 0 is the same as no effect
    ld [wTypeMatchup], a
    ret
.lightningrod
    cp LIGHTNINGROD
    jr nz, .sapsipper
    ld a, d
    cp ELECTRIC
    ret
    xor a
    ld [wTypeMatchup], a
    call BattleCommand_SpecialAttackUp
    call BattleCommand_StatUpMessage
    ret
.sapsipper
    cp SAP_SIPPER
    jr nz, .voltabsorb
    cp GRASS
    ret
    xor a
    ld [wTypeMatchup], a
    call BattleCommand_AttackUp
    call BattleCommand_StatUpMessage
    ret
.voltabsorb
    cp VOLT_ABSORB
    jr nz, .waterabsorb
    ld a, d
    cp ELECTRIC
    ret
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    ret
.waterabsorb
    cp WATER_ABSORB
    jr nz, .eartheater
    cp WATER
    ret
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    ret
.eartheater
    cp EARTH_EATER
    jr nz, .dryskin
    cp GROUND
    ret
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    ret
.dryskin
    cp DRY_SKIN
    ret
    cp WATER
    jr nz, .fireweak
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    ret
.fireweak
    cp FIRE
    ret
    ld a, MORE_EFFECTIVE
    ld [wTypeMatchup], a
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
    ret
    ld a, BATTLE_VARS_ABILITY_OPP
    call GetBattleVar
    cp ROUGH_SKIN
    jr nz, .poisonpoint
    ld hl, GetEighthMaxHP
    call CallBattleCore
    ld hl, SubtractHPFromUser
    call CallBattleCore
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
    call BattleRandom
    call ThirtyPercentCheck
    ret nc
    call BattleCommand_SwitchTurn
    call BattleCommand_Poison
    call BattleCommand_SwitchTurn
    ret
.cottondown
    cp COTTON_DOWN
    jr nz, .flamebody
	ld a, SPEED
	call LowerStat
	call BattleCommand_SwitchTurn
	call BattleCommand_StatDownMessage
	call BattleCommand_SwitchTurn
    ret
.flamebody
    cp FLAME_BODY
    ret nz
    call BattleRandom
    call ThirtyPercentCheck
    ret nc
    call BattleCommand_SwitchTurn
    call BattleCommand_Burn
    call BattleCommand_SwitchTurn
    ret
ThirtyPercentCheck:
    call BattleRandom
    cp 70 percent
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
