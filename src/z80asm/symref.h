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

Cross reference list of symbol usage

$Header: /cvsroot/z88dk/z88dk/src/z80asm/symref.h,v 1.10 2015/02/13 00:05:17 pauloscustodio Exp $
*/

#pragma once

#include "class.h"
#include "classlist.h"
#include "types.h"

/*-----------------------------------------------------------------------------
*   Cross reference list of symbol usage
*----------------------------------------------------------------------------*/
CLASS( SymbolRef )
	int		page_nr;			/* page where symbol used/defined */
END_CLASS;

CLASS_LIST( SymbolRef );		/* list of references sorted by page_nr, with
								   definition reference at head of list */

/* add a symbol reference, create the list if NULL */
extern void add_symbol_ref( SymbolRefList *list, int page_nr, Bool defined );
