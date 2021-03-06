
; DRAW LOAD SPRITE 1 BYTE DEFINITION NO ROTATION
; 01.2006 aralbrec, Sprite Pack v3.0
; sinclair spectrum version

INCLUDE "clib_target_cfg.asm"

SECTION code_temp_sp1

PUBLIC _SP1_DRAW_LOAD1NR

EXTERN SP1RETSPRDRAW

; following data segment copied into struct sp1_cs

   ld hl,0
   nop
   ld de,0
   call _SP1_DRAW_LOAD1NR

; following draw code called by way of SP1UpdateNow
;
;  a = hor rot table
; bc = graphic disp
; hl = graphic def ptr
; de = left graphic def ptr
;
; 11 + 7*16 + 10 + 14 + 10 = 157 cycles

_SP1_DRAW_LOAD1NR:

   add hl,bc

   ; hl = sprite def (graph only)

   ld de,SP1V_PIXELBUFFER
   ldi
   ldi
   ldi
   ldi
   ldi
   ldi
   ldi
   ld a,(hl)
   ld (de),a

   jp SP1RETSPRDRAW
