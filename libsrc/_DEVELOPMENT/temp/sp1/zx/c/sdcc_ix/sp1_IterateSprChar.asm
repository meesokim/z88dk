; void sp1_IterateSprChar(struct sp1_ss *s, void *hook1)

SECTION code_temp_sp1

PUBLIC _sp1_IterateSprChar

_sp1_IterateSprChar:

   pop af
   pop hl
   pop bc
   
   push bc
   push hl
   push af
   
   push bc
   ex (sp),ix
   
   call asm_sp1_IterateSprChar
   
   pop ix
   ret

   INCLUDE "temp/sp1/zx/sprites/asm_sp1_IterateSprChar.asm"
