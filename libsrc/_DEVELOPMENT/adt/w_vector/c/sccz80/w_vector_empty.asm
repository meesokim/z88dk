
; void w_vector_empty(w_vector_t *v)

SECTION code_adt_w_vector

PUBLIC w_vector_empty

defc w_vector_empty = asm_w_vector_empty

INCLUDE "adt/w_vector/z80/asm_w_vector_empty.asm"
