
; float lgamma(float x)

SECTION code_fp_math48

PUBLIC cm48_sdccix_lgamma

EXTERN cm48_sdccix_lgamma_fastcall

cm48_sdccix_lgamma:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af
   
   jp cm48_sdccix_lgamma_fastcall