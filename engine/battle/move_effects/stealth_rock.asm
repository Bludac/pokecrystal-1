BattleCommand_StealthRock:
	ld hl, wEnemyScreens
	ldh a, [hBattleTurn]
	and a
	jr z, .got_screens
	ld hl, wPlayerScreens
.got_screens

; Fails if spikes are already down!

	bit SCREENS_STEALTH_ROCK, [hl]
	jr nz, .failed

; Nothing else stops it from working.

	set SCREENS_STEALTH_ROCK, [hl]

	call AnimateCurrentMove

	ld hl, SpikesText
	jp StdBattleTextbox

.failed
	jp FailMove
