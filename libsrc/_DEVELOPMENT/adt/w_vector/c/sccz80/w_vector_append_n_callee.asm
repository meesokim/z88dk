
; size_t w_vector_append_n(b_vector_t *v, size_t n, void *item)

SECTION code_adt_w_vector

PUBLIC w_vector_append_n_callee

w_vector_append_n_callee:

   pop hl
   pop bc
   pop de
   ex (sp),hl
   
   INCLUDE "adt/w_vector/z80/asm_w_vector_append_n.asm"
