
; void p_forward_list_alt_push_back(p_forward_list_alt_t *list, void *item)

SECTION code_adt_p_forward_list_alt

PUBLIC p_forward_list_alt_push_back_callee

p_forward_list_alt_push_back_callee:

   pop af
   pop de
   pop bc
   push af
   
   INCLUDE "adt/p_forward_list_alt/z80/asm_p_forward_list_alt_push_back.asm"
