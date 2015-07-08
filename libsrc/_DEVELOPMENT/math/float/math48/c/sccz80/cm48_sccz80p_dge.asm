
SECTION code_fp_math48

PUBLIC cm48_sccz80p_dge

EXTERN am48_dge_s

   ; sccz80 float primitive
   ; left_op >= right_op ?
   ;
   ; enter : AC'(BCDEHL') = right_op
   ;              stack   = left_op, ret
   ;
   ; exit  : if true
   ;
   ;            HL = 1
   ;            carry set
   ;
   ;         if false
   ;
   ;            HL = 0
   ;            carry reset
   ;
   ; uses  : AF, BC, DE, HL

defc cm48_sccz80p_dge = am48_dge_s
