TypeShortNames:
; entries correspond to types (see constants/type_constants.asm)
	table_width 2, TypeShortNames
	dw NRM
	dw FGT
	dw FLY2
	dw PSN2
	dw GRN
	dw RCK
	dw BRD
	dw BUGs
	dw GHO
	dw STL
	assert_table_length UNUSED_TYPES
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw NRM
	dw CurseType2
	assert_table_length UNUSED_TYPES_END
	dw FIR
	dw WTR
	dw GRS
	dw ELE
	dw PSY
	dw Ices
	dw DRA
	dw DRK
	dw FAI
	assert_table_length TYPES_END

NRM:    db "NRM@"
FGT:  db "FGT@"
FLY2:    db "FLY@"
PSN2:    db "PSN@"
CurseType2: db "???@"
FIR:      db "FIR@"
WTR:     db "WTR@"
GRS:     db "GRS@"
ELE:  db "ELE@"
PSY:   db "PSY@"
Ices:       db "ICE@"
GRN:    db "GRN@"
RCK:      db "RCK@"
BRD:      db "BRD@"
BUGs:       db "BUG@"
GHO:     db "GHO@"
STL:     db "STL@"
DRA:    db "DRA@"
DRK:      db "DRK@"
FAI:     db "FAI@"