
; int b_vector_resize(b_vector_t *v, size_t n)

SECTION code_adt_b_vector

PUBLIC b_vector_resize_callee

b_vector_resize_callee:

   pop hl
   pop de
   ex (sp),hl
   
   INCLUDE "adt/b_vector/z80/asm_b_vector_resize.asm"
