
SECTION code_sound_bit

PUBLIC _bitfx_31

INCLUDE "clib_target_cfg.asm"

EXTERN asm_bit_beep_raw

_bitfx_31:

   ; fx8 effect
   
   ld b,1

fx8_1:

   push bc
   
   ld hl,2600
   ld de,2

fx8_2:

   push de
   push hl
   
   call asm_bit_beep_raw
   inc hl
   
   pop hl
   pop de
   
   push de
   push hl
   
   ld bc,400
   sbc hl,bc
   
   ld l,c
   ld h,b
   
   call asm_bit_beep_raw
   
   pop hl
   pop de
   
   ld bc,40
   
   or a
   sbc hl,bc
   
   jr nc, fx8_2
   
   pop bc
   djnz fx8_1
   
   scf
   ret
