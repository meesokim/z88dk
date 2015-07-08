dnl############################################################
dnl##     EMBEDDED_CRT_ROM.M4 - STANDALONE ROM TARGET        ##
dnl############################################################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;              embedded standalone rom target               ;;
;; generated by target/embedded/startup/embedded_crt_rom.m4  ;;
;;                                                           ;;
;;                  flat 64k address space                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRT AND CLIB CONFIGURATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../crt_defaults.inc"
include "crt_target_defaults.inc"
include "../crt_rules.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; SET UP MEMORY MODEL ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "memory_model.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GLOBAL SYMBOLS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_constants.inc"
include "clib_target_constants.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; INSTANTIATE DRIVERS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; The embedded target has no device drivers so it cannot
; instantiate FILEs.

; It can use sprint/sscanf + family and it can create
; memstreams in the default configuration.

include(../../clib_instantiate_begin.m4)
include(../../clib_instantiate_end.m4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION CODE

PUBLIC __Start, __Exit

EXTERN _main

;**************************************************************
IF __crt_org_code = 0
;**************************************************************

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rst and im1 entry ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   ; address = 0x0000
   
   jr __Start
   
   defm "Z88DK"
   defs 0x0008 - ASMPC
   
   ; address = 0x0008
   
IF (__crt_enable_rst & $02)

   EXTERN _z80_rst_08h
   jp _z80_rst_08h

ELSE

   ret

ENDIF

   defm "2.0a"
   defs 0x0010 - ASMPC

   ; address = 0x0010

IF (__crt_enable_rst & $04)

   EXTERN _z80_rst_10h
   jp _z80_rst_10h

ELSE

   ret

ENDIF

   defm "embe"
   defs 0x0018 - ASMPC

   ; address = 0x0018
   
IF (__crt_enable_rst & $08)

   EXTERN _z80_rst_18h
   jp _z80_rst_18h

ELSE

   ret

ENDIF

   defm "dded"
   defs 0x0020 - ASMPC

   ; address = 0x0020

IF (__crt_enable_rst & $10)

   EXTERN _z80_rst_20h
   jp _z80_rst_20h

ELSE

   ret

ENDIF

   defm "2015"
   defs 0x0028 - ASMPC

   ; address = 0x0028

IF (__crt_enable_rst & $20)

   EXTERN _z80_rst_28h
   jp _z80_rst_28h

ELSE

   ret

ENDIF

IF __SDCC_IY

   PUBLIC l_jpix
   
   l_jpix:
   
      defb $fd
   
   PUBLIC l_jphl
   
   l_jphl:
   
      jp (hl)
   
   PUBLIC l_jpiy
   
   l_jpiy:
   
      jp (ix)

ELSE

   PUBLIC l_jpix
   
   l_jpix:
   
      defb $dd
   
   PUBLIC l_jphl
   
   l_jphl:
   
      jp (hl)
   
   PUBLIC l_jpiy
   
   l_jpiy:
   
      jp (iy)

ENDIF

   defs 0x0030 - ASMPC

   ; address = 0x0030

IF (__crt_enable_rst & $40)

   EXTERN _z80_rst_30h
   jp _z80_rst_30h

ELSE

   ret

ENDIF

   PUBLIC l_ret
   
      pop hl
      pop hl
      pop hl
   
   l_ret:
   
      ret

   defs 0x0038 - ASMPC

   ; address = 0x0038
   ; im 1 isr

IF (__crt_enable_rst & $80)

   EXTERN _z80_rst_38h
   call _z80_rst_38h

ENDIF

   ei
   reti

;**************************************************************
ENDIF
;**************************************************************

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crt startup part 1 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

__Start:

   di                          ; if warm reset

   ; set stack address
   
   IF __register_sp = -1
   
      ld sp,0
   
   ELSE
   
      ld sp,__register_sp
   
   ENDIF
   
   ; commandline
   
   IF __crt_enable_commandline = 1
      
      IF __SDCC | __SDCC_IX | __SDCC_IY
      
         ld hl,0
         push hl               ; char *argv[]
         push hl               ; int argc

      ELSE
            
         ld hl,0
         push hl               ; int argc
         push hl               ; char *argv[]
   
      ENDIF
   
   ENDIF

   ; initialize sections
   
   include "../clib_init_bss.inc"
   include "../clib_init_data.inc"

;**************************************************************
IF __crt_org_code = 0
;**************************************************************

   jr __Start_2

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; nmi entry ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

   defs 0x0066 - ASMPC

   ; address = 0x0066

IF __crt_enable_nmi

   EXTERN _z80_nmi
   call _z80_nmi

ENDIF

   retn

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; crt startup part 2 ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

__Start_2:

;**************************************************************
ENDIF
;**************************************************************

SECTION code_crt_init          ; user and library initialization
SECTION code_crt_main

   ; call user program
   
   call _main                  ; hl = return status

   ; run exit stack

   IF __clib_exit_stack_size > 0
   
      EXTERN asm_exit
      jp asm_exit              ; exit function jumps to __Exit
   
   ENDIF

__Exit:

SECTION code_crt_exit          ; user and library cleanup
SECTION code_crt_return

   ; close files
   
   include "../clib_close.inc"

   ; restart program
   
   jp __Start

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUNTIME VARS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_variables.inc"
include "clib_target_variables.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLIB STUBS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_stubs.inc"
