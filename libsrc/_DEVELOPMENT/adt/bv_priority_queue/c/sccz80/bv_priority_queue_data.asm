
; void *bv_priority_queue_data(bv_priority_queue_t *q)

SECTION code_adt_bv_priority_queue

PUBLIC bv_priority_queue_data

defc bv_priority_queue_data = asm_bv_priority_queue_data

INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_data.asm"
