
; float fdim(float x, float y)

SECTION code_fp_math48

PUBLIC cm48_sdccix_fdim

EXTERN cm48_sdccixp_dread2, l0_cm48_sdccix_fdim_callee

cm48_sdccix_fdim:

   call cm48_sdccixp_dread2
   
   ; AC'= y
   ; AC = x

   jp l0_cm48_sdccix_fdim_callee
