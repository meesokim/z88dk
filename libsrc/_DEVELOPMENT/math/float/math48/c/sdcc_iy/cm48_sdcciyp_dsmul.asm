
; float __fsmul (float a1, float a2)

SECTION code_fp_math48

PUBLIC cm48_sdcciyp_dsmul

EXTERN cm48_sdcciyp_dread2, am48_dmul, cm48_sdcciyp_m482d

cm48_sdcciyp_dsmul:

   ; multiply two sdcc floats
   ;
   ; enter : stack = sdcc_float a2, sdcc_float a1, ret
   ;
   ; exit  : dehl = sdcc_float(a1*a2)
   ;
   ; uses  : af, bc, de, hl, af', bc', de', hl'
   
   call cm48_sdcciyp_dread2
   
   ; AC = a2
   ; AC'= a1
   
   call am48_dmul
   
   jp cm48_sdcciyp_m482d
