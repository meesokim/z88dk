
; void w_array_clear_fastcall(w_array_t *a)

SECTION code_adt_w_array

PUBLIC _w_array_clear_fastcall

defc _w_array_clear_fastcall = asm_w_array_clear

INCLUDE "adt/w_array/z80/asm_w_array_clear.asm"
