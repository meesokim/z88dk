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

# $Header: /cvsroot/z88dk/z88dk/src/z80asm/doc/Makefile,v 1.9 2015/02/21 14:22:26 pauloscustodio Exp $

DOC = ../../../doc

#.SUFFIXES: .txt .html
#
#SRCS 	:= $(wildcard *.txt)
#HTMLS	:= $(SRCS:.txt=.html)
#
#.txt.html:
#	perl mmd2html.pl $<
#
#all: 	$(HTMLS)
#
#$(HTMLS) : mmd2html.pl

# User manual source in Google Docs and published as
# https://docs.google.com/document/d/1BDmDaQKLT_538uPrsFTlDM-ChLSlaGcqaEVs8Px9ac0/pub
# Converted to txt by reformat_html.pl

all:	$(DOC)/z80asm.txt

$(DOC)/z80asm.txt : $(DOC)/z80asm.html reformat_html.pl
	perl reformat_html.pl $(DOC)/z80asm.html
