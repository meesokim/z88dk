
SECTION code_l_sdcc

PUBLIC __divuchar_callee

EXTERN l_divu_16_16x8

__divuchar_callee:

   ; unsigned 8-bit division
   ;
   ; enter : stack = divisor (byte), dividend (byte), ret
   ;
   ; exit  : hl = quotient
   ;         de = remainder

   ; note: the fast integer math library has a fast 8x8 divide but it
   ;       is unknown at this time whether sdcc expects 16-bit results     

   pop af
   pop hl
   push af
   
   ld e,h
   
   ; e = divisor
   ; l = dividend

   ld h,0
   jp l_divu_16_16x8
