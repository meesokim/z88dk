
; void *b_vector_append_block_callee(b_vector_t *v, size_t n)

SECTION code_adt_b_vector

PUBLIC _b_vector_append_block_callee

_b_vector_append_block_callee:

   pop af
   pop hl
   pop de
   push af
   
   INCLUDE "adt/b_vector/z80/asm_b_vector_append_block.asm"
