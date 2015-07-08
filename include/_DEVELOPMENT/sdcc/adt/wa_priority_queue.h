
// automatically generated by m4 from headers in proto subdir


#ifndef _ADT_WA_PRIORITY_QUEUE_H
#define _ADT_WA_PRIORITY_QUEUE_H

#include <stddef.h>

// DATA STRUCTURES

typedef struct wa_priority_queue_s
{

   void       *compar;
   void       *data;
   size_t      size;
   size_t      capacity;

} wa_priority_queue_t;

extern size_t wa_priority_queue_capacity(wa_priority_queue_t *q);
extern size_t wa_priority_queue_capacity_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_capacity(a) wa_priority_queue_capacity_fastcall(a)


extern void wa_priority_queue_clear(wa_priority_queue_t *q);
extern void wa_priority_queue_clear_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_clear(a) wa_priority_queue_clear_fastcall(a)


extern void *wa_priority_queue_data(wa_priority_queue_t *q);
extern void *wa_priority_queue_data_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_data(a) wa_priority_queue_data_fastcall(a)


extern void wa_priority_queue_destroy(wa_priority_queue_t *q);
extern void wa_priority_queue_destroy_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_destroy(a) wa_priority_queue_destroy_fastcall(a)


extern int wa_priority_queue_empty(wa_priority_queue_t *q);
extern int wa_priority_queue_empty_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_empty(a) wa_priority_queue_empty_fastcall(a)


extern wa_priority_queue_t *wa_priority_queue_init(void *p,void *data,size_t capacity,void *compar);
extern wa_priority_queue_t *wa_priority_queue_init_callee(void *p,void *data,size_t capacity,void *compar) __z88dk_callee;
#define wa_priority_queue_init(a,b,c,d) wa_priority_queue_init_callee(a,b,c,d)


extern void *wa_priority_queue_pop(wa_priority_queue_t *q);
extern void *wa_priority_queue_pop_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_pop(a) wa_priority_queue_pop_fastcall(a)


extern int wa_priority_queue_push(wa_priority_queue_t *q,void *item);
extern int wa_priority_queue_push_callee(wa_priority_queue_t *q,void *item) __z88dk_callee;
#define wa_priority_queue_push(a,b) wa_priority_queue_push_callee(a,b)


extern int wa_priority_queue_resize(wa_priority_queue_t *q,size_t n);
extern int wa_priority_queue_resize_callee(wa_priority_queue_t *q,size_t n) __z88dk_callee;
#define wa_priority_queue_resize(a,b) wa_priority_queue_resize_callee(a,b)


extern size_t wa_priority_queue_size(wa_priority_queue_t *q);
extern size_t wa_priority_queue_size_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_size(a) wa_priority_queue_size_fastcall(a)


extern void *wa_priority_queue_top(wa_priority_queue_t *q);
extern void *wa_priority_queue_top_fastcall(wa_priority_queue_t *q) __z88dk_fastcall;
#define wa_priority_queue_top(a) wa_priority_queue_top_fastcall(a)



#endif