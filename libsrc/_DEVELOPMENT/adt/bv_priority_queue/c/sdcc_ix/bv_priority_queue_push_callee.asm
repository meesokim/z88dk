
; int bv_priority_queue_push_callee(bv_priority_queue_t *q, int c)

SECTION code_adt_bv_priority_queue

PUBLIC _bv_priority_queue_push_callee, l0_bv_priority_queue_push_callee

_bv_priority_queue_push_callee:

   pop af
   pop hl
   pop bc
   push af

l0_bv_priority_queue_push_callee:

   push ix
   call asm_bv_priority_queue_push
   pop ix
   
   ret
   
   INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_push.asm"
