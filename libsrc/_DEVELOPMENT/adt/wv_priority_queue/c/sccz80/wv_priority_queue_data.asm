
; void *wv_priority_queue_data(wv_priority_queue_t *q)

SECTION code_adt_wv_priority_queue

PUBLIC wv_priority_queue_data

defc wv_priority_queue_data = asm_wv_priority_queue_data

INCLUDE "adt/wv_priority_queue/z80/asm_wv_priority_queue_data.asm"
