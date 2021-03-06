
; int fflush(FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _fflush

EXTERN asm_fflush

_fflush:

   pop af
   pop ix
   
   push hl
   push af

   jp asm_fflush

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _fflush

EXTERN _fflush_unlocked

defc _fflush = _fflush_unlocked

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
