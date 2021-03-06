
; void heap_free(void *heap, void *p)

INCLUDE "clib_cfg.asm"

SECTION code_alloc_malloc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $01
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _heap_free

EXTERN asm_heap_free

_heap_free:

   pop af
   pop de
   pop hl
   
   push hl
   push de
   push af
   
   jp asm_heap_free

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _heap_free

EXTERN _heap_free_unlocked

defc _heap_free = _heap_free_unlocked
   
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
