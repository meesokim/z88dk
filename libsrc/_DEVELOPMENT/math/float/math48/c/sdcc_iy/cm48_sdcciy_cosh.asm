
; float cosh(float x)

SECTION code_fp_math48

PUBLIC cm48_sdcciy_cosh

EXTERN cm48_sdcciy_cosh_fastcall

cm48_sdcciy_cosh:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af
   
   jp cm48_sdcciy_cosh_fastcall
