
; size_t dtoe(double x, char *buf, uint16_t prec, uint16_t flag)

SECTION code_stdlib

PUBLIC _dtoe

EXTERN d2mlib, asm_dtoe

_dtoe:

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
   
   jp asm_dtoe
