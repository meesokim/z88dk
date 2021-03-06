
SECTION code_fcntl

PUBLIC zx_01_output_fzx_proc_move_left

EXTERN zx_01_output_fzx_proc_move_left_right
EXTERN console_01_output_char_proc_move_left

zx_01_output_fzx_proc_move_left:

   ; variable width fonts confuse the meaning of left, right, up, down movement
   ; so for fzx these movements are defined in terms of the native fixed width char size
   ;
   ; move left, wrap, snap to window
   ;
   ; uses : af, b, de, hl
   
   ld hl,console_01_output_char_proc_move_left
   push hl
   
   jp zx_01_output_fzx_proc_move_left_right
