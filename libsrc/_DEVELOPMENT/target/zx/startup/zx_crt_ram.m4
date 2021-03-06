
dnl############################################################
dnl##        ZX_CRT_RAM.M4 - RAM MODEL GENERATOR             ##
dnl############################################################
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 zx spectrum ram model                     ;;
;;     generated by target/zx/startup/zx_crt_ram.m4          ;;
;;                                                           ;;
;;      48k memory model  (flat 64k address space)           ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CRT AND CLIB CONFIGURATION ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

define CONFIG_ZX

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
dnl
dnl############################################################
dnl## LIST OF AVAILABLE DRIVERS WITH STATIC INSTANTIATORS #####
dnl############################################################
dnl
dnl## input terminals
dnl
dnl#include(../driver/terminal/zx_01_input_kbd_inkey.m4)dnl
dnl#include(../driver/terminal/zx_01_input_kbd_lastk.m4)dnl
dnl
dnl## output terminals
dnl
dnl#include(../driver/terminal/zx_01_output_char_32.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_32_tty_z88dk.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_64.m4)dnl
dnl#include(../driver/terminal/zx_01_output_char_64_tty_z88dk.m4)dnl
dnl#include(../driver/terminal/zx_01_output_fzx.m4)dnl
dnl#include(../driver/terminal/zx_01_output_fzx_tty_z88dk.m4)dnl
dnl
dnl## file dup
dnl
dnl#include(../../m4_file_dup.m4)dnl
dnl
dnl## empty fd slot
dnl
dnl#include(../../m4_file_absent.m4)dnl
dnl
dnl############################################################
dnl## INSTANTIATE DRIVERS #####################################
dnl############################################################
dnl
dnl#; Some default fonts:
dnl#;
dnl#; _font_8x8_rom
dnl#; _font_4x8_default
dnl#; _ff_ao_Soxz

include(../../clib_instantiate_begin.m4)

include(../driver/terminal/zx_01_input_kbd_inkey.m4)dnl
m4_zx_01_input_kbd_inkey(_stdin, __i_fcntl_fdstruct_1, 0x03b0, 64, 1, 500, 15)dnl

include(../driver/terminal/zx_01_output_fzx.m4)dnl
m4_zx_01_output_fzx(_window_1, 0x2330, 0, 0, 1, 14, 1, 19, 0, _ff_ao_Prefect, 14, 0, 14, 8, 112, 8, 152, 1, 0, 3, 0)dnl

include(../driver/terminal/zx_01_output_fzx.m4)dnl
m4_zx_01_output_fzx(_window_2, 0x2330, 0, 0, 16, 14, 3, 19, 0, _ff_ao_RoundelSerif, 26, 0, 26, 128, 112, 24, 152, 1, 0, 3, 0)dnl

include(../../clib_instantiate_end.m4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; STARTUP ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION CODE

PUBLIC __Start, __Exit

EXTERN _main

__Start:

   IF __crt_enable_restart = 0
   
      ; save state required for successful return to basic
      
      push iy
      exx
      push hl
   
   ENDIF

   ; save stack address for safe exit
   
   ld (__sp),sp
   include "../clib_init_sp.inc"

   ; parse command line
   
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

   IF __crt_enable_restart = 0
   
      ; returning to caller

      push hl                  ; save return status
   
   ENDIF
   
SECTION code_crt_exit          ; user and library cleanup
SECTION code_crt_return

   ; close files
   
   include "../clib_close.inc"

   ; exit program
   
   IF __crt_enable_restart = 0
   
      ; returning to basic
      
      pop bc                   ; bc = return status
      
      ld sp,(__sp)             ; reset stack location
      
      exx
      pop hl
      exx
      pop iy
      
      im 1
      ei
      ret
   
   ELSE
   
      ; restarting program
      
      ld sp,(__sp)             ; reset stack location
      jp __Start
   
   ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; RUNTIME VARS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SECTION BSS_UNINITIALIZED

__sp:  defw 0

include "../clib_variables.inc"
include "clib_target_variables.inc"

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CLIB STUBS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

include "../clib_stubs.inc"
