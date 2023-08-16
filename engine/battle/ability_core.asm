SpeedBoostingAbilities:
    db CHLOROPHYLL
    db SWIFT_SWIM
    db SAND_RUSH
    db SLUSH_RUSH
    db -1

WeatherSpeedBoost:  ;a is the ability and hl is the speed
    cp CHLOROPHYLL
    jr nz, .swiftswim
    ld a, [wBattleWeather]
    cp WEATHER_SUN
    jr nz, .norelevantweather
    add hl, hl
.swiftswim
    cp SWIFT_SWIM
    jr nz, .sandrush
    ld a, [wBattleWeather]
    cp WEATHER_RAIN
    jr nz, .norelevantweather
    add hl, hl
.sandrush
    cp SAND_RUSH
    jr nz, .slushrush
    ld a, [wBattleWeather]
    cp WEATHER_SANDSTORM
    jr nz, .norelevantweather
    add hl, hl
.slushrush
    cp SLUSH_RUSH               ;this should be unecessary
    jr nz, .norelevantweather   ;this shouldnt happen
    ld a, [wBattleWeather]
    cp WEATHER_HAIL
    jr nz, .norelevantweather
    add hl, hl

.norelevantweather
    ret

HandlePoisonHeal:   ;eigthmaxhp stored in bc
	ld hl, wEnemyMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .ok
	ld hl, wBattleMonMaxHP
.ok
	ld a, [hli]
	ld [wHPBuffer1 + 1], a
	ld a, [hld]
	ld [wHPBuffer1], a
	dec hl
	ld a, [hl]
	ld [wHPBuffer2], a
	add c
	ld [hld], a
	ld [wHPBuffer3], a
	ld a, [hl]
	ld [wHPBuffer2 + 1], a
	adc b
	ld [hli], a
	ld [wHPBuffer3 + 1], a

	ld a, [wHPBuffer1]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [wHPBuffer1 + 1]
	ld b, a
	ld a, [hl]
	sbc b
	jr c, .overflow
	ld a, b
	ld [hli], a
	ld [wHPBuffer3 + 1], a
	ld a, c
	ld [hl], a
	ld [wHPBuffer3], a
.overflow
    jp UpdateHPBarBattleHuds

HandleBetweenTurnAbilities:
	ld a, [wEnemyGoesFirst]
	jr z, .DoEnemyFirst
	call SetPlayerTurn
	call .do_it
	call SetEnemyTurn
	jp .do_it

.DoEnemyFirst:
	call SetEnemyTurn
	call .do_it
	call SetPlayerTurn
.do_it
	ld a, BATTLE_VARS_ABILITY
	call GetBattleVar
	cp SPEED_BOOST
	jr nz, .shedskin
	farcall BattleCommand_SpeedUp
    farcall BattleCommand_StatUpMessage
	ret
.shedskin
	cp SHED_SKIN
	ret nz
	ld a, BATTLE_VARS_STATUS
	call GetBattleVar
	cp 0
	ret z
	call BattleRandom
    cp 33 percent
	ret nc
	ldh a, [hBattleTurn]
    and a
	jr nz, .shedskin_enemy
	ld [wBattleMonStatus], a
	jr .text
.shedskin_enemy
	xor a
	ld [wEnemyMonStatus], a
.text
	ld hl, BattleText_ShedSkin
	call StdBattleTextbox
	call UpdateBattleHUDs
	ret

HalfHPAbility:
	call SetPlayerTurn
	ld a, [wEnemySubStatus4]
	bit SUBSTATUS_BERSERK_PANIC, a
	jr nz, .alreadytriggered
	call HalfHPAbilityCheck
.alreadytriggered
	call SetEnemyTurn
	ld a, [wPlayerSubStatus4]
	bit SUBSTATUS_BERSERK_PANIC, a
	ret nz
	jp HalfHPAbilityCheck

HalfHPAbilityCheck:
	ld de, wEnemyMonHP + 1
	ld hl, wEnemyMonMaxHP
	ldh a, [hBattleTurn]
	and a
	jr z, .go
	ld de, wBattleMonHP + 1
	ld hl, wBattleMonMaxHP

.go
; If, and only if, Pokemon's HP is less than half max, activate the ability.
; Store current HP in Buffer 3/4
	push bc
	ld a, [de]
	ld [wHPBuffer2], a
	add a
	ld c, a
	dec de
	ld a, [de]
	inc de
	ld [wHPBuffer2 + 1], a
	adc a
	ld b, a
	ld a, b
	cp [hl]
	ld a, c
	pop bc
	jr z, .equal
	jr c, .less
	ret

.equal
	inc hl
	cp [hl]
	dec hl
	ret nc

.less
	ld a, BATTLE_VARS_ABILITY_OPP
	call GetBattleVar
	cp BERSERK
	jr nz, .Panic
	call SwitchTurnCore
	call SetSubStatus4
	ld hl, BattleText_Berserk
	call StdBattleTextbox
    farcall BattleCommand_SpecialAttackUp2
    farcall BattleCommand_StatUpMessage
	call SwitchTurnCore
    ret
.Panic
	cp PANIC
	ret nz
	call SwitchTurnCore
	call SetSubStatus4
	ld hl, BattleText_Panic
	call StdBattleTextbox
    farcall BattleCommand_SpeedUp2
    farcall BattleCommand_StatUpMessage
	call SwitchTurnCore
    ret

SetSubStatus4:
	ld a, BATTLE_VARS_SUBSTATUS4
	call GetBattleVarAddr
	set SUBSTATUS_BERSERK_PANIC, [hl]
	ret
