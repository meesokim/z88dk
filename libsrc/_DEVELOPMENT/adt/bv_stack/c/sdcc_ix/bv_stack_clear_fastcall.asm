
; void bv_stack_clear_fastcall(bv_stack_t *s)

SECTION code_adt_bv_stack

PUBLIC _bv_stack_clear_fastcall

defc _bv_stack_clear_fastcall = asm_bv_stack_clear

INCLUDE "adt/bv_stack/z80/asm_bv_stack_clear.asm"
