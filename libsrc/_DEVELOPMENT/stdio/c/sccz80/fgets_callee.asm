
; char *fgets(char *s, int n, FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC fgets_callee

EXTERN asm_fgets

fgets_callee:

   pop af
   pop ix
   pop bc
   pop de
   push af
   
   jp asm_fgets

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC fgets_callee

EXTERN fgets_unlocked_callee

defc fgets_callee = fgets_unlocked_callee

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
