
; int bv_priority_queue_push(bv_priority_queue_t *q, int c)

SECTION code_adt_bv_priority_queue

PUBLIC bv_priority_queue_push

bv_priority_queue_push:

   pop hl
   pop bc
   ex (sp),hl
   
   INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_push.asm"
