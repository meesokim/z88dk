; void __CALLEE__ sp1_Initialize_callee(uchar iflag, uchar colour, uchar tile)
; 03.2006 aralbrec, Sprite Pack v3.0
; sinclair zx version

SECTION code_temp_sp1

PUBLIC sp1_Initialize_callee

sp1_Initialize_callee:

   pop bc
   pop hl
   pop de
   ld h,e
   pop de
   ld a,e
   push bc

   INCLUDE "temp/sp1/zx/updater/asm_sp1_Initialize.asm"
