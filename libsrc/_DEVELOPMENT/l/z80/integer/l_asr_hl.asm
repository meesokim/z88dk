
SECTION code_l

PUBLIC l_asr_hl

INCLUDE "clib_cfg.asm"

   ; arithmetic shift right 16-bit signed int
   ;
   ; enter : hl = 16-bit number
   ;          a = shift amount
   ;
   ; exit  : hl = hl >> a
   ;
   ; uses  : af, bc, hl

   IF __CLIB_OPT_IMATH_SELECT & $01
   
      EXTERN l_fast_asr_hl
      
      defc l_asr_hl = l_fast_asr_hl
   
   ELSE
   
      EXTERN l_small_asr_hl
      
      defc l_asr_hl = l_small_asr_hl
   
   ENDIF
