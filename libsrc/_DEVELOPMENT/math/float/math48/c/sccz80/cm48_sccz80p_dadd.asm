
SECTION code_fp_math48

PUBLIC cm48_sccz80p_dadd

EXTERN am48_dadd_s

   ; sccz80 float primitive
   ; Add two math48 floats.
   ;
   ; enter : AC'(BCDEHL') = double x
   ;              stack   = double y, ret
   ;
   ; exit  : AC'(BCDEHL') = x + y
   ;
   ; uses  : AF, BC, DE, HL, AF', BC', DE', HL'

defc cm48_sccz80p_dadd = am48_dadd_s
