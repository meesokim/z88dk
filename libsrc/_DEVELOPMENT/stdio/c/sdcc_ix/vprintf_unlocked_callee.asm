
; int vprintf_unlocked_callee(const char *format, void *arg)

SECTION code_stdio

PUBLIC _vprintf_unlocked_callee, l0_vprintf_unlocked_callee

EXTERN asm_vprintf_unlocked

_vprintf_unlocked_callee:

   pop af
   pop de
   pop bc
   push af

l0_vprintf_unlocked_callee:

   push ix
   
   call asm_vprintf_unlocked
   
   pop ix
   ret
