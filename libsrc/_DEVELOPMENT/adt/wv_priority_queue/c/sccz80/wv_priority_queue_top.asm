
; void *wv_priority_queue_top(wv_priority_queue_t *q)

SECTION code_adt_wv_priority_queue

PUBLIC wv_priority_queue_top

defc wv_priority_queue_top = asm_wv_priority_queue_top

INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_top.asm"
