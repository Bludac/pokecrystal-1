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
	
		ld hl, MON_STATUS
		add hl, de
		xor a
		ld [hli], a
		ld [hl], a
	
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
