; void sp1_MoveSprRel(struct sp1_ss *s, struct sp1_Rect *clip, uchar *frame, char rel_row, char rel_col, char rel_vrot, char rel_hrot)

SECTION code_temp_sp1

PUBLIC _sp1_MoveSprRel

_sp1_MoveSprRel:

   exx
   pop bc
   pop ix
   pop de
   exx
   pop hl
   pop de
   ld d,e
   pop bc
   ld e,c
   pop bc
   ld a,c
   pop bc
   ld b,c
   ld c,a
   
   push bc
   push bc
   push bc
   push de
   push hl
   exx
   push de
   push ix
   push bc
   
   push de
   exx
   
   ex (sp),iy
   
   call asm_sp1_MoveSprRel
   
   pop iy
   ret

   INCLUDE "temp/sp1/zx/sprites/asm_sp1_MoveSprRel.asm"
