
; int ba_stack_pop(ba_stack_t *s)

SECTION code_adt_ba_stack

PUBLIC ba_stack_pop

defc ba_stack_pop = asm_ba_stack_pop

INCLUDE "adt/ba_stack/z80/asm_ba_stack_pop.asm"
