
; void b_vector_empty_fastcall(b_vector_t *v)

SECTION code_adt_b_vector

PUBLIC _b_vector_empty_fastcall

EXTERN _b_array_empty_fastcall

defc _b_vector_empty_fastcall = _b_array_empty_fastcall

INCLUDE "adt/b_vector/z80/asm_b_vector_empty.asm"
