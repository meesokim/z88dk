
; int bv_priority_queue_resize_callee(bv_priority_queue_t *q, size_t n)

SECTION code_adt_bv_priority_queue

PUBLIC _bv_priority_queue_resize_callee

EXTERN _ba_priority_queue_resize_callee

defc _bv_priority_queue_resize_callee = _ba_priority_queue_resize_callee

INCLUDE "adt/bv_priority_queue/z80/asm_bv_priority_queue_resize.asm"
