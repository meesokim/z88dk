
; size_t ba_priority_queue_capacity(ba_priority_queue_t *q)

SECTION code_adt_ba_priority_queue

PUBLIC ba_priority_queue_capacity

defc ba_priority_queue_capacity = asm_ba_priority_queue_capacity

INCLUDE "adt/ba_priority_queue/z80/asm_ba_priority_queue_capacity.asm"
