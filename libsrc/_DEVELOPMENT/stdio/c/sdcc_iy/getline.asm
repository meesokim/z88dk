
; size_t getline(char **lineptr, size_t *n, FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _getline

EXTERN asm_getline

_getline:

   pop af
   pop hl
   pop de
   pop ix
   
   push hl
   push de
   push hl
   push af
   
   jp asm_getline

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _getline

EXTERN _getline_unlocked

defc _getline = _getline_unlocked

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
