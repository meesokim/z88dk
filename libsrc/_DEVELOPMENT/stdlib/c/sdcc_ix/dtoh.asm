
; size_t dtoh(double x, char *buf, uint16_t prec, uint16_t flag)

SECTION code_stdlib

PUBLIC _dtoh

EXTERN d2mlib, l0_dtoh_callee

_dtoh:

   pop af
   
   pop de
   pop hl
   
   exx
   
   pop hl
   pop de
   pop bc
   
   push bc
   push de
   push hl
   
   exx
   
   push hl
   push de
   
   push af
   
   call d2mlib
   
   jp l0_dtoh_callee
