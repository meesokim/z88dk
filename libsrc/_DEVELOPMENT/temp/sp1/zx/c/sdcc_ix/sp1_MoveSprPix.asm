; void sp1_MoveSprPix(struct sp1_ss *s, struct sp1_Rect *clip, uchar *frame, uint x, uint y)

SECTION code_temp_sp1

PUBLIC _sp1_MoveSprPix

_sp1_MoveSprPix:

   pop af
   exx
   pop bc
   pop iy
   exx
   pop hl
   pop de
   pop bc
   
   push bc
   push de
   push hl
   exx
   push iy
   push bc
   push af
   
   push bc
   ex (sp),ix
   
   call asm_sp1_MoveSprPix
   
   pop ix
   ret

   INCLUDE "temp/sp1/zx/sprites/asm_sp1_MoveSprPix.asm"
