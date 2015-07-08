
SECTION code_fcntl

PUBLIC console_01_output_char_iterm_msg_putc

EXTERN console_01_output_char_oterm_msg_putc_raw

console_01_output_char_iterm_msg_putc:

   ; enter  :  c = char to output
   ; can use:  af, bc, de, hl, ix
   
   ; char to print is coming from the input terminal
   ; so it should not be subject to tty emulation
   
   ld b,255                    ; b = parameter (undefined)
   jp console_01_output_char_oterm_msg_putc_raw
