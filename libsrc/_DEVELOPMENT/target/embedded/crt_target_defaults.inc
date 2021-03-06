
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crt target defaults ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; opportunity for target to override library defaults
   
   defc TAR__crt_org_data           = 32768
   defc TAR__crt_org_bss            = -1   ; create separate bss.bin
   
   defc TAR__crt_enable_commandline = 0
   defc TAR__crt_enable_close       = 0
   
   defc TAR__clib_exit_stack_size      = 2
   defc TAR__clib_quickexit_stack_size = 0
   
   defc TAR__clib_stdio_heap_size   = 0
   
   defc TAR__clib_fopen_max         = 0
   defc TAR__clib_open_max          = 0

;; end crt target defaults ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
