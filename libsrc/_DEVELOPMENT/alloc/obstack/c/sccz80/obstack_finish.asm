
; ===============================================================
; Dec 2013
; ===============================================================
; 
; void *obstack_finish(struct obstack *ob)
;
; Return the address of the currently growing object and close
; it.  The next use of the grow functions will create a new
; object.
;
; If no object was growing, the returned address is the next
; free byte in the obstack and this should be treated as a
; zero length block.
;
; ===============================================================

SECTION code_alloc_obstack

PUBLIC obstack_finish

obstack_finish:

   INCLUDE "alloc/obstack/z80/asm_obstack_finish.asm"
