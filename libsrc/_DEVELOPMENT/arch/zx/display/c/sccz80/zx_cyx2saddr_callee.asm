
; void *zx_cyx2saddr(uchar row, uchar col)

SECTION code_arch

PUBLIC zx_cyx2saddr_callee, l0_zx_cyx2saddr_callee

zx_cyx2saddr_callee:

   pop af
   pop hl
   pop de
   push af

l0_zx_cyx2saddr_callee:

   ld h,e
   
   INCLUDE "arch/zx/display/z80/asm_zx_cyx2saddr.asm"
