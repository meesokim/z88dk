
   ; initialize bss section

   IF (__crt_model | __crt_initialize_bss)

      EXTERN ASMTAIL_BSS_UNINITIALIZED, ASMHEAD_BSS_END

      ld hl,ASMTAIL_BSS_UNINITIALIZED
      ld bc,ASMHEAD_BSS_END - ASMTAIL_BSS_UNINITIALIZED
   
      ld e,0
   
      EXTERN asm_memset
      call asm_memset

   ENDIF
