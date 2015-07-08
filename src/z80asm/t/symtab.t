#!/usr/bin/perl

#     ZZZZZZZZZZZZZZZZZZZZ    8888888888888       00000000000
#   ZZZZZZZZZZZZZZZZZZZZ    88888888888888888    0000000000000
#                ZZZZZ      888           888  0000         0000
#              ZZZZZ        88888888888888888  0000         0000
#            ZZZZZ            8888888888888    0000         0000       AAAAAA         SSSSSSSSSSS   MMMM       MMMM
#          ZZZZZ            88888888888888888  0000         0000      AAAAAAAA      SSSS            MMMMMM   MMMMMM
#        ZZZZZ              8888         8888  0000         0000     AAAA  AAAA     SSSSSSSSSSS     MMMMMMMMMMMMMMM
#      ZZZZZ                8888         8888  0000         0000    AAAAAAAAAAAA      SSSSSSSSSSS   MMMM MMMMM MMMM
#    ZZZZZZZZZZZZZZZZZZZZZ  88888888888888888    0000000000000     AAAA      AAAA           SSSSS   MMMM       MMMM
#  ZZZZZZZZZZZZZZZZZZZZZ      8888888888888       00000000000     AAAA        AAAA  SSSSSSSSSSS     MMMM       MMMM
#
# Copyright (C) Paulo Custodio, 2011-2015

# $Header: /cvsroot/z88dk/z88dk/src/z80asm/t/symtab.t,v 1.30 2015/03/25 22:35:45 pauloscustodio Exp $
#

use Modern::Perl;
use Test::More;
require 't/test_utils.pl';

# -DVAR
t_z80asm(
	asm		=> "define VAR",
	err		=> "Error at file 'test.asm' line 1: symbol 'VAR' already defined",
	options	=> "-DVAR"
);

t_z80asm(
	asm		=> "defb VAR",
	bin		=> "\1",
	options	=> "-DVAR"
);

t_z80asm(
	asm		=> "defc VAR=2",
	err		=> "Error at file 'test.asm' line 1: symbol 'VAR' already defined",
	options	=> "-DVAR"
);

t_z80asm(
	asm		=> "VAR: nop",
	err		=> "Error at file 'test.asm' line 1: symbol 'VAR' already defined",
	options	=> "-DVAR"
);

t_z80asm(
	asm		=> "PUBLIC VAR : defb VAR",
	bin		=> "\1",
	options	=> "-DVAR"
);

t_z80asm(
	asm		=> "EXTERN VAR",
	err		=> "Error at file 'test.asm' line 1: symbol 'VAR' already declared local",
	options	=> "-DVAR"
);

# define VAR
t_z80asm(
	asm		=> "define VAR : defb VAR",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "undefine VAR : defb VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' not defined",
);

t_z80asm(
	asm		=> "define VAR : undefine VAR : define VAR : defb VAR",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "define VAR : defc VAR=2",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "define VAR : VAR: nop",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "define VAR : PUBLIC VAR : defb VAR",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "define VAR : EXTERN VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already declared local",
);

# defc VAR
t_z80asm(
	asm		=> "defc VAR=1 : defb VAR",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "defc VAR=1 : define VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "defc VAR=1 : defc VAR=1",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "defc VAR=1 : VAR: nop",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "defc VAR=1 : PUBLIC VAR : defb VAR",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "defc VAR=1 : EXTERN VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already declared local",
);

# VAR:
t_z80asm(
	asm		=> "VAR: : defb VAR",
	bin		=> "\0",
);

t_z80asm(
	asm		=> "defb VAR : VAR:",
	bin		=> "\1",
);

t_z80asm(
	asm		=> "VAR: : define VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "VAR: : defc VAR=1",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "VAR: : VAR: nop",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already defined",
);

t_z80asm(
	asm		=> "VAR: : PUBLIC VAR : defb VAR",
	bin		=> "\0",
);

t_z80asm(
	asm		=> "PUBLIC VAR : VAR: : defb VAR",
	bin		=> "\0",
);

t_z80asm(
	asm		=> "VAR: : EXTERN VAR",
	err		=> "Error at file 'test.asm' line 2: symbol 'VAR' already declared local",
);

# PUBLIC
t_z80asm(
	asm		=> "PUBLIC VAR : PUBLIC VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

t_z80asm(
	asm		=> "PUBLIC VAR : EXTERN VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

t_z80asm(
	asm		=> "PUBLIC VAR : GLOBAL VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

# EXTERN
t_z80asm(
	asm		=> "EXTERN VAR : PUBLIC VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

t_z80asm(
	asm		=> "EXTERN VAR : EXTERN VAR : VAR: defb VAR",	# local hides global
	bin		=> "\0",
);

t_z80asm(
	asm		=> "EXTERN VAR : GLOBAL VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

# GLOBAL
t_z80asm(
	asm		=> "GLOBAL VAR : PUBLIC VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

t_z80asm(
	asm		=> "GLOBAL VAR : EXTERN VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

t_z80asm(
	asm		=> "GLOBAL VAR : GLOBAL VAR : DEFC VAR = 3 : defb VAR",
	asm1	=> "EXTERN VAR : defb VAR",
	bin		=> "\3\3",
);

# Symbol redefined
t_z80asm(
	asm		=> "PUBLIC VAR : defc VAR=3 : defb VAR",
	asm1	=> "PUBLIC VAR : defc VAR=3 : defb VAR",
	linkerr	=> "Error at module 'test1': symbol 'VAR' already defined in module 'test'",
);

# Symbol declared global in another module
t_z80asm(
	asm		=> "PUBLIC VAR : defc VAR=2",
	asm1	=> "PUBLIC VAR : defc VAR=3",
	linkerr	=> "Error at module 'test1': symbol 'VAR' already defined in module 'test'",
);

# CH_0024: Case-preserving, case-insensitive symbols
unlink_testfiles();
write_file(asm_file(), "Defc Loc = 1 \n ld a, LOC \n PUBLIC Var \n defc VAR = 2");
write_file(asm1_file(), "EXTERN var \n ld a, VAR");
t_z80asm_capture("-l -b -r0 ".asm_file()." ".asm1_file(), "", <<'ERR', 0);
Warning at file 'test.asm' line 2: symbol 'Loc' used as 'LOC'
Warning at file 'test.asm' line 4: symbol 'Var' used as 'VAR'
Warning at file 'test1.asm' line 2: symbol 'var' used as 'VAR'
Warning at file 'test1.asm' line 2: symbol 'Var' used as 'VAR'
ERR
t_binary(read_binfile(bin_file()), "\x3E\x01\x3E\x02");

# CH_0025: PUBLIC and EXTERN instead of LIB, XREF, XDEF, XLIB
write_file(asm_file(), "
	PUBLIC 	var1
	DEFC 	var1 = 1
	
	XDEF	var2
	DEFC 	var2 = 2
	
	XLIB	var3
	DEFC 	var3 = 3
");
write_file(asm1_file(), "
	EXTERN 	var1
	DEFB 	var1
	
	XREF	var2
	DEFB 	var2
	
	LIB		var3
	DEFB 	var3
");
t_z80asm_capture("-l -b -r0 ".asm_file()." ".asm1_file(), "", <<'ERR', 0);
Warning at file 'test.asm' line 5: 'XDEF' is deprecated, use 'PUBLIC' instead
Warning at file 'test.asm' line 8: 'XLIB' is deprecated, use 'PUBLIC' instead
Warning at file 'test1.asm' line 5: 'XREF' is deprecated, use 'EXTERN' instead
Warning at file 'test1.asm' line 8: 'LIB' is deprecated, use 'EXTERN' instead
ERR
t_binary(read_binfile(bin_file()), "\x01\x02\x03");

# delete directories and files
unlink_testfiles();
done_testing;
