
; signed long __fs2slong (float f)

SECTION code_fp_math48

PUBLIC cm48_sdcciyp_ds2slong

EXTERN cm48_sdcciyp_dread1, am48_dfix32

cm48_sdcciyp_ds2slong:

   ; double to signed long
   ;
   ; enter : stack = sdcc_float x, ret
   ;
   ; exit  : dehl = (long)(x)
   ;
   ; uses  : af, bc, de, hl, bc', de', hl'

   call cm48_sdcciyp_dread1    ; AC'= math48(x)

   jp am48_dfix32
