/*

 *        BIN to .P Z81 program file

 *

 *        Creates a Basic program with M/C put in a REM line.

 *        The M/C start address of must be 16514

 *

 *        Stefano Bodrato Apr. 2000

 *        May 2010, added support for wave file

 *

 *        $Id: zx81.c,v 1.15 2015/01/28 04:32:59 aralbrec Exp $

 */





#include "appmake.h"



static char             *binname      = NULL;

static char             *outfile      = NULL;

static char              help         = 0;

static char              audio        = 0;

static char              fast         = 0;

static char              dumb         = 0;

static char              collapsed    = 0;

static char              zx80         = 0;





/* Options that are available for this module */

option_t zx81_options[] = {

    { 'h', "help",     "Display this help",          OPT_BOOL,  &help},

    { 'b', "binfile",  "Linked binary file",         OPT_STR,   &binname },

    { 'o', "output",   "Name of output file",        OPT_STR,   &outfile },

    {  0,  "audio",    "Create also a WAV file",     OPT_BOOL,  &audio },

    {  0,  "fast",     "Create a fast loading WAV",  OPT_BOOL,  &fast },

    {  0,  "dumb",     "Just convert to WAV a tape file",  OPT_BOOL,  &dumb },

    {  0,  "collapsed",  "Collapse display to save loading time",  OPT_BOOL,  &collapsed },

    {  0,  "zx80",     "Work in ZX80 mode (4K ROM)",  OPT_BOOL,  &zx80 },

    {  0,  NULL,       NULL,                         OPT_NONE,  NULL }

};





void zx81_rawpeak (FILE *fpout)

{

  int i;

  for (i=0; i < 7; i++)

	fputc (0xe0,fpout);

  for (i=0; i < 7; i++)

	fputc (0x20,fpout);

}



void zx81_rawout (FILE *fpout, unsigned char b)

{

  static unsigned char c[8] = { 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01 };

  int i,j,peaks;



  for (i=0; i < 8; i++)

  {

    if (b & c[i])

	  if ( fast ) peaks = 7; else peaks = 9;

    else

      if ( fast ) peaks = 3; else peaks = 4;



    for (j=0; j < peaks; j++)

	  zx81_rawpeak(fpout);

	  

  	/* bit interval at std speed: about 67 */

    if ( fast ) {

		for (j=0; j < 20; j++)

		fputc (0x20,fpout);

	} else {

		for (j=0; j < 60; j++)

		fputc (0x20,fpout);

	}

  }

}





int zx81_exec(char *target)

{

    char       filename[FILENAME_MAX+1];

    char       wavfile[FILENAME_MAX+1];

    char       name[12];

    FILE       *fpin, *fpout;

    int        c;

    int        i;

    int        len;

	int        screen_size;



    if ( help || binname == NULL )

        return -1;



	if (dumb) {

		strcpy(filename,binname);



	} else {

		if ( outfile == NULL ) {

			strcpy(filename,binname);

			if ( !zx80 )

				suffix_change(filename,".P");

			else

				suffix_change(filename,".O");

		} else {

			strcpy(filename,outfile);

		}

		

		if ( strcmp(binname,filename) == 0 ) {

			fprintf(stderr,"Input and output file names must be different\n");

			myexit(NULL,1);

		}



		if ( (fpin=fopen(binname,"rb") ) == NULL ) {

			fprintf(stderr,"Can't open input file %s\n",binname);

			myexit(NULL,1);

		}





	/*

	 *        Now we try to determine the size of the file

	 *        to be converted

	 */

		if (fseek(fpin,0,SEEK_END)) {

			fclose(fpin);

			myexit("Couldn't determine size of file\n",1);

		}



		len=ftell(fpin);



		fseek(fpin,0L,SEEK_SET);



	  

		if ( (fpout=fopen(filename,"wb") ) == NULL ) {

			fclose(fpin);

			fprintf(stderr,"Can't open output file %s\n",filename);

			myexit(NULL,1);

		}



	/* Write out the '.P' or '.O' file */

		if ( collapsed ) screen_size = 25; else screen_size = 793;

		if ( zx80 ) {

			screen_size=0;

			// All system VARS are saved !  Does it mean the memory model matters ?

/*

140D:0100  FF 88 FE FF 90 40 01 00-8E 40 8F 40 91 40 92 40   .....@...@.@.@.@

140D:0110  92 40 02 01 00 00 00 00-00 00 B0 07 00 00 1C 15   .@..............

140D:0120  00 00 00 00 21 17 90 40-00 01 EF 3A 38 37 DA 1D   ....!..@...:87..

140D:0130  22 21 1E 21 D9 76 00 02-FE 76 00 03 FE 76 00 04   "!.!.v...v...v..

140D:0140  FE 76 00 05 FE 76 00 06-FE 76 00 07 FE 76 00 08   .v...v...v...v..

140D:0150  FE 76 00 09 FE 76 00 0A-FE 76 00 0B FE 76 00 0C   .v...v...v...v..

140D:0160  FE 76 00 0D FE 76 00 0E-FE 76 00 0F FE 76 00 10   .v...v...v...v..

140D:0170  FE 76 00 11 FE 76 00 12-FE 76 00 13 FE 76 00 14   .v...v...v...v..

140D:0180  FE 76 00 15 FE 76 00 16-FE 76 00 17 FE 76 80 00   .v...v...v...v..

*/

			fputc(255,fpout);							// ERR_NR

			fputc(136,fpout);							// FLAGS

			writeword(65534,fpout);						// PPC

			writeword(16422+len+106,fpout);				// E_ADDR

			writeword(1,fpout);							// E_PPC

			// ZX80 BASIC program starts at 16420

			writeword(16420+len+106,fpout);				// VARS

			writeword(16421+len+106,fpout);				// E_LINE

			writeword(16423+len+106,fpout);				// D_FILE

			writeword(16424+len+106+screen_size,fpout);	// DF_EA

			writeword(16424+len+106+screen_size,fpout);	// DF_END

			fputc(2,fpout);								// DF_ZX

			writeword(1,fpout);							// S_TOP

			writeword(0,fpout);							// X_PTR

			writeword(0,fpout);							// OLDPPC

			fputc(0,fpout);								// FLAGX

			writeword(1968,fpout);						// T_ADDR

			writeword(0,fpout);							// SEED ..should we 'randomize' it ?

			writeword(5000,fpout);						// FRAMES

			writeword(16423+len+106,fpout);				// V_ADDR

			writeword(0,fpout);							// ACC

			fputc(33,fpout);							// S_POSN (X)

			fputc(23,fpout);							// S_POSN (Y)

			writeword(16422+len+106,fpout);				// CH_ADD

		} else {

			// SYSTEM VARS before "VERSN" are not saved (ERR_NR, FLAGS, ERR_SP, RAMTOP, MODE, PPC are preserved)

			fputc(0,fpout);								// VERSN ($4009)

			writeword(1,fpout);							// E_PPC

			writeword(16530+len,fpout);					// D_FILE

			writeword(16531+len,fpout);					// DF_CC

			writeword(16530+len+screen_size,fpout);		// VARS

			writeword(0,fpout);							// DEST

			writeword(16531+len+screen_size,fpout);		// E_LINE

			writeword(16535+len+screen_size,fpout);		// CH_ADD ($4016)

			writeword(0,fpout);							// X_PTR

			writeword(16536+len+screen_size,fpout);		// STKBOT

			writeword(16536+len+screen_size,fpout);		// STKEND

			fputc(0,fpout);								// BERG

			writeword(16477,fpout);						// MEM

			fputc(0,fpout);								// not used

			fputc(2,fpout);								// DF_SZ

			writeword(0,fpout);							// S_TOP

			fputc(191,fpout);							// LAST_K

			fputc(253,fpout);							// 

			fputc(255,fpout);							// DB_ST

			fputc(55,fpout);							// MARGIN (55 if 50hz, 31 if 60 hz)

			writeword(16530+len,fpout);					// NXTLIN

			writeword(0,fpout);							// OLDPPC

			fputc(0,fpout);								// FLAGX

			writeword(0,fpout);							// STRLEN

			writeword(3213,fpout);						// T_ADDR

			writeword(0,fpout);							// SEED .. should we 'randomize' it ?

			writeword(63000,fpout);						// FRAMES

			writeword(0,fpout);							// COORDS

			fputc(188,fpout);							// PR_CC

			fputc(33,fpout);							// S_POSN (X)

			fputc(24,fpout);							// S_POSN (Y)

			fputc(64,fpout);							// CDFLAG



			for (i=0;i<16;i++)

				writeword(0,fpout);

			fputc(118,fpout);

			for (i=0;i<5;i++)

				writeword(0,fpout);

			fputc(132,fpout);

			fputc(32,fpout);

			for (i=0;i<10;i++)

				writeword(0,fpout);

		}





		if ( zx80 ) {

			/* 1 RANDOMISE USR(16525)*/

			fputc(00,fpout);

			fputc(01,fpout);

			//fputc(244,fpout);	/* PRINT */

			fputc(239,fpout);	/* RANDOMISE */

			fputc(58,fpout);	/* U */

			fputc(56,fpout);	/* S */

			fputc(55,fpout);	/* R */

			fputc(218,fpout);	/* ( */

			fputc(1+28,fpout);	/* 1 */

			fputc(6+28,fpout);	/* 6 */

			fputc(5+28,fpout);	/* 5 */

			fputc(2+28,fpout);	/* 2 */

			fputc(5+28,fpout);	/* 5 */

			fputc(217,fpout);	/* ) */

			fputc(118,fpout);

			/* 2 REM */

			fputc(00,fpout);

			fputc(02,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 3 REM */

			fputc(00,fpout);

			fputc(03,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 4 REM */

			fputc(00,fpout);

			fputc(04,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 5 REM */

			fputc(00,fpout);

			fputc(05,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 6 REM */

			fputc(00,fpout);

			fputc(06,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 7 REM */

			fputc(00,fpout);

			fputc(07,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 8 REM */

			fputc(00,fpout);

			fputc(8,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 9 REM */

			fputc(00,fpout);

			fputc(9,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 10 REM */

			fputc(00,fpout);

			fputc(10,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 11 REM */

			fputc(00,fpout);

			fputc(11,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 12 REM */

			fputc(00,fpout);

			fputc(12,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 13 REM */

			fputc(00,fpout);

			fputc(13,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 14 REM */

			fputc(00,fpout);

			fputc(14,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 15 REM */

			fputc(00,fpout);

			fputc(15,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 16 REM */

			fputc(00,fpout);

			fputc(16,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 17 REM */

			fputc(00,fpout);

			fputc(17,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 18 REM */

			fputc(00,fpout);

			fputc(18,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 19 REM */

			fputc(00,fpout);

			fputc(19,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 20 REM */

			fputc(00,fpout);

			fputc(20,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 21 REM */

			fputc(00,fpout);

			fputc(21,fpout);

			fputc(254,fpout);

			fputc(118,fpout);

			/* 22 STOP */

			fputc(00,fpout);

			fputc(22,fpout);

			fputc(248,fpout);

			fputc(118,fpout);





			/* 23 REM */

			fputc(00,fpout);

			fputc(23,fpout);

			fputc(254,fpout);



			/* ... M/C ...*/

			for (i=0; i<len;i++) {

				c=getc(fpin);

				fputc(c,fpout);

			}



			/* .. and ENTER. (+2)*/

			fputc(118,fpout);



			fputc(128,fpout);

			

			/* At last the DISPLAY FILE */

			/*

			for (c=0;c<24;c++)

			{

				fputc(118,fpout);

				if ( !collapsed ) {

				  for (i=0;i<32;i++)

					fputc(0,fpout);

				}

			}

			fputc(118,fpout);

			fputc(128,fpout);

			*/



		} else {

			/* Now, the basic program, here.*/

			/* 1 REM.... */

			fputc(00,fpout);

			fputc(01,fpout);

			writeword(len+2,fpout);

			fputc(234,fpout);

			/* ... M/C ...*/

			for (i=0; i<len;i++) {

				c=getc(fpin);

				fputc(c,fpout);

			}

			/* .. and ENTER.*/

			fputc(118,fpout);



			/* 2 RAND USR VAL "16514" */

			fputc(00,fpout);

			fputc(02,fpout);

			writeword(11,fpout);

			fputc(249,fpout);

			fputc(212,fpout);

			fputc(197,fpout);

			fputc(11,fpout);

			fputc(29,fpout);

			fputc(34,fpout);

			fputc(33,fpout);

			fputc(29,fpout);

			fputc(32,fpout);

			fputc(11,fpout);

			/* .. and ENTER.*/

			fputc(118,fpout);



			/* At last the DISPLAY FILE */

			for (c=0;c<24;c++)

			{

				fputc(118,fpout);

				if ( !collapsed ) {

				  for (i=0;i<32;i++)

					fputc(0,fpout);

				}

			}

			fputc(118,fpout);

			fputc(128,fpout);

		}





		fclose(fpin);

		fclose(fpout);

	}



	/* ***************************************** */

	/*  Now, if requested, create the audio file */

	/* ***************************************** */

	if (( audio ) || ( fast )) {

		if ( (fpin=fopen(filename,"rb") ) == NULL ) {

			fprintf(stderr,"Can't open file %s for wave conversion\n",filename);

			myexit(NULL,1);

		}



        if (fseek(fpin,0,SEEK_END)) {

           fclose(fpin);

           myexit("Couldn't determine size of file\n",1);

        }

        len=ftell(fpin);

        fseek(fpin,0L,SEEK_SET);



        strcpy(wavfile,filename);

		suffix_change(wavfile,".RAW");

		if ( (fpout=fopen(wavfile,"wb") ) == NULL ) {

			fprintf(stderr,"Can't open output raw audio file %s\n",wavfile);

			myexit(NULL,1);

		}



		/* leading silence */

	    for (i=0; i < 0x3000; i++)

			fputc(0x20, fpout);



		if (!zx80) {

			/* The program on tape has to have a leading name */

			if (dumb) printf("\nAssigning name : ");

			strcpy(name,"           ");

			for (i=0;(i<=11)&&(isalnum(filename[i]));i++) {

			if (dumb) printf("%c",toupper(filename[i]));

				if (isalpha(filename[i]))

					name[i]=toupper(filename[i])-27;

				else

					name[i]=filename[i]-20;

			}

			if (dumb) printf("\n\n");

			name[i-1]=name[i-1]+128;



			for (i=0;name[i]!=' ';i++)

				zx81_rawout(fpout,name[i]);

		}

		

		/*

		zx81_rawout(fpout,'Z'-27);

		zx81_rawout(fpout,'8'-20);

		zx81_rawout(fpout,'8'-20);

		zx81_rawout(fpout,'D'-27);

		zx81_rawout(fpout,'K'-27+128);

		*/



        for (i=0; i<len;i++) {

          c=getc(fpin);

		  zx81_rawout(fpout,c);

        }



		/* trailing silence */

	    for (i=0; i < 0x1000; i++)

			fputc(0x20, fpout);



        fclose(fpin);

        fclose(fpout);



		/* Now let's think at the WAV format */

		raw2wav(wavfile);



	}

	

    exit(0);

}

                

