
; sp1_ValUpdateStruct

SECTION code_temp_sp1

PUBLIC _sp1_ValUpdateStruct

_sp1_ValUpdateStruct:

   pop af
   pop hl
   
   push hl
   push af

   INCLUDE "temp/sp1/zx/updater/asm_sp1_ValUpdateStruct.asm"
