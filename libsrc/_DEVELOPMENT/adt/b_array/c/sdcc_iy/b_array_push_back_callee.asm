
; size_t b_array_push_back_callee(b_array_t *a, int c)

SECTION code_adt_b_array

PUBLIC _b_array_push_back_callee

EXTERN _b_array_append_callee

defc _b_array_push_back_callee = _b_array_append_callee
   
INCLUDE "adt/b_array/z80/asm_b_array_push_back.asm"
