
; int isgreaterequal(double x, double y)

SECTION code_fp_math48

PUBLIC cm48_sccz80_isgreaterequal

EXTERN am48_isgreaterequal, cm48_sccz80p_dparam2

cm48_sccz80_isgreaterequal:

   call cm48_sccz80p_dparam2
   
   ; AC'= y
   ; AC = x
   
   jp am48_isgreaterequal
