
; size_t b_array_erase_range(b_array_t *a, size_t idx_first, size_t idx_last)

PUBLIC b_array_erase_range_callee

SECTION code_adt_b_array

b_array_erase_range_callee:

   pop af
   pop hl
   pop bc
   pop de
   push af
   
   INCLUDE "adt/b_array/z80/asm_b_array_erase_range.asm"
