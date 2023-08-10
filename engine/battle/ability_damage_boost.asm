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
