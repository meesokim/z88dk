
; int ungetc(int c, FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC ungetc_callee

EXTERN asm_ungetc

ungetc_callee:

   pop hl
   pop ix
   ex (sp),hl
   
   jp asm_ungetc

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC ungetc_callee

EXTERN ungetc_unlocked_callee

defc ungetc_callee = ungetc_unlocked_callee

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
