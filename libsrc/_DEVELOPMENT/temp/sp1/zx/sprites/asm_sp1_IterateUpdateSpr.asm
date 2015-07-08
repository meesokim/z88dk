; void sp1_IterateUpdateSpr(struct sp1_ss *s, void *hook2)
; 11.2006 aralbrec, Sprite Pack v3.0
; sinclair spectrum version

SECTION code_temp_sp1

PUBLIC asm_sp1_IterateUpdateSpr

EXTERN l_jpix

asm_sp1_IterateUpdateSpr:

; Iterate over all the sp1_update* that the sprite's characters
; occupy in row major order, calling the user function for each
; one.  Where a sprite character is not drawn, the user function
; is not called.
;
; enter : hl = & struct sp1_ss
;         ix = user function
; uses  : af, bc, hl + whatever user function uses

   ld bc,15
   add hl,bc              ; hl = & struct sp1_ss.first

   ld c,b                 ; bc = sprite char counter = 0

iterloop:

   ld a,(hl)
   or a
   ret z

   inc hl
   ld l,(hl)
   ld h,a                 ; hl = & next struct sp1_cs
   push hl
   inc hl
   inc hl
   
   ld a,(hl)
   or a
   jr z, skipit
   inc hl
   ld l,(hl)
   ld h,a                 ; hl = struct sp1_update*
   
   push bc
   push hl
   call l_jpix            ; call userfunc(uint count, struct sp1_update *u)
   pop hl
   pop bc
   
skipit:

   pop hl
   inc bc
   jp iterloop
