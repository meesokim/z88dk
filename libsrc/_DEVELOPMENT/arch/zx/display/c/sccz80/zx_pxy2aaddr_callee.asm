
; void *zx_pxy2aaddr_callee(uchar x, uchar y)

SECTION code_arch

PUBLIC zx_pxy2aaddr_callee, l0_zx_pxy2aaddr_callee

zx_pxy2aaddr_callee:

   pop hl
   pop de
   ex (sp),hl

l0_zx_pxy2aaddr_callee:

   ld h,e
   
   INCLUDE "arch/zx/display/z80/asm_zx_pxy2aaddr.asm"
