
; size_t b_array_insert(b_array_t *a, size_t idx, int c)

SECTION code_adt_b_array

PUBLIC b_array_insert_callee

b_array_insert_callee:

   pop hl
   pop de
   pop bc
   ex (sp),hl
   
   INCLUDE "adt/b_array/z80/asm_b_array_insert.asm"
