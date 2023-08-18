BattleCommand_StartSandstorm:
	ld a, [wBattleWeather]
	cp WEATHER_SANDSTORM
	jr z, .failed

	ld a, WEATHER_SANDSTORM
	ld [wBattleWeather], a
	ld a, 5
	push af

	push bc
	call GetUserItem
	ld a, b
	cp HELD_SMOOTH_ROCK
	pop bc
	pop af
	jr nz, .norock
	inc a
	inc a
.norock
	ld [wWeatherCount], a
	call AnimateCurrentMove
	ld hl, SandstormBrewedText
	jp StdBattleTextbox

.failed
	call AnimateFailedMove
	jp PrintButItFailed
