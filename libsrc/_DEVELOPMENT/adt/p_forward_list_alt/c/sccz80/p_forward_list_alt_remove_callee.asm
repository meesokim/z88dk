
; void *p_forward_list_alt_remove(p_forward_list_alt_t *list, void *item)

SECTION code_adt_p_forward_list_alt

PUBLIC p_forward_list_alt_remove_callee

p_forward_list_alt_remove_callee:

   pop hl
   pop bc
   ex (sp),hl
   
   INCLUDE "adt/p_forward_list_alt/z80/asm_p_forward_list_alt_remove.asm"
