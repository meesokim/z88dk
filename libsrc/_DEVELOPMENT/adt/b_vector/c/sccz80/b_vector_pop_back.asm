
; int b_vector_pop_back(b_vector_t *v)

SECTION code_adt_b_vector

PUBLIC b_vector_pop_back

defc b_vector_pop_back = asm_b_vector_pop_back

INCLUDE "adt/b_vector/z80/asm_b_vector_pop_back.asm"
