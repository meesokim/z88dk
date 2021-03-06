;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SELECT CRT0 FROM -STARTUP=N COMMANDLINE OPTION ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

INCLUDE "zcc_opt.def"

IFNDEF startup

   ; startup undefined so select a default
   
   defc startup = 0

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; user supplied crt ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF startup = -1

   INCLUDE "crt.asm"

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ram model ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF startup = 0

   ; standard 32 column display
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_32 full screen
   ; stderr = dup(stdout)

   INCLUDE "startup/zx_crt_0.asm"

ENDIF

IF startup = 1

   ; standard 32 column display tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_32_tty_z88dk full screen
   ; stderr = dup(stdout)

   INCLUDE "startup/zx_crt_1.asm"

ENDIF

IF startup = 4

   ; 64 column display using fixed width 4x8 font
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_64 full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_4.asm"

ENDIF

IF startup = 5

   ; 64 column display using fixed width 4x8 font tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_64_tty_z88dk full screen
   ; stderr = dup(stdout)

   INCLUDE "startup/zx_crt_5.asm"

ENDIF

IF startup = 8

   ; fzx terminal using ff_ao_Soxz font
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_fzx full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_8.asm"

ENDIF

IF startup = 9

   ; fzx terminal using ff_ao_Soxz font tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_fzx full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_9.asm"

ENDIF

IF startup = 31

   ; no instantiated FILEs
   
   INCLUDE "startup/zx_crt_31.asm"

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; if 2 cartridge ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF startup = 32

   ; if 2 cartridge
   ; standard 32 column display
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_32 full screen
   ; stderr = dup(stdin)

   INCLUDE "startup/zx_crt_32.asm"

ENDIF

IF startup = 33

   ; if 2 cartridge
   ; standard 32 column display tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_32_tty_z88dk full screen
   ; stderr = dup(stdout)

   INCLUDE "startup/zx_crt_33.asm"

ENDIF

IF startup = 36

   ; if 2 cartridge
   ; 64 column display using fixed width 4x8 font
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_64 full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_36.asm"

ENDIF

IF startup = 37

   ; if 2 cartridge
   ; 64 column display using fixed width 4x8 font tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_char_64_tty_z88dk full screen
   ; stderr = dup(stdout)

   INCLUDE "startup/zx_crt_37.asm"

ENDIF

IF startup = 40

   ; if 2 cartridge
   ; fzx terminal using ff_ao_Soxz font
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_fzx full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_40.asm"

ENDIF

IF startup = 41

   ; if 2 cartridge
   ; fzx terminal using ff_ao_Soxz font tty_z88dk terminal
   ;
   ; stdin  = zx_01_input_kbd_inkey
   ; stdout = zx_01_output_fzx full screen
   ; stderr = dup(stdout)
   
   INCLUDE "startup/zx_crt_41.asm"

ENDIF

IF startup = 63

   ; if 2 cartridge
   ; no instantiated FILEs
   
   INCLUDE "startup/zx_crt_63.asm"

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; testing purposes ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

IF startup = 100

   ; three terminal windows on screen
   ;
   ; stdin  = zx_01_input_kbd_inkey (connected to edit)
   ; stdout = zx_01_output_char_64 window (2, 44, 1, 18)
   ; stderr = dup(stdout)
   ; edit   = zx_01_output_char_32 window (1, 30, 20 ,3)
   ; sidebar= zx_01_output_char_64 window (48, 14, 1, 18)
   
   INCLUDE "startup/zx_crt_100.asm"

ENDIF

IF startup = 200

   ; three terminal windows on screen
   ;
   ; stdin    = zx_01_input_kbd_inkey (connected to window_1)
   ; window_1 = fzx terminal (font = Prefect)
   ; window_2 = fzx terminal (font = RoundelSerif)
   
   INCLUDE "startup/zx_crt_200.asm"

ENDIF

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
