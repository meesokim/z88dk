
; void *b_array_data_fastcall(b_array_t *a)

SECTION code_adt_b_array

PUBLIC _b_array_data_fastcall

defc _b_array_data_fastcall = asm_b_array_data

INCLUDE "adt/b_array/z80/asm_b_array_data.asm"
