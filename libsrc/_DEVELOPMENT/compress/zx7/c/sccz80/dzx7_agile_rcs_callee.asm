
; void dzx7_agile_rcs_callee(void *src, void *dst)

SECTION code_compress_zx7

PUBLIC dzx7_agile_rcs_callee

EXTERN asm_dzx7_agile_rcs

dzx7_agile_rcs_callee:

   pop hl
   pop de
   ex (sp),hl
   
   jp asm_dzx7_agile_rcs
