
; void *p_list_front_fastcall(p_list_t *list)

SECTION code_adt_p_list

PUBLIC _p_list_front_fastcall

defc _p_list_front_fastcall = asm_p_list_front

INCLUDE "adt/p_list/z80/asm_p_list_front.asm"
