;
;	Sharp OZ family functions
;
;	ported from the OZ-7xx SDK by by Alexander R. Pruss
;	by Stefano Bodrato - Oct. 2003
;
;
;	void ozkeyboardoff()
;
; ------
; $Id: ozkbdoff.asm,v 1.2 2015/01/19 01:33:02 pauloscustodio Exp $
;


	PUBLIC	ozkbdoff


ozkbdoff:
        in      a,(7)
        or      1
        out     (7),a
        ret
