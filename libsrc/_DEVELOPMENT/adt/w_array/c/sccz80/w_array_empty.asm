
; int w_array_empty(b_array_t *a)

SECTION code_adt_w_array

PUBLIC w_array_empty

defc w_array_empty = asm_w_array_empty

INCLUDE "adt/w_array/z80/asm_w_array_empty.asm"
