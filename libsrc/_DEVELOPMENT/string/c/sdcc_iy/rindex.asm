
; BSD
; char *rindex(const char *s, int c)

SECTION code_string

PUBLIC _rindex

EXTERN _strrchr

defc _rindex = _strrchr
