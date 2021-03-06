
// automatically generated by m4 from headers in proto subdir


#ifndef _ADT_BA_STACK_H
#define _ADT_BA_STACK_H

#include <stddef.h>

// DATA STRUCTURES

typedef struct ba_stack_s
{

   void       *data;
   size_t      size;
   size_t      capacity;

} ba_stack_t;

extern size_t ba_stack_capacity(ba_stack_t *s);
extern size_t ba_stack_capacity_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_capacity(a) ba_stack_capacity_fastcall(a)


extern void ba_stack_clear(ba_stack_t *s);
extern void ba_stack_clear_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_clear(a) ba_stack_clear_fastcall(a)


extern void ba_stack_destroy(ba_stack_t *s);
extern void ba_stack_destroy_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_destroy(a) ba_stack_destroy_fastcall(a)


extern int ba_stack_empty(ba_stack_t *s);
extern int ba_stack_empty_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_empty(a) ba_stack_empty_fastcall(a)


extern ba_stack_t *ba_stack_init(void *p,void *data,size_t capacity);
extern ba_stack_t *ba_stack_init_callee(void *p,void *data,size_t capacity) __z88dk_callee;
#define ba_stack_init(a,b,c) ba_stack_init_callee(a,b,c)


extern int ba_stack_pop(ba_stack_t *s);
extern int ba_stack_pop_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_pop(a) ba_stack_pop_fastcall(a)


extern int ba_stack_push(ba_stack_t *s,int c);
extern int ba_stack_push_callee(ba_stack_t *s,int c) __z88dk_callee;
#define ba_stack_push(a,b) ba_stack_push_callee(a,b)


extern size_t ba_stack_size(ba_stack_t *s);
extern size_t ba_stack_size_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_size(a) ba_stack_size_fastcall(a)


extern int ba_stack_top(ba_stack_t *s);
extern int ba_stack_top_fastcall(ba_stack_t *s) __z88dk_fastcall;
#define ba_stack_top(a) ba_stack_top_fastcall(a)



#endif
