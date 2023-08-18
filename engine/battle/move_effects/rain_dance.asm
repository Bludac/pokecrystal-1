BattleCommand_StartRain:
	ld a, [wBattleWeather]
	cp WEATHER_RAIN
	jr z, .failed

	ld a, WEATHER_RAIN
	ld [wBattleWeather], a
	ld a, 5
	push af

	push bc
	call GetUserItem
	ld a, b
	cp HELD_DAMP_ROCK
	pop bc
	pop af
	jr nz, .norock
	inc a
	inc a
.norock
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, DownpourText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
