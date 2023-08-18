BattleCommand_StartSun:
	ld a, [wBattleWeather]
	cp WEATHER_SUN
	jr z, .failed

	ld a, WEATHER_SUN
	ld [wBattleWeather], a
	ld a, 5
	push af

	push bc
	call GetUserItem
	ld a, b
	cp HELD_HEAT_ROCK
	pop bc
	pop af
	jr nz, .norock
	inc a
	inc a
.norock
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SunGotBrightText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
	