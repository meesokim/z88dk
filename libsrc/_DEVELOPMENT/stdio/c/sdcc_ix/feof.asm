
; int feof(FILE *stream)

INCLUDE "clib_cfg.asm"

SECTION code_stdio

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
IF __CLIB_OPT_MULTITHREAD & $02
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _feof

EXTERN _feof_fastcall

_feof:

   pop af
   pop hl
   
   push hl
   push af

   jp _feof_fastcall

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ELSE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

PUBLIC _feof

EXTERN _feof_unlocked

defc _feof = _feof_unlocked

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ENDIF
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
