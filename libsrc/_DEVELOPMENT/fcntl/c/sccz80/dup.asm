
; int dup(int fd)

SECTION code_fcntl

PUBLIC dup

EXTERN asm_dup

defc dup = asm_dup
