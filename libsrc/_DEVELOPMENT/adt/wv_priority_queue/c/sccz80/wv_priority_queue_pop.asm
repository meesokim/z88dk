
; void *wv_priority_queue_pop(wv_priority_queue_t *q)

SECTION code_adt_wv_priority_queue

PUBLIC wv_priority_queue_pop

defc wv_priority_queue_pop = asm_wv_priority_queue_pop

INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_pop.asm"
