
; void *w_vector_size(w_vector_t *v)

SECTION code_adt_w_vector

PUBLIC w_vector_size

defc w_vector_size = asm_w_vector_size

INCLUDE "adt/w_vector/z80/asm_w_vector_size.asm"
