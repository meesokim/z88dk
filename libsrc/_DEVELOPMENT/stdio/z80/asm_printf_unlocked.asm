
; ===============================================================
; Jan 2014
; ===============================================================
; 
; int printf_unlocked(const char *format, ...)
;
; See C11 specification.
;
; ===============================================================

SECTION code_stdio

PUBLIC asm_printf_unlocked

EXTERN asm_vprintf_unlocked, __stdio_varg_2

asm_printf_unlocked:

   ; MUST BE CALLED, NO JUMPS
   ;
   ; enter : none
   ;
   ; exit  : ix = FILE *stdout
   ;         de = char *format (next unexamined char)
   ;
   ;         success
   ;
   ;            hl = number of chars output on stream
   ;            carry reset
   ;
   ;         fail
   ;
   ;            hl = - (chars output + 1) < 0
   ;            carry set, errno set as below
   ;
   ;            eacces = stream not open for writing
   ;            eacces = stream is in an error state
   ;            erange = width or precision out of range
   ;            einval = unknown printf conversion
   ;
   ;            more errors may be set by underlying driver
   ;            
   ; uses  : all

   call __stdio_varg_2         ; de = char *format
   
   ld c,l
   ld b,h                      ; bc = void *arg
   
   jp asm_vprintf_unlocked
