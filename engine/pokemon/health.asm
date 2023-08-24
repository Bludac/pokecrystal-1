HealParty:
	xor a
	ld [wCurPartyMon], a
	ld hl, wPartySpecies
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr z, .next

	push hl
	call HealPartyMon
	pop hl

.next
	ld a, [wCurPartyMon]
	inc a
	ld [wCurPartyMon], a
	jr .loop

.done
	ret

HealPartyMon:
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld d, h
	ld e, l

	;status restored
	ld hl, MON_STATUS
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a

	;creates a floor for stat exp when healing at pokemon center as a catchup mechanic
	ld hl, MON_LEVEL
	add hl, de
	ld a, [hl]
	ld b, a
	xor a
	ld c, a
.divide_by_5
	inc c
	add 5
	cp b
	jr c, .divide_by_5
	dec c
	ld b, 0
	ld hl, StatExpMinimumTable
	add hl, bc
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	;bc contains the stat exp minimum
	ld hl, MON_STAT_EXP
	add hl, de
	push de
	xor a
	ld d, a
	dec hl
.next
	;we want to get here looking at the low byte of the stat before the stat we want so we inc to the high byte
	inc hl
	ld a, d
	cp 5
	jr nc, .stat_exp_done
	inc a
	ld d, a
	;loop business above, below compares the current stat exp to the minimum stat exp from the table
	ld a, b
	cp [hl]
	inc hl
	jr c, .next
	jr z, .checklowbyte
	;if stat exp is lower than the minimum from the table, we replace it with the minimum
.use_min_stat_exp
	dec hl
	ld a, b
	ld [hl], a
	inc hl
	ld a, c
	ld [hl], a
	jr .next

.checklowbyte
	ld a, c
	cp [hl]
	jr nc, .use_min_stat_exp
	jr .next

.stat_exp_done
	pop de

	push hl
	push de

	ld a, [wCurPartyMon]
	ld e, a
	ld d, 0
	ld hl, wPartySpecies
	add hl, de
	ld a, [hl]
	ld [wCurSpecies], a
	call GetBaseData

	ld a, d
	ld b, a
	ld a, e
	ld c, a

	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_STAT_EXP - 1
	add hl, bc
	ld b, TRUE
	predef CalcMonStats
	pop de
	pop hl

	;health restored
	ld hl, MON_MAXHP
	add hl, de

	; bc = MON_HP
	ld b, h
	ld c, l
	dec bc
	dec bc

	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a

	farcall RestoreAllPP
	ret

ComputeHPBarPixels:
; e = bc * (6 * 8) / de
	ld a, b
	or c
	jr z, .zero
	push hl
	xor a
	ldh [hMultiplicand + 0], a
	ld a, b
	ldh [hMultiplicand + 1], a
	ld a, c
	ldh [hMultiplicand + 2], a
	ld a, 6 * 8
	ldh [hMultiplier], a
	call Multiply
	; We need de to be under 256 because hDivisor is only 1 byte.
	ld a, d
	and a
	jr z, .divide
	; divide de and hProduct by 4
	srl d
	rr e
	srl d
	rr e
	ldh a, [hProduct + 2]
	ld b, a
	ldh a, [hProduct + 3]
	srl b
	rr a
	srl b
	rr a
	ldh [hDividend + 3], a
	ld a, b
	ldh [hDividend + 2], a
.divide
	ld a, e
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ldh a, [hQuotient + 3]
	ld e, a
	pop hl
	and a
	ret nz
	ld e, 1
	ret

.zero
	ld e, 0
	ret

AnimateHPBar:
	call WaitBGMap
	call _AnimateHPBar
	call WaitBGMap
	ret

StatExpMinimumTable:
	dw 0
	dw LV5_STAT_EXP
	dw LV10_STAT_EXP
	dw LV15_STAT_EXP
	dw LV20_STAT_EXP
	dw LV25_STAT_EXP
	dw LV30_STAT_EXP
	dw LV35_STAT_EXP
	dw LV40_STAT_EXP
	dw LV45_STAT_EXP
	dw LV50_STAT_EXP
	dw LV55_STAT_EXP
	dw LV60_STAT_EXP
	dw LV65_STAT_EXP
	dw LV70_STAT_EXP
	dw LV75_STAT_EXP
	dw LV80_STAT_EXP
	dw LV85_STAT_EXP
	dw LV90_STAT_EXP
	dw LV95_STAT_EXP
	dw PERFECT_STAT_EXP
