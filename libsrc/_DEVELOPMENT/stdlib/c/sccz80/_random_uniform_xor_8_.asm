
; uint16_t _random_uniform_xor_8_(uint32_t seed)

SECTION code_stdlib

PUBLIC _random_uniform_xor_8_

EXTERN asm_random_uniform_xor_8

_random_uniform_xor_8_:

   call asm_random_uniform_xor_8
   
   ld l,a
   ld h,0
   
   ret
