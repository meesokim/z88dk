;
;	Sharp specific routines
;	by Stefano Bodrato, Fall 2013
;
;	int set_psg(int reg, int val);
;
;	Play a sound by PSG
;
;
;	$Id: set_psg.asm,v 1.2 2015/01/19 01:33:04 pauloscustodio Exp $
;

	PUBLIC	set_psg
	EXTERN		set_psg_callee

	EXTERN ASMDISP_SET_PSG_CALLEE
	

set_psg:

	pop	bc
	pop	de
	pop	hl

	push	hl
	push	de
	push	bc
	
	jp set_psg_callee + ASMDISP_SET_PSG_CALLEE

