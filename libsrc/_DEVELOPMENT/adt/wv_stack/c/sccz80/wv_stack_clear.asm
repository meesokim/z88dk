
; void wv_stack_clear(wv_stack_t *s)

SECTION code_adt_wv_stack

PUBLIC wv_stack_clear

defc wv_stack_clear = asm_wv_stack_clear

INCLUDE "adt/wv_stack/z80/asm_wv_stack_clear.asm"
