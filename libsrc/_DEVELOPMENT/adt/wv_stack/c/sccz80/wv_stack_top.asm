
; void *wv_stack_top(wv_stack_t *s)

SECTION code_adt_wv_stack

PUBLIC wv_stack_top

defc wv_stack_top = asm_wv_stack_top

INCLUDE "adt/wv_stack/z80/asm_wv_stack_top.asm"
