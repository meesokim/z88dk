; void sp1_ClearRectInv(struct sp1_Rect *r, uchar colour, uchar tile, uchar rflag)

SECTION code_temp_sp1

PUBLIC _sp1_ClearRectInv

_sp1_ClearRectInv:

   ld hl,2
   add hl,sp
   
   ld e,(hl)
   inc hl
   ld d,(hl)
   inc hl
   
   push hl
   ex de,hl
   
   ld d,(hl)
   inc hl
   ld e,(hl)
   inc hl
   ld b,(hl)
   inc hl
   ld c,(hl)

   pop hl
   
   ld a,(hl)
   ex af,af'
   inc hl
   inc hl
   ld a,(hl)
   inc hl
   inc hl
   ld h,(hl)
   ld l,a
   ld a,h
   ex af,af'
   ld h,a
   ex af,af'

   push ix
   
   call asm_sp1_ClearRectInv
   
   pop ix
   ret

   INCLUDE "temp/sp1/zx/tiles/asm_sp1_ClearRectInv.asm"
