
; int b_vector_at(b_vector_t *v, size_t idx)

SECTION code_adt_b_vector

PUBLIC b_vector_at_callee

EXTERN b_array_at_callee

defc b_vector_at_callee = b_array_at_callee

INCLUDE "adt/b_vector/z80/asm_b_vector_at.asm"
