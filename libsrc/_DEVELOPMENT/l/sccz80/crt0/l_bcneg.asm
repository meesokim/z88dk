;       Z88 Small C+ Run time Library
;       Moved functions over to proper libdefs
;       To make startup code smaller and neater!
;
;       6/9/98  djm

SECTION code_l_sccz80

PUBLIC l_bcneg

EXTERN l_neg_bc

defc l_bcneg = l_neg_bc
