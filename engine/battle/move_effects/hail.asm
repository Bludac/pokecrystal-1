BattleCommand_StartHail:
	ld a, [wBattleWeather]
	cp WEATHER_HAIL
	jr z, .failed

	ld a, WEATHER_HAIL
	ld [wBattleWeather], a
	ld a, 5
	push af

	push bc
	call GetUserItem
	ld a, b
	cp HELD_ICY_ROCK
	pop bc
	pop af
	jr nz, .norock
	inc a
	inc a
.norock
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, ItStartedToHailText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
