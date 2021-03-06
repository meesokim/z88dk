
SECTION code_sound_bit

PUBLIC _bitfx_15

INCLUDE "clib_target_cfg.asm"

_bitfx_15:

   ; explosion
   
   ld hl,1

expl:

   push hl
   push af
   
   ld a,__sound_bit_toggle
   ld h,0
   and (hl)
   ld l,a
   
   pop af
   
   xor l
   INCLUDE "sound/bit/z80/output_bit_device_2.inc"

   pop hl
   
   push af
   
   ld b,h
   ld c,l

dly:

   dec bc

   ld a,b
   or c

   jr nz, dly
   
   pop af

   inc hl
   
   bit 1,h
   jr z, expl
   
   ret
