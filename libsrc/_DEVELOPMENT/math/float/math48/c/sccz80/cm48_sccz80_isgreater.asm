
; int isgreater(double x, double y)

SECTION code_fp_math48

PUBLIC cm48_sccz80_isgreater

EXTERN am48_isgreater, cm48_sccz80p_dparam2

cm48_sccz80_isgreater:

   call cm48_sccz80p_dparam2
   
   ; AC'= y
   ; AC = x
   
   jp am48_isgreater
