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

One symbol from the assembly code - label or constant.

$Header: /cvsroot/z88dk/z88dk/src/z80asm/sym.h,v 1.27 2015/02/13 00:31:59 pauloscustodio Exp $
*/

#pragma once

#include "class.h"
#include "symref.h"
#include "types.h"

struct Module;
struct Section;

/*-----------------------------------------------------------------------------
*   Special symbols
*----------------------------------------------------------------------------*/
#define ASMHEAD_KW	"ASMHEAD%s%s"
#define ASMTAIL_KW	"ASMTAIL%s%s"
#define ASMSIZE_KW	"ASMSIZE%s%s"

/*-----------------------------------------------------------------------------
*   Type of symbol
*	Expressions have the type of the greatest symbol used
*----------------------------------------------------------------------------*/
typedef enum {
	TYPE_UNKNOWN,						/* symbol not defined */
	TYPE_CONSTANT,						/* can be computed */
	TYPE_ADDRESS,						/* depends on ASMPC, can be computed after
										   address allocation */
	TYPE_COMPUTED,						/* depends on the result of an expression
										   that has this symbol as target */
} sym_type_t;

/*-----------------------------------------------------------------------------
*   Scope of symbol
*	Initially defined as LOCAL
*----------------------------------------------------------------------------*/
typedef enum {
	SCOPE_LOCAL,
	SCOPE_PUBLIC,						/* defined and exported */
	SCOPE_EXTERN,						/* not defined and imported */
	SCOPE_GLOBAL,						/* PUBLIC if defined, EXTERN if not defined */
} sym_scope_t;

/*-----------------------------------------------------------------------------
*   Symbol
*----------------------------------------------------------------------------*/
CLASS( Symbol )
	char		   *name;				/* name, kept in strpool */
	long			value;				/* computed value of symbol */
	sym_type_t		type;				/* type of symbol */
	sym_scope_t		scope;				/* scope of symbol definition */
	Bool			is_computed : 1;	/* TRUE if TYPE_COMPUTED or TYPE_ADDRESS 
										 * and value already known */
	Bool			is_defined : 1;		/* TRUE if symbol was defined in the current module */
	Bool			is_touched : 1;		/* TRUE if symbol was used, e.g. returned by 
										 * a symbol table search */
	struct Module  *module;				/* module which owns symbol (weak ref) */
	struct Section *section;			/* section where expression is defined (weak ref) */
	SymbolRefList  *references;			/* pointer to all found references of symbol */
END_CLASS;

/*-----------------------------------------------------------------------------
*   Symbol API
*----------------------------------------------------------------------------*/

/* create a new symbol, needs to be deleted by OBJ_DELETE()
   adds a reference to the page were referred to */
extern Symbol *Symbol_create(char *name, long value, sym_type_t type, sym_scope_t scope,
							  struct Module *module, struct Section *section );

/* return full symbol name NAME@MODULE stored in strpool */
extern char *Symbol_fullname( Symbol *sym );
