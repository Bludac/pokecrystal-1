BattleCommand_StrongWinds:
	ld a, WEATHER_NONE
	ld [wBattleWeather], a
	call AnimateCurrentMove
	ld hl, StrongWindsText
	jp StdBattleTextbox
