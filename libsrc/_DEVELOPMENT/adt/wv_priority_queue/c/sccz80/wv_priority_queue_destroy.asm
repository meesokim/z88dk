
; void wv_priority_queue_destroy(wv_priority_queue_t *q)

SECTION code_adt_wv_priority_queue

PUBLIC wv_priority_queue_destroy

defc wv_priority_queue_destroy = asm_wv_priority_queue_destroy

INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_destroy.asm"
