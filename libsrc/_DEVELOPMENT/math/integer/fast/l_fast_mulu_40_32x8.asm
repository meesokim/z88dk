
SECTION code_math

PUBLIC l_fast_mulu_40_32x8, l0_fast_mulu_40_32x8

EXTERN l0_fast_mulu_32_24x8, l_fast_mulu_16_8x8

l_fast_mulu_40_32x8:

   ; enter :  dehl = 32-bit multiplicand
   ;             a = 8-bit multiplicand
   ;
   ; exit  : adehl = 40-bit product
   ;         carry reset
   ;
   ; uses  : af, bc, de, hl, (ixh if loop unrolling disabled)
   
   ; try to reduce the multiplication
   
   inc d
   dec d
   jp z, l0_fast_mulu_32_24x8

l0_fast_mulu_40_32x8:

   ; two full size multiplicands

   ; split into two multiplications and add
   
   ld c,a
   ld b,d
   
   push bc                     ; save DA
   
   call l0_fast_mulu_32_24x8        ; dehl = EHL * A
   
   ex (sp),hl                  ; hl = DA
   push de                     ; stack = hlde
   
   ld e,h
   call l_fast_mulu_16_8x8          ; hl = D * A
   
   pop de                      ; de = MSW(EHL * A)
   
   ld a,d
   add a,l
   ld d,a
   
   ld a,h
   adc a,0
   
   pop hl                      ; adehl = 40-bit result
   ret
