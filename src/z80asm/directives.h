/*
     ZZZZZZZZZZZZZZZZZZZZ    8888888888888       00000000000
   ZZZZZZZZZZZZZZZZZZZZ    88888888888888888    0000000000000
                ZZZZZ      888           888  0000         0000
              ZZZZZ        88888888888888888  0000         0000
            ZZZZZ            8888888888888    0000         0000       AAAAAA         SSSSSSSSSSS   MMMM       MMMM
          ZZZZZ            88888888888888888  0000         0000      AAAAAAAA      SSSS            MMMMMM   MMMMMM
        ZZZZZ              8888         8888  0000         0000     AAAA  AAAA     SSSSSSSSSSS     MMMMMMMMMMMMMMM
      ZZZZZ                8888         8888  0000         0000    AAAAAAAAAAAA      SSSSSSSSSSS   MMMM MMMMM MMMM
    ZZZZZZZZZZZZZZZZZZZZZ  88888888888888888    0000000000000     AAAA      AAAA           SSSSS   MMMM       MMMM
  ZZZZZZZZZZZZZZZZZZZZZ      8888888888888       00000000000     AAAA        AAAA  SSSSSSSSSSS     MMMM       MMMM

Copyright (C) Gunther Strube, InterLogic 1993-99
Copyright (C) Paulo Custodio, 2011-2015

Assembly directives.

$Header: /cvsroot/z88dk/z88dk/src/z80asm/directives.h,v 1.16 2015/02/13 00:30:31 pauloscustodio Exp $
*/

#pragma once

struct Expr;

enum {
	DEFVARS_SIZE_B = 1,
	DEFVARS_SIZE_W = 2,
	DEFVARS_SIZE_P = 3,
	DEFVARS_SIZE_L = 4,
};

/* define a label at the current location, or current location + offset */
extern void asm_LABEL(char *name);
extern void asm_LABEL_offset(char *name, int offset);

/* start a new DEFVARS context, closing any previously open one */
extern void asm_DEFVARS_start(int start_addr);

/* define one constant in the current context */
extern void asm_DEFVARS_define_const(char *name, int elem_size, int count);

/* start a new DEFGROUP context, give the value of the next defined constant */
extern void asm_DEFGROUP_start(int next_value);

/* define one constant with the next value, increment the value */
extern void asm_DEFGROUP_define_const(char *name);

/* directives without arguments */
extern void asm_LSTON(void);
extern void asm_LSTOFF(void);

/* directives with number argument */
extern void asm_LINE(int line_nr);
extern void asm_ORG(int address);

/* directives with string argument */
extern void asm_INCLUDE(char *filename);
extern void asm_BINARY(char *filename);

/* directives with name argument */
extern void asm_MODULE(char *name);
extern void asm_SECTION(char *name);

/* define default module name, if none defined by asm_MODULE() */
extern void asm_MODULE_default(void);

/* directives with list of names argument, function called for each argument */
extern void asm_GLOBAL(char *name);
extern void asm_EXTERN(char *name);
extern void asm_XREF(char *name);
extern void asm_LIB(char *name);
extern void asm_PUBLIC(char *name);
extern void asm_XDEF(char *name);
extern void asm_XLIB(char *name);
extern void asm_DEFINE(char *name);
extern void asm_UNDEFINE(char *name);

/* define a constant or expression */
extern void asm_DEFC(char *name, struct Expr *expr);

/* create a block of empty bytes, called by the DEFS directive */
extern void asm_DEFS(int count, int fill);

/* DEFB - add an expression or a string */
extern void asm_DEFB_str(char *str, int length);
extern void asm_DEFB_expr(struct Expr *expr);

/* DEFW, DEFL - add 2-byte and 4-byte expressions */
extern void asm_DEFW(struct Expr *expr);
extern void asm_DEFL(struct Expr *expr);
