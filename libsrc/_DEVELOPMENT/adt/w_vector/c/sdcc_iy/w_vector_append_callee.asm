
; size_t w_vector_append_callee(b_vector_t *v, void *item)

SECTION code_adt_w_vector

PUBLIC _w_vector_append_callee

_w_vector_append_callee:

   pop af
   pop hl
   pop bc
   push af
   
   INCLUDE "adt/w_vector/z80/asm_w_vector_append.asm"
