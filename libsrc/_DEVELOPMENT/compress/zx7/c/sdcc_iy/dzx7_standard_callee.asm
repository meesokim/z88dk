
; void dzx7_standard_callee(void *src, void *dst)

SECTION code_compress_zx7

PUBLIC _dzx7_standard_callee

EXTERN asm_dzx7_standard

_dzx7_standard_callee:

   pop af
   pop hl
   pop de
   push af
   
   jp asm_dzx7_standard
