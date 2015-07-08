
; wv_priority_queue_t *
; wv_priority_queue_init_callee(void *p, size_t capacity, size_t max_size, int (*compar)(const void *, const void *))

SECTION code_adt_wv_priority_queue

PUBLIC _wv_priority_queue_init_callee, l0_wv_priority_queue_init_callee

_wv_priority_queue_init_callee:

   pop af
   pop de
   pop bc
   pop hl
   exx
   pop bc
   push af

l0_wv_priority_queue_init_callee:

   push bc
   exx
   
   ex (sp),ix
   
   call asm_wv_priority_queue_init
   
   pop ix
   ret

   INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_init.asm"
