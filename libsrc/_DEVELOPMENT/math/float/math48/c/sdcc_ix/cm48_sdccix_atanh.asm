
; float atanh(float x)

SECTION code_fp_math48

PUBLIC cm48_sdccix_atanh

EXTERN cm48_sdccix_atanh_fastcall

cm48_sdccix_atanh:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af
   
   jp cm48_sdccix_atanh_fastcall
