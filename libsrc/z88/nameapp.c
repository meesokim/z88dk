/*
 *	Name a z88 application
 */


#include <z88.h>

void nameapp(char *name)
{
#asm
	INCLUDE	"director.def"
	pop	bc
	pop	hl
	push	hl
	push	bc
	call_oz(dc_nam)
#endasm
}

