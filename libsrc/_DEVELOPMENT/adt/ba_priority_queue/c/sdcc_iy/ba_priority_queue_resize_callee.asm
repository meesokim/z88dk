
; int ba_priority_queue_resize_callee(ba_priority_queue_t *q, size_t n)

SECTION code_adt_ba_priority_queue

PUBLIC _ba_priority_queue_resize_callee

_ba_priority_queue_resize_callee:

   pop af
   pop hl
   pop de
   push af

   INCLUDE "adt/ba_priority_queue/z80/asm_ba_priority_queue_resize.asm"
