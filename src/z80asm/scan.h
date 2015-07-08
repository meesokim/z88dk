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

Copyright (C) Paulo Custodio, 2011-2015

Scanner. Scanning engine is built by ragel from scan_rules.rl.

$Header: /cvsroot/z88dk/z88dk/src/z80asm/scan.h,v 1.53 2015/04/02 20:00:19 pauloscustodio Exp $
*/

#pragma once

#include "tokens.h"
#include "types.h"
#include "opcodes.h"

/*-----------------------------------------------------------------------------
* 	Keep last symbol retrieved
*----------------------------------------------------------------------------*/
typedef struct sym_t 
{
	tokid_t  tok;			/* token */
	tokid_t	 tok_opcode;	/* e.g. TK_IX, when tok = TK_NAME and token is "ix" */
	char	*tstart;		/* start of recognized token with input buffer */
	int 	 tlen;			/* length of recognized token with input buffer */
#if 0
	char	*text;			/* characters of the retrieved token for lexemes
							*  used in the expression parser */
	char	*string;		/* identifier to return with TK_NAME and TK_LABEL, or
							*  double-quoted string without quotes to return with a TK_STRING */
	char	*filename;		/* filename where token found, in strpool */
	int 	 line_nr;		/* line number where token found */
#endif
	int		 number;		/* number to return with TK_NUMBER */
} Sym;

/*-----------------------------------------------------------------------------
* 	Globals
*----------------------------------------------------------------------------*/
extern Sym  sym;			/* last token retrieved */
extern Bool EOL;			/* scanner EOL state */

/*-----------------------------------------------------------------------------
*	Scan API
*----------------------------------------------------------------------------*/

/* get the next token, fill the corresponding tok* variables */
extern tokid_t GetSym( void );
extern void scan_expect_opcode(void);		/* GetSym() returns NOP as TK_NOP */
extern void scan_expect_operands(void);		/* GetSym() returns NOP as TK_NAME */

/* save the current scan position and back-track to a saved position */
extern void save_scan_state(void);		/* needs to be balanced with restore_.../drop_... */
extern void restore_scan_state(void);
extern void drop_scan_state(void);

/* get the current/next token, error if not the expected one */
extern void CurSymExpect(tokid_t expected_tok);
extern void GetSymExpect(tokid_t expected_tok);

/* insert the given text at the current scan position */
extern void SetTemporaryLine( char *line );

/* skip line past the newline, set EOL */
extern void  Skipline( void );
extern Bool EOL;

/* return static string with current token text
*  non-reentrant, string needs to be saved by caller */
extern char *sym_text(Sym *sym);
