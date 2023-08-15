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
