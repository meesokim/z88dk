
; void p_queue_push_callee(p_queue_t *q, void *item)

SECTION code_adt_p_queue

PUBLIC _p_queue_push_callee

EXTERN _p_forward_list_alt_push_back_callee

defc _p_queue_push_callee = _p_forward_list_alt_push_back_callee

INCLUDE "adt/p_queue/z80/asm_p_queue_push.asm"
