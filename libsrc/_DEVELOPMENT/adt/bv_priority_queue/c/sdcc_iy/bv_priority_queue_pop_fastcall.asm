
; int bv_priority_queue_pop_fastcall(bv_priority_queue_t *q)

SECTION code_adt_bv_priority_queue

PUBLIC _bv_priority_queue_pop_fastcall

EXTERN _ba_priority_queue_pop_fastcall

defc _bv_priority_queue_pop_fastcall = _ba_priority_queue_pop_fastcall

INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_pop.asm"
