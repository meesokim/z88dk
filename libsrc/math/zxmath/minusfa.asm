;
;
;       ZX Maths Routines
;
;       8/1/03 - Stefano Bodrato
;
;       $Id: minusfa.asm,v 1.5 2015/01/21 10:56:30 stefano Exp $
;
;       Negate a floating point number
;
;	Strangely the generic minusfa function doesn't do the job for me !
;	I had to write this small function, but this means that probably
;	this FP format differs slightly from the generic one
;


IF FORzx
		INCLUDE  "zxfp.def"
ELSE
		INCLUDE  "81fp.def"
ENDIF


                PUBLIC    minusfa

                EXTERN    fa

.minusfa LD     HL,fa+4
        LD      A,(HL)
        XOR     $80
        LD      (HL),A
        RET

;                PUBLIC    minusfa
;
;                EXTERN	fsetup1
;                EXTERN	stkequ
;
;.minusfa
;        call    fsetup1
;	defb	ZXFP_NEGATE
;	defb	ZXFP_END_CALC
;        jp      stkequ
;
