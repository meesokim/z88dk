
; BeepFX sound effect by shiru
; http://shiru.untergrund.net

SECTION rodata_sound_bit

PUBLIC _bfx_39

_bfx_39:

   ; Water_tap

   defb 1 ;tone
   defw 20,200,3400,10,64
   defb 0
