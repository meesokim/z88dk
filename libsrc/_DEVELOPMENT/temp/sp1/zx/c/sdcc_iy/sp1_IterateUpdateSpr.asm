; void sp1_IterateUpdateSpr(struct sp1_ss *s, void *hook2)

SECTION code_temp_sp1

PUBLIC _sp1_IterateUpdateSpr

_sp1_IterateUpdateSpr:

   pop af
   pop hl
   pop ix
   
   push ix
   push hl
   push af
   
   INCLUDE "temp/sp1/zx/sprites/asm_sp1_IterateUpdateSpr.asm"
