
; char *strupr(char *s)

SECTION code_string

PUBLIC strupr

EXTERN asm_strupr

defc strupr = asm_strupr
