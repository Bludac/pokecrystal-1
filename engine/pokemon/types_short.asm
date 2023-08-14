PrintEnemyTypes:
; Print one or both types of [wCurSpecies]
; on the stats screen at hl.

	push hl
	call GetBaseData
	pop hl

	push hl
	ld a, [wBaseType1]
	call .Print

	; Single-typed monsters really
	; have two of the same type.
	ld a, [wBaseType1]
	ld b, a
	ld a, [wBaseType2]
	cp b
	pop hl
	ret z

	ld bc, 4
	add hl, bc

.Print:
	ld b, a
	jr PrintTypeShort

PrintTypeShort:
; Print type b at hl.

	ld a, b

	push hl
	add a
	ld hl, TypeShortNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	jp PlaceString

GetMoveType:
	ld a, b
	dec a
	ld bc, MOVE_LENGTH
	ld hl, Moves + MOVE_TYPE
	call AddNTimes
	ld a, Bank(Moves)
	call GetFarByte
	ld b, a
	ret

INCLUDE "data/types/names_short.asm"
