
; void b_vector_clear(b_vector_t *v)

SECTION code_adt_b_vector

PUBLIC b_vector_clear

defc b_vector_clear = asm_b_vector_clear

INCLUDE "adt/b_vector/z80/asm_b_vector_clear.asm"
