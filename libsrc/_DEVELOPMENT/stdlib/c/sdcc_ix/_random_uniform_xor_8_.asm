
; uint16_t _random_uniform_xor_8_(uint32_t seed)

SECTION code_stdlib

PUBLIC __random_uniform_xor_8_

EXTERN __random_uniform_xor_8__fastcall

__random_uniform_xor_8_:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af

   jp __random_uniform_xor_8__fastcall
