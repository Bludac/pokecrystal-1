INCLUDE "data/moves/effects_pointers.asm"

MoveEffects: ; used only for BANK(MoveEffects)

NormalHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

DoSleep:
	usedmovetext
	doturn
	checkhit
	checkpowder
	checksafeguard
	sleeptarget
	endmove

PoisonHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	poisontarget
	kingsrock
	endmove

LeechHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	draintarget
	checkfaint
	buildopponentrage
	kingsrock
	endmove

BurnHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	burntarget
	kingsrock
	endmove

FreezeHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	freezetarget
	kingsrock
	endmove

ParalyzeHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	paralyzetarget
	kingsrock
	endmove

Selfdestruct:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	selfdestruct
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

DreamEater:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	eatdream
	checkfaint
	buildopponentrage
	kingsrock
	endmove

AttackUp:
	usedmovetext
	doturn
	attackup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

DefenseUp:
	usedmovetext
	doturn
	defenseup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpeedUp:
	usedmovetext
	doturn
	speedup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpecialAttackUp:
	usedmovetext
	doturn
	specialattackup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpecialDefenseUp:
	usedmovetext
	doturn
	specialdefenseup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

AccuracyUp:
	usedmovetext
	doturn
	accuracyup
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

EvasionUp:
	usedmovetext
	doturn
	lowersub
	evasionup
	statupanim
	lowersubnoanim
	raisesub
	statupmessage
	statupfailtext
	endmove

AttackUp2:
	usedmovetext
	doturn
	attackup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

DefenseUp2:
	usedmovetext
	doturn
	defenseup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpeedUp2:
	usedmovetext
	doturn
	speedup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpecialAttackUp2:
	usedmovetext
	doturn
	specialattackup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

SpecialDefenseUp2:
	usedmovetext
	doturn
	specialdefenseup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

AccuracyUp2:
	usedmovetext
	doturn
	accuracyup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

EvasionUp2:
	usedmovetext
	doturn
	evasionup2
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

DragonDance:
	usedmovetext
	doturn
	dragondance
	endmove

BulkUp:
	usedmovetext
	doturn
	bulkup
	endmove

CalmMind:
	usedmovetext
	doturn
	calmmind
	endmove

WorkUp:
	usedmovetext
	doturn
	workup
	endmove

Growth:
	usedmovetext
	doturn
	growth
	endmove

CosmicPower:
	usedmovetext
	doturn
	cosmicpower
	endmove

Coil:
	usedmovetext
	doturn
	coil
	endmove

AttackDown:
	usedmovetext
	doturn
	checkhit
	attackdown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

DefenseDown:
	usedmovetext
	doturn
	checkhit
	defensedown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpeedDown:
	usedmovetext
	doturn
	checkhit
	speeddown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpecialAttackDown:
	usedmovetext
	doturn
	checkhit
	specialattackdown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpecialDefenseDown:
	usedmovetext
	doturn
	checkhit
	specialdefensedown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

AccuracyDown:
	usedmovetext
	doturn
	checkhit
	accuracydown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

EvasionDown:
	usedmovetext
	doturn
	checkhit
	evasiondown
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

AttackDown2:
	usedmovetext
	doturn
	checkhit
	attackdown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

DefenseDown2:
	usedmovetext
	doturn
	checkhit
	defensedown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpeedDown2:
	usedmovetext
	doturn
	checkhit
	checkpowder
	speeddown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpecialAttackDown2:
	usedmovetext
	doturn
	checkhit
	specialattackdown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

SpecialDefenseDown2:
	usedmovetext
	doturn
	checkhit
	specialdefensedown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

AccuracyDown2:
	usedmovetext
	doturn
	checkhit
	accuracydown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

EvasionDown2:
	usedmovetext
	doturn
	checkhit
	evasiondown2
	lowersub
	statdownanim
	raisesub
	statdownmessage
	statdownfailtext
	endmove

AttackDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	attackdown
	statdownmessage
	kingsrock
	endmove

DefenseDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	defensedown
	statdownmessage
	kingsrock
	endmove

SpeedDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	speeddown
	statdownmessage
	kingsrock
	endmove

SpecialAttackDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	specialattackdown
	statdownmessage
	kingsrock
	endmove

SpecialDefenseDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	specialdefensedown
	statdownmessage
	kingsrock
	endmove

AccuracyDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	accuracydown
	statdownmessage
	kingsrock
	endmove

EvasionDownHit:
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	evasiondown
	statdownmessage
	kingsrock
	endmove

DefenseUpHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	defenseup
	statupmessage
	checkfaint
	buildopponentrage
	kingsrock
	endmove

AttackUpHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	attackup
	statupmessage
	checkfaint
	buildopponentrage
	kingsrock
	endmove

SpAtkUpHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	specialattackup
	statupmessage
	checkfaint
	buildopponentrage
	kingsrock
	endmove

AllUpHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	allstatsup
	checkfaint
	buildopponentrage
	kingsrock
	endmove

ResetStats:	
	usedmovetext
	doturn
	resetstats
	endmove

ClearSmog:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	;moveanim	there is a spot in the reset stats battle command that calls the move animation so this should be safe to cut
	resetstats
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Rampage:
	checkrampage
	doturn
	rampage
	usedmovetext
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

ForceSwitch:	
	usedmovetext
	doturn
	checkhit
	forceswitch
	endmove

MultiHit:	
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	kingsrock
	endloop
	raisesub
	endmove

PoisonMultiHit:	
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	effectchance
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	kingsrock
	endloop
	raisesub
	poisontarget
	endmove

FlinchHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

RecoilHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	recoil
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Mist:	
	usedmovetext
	doturn
	mist
	endmove

FocusEnergy:	
	usedmovetext
	doturn
	focusenergy
	endmove

DoConfuse:	
	usedmovetext
	doturn
	checkhit
	checksafeguard
	confuse
	endmove

ConfuseHit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	confusetarget
	kingsrock
	endmove

Heal:	
	usedmovetext
	doturn
	heal
	endmove

Transform:	
	usedmovetext
	doturn
	transform
	endmove

LightScreen:
Reflect:	
	usedmovetext
	doturn
	screen
	endmove

TriAttack:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	tristatuschance
	kingsrock
	endmove

Toxic:
DoPoison:	
	usedmovetext
	doturn
	checkhit
	checkpowder
	stab
	checksafeguard
	poison
	endmove

DoParalyze:	
	usedmovetext
	doturn
	stab
	checkhit
	checkpowder
	checksafeguard
	paralyze
	endmove

DoBurn:	
	usedmovetext
	doturn
	stab
	checkhit
	checkpowder
	checksafeguard
	burn
	endmove

Substitute:	
	usedmovetext
	doturn
	substitute
	endmove

HyperBeam:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	rechargenextturn
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Draco:	
	usedmovetext
	doturn
	critical
	effectchance
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	draco
	checkfaint
	buildopponentrage
	kingsrock
	endmove

CloseCombat:	
	usedmovetext
	doturn
	critical
	effectchance
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	closecombat
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Hammer:	
	usedmovetext
	doturn
	critical
	effectchance
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	hammer
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Rage:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	checkhit
	ragedamage
	damagevariation
	moveanim
	failuretext
	rage
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Metronome:	
	usedmovetext
	doturn
	metronome
	endmove

LeechSeed:	
	usedmovetext
	doturn
	checkhit
	leechseed
	endmove

Disable:	
	usedmovetext
	doturn
	checkhit
	disable
	endmove

Fly:
	checkcharge	
	doturn
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanimnosub
	raisesub
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

TrapTarget:	
	usedmovetext
	doturn
	checkhit
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	clearmissdamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	traptarget
	endmove

SuperFang:
StaticDamage:	
	usedmovetext
	doturn
	constantdamage
	checkhit
	resettypematchup
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Reversal:	
	usedmovetext
	doturn
	constantdamage
	stab
	checkhit
	moveanim
	failuretext
	applydamage
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Counter:	
	usedmovetext
	doturn
	counter
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	endmove

Encore:	
	usedmovetext
	doturn
	checkhit
	encore
	endmove

PainSplit:	
	usedmovetext
	doturn
	checkhit
	painsplit
	endmove

Snore:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	snore
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	kingsrock
	endmove

LockOn:	
	usedmovetext
	doturn
	checkhit
	lockon
	endmove

DefrostOpponent:	
	usedmovetext
	doturn
	defrostopponent
	endmove

SleepTalk:	
	usedmovetext
	doturn
	sleeptalk
	endmove

DestinyBond:	
	usedmovetext
	doturn
	destinybond
	endmove

Spite:	
	usedmovetext
	doturn
	checkhit
	spite
	endmove

HealBell:	
	usedmovetext
	doturn
	healbell
	endmove

TripleKick:
	usedmovetext
	doturn
	startloop
	lowersub
	checkhit
	critical
	damagestats
	damagecalc
	triplekick
	stab
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivelooptext
	checkfaint
	buildopponentrage
	kingsrock
	kickcounter
	endloop
	raisesub
	endmove

Thief:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	thief
	checkfaint
	buildopponentrage
	kingsrock
	endmove

MeanLook:	
	usedmovetext
	doturn
	arenatrap
	endmove

FlameWheel:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	defrost
	checkfaint
	buildopponentrage
	kingsrock
	burntarget
	endmove

Curse:	
	usedmovetext
	doturn
	curse
	endmove

Protect:	
	usedmovetext
	doturn
	protect
	endmove

Spikes:	
	usedmovetext
	doturn
	spikes
	endmove

ToxicSpikes:	
	usedmovetext
	doturn
	toxicspikes
	endmove

Foresight:	
	usedmovetext
	doturn
	checkhit
	foresight
	endmove

PerishSong:	
	usedmovetext
	doturn
	perishsong
	endmove

Sandstorm:	
	usedmovetext
	doturn
	startsandstorm
	endmove

Rollout:
	checkcurl	
	doturn
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	checkhit
	rolloutpower
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

FuryCutter:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	checkhit
	furycutter
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Return:	
	usedmovetext
	doturn
	critical
	damagestats
	happinesspower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Safeguard:	
	usedmovetext
	doturn
	safeguard
	endmove

SacredFire:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	defrost
	checkfaint
	buildopponentrage
	kingsrock
	burntarget
	endmove

Magnitude:	
	usedmovetext
	doturn
	critical
	damagestats
	getmagnitude
	damagecalc
	stab
	damagevariation
	checkhit
	doubleundergrounddamage
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

BatonPass:	
	usedmovetext
	doturn
	batonpass
	endmove

Pursuit:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	pursuit
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

RapidSpin:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	clearhazards
	speedup
	statupmessage
	checkfaint
	buildopponentrage
	kingsrock
	endmove

HiddenPower:	
	usedmovetext
	doturn
	critical
	hiddenpower
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

RainDance:	
	usedmovetext
	doturn
	startrain
	endmove

SunnyDay:	
	usedmovetext
	doturn
	startsun
	endmove

FakeOut:	
	usedmovetext
	doturn
	checkhit
	fakeout
	moveanim
	failuretext
	endmove

BellyDrum:	
	usedmovetext
	doturn
	bellydrum
	endmove

PsychUp:	
	usedmovetext
	doturn
	psychup
	endmove

MirrorCoat:	
	usedmovetext
	doturn
	mirrorcoat
	moveanim
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	endmove

Twister:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleflyingdamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	flinchtarget
	endmove

Earthquake:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleundergrounddamage
	checkhit
	effectchance
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

FutureSight:
	checkfuturesight	
	usedmovetext
	doturn
	damagestats
	damagecalc
	futuresight
	damagevariation ; skip here if last turn
	checkhit
	moveanimnosub
	failuretext
	applydamage
	checkfaint
	buildopponentrage
	endmove

Gust:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	doubleflyingdamage
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Solarbeam:
	checkcharge	
	doturn
	skipsuncharge
	charge
	usedmovetext
	critical
	damagestats
	damagecalc
	stab
	damagevariation
	checkhit
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endmove

Thunder:	
	usedmovetext
	doturn
	critical
	damagestats
	damagecalc
	thunderaccuracy
	checkhit
	effectchance
	stab
	damagevariation
	moveanim
	failuretext
	applydamage
	criticaltext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	paralyzetarget
	endmove

Teleport:	
	usedmovetext
	doturn
	teleport
	endmove

BeatUp:	
	usedmovetext
	movedelay
	doturn
	startloop
	lowersub
	checkhit
	critical
	beatup
	damagecalc
	damagevariation
	clearmissdamage
	moveanimnosub
	failuretext
	applydamage
	criticaltext
	cleartext
	supereffectivetext
	checkfaint
	buildopponentrage
	kingsrock
	endloop
	beatupfailtext
	raisesub
	endmove

DefenseCurl:	
	usedmovetext
	doturn
	defenseup
	curl
	lowersub
	statupanim
	raisesub
	statupmessage
	statupfailtext
	endmove

Hail:	
	usedmovetext
	doturn
	starthail
	endmove
