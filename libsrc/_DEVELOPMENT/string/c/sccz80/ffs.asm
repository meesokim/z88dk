
; int ffs(int i)

SECTION code_string

PUBLIC ffs

EXTERN asm_ffs

defc ffs = asm_ffs
