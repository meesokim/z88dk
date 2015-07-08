
; float __fsdiv_callee(float dividend, float divisor)

SECTION code_fp_math48

PUBLIC cm48_sdccixp_dsdiv_callee

EXTERN cm48_sdccixp_dcallee2, am48_ddiv, cm48_sdccixp_m482d

cm48_sdccixp_dsdiv_callee:

   ; divide two sdcc floats
   ;
   ; enter : stack = sdcc_float divisor, sdcc_float dividend, ret
   ;
   ; exit  : dehl = sdcc_float(dividend/divisor)
   ;
   ; uses  : af, bc, de, hl, af', bc', de', hl'
   
   call cm48_sdccixp_dcallee2

   ; AC'= divisor
   ; AC = dividend
   
   exx
   call am48_ddiv
   
   jp cm48_sdccixp_m482d
