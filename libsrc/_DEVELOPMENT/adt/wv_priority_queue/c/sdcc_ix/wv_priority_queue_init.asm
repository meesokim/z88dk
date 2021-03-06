
; wv_priority_queue_t *
; wv_priority_queue_init(void *p, size_t capacity, size_t max_size, int (*compar)(const void *, const void *))

SECTION code_adt_wv_priority_queue

PUBLIC _wv_priority_queue_init

EXTERN l0_wv_priority_queue_init_callee

_wv_priority_queue_init:

   pop af
   pop de
   pop bc
   pop hl
   exx
   pop bc
   
   push bc
   push hl
   push bc
   push de
   push af

   jp l0_wv_priority_queue_init_callee
