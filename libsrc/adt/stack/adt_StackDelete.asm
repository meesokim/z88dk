; void adt_StackDelete(struct adt_Stack *s, void *delete)
; CALLER linkage for function pointers

PUBLIC adt_StackDelete

EXTERN adt_StackDelete_callee
EXTERN ASMDISP_ADT_STACKDELETE_CALLEE

.adt_StackDelete

   pop bc
   pop de
   pop hl
   push hl
   push de
   push bc
   
   jp adt_StackDelete_callee + ASMDISP_ADT_STACKDELETE_CALLEE
