/PROG  M2_CHUCK_CLS
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 396;
CREATE		= DATE 19-04-08  TIME 11:33:56;
MODIFIED	= DATE 19-04-15  TIME 12:31:50;
FILE_NAME	= W1_CHUCK;
VERSION		= 0;
LINE_COUNT	= 14;
MEMORY_SIZE	= 876;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/MN
   1:  DO[48:W2_CHUCK_CLOSE]=PULSE,1.0sec ;
   2:  WAIT   3.00(sec) ;
   3:   ;
   4:  $WAITTMOUT=200 ;
   5:  WAIT (DI[55:W2_CHUCK_CLOSED]) TIMEOUT,LBL[1] ;
   6:   ;
   7:   ;
   8:  END ;
   9:  LBL[1] ;
  10:  MESSAGE[...] ;
  11:  MESSAGE[PRIHVATNICA STROJA 2] ;
  12:  MESSAGE[NIJE ZATVORILA] ;
  13:  WAIT (DI[55:W2_CHUCK_CLOSED])    ;
  14:  END ;
/POS
/END
