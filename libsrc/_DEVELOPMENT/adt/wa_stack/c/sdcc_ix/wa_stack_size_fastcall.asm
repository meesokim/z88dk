
; size_t wa_stack_size_fastcall(wa_stack_t *s)

SECTION code_adt_wa_stack

PUBLIC _wa_stack_size_fastcall

defc _wa_stack_size_fastcall = asm_wa_stack_size

INCLUDE "adt/wa_stack/z80/asm_wa_stack_size.asm"
