
; void dzx7_mega_callee(void *src, void *dst)

SECTION code_compress_zx7

PUBLIC _dzx7_mega_callee

EXTERN asm_dzx7_mega

_dzx7_mega_callee:

   pop af
   pop hl
   pop de
   push af
   
   jp asm_dzx7_mega
