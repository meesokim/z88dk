
; void *calloc_unlocked(size_t nmemb, size_t size)

SECTION code_alloc_malloc

PUBLIC calloc_unlocked_callee

calloc_unlocked_callee:

   pop hl
   pop bc
   ex (sp),hl
   
   INCLUDE "alloc/malloc/z80/asm_calloc_unlocked.asm"
