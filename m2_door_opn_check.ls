/PROG  M2_DOOR_OPN_CHECK
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 350;
CREATE		= DATE 19-04-15  TIME 12:25:04;
MODIFIED	= DATE 19-04-15  TIME 12:43:20;
FILE_NAME	= M1_DOOR_;
VERSION		= 0;
LINE_COUNT	= 11;
MEMORY_SIZE	= 842;
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
   1:  $WAITTMOUT=200 ;
   2:  WAIT (DI[52:W2_DOOR_OPENED]) TIMEOUT,LBL[1] ;
   3:   ;
   4:   ;
   5:  END ;
   6:  LBL[1] ;
   7:  MESSAGE[...] ;
   8:  MESSAGE[VRATA STROJA 2] ;
   9:  MESSAGE[NISU OTVORILA] ;
  10:  WAIT (DI[52:W2_DOOR_OPENED])    ;
  11:  END ;
/POS
/END
