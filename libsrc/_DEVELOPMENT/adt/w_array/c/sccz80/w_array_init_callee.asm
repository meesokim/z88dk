
; w_array_t *w_array_init(void *p, void *data, size_t capacity)

SECTION code_adt_w_array

PUBLIC w_array_init_callee

w_array_init_callee:

   pop hl
   pop bc
   pop de
   ex (sp),hl
   
   INCLUDE "adt/w_array/z80/asm_w_array_init.asm"
