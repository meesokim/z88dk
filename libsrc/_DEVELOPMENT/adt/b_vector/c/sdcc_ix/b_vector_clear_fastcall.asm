
; void b_vector_clear_fastcall(b_vector_t *v)

SECTION code_adt_b_vector

PUBLIC _b_vector_clear_fastcall

EXTERN _b_array_clear_fastcall

defc _b_vector_clear_fastcall = _b_array_clear_fastcall

INCLUDE "adt/b_vector/z80/asm_b_vector_clear.asm"
