
; int wv_stack_empty(wv_stack_t *s)

SECTION code_adt_wv_stack

PUBLIC wv_stack_empty

defc wv_stack_empty = asm_wv_stack_empty

INCLUDE "adt/wv_stack/z80/asm_wv_stack_empty.asm"
