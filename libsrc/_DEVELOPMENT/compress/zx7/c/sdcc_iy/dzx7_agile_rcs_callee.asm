
; void dzx7_agile_rcs_callee(void *src, void *dst)

SECTION code_compress_zx7

PUBLIC _dzx7_agile_rcs_callee

EXTERN asm_dzx7_agile_rcs

_dzx7_agile_rcs_callee:

   pop af
   pop hl
   pop de
   push af
   
   jp asm_dzx7_agile_rcs
