/*
	Minimal Xlib port
	Stefano Bodrato, 5/3/2007
	
	$Id: DefaultDepth.c,v 1.1 2014/04/16 06:16:15 stefano Exp $
*/

#define _BUILDING_X
#include <X11/Xlib.h>


int DefaultDepth(Display *display,int screen) {
	return 2;
}

