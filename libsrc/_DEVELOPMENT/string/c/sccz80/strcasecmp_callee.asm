
; int strcasecmp(const char *s1, const char *s2)

SECTION code_string

PUBLIC strcasecmp_callee

EXTERN asm_strcasecmp

strcasecmp_callee:

   pop af
   pop hl
   pop de
   push af
   
   jp asm_strcasecmp
