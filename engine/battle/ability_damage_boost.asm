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
    jr nc, .done
    call GetTenPercent
    add a
    add a
    add a
    add a
    add d
    ld d, a
    jr .done
.technician
	cp TECHNICIAN
	jr nz, .sheerforce
    ld a, d
    cp 60
    jr c, .done
    call GetTenPercent
    add a
    add a
    add a
    add a
    add d
    ld d, a
    jr .done
.sheerforce
	cp SHEER_FORCE
	jr nz, .reckless
    ;need code here to check if move has effect chance and then also
    ;need additional code to zero out that additional chance later
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
    ld b, a
    and TYPE_MASK
    jr nz, .done        ; normal type is zero
    ld a, b
    and %11010111
    ld b, a
    ldh a, [hBattleTurn]
    and a
    jr nz, .EnemyMoveGalvanize
    ;ld wPlayerMoveStructType, b      ;these caused errors and i dont know why
    jr .contGalvanize
.EnemyMoveGalvanize
    ;ld wEnemyMoveStructType, b
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
    cp THICK_FAT
    jr nz, .levitate
    ld a, d
    cp FIRE
    jr z, .thick_fat_resist
    cp ICE
    jp nz, .done
.thick_fat_resist
    ld a, NOT_VERY_EFFECTIVE
    ld [wTypeMatchup], a
    jp .done
.levitate
    cp LEVITATE
    jr nz, .lightningrod
    ld a, d
    cp GROUND
    jp nz, .done
    xor a                           ; 0 is the same as no effect
    ld [wTypeMatchup], a
    jr .done
.lightningrod
    cp LIGHTNINGROD
    jr nz, .sapsipper
    ld a, d
    cp ELECTRIC
    jr nz, .done
    xor a
    ld [wTypeMatchup], a
    call BattleCommand_SpecialAttackUp
    call BattleCommand_StatUpMessage
    jr .done
.sapsipper
    cp SAP_SIPPER
    jr nz, .voltabsorb
    cp GRASS
    jr nz, .done
    xor a
    ld [wTypeMatchup], a
    call BattleCommand_AttackUp
    call BattleCommand_StatUpMessage
    jr .done
.voltabsorb
    cp VOLT_ABSORB
    jr nz, .waterabsorb
    ld a, d
    cp ELECTRIC
    jr nz, .done
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jr .done
.waterabsorb
    cp WATER_ABSORB
    jr nz, .eartheater
    cp WATER
    jr nz, .done
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jr .done
.eartheater
    cp EARTH_EATER
    jr nz, .dryskin
    cp GROUND
    jr nz, .done
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jr .done
.dryskin
    cp DRY_SKIN
    jr nz, .done
    cp WATER
    jr nz, .fireweak
    xor a
    ld [wTypeMatchup], a
    inc a
    ld [wAbsorbAbilityTrigger], a
    jr .done
.fireweak
    cp FIRE
    jr nz, .done
    ld a, MORE_EFFECTIVE
    ld [wTypeMatchup], a
.done
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
