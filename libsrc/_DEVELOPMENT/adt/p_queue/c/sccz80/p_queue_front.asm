
; void *p_queue_front(p_queue_t *q)

SECTION code_adt_p_queue

PUBLIC p_queue_front

defc p_queue_front = asm_p_queue_front

INCLUDE "adt/p_queue/z80/asm_p_queue_front.asm"
