
; float asin(float x) __z88dk_fastcall

SECTION code_fp_math48

PUBLIC cm48_sdccix_asin_fastcall

EXTERN cm48_sdccixp_dx2m48, am48_asin, cm48_sdccixp_m482d

cm48_sdccix_asin_fastcall:

   call cm48_sdccixp_dx2m48
   
   call am48_asin
   
   jp cm48_sdccixp_m482d
