
; float lround(float x) __z88dk_fastcall

SECTION code_fp_math48

PUBLIC cm48_sdccix_lround_fastcall

EXTERN cm48_sdccixp_dx2m48, am48_lround, cm48_sdccixp_m482d

cm48_sdccix_lround_fastcall:

   call cm48_sdccixp_dx2m48
   
   call am48_lround
   
   jp cm48_sdccixp_m482d
