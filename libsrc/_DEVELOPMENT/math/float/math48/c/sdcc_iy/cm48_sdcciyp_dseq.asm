
; char __fseq (float left, float right)

SECTION code_fp_math48

PUBLIC cm48_sdcciyp_dseq

EXTERN cm48_sdcciyp_dread2, am48_deq

cm48_sdcciyp_dseq:

   ; (left == right)
   ;
   ; enter : sdcc_float right, sdcc_float left, ret
   ;
   ; exit  : HL = 0 and carry reset if false
   ;         HL = 1 and carry set if true
   ;
   ; uses  : af, bc, de, hl, bc', de', hl'
   
   call cm48_sdcciyp_dread2

   ; AC = right
   ; AC'= left

   jp am48_deq
