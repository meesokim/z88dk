
; BSD
; char *rindex(const char *s, int c)

SECTION code_string

PUBLIC rindex

EXTERN strrchr

defc rindex = strrchr
