
; void *p_list_remove_after(p_list_t *list, void *list_item)

SECTION code_adt_p_list

PUBLIC p_list_remove_after_callee

p_list_remove_after_callee:

   pop af
   pop hl
   pop bc
   push af
   
   INCLUDE "adt/p_list/z80/asm_p_list_remove_after.asm"
