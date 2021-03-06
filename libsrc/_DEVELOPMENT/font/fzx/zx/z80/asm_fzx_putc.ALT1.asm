

;; This version applies colour but tries to follow the
;; contour of the text when applying it.
;;
;; This was voted undesirable at WOS.


; int fzx_putc(struct fzx_state *fs, int c)

; ===============================================================
; FZX driver - Copyright (c) 2013 Einar Saukas
; FZX format - Copyright (c) 2013 Andrew Owen
; ===============================================================
; Modified for z88dk - aralbrec
; * removed self-modifying code
; * removed control code sequences
; * added colour and rop modes
; * added window
; * made fields 16-bit for hi-res
; ===============================================================

SECTION code_font_fzx

PUBLIC asm_fzx_putc

EXTERN l_jpix, error_zc
EXTERN asm_zx_pxy2saddr, asm_zx_saddr2aaddr, asm_zx_saddrpdown

asm_fzx_putc:

   ; print fzx glyph to window on screen
   ;
   ; enter :  c = ascii code
   ;         ix = struct fzx_state *
   ;
   ; exit  : ix = struct fzx_state *
   ;
   ;         success
   ;
   ;            hl = screen address below glyph (may be off window)
   ;            fzx_state.x += glyph width
   ;            carry reset
   ;
   ;         fail if glyph does not fit horizontally
   ;
   ;            a = 0
   ;            carry set
   ;
   ;         fail if glyph does not fit vertically
   ;
   ;            a = 1
   ;            carry set
   ;
   ; uses  : af, bc, de, hl, af'

   ld l,(ix+3)
   ld h,(ix+4)                 ; hl = struct fzx_font *
   
   ld a,(hl)
   ex af,af'                   ; a' = font height
   
   inc hl
   ld a,(hl)
   push af                     ; save tracking
   
   inc hl                      ; hl = & fzx_font.last_char

   ld a,c                      ; a = char
   dec a
   
   cp (hl)
   jr nc, char_undefined       ; if char > fzx_font.last_char
   
   sub 31                      ; a = char - 32
   jr nc, char_defined

char_undefined:

   ld a,'?'-32                 ; print '?' for undefined chars

char_defined:

   inc hl

   ; hl = struct fzx_char * (code 32)
   ; ix = struct fzx_state *
   ;  a = char-32
   ;  a'= font height
   ; stack = tracking
   
   ld c,a
   ld b,0
   
   add hl,bc
   add hl,bc
   add hl,bc                   ; hl = struct fzx_char *
   
   ; space character can have additional padding
   
   or a
   jr nz, no_padding           ; char not space

   ld a,(ix+19)                ; a = space_expand
   and $0f
   ld b,a

no_padding:

   ld d,b
   
   ; hl = struct fzx_char *
   ; ix = struct fzx_state *
   ;  d = additional_padding
   ;  a'= font height
   ; stack = tracking
   
   ld c,(hl)
   inc hl
   ld a,(hl)
   and $3f
   ld b,a                      ; bc = bitmap offset
   
   xor (hl)
   rlca
   rlca
   ld e,a                      ; e = kern
   
   push hl                     ; save & fzx_char + 1b
   
   add hl,bc
   dec hl                      ; hl = bitmap address
   
   ex (sp),hl
   inc hl                      ; hl = & fzx_char.shift_width_1
   
   ; ix = struct fzx_state *
   ; hl = & fzx_char.shift_width_1
   ;  d = additional_padding
   ;  e = kern
   ;  a'= font height
   ; stack = tracking, & bitmap

   ld a,(hl)
   and $0f
   add a,d
   ld c,a                      ; c = width - 1 + additional_padding
   
   ld a,(hl)
   rra
   rra
   rra
   rra
   and $0f
   push af                     ; save vertical shift

   ; ix = struct fzx_state *
   ; hl = & fzx_char.shift_width_1
   ;  c = width - 1
   ;  e = kern
   ;  a'= font height
   ; stack = tracking, & bitmap, shift
   
   inc hl                      ; hl = & fzx_char.next
   
   ld a,(hl)
   add a,l
   ld b,a                      ; b = LSB of next char bitmap address
   
   ; ix = struct fzx_state *
   ;  b = LSB of end of bitmap
   ;  c = width - 1
   ;  e = kern
   ;  a'= font height
   ; stack = tracking, & bitmap, shift

   ; check if glyph fits window horizontally
   ; spectrum resolution 8-bits so ignore MSB in coordinates
   
   ld a,(ix+6)
   or a
;;   jr nz, x_too_large          ; if x > 255
   jp nz, x_too_large


   ld a,(ix+5)                 ; a = x coord
   ld d,(ix+17)                ; d = left_margin
   
   cp d
   jr nc, exceeds_margin

   ld a,d

exceeds_margin:

   sub e                       ; a = x - kern
   jr nc, x_ok
   
   xor a

x_ok:

   ld (ix+5),a                 ; update possibly different x coord
   ld e,a                      ; e = x coord

   add a,c                     ; a = x + width - 1
   jr c, x_too_large           ; if glyph exceeds right edge of window
   
   cp (ix+11)
   jr c, width_adequate
   
   ld a,(ix+12)
   or a
   jr z, x_too_large           ; if glyph exceeds right edge of window

width_adequate:

   ld a,(ix+9)                 ; a = window.x
   add a,e
   ld l,a                      ; l = absolute x coord

   ; ix = struct fzx_state *
   ;  b = LSB of end of bitmap
   ;  c = width - 1
   ;  l = absolute x coord
   ;  a'= font height
   ; stack = tracking, & bitmap, shift
   
   ; check if glyph fits window vertically
   
   ld a,(ix+8)
   or a
   jr nz, y_too_large          ; if y > 255
   
   ld h,(ix+7)                 ; h = y coord
   ex af,af'                   ; a = font height
   
   add a,h
   jr c, y_too_large           ; if glyph exceeds bottom edge of window
   
   dec a
   cp (ix+15)
   
   jr c, height_adequate
   
   ld a,(ix+16)
   or a
   jr z, y_too_large           ; if glyph exceeds bottom edge of window 

height_adequate:
   
   pop af                      ; a = vertical shift
   
   add a,h                     ; + y coord
   add a,(ix+13)               ; + window.y
   
   ld h,a                      ; h = absolute y coord
   
   ; ix = struct fzx_state *
   ;  b = LSB of end of bitmap
   ;  c = width - 1
   ;  l = absolute x coord
   ;  h = absolute y coord
   ; stack = tracking, & bitmap

   ld a,l
   and $07
   ld e,a
   
   ld a,c
   add a,e
   rra
   rra
   rra
   inc a
   and $1f                     ; a = width of font in bytes

   pop de
   push bc
   push af
   push de

   call asm_zx_pxy2saddr       ; hl = screen address, de = coords

   ld a,e
   and $07                     ; a = rotate amount, z = zero rotate

   ex af,af'

   ex (sp),hl                  ; hl = & bitmap
   ld e,b                      ; e = LSB of end of bitmap
   
   ld a,d
   and $07
   neg
   add a,8
   ld b,a                      ; b = number of rows until next attr
   
   ld a,c                      ; a = width - 1
   cp 8
   jr nc, wide_char

narrow_char:

   ex af,af'
   scf
   ex af,af'

wide_char:
   
   ; ix = struct fzx_state *
   ; hl = & bitmap
   ;  b = number of rows until next attr
   ;  e = LSB of end of bitmap
   ; af'= rotate 0-7, carry = narrow char, z = zero rotate
   ; stack = tracking, width - 1, width in bytes, screen address

   ld a,l
   cp e
   jr nz, draw_attr          ; if bitmap is not zero length

   ; glyph drawn, update x coordinate

   ; ix = struct fzx_state *
   ; stack = tracking, width - 1, width in bytes, screen address

draw_attr_ret:

   pop hl                      ; hl = screen address
   pop bc
   pop bc                      ; c = width - 1
   pop af                      ; a = tracking

   inc a
   add a,c
   add a,(ix+5)                ; a = new x coordinate
   
   ld (ix+5),a                 ; store new x coordinate
   ret nc
   ld (ix+6),1
   
   or a
   ret

x_too_large:

   ; ix = struct fzx_state *
   ; stack = tracking, & bitmap, shift

   xor a
   jp error_zc - 3

y_too_large:

   ; ix = struct fzx_state *
   ; stack = tracking, & bitmap, shift

   ld a,1
   jp error_zc - 3

draw_attr:

   ; ix = struct fzx_state *
   ; hl = & bitmap
   ;  b = row count until next attr
   ;  e = LSB of end of bitmap
   ; af'= rotate 0-7, carry = narrow char, z = zero rotate
   ; stack = width in bytes, screen address

   ld d,b

   pop af
   pop bc                      ; b = width in bytes
   push bc
   push af

   ex (sp),hl
   push hl                     ; save screen address
   
   call asm_zx_saddr2aaddr     ; hl = attribute address

attr_loop:

   ld a,(ix+23)                ; a = foregound mask
   and (hl)                    ; keep screen attribute bits
   or (ix+22)                  ; mix foregound colour
   
   ld (hl),a                   ; new colour to screen
   inc l
   
   djnz attr_loop
   
   ld b,d                      ; b = row count until next attr
   
   pop hl                      ; hl = screen address
   ex (sp),hl

draw_row:

   ; ix = struct fzx_state *
   ; hl = & bitmap
   ;  b = row count until next attr
   ;  e = LSB of end of bitmap
   ; af'= rotate 0-7, carry = narrow char, z = zero rotate
   ; stack = width in bytes, screen address
   
   ; bitmap bytes
   
   ld d,(hl)                   ; first bitmap byte
   inc hl
   
   ld c,(hl)                   ; second bitmap byte
   inc hl

   xor a                       ; third bitmap byte
   
   ; narrow char test
   
   ex af,af'
   jr nc, rotate_bitmap        ; if wide char
   
   dec hl                      ; no second bitmap byte
   ld c,0                      ; second byte = 0

rotate_bitmap:

   ex (sp),hl                  ; hl = screen address
   push bc                     ; save row count until next attr

   jr z, no_rotate

   ld b,a                      ; b = rotate amount
   
   ex af,af'

rotate_loop:

   srl d                       ; rotate bitmap DCA right one pixel
   rr c
   rra
   
   djnz rotate_loop
   
   ex af,af'

no_rotate:

   ex af,af'
   
   ; ix = struct fzx_state *
   ; hl = screen address
   ;  b = row count until next attr
   ;  e = LSB of end of bitmap
   ; dca= bitmap bytes
   ; af'= rotate 0-7, carry = narrow char, z = zero rotate
   ; stack = width in bytes, & bitmap, row count until attr

   call l_jpix                 ; call fzx_draw
   call asm_zx_saddrpdown      ; move screen address down one pixel
   
   pop bc                      ; b = row count until next attr
   ex (sp),hl                  ; hl = & bitmap
   
   ld a,l
   cp e
   jr z, draw_attr_ret         ; if bitmap finished
   
   djnz draw_row               ; if not time for new attr
   
   ld b,8                      ; row count until next attr
   jr draw_attr
