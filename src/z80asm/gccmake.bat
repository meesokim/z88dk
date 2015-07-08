@echo off
rem $Id: gccmake.bat,v 1.56 2015/02/24 22:27:38 pauloscustodio Exp $

echo *******************
echo * Building z80asm *
echo *******************
del *.o lib\*.o
gcc -Ilib -Wall -c -o codearea.o             codearea.c
gcc -Ilib -Wall -c -o deffile.o              deffile.c
gcc -Ilib -Wall -c -o directives.o           directives.c
gcc -Ilib -Wall -c -o errors.o               errors.c
gcc -Ilib -Wall -c -o expr.o                 expr.c
gcc -Ilib -Wall -c -o hist.o                 hist.c
gcc -Ilib -Wall -c -o libfile.o              libfile.c
gcc -Ilib -Wall -c -o listfile.o             listfile.c
gcc -Ilib -Wall -c -o mapfile.o              mapfile.c
gcc -Ilib -Wall -c -o model.o                model.c
gcc -Ilib -Wall -c -o modlink.o              modlink.c
gcc -Ilib -Wall -c -o module.o               module.c
gcc -Ilib -Wall -c -o objfile.o              objfile.c
gcc -Ilib -Wall -c -o opcodes.o              opcodes.c
gcc -Ilib -Wall -c -o options.o              options.c
gcc -Ilib -Wall -c -o parse.o                parse.c
gcc -Ilib -Wall -c -o scan.o                 scan.c
gcc -Ilib -Wall -c -o sym.o                  sym.c
gcc -Ilib -Wall -c -o symref.o               symref.c
gcc -Ilib -Wall -c -o symtab.o               symtab.c
gcc -Ilib -Wall -c -o z80asm.o               z80asm.c
gcc -Ilib -Wall -c -o z80pass.o              z80pass.c
gcc -Ilib -Wall -c -o lib/alloc.o            lib/alloc.c
gcc -Ilib -Wall -c -o lib/array.o            lib/array.c
gcc -Ilib -Wall -c -o lib/class.o            lib/class.c
gcc -Ilib -Wall -c -o lib/dbg.o              lib/dbg.c
gcc -Ilib -Wall -c -o lib/fileutil.o         lib/fileutil.c
gcc -Ilib -Wall -c -o lib/list.o             lib/list.c
gcc -Ilib -Wall -c -o lib/minunit.o          lib/minunit.c
gcc -Ilib -Wall -c -o lib/srcfile.o          lib/srcfile.c
gcc -Ilib -Wall -c -o lib/str.o              lib/str.c
gcc -Ilib -Wall -c -o lib/strhash.o          lib/strhash.c
gcc -Ilib -Wall -c -o lib/strpool.o          lib/strpool.c
gcc -o z80asm.exe *.o lib\*.o
copy z80asm.exe ..\..\bin
del z80asm.exe
