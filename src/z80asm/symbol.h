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

$Header: /cvsroot/z88dk/z88dk/src/z80asm/symbol.h,v 1.56 2015/02/13 00:05:17 pauloscustodio Exp $
*/

#pragma once

#include "expr.h"
#include "model.h"
#include "objfile.h"
#include "symtab.h"
#include "types.h"
#include "scan.h"
#include <stdlib.h>

/* Structured data types : */

enum flag           { OFF, ON };

struct liblist
{
    struct libfile    *firstlib;		/* pointer to first library file specified from command line */
    struct libfile    *currlib;			/* pointer to current library file specified from command line */
};

struct libfile
{
    struct libfile    *nextlib;			/* pointer to next library file in list */
    char              *libfilename;		/* filename of library (incl. extension) */
    long              nextobjfile;		/* file pointer to next object file in library */
};

struct linklist
{
    struct linkedmod  *firstlink;		/* pointer to first linked object module */
    struct linkedmod  *lastlink;		/* pointer to last linked module in list */
};

struct linkedmod
{
    struct linkedmod  *nextlink;		/* pointer to next module link */
    char              *objfilename;		/* filename of library/object file (incl. extension) */
    long              modulestart;		/* base pointer of beginning of object module */
    Module		     *moduleinfo;		/* pointer to main module information */
};
