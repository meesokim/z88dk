
; size_t w_vector_push_back_callee(w_vector_t *v, int c)

SECTION code_adt_w_vector

PUBLIC _w_vector_push_back_callee

EXTERN _w_vector_append_callee

defc _w_vector_push_back_callee = _w_vector_append_callee

INCLUDE "adt/w_vector/z80/asm_w_vector_push_back.asm"
