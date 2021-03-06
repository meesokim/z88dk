
; DRAW OR SPRITE 2 BYTE DEFINITION ROTATED, ON LEFT BORDER
; 01.2006 aralbrec, Sprite Pack v3.0
; sinclair spectrum version

INCLUDE "clib_target_cfg.asm"

SECTION code_temp_sp1

PUBLIC _SP1_DRAW_OR2LB

EXTERN _SP1_DRAW_OR2NR
EXTERN SP1RETSPRDRAW

; following data segment copied into struct sp1_cs

   ld hl,0
   nop
   ld de,0
   call _SP1_DRAW_OR2LB

; following draw code called by way of SP1UpdateNow
;
;  a = hor rot table
; bc = graphic disp
; hl = graphic def ptr
; de = left graphic def ptr
;
; 32 + 106*4 - 6 + 10 = 460 cycles

_SP1_DRAW_OR2LB:

   cp SP1V_ROTTBL/256
   jp z, _SP1_DRAW_OR2NR

   add hl,bc
   ld d,a

   ;  d = shift table
   ; hl = sprite def (mask,graph) pairs

_SP1Or2LBRotate:

   ; 0

   ld bc,(SP1V_PIXELBUFFER+0)
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or c
   ld (SP1V_PIXELBUFFER+0),a
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or b
   ld (SP1V_PIXELBUFFER+1),a

   ; 1

   ld bc,(SP1V_PIXELBUFFER+2)
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or c
   ld (SP1V_PIXELBUFFER+2),a
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or b
   ld (SP1V_PIXELBUFFER+3),a


   ; 2

   ld bc,(SP1V_PIXELBUFFER+4)
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or c
   ld (SP1V_PIXELBUFFER+4),a
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or b
   ld (SP1V_PIXELBUFFER+5),a


   ; 3

   ld bc,(SP1V_PIXELBUFFER+6)
   inc hl
   ld e,(hl)
   inc hl
   ld a,(de)
   or c
   ld (SP1V_PIXELBUFFER+6),a
   inc hl
   ld e,(hl)
   ld a,(de)
   or b
   ld (SP1V_PIXELBUFFER+7),a

   jp SP1RETSPRDRAW
