
SECTION code_sound_bit

PUBLIC _bitfx_22

INCLUDE "clib_target_cfg.asm"

_bitfx_22:

   ; descending buzzer 2

   ld hl,1023

asc1:

   push hl
   ld b,16

asc2:

   rl l
   rl h
   
   jr c, asc3
   
   xor __sound_bit_toggle
   INCLUDE "sound/bit/z80/output_bit_device_2.inc"

asc3:

   djnz asc2
   
   pop hl
   dec hl
   
   ld c,a
   
   ld a,h
   or l
   
   ld a,c
   jr nz, asc1
   
   ret
