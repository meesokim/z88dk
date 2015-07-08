/*
Macros to help define init_module() functions per module

Copyright (C) Paulo Custodio, 2011-2015

$Header: /cvsroot/z88dk/z88dk/src/z80asm/lib/init.h,v 1.10 2015/02/09 21:57:46 pauloscustodio Exp $
*/

#pragma once

#include "dbg.h"
#include "types.h"

/*-----------------------------------------------------------------------------
*   Usage:
*
*	DEFINE_init_module()
*	{
*		... init code ...	// included in a new init_module() function
*	}
*	DEFINE_dtor_module()
*	{
*		... dtor code ...	// included in a new dtor() function
*							// init_module() calls atexit(dtor)
*	}
*
*	xxx func ( xxx )
*	{
*		init_module();				// call init_module() at the begin of every external function
*		...
*	}
*----------------------------------------------------------------------------*/

/* DEFINE_init_module() */
#define DEFINE_init_module()									\
		static Bool __init_called = FALSE;				\
		static void __fini(void);						\
		static void __user_init(void);					\
		static void __init(void)						\
		{												\
			if ( ! __init_called )						\
			{											\
				__init_called = TRUE;					\
				__user_init();							\
				xatexit( __fini );						\
			}											\
		}												\
		static void __user_init(void)

/* DEFINE_dtor_module() */
#define DEFINE_dtor_module()									\
		static void __fini(void)

/* init_module() */
#define init_module() do { if ( ! __init_called ) __init(); } while (0)