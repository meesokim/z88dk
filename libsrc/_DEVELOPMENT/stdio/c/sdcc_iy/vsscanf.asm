
; int vsscanf(const char *s, const char *format, va_list arg)

SECTION code_stdio

PUBLIC _vsscanf

EXTERN asm_vsscanf

_vsscanf:

   pop af
   pop hl
   pop de
   pop bc
   
   push bc
   push de
   push hl
   push af
   
   jp asm_vsscanf
