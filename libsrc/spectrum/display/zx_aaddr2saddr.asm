; uchar __FASTCALL__ *zx_aaddr2saddr(void *attraddr)
; aralbrec 06.2007

PUBLIC zx_aaddr2saddr

.zx_aaddr2saddr

   ld a,h
   rlca
   rlca
   rlca
   xor $82
   ld h,a
   
   ret
