
; size_t bv_stack_size_fastcall(bv_stack_t *s)

SECTION code_adt_bv_stack

PUBLIC _bv_stack_size_fastcall

defc _bv_stack_size_fastcall = asm_bv_stack_size

INCLUDE "adt/bv_stack/z80/asm_bv_stack_size.asm"
