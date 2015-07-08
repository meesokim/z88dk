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

$Header: /cvsroot/z88dk/z88dk/src/z80asm/sym.c,v 1.28 2015/02/24 22:27:40 pauloscustodio Exp $
*/

#include "listfile.h"
#include "options.h"
#include "strpool.h"
#include "str.h"
#include "sym.h"
#include "symbol.h"

/*-----------------------------------------------------------------------------
*   Symbol
*----------------------------------------------------------------------------*/
DEF_CLASS( Symbol )

void Symbol_init( Symbol *self )
{
    self->references = OBJ_NEW( SymbolRefList );
    OBJ_AUTODELETE( self->references ) = FALSE;
}

void Symbol_copy( Symbol *self, Symbol *other )
{
    self->references = SymbolRefList_clone( other->references );
}

void Symbol_fini( Symbol *self )
{
    OBJ_DELETE( self->references );
}

/*-----------------------------------------------------------------------------
*   create a new symbol, needs to be deleted by OBJ_DELETE()
*	adds a reference to the page were referred to
*----------------------------------------------------------------------------*/
Symbol *Symbol_create(char *name, long value, sym_type_t type, sym_scope_t scope,
					   Module *module, Section *section )
{
    Symbol *self 	= OBJ_NEW( Symbol );

	self->name = strpool_add(name);			/* name in strpool, not freed */
	self->value = value;
	self->type = type;
	self->scope = scope;
	self->module = module;
	self->section = section;

    /* add reference */
    add_symbol_ref( self->references, list_get_page_nr(), FALSE );

    return self;              						/* pointer to new symbol */
}

/*-----------------------------------------------------------------------------
*   return full symbol name NAME@MODULE stored in strpool
*----------------------------------------------------------------------------*/
char *Symbol_fullname( Symbol *sym )
{
	STR_DEFINE(name, STR_SIZE);
	char *ret;

    str_set( name, sym->name );

    if ( sym->module && sym->module->modname )
    {
        str_append_char( name, '@' );
        str_append( name, sym->module->modname );
    }

    ret = strpool_add( str_data(name) );

	STR_DELETE(name);

	return ret;
}
