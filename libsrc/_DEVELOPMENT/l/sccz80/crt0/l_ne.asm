;       Z88 Small C+ Run time Library
;       Moved functions over to proper libdefs
;       To make startup code smaller and neater!
;
;       6/9/98  djm

SECTION code_l_sccz80

PUBLIC l_ne

l_ne:

   ; DE != HL
   ; set carry if true

   or a
   sbc hl,de
   
   scf
   ret nz
   
   or a
   ret
