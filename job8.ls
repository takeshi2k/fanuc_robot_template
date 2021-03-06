/PROG  JOB8
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2078;
CREATE		= DATE 19-04-15  TIME 08:01:04;
MODIFIED	= DATE 19-04-15  TIME 13:17:22;
FILE_NAME	= JOB5;
VERSION		= 0;
LINE_COUNT	= 125;
MEMORY_SIZE	= 2530;
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
   1:  !STROJ 2 NA IZLAZNU PALETU ;
   2:   ;
   3:  CALL CLR_SCR    ;
   4:  GO[1]=R[100:Job Number] ;
   5:   ;
   6:  UFRAME_NUM=12 ;
   7:  UTOOL_NUM=1 ;
   8:   ;
   9:J PR[6:V_MID_W2H3] 100% CNT100    ;
  10:   ;
  11:J PR[45:V_WELDING_2] 100% CNT100    ;
  12:  CALL M2_CHUCK_OPN    ;
  13:   ;
  14:  !M2 DOOR OPEN CHECK ;
  15:   ;
  16:  CALL M2_DOOR_OPN_CHECK    ;
  17:   ;
  18:  WAIT DI[15:PermissSpace8]=ON    ;
  19:   ;
  20:  UFRAME_NUM=12 ;
  21:  UTOOL_NUM=1 ;
  22:   ;
  23:J PR[47:IN_WELDING_2 ] 100% CNT100    ;
  24:   ;
  25:  CALL PR(97,0,0,(-250)) ;
  26:   ;
  27:J PR[47:IN_WELDING_2 ] 30% CNT20 Tool_Offset,PR[94:OFFSET W2]    ;
  28:   ;
  29:  UFRAME_NUM=8 ;
  30:  UTOOL_NUM=1 ;
  31:   ;
  32:  R[70:W2 CHUCK HEIGHT]=126    ;
  33:  R[71:W2 CHUCK DEPTH]=GI[27:M2_Chuck_Depth]    ;
  34:   ;
  35:  R[20:WELDING2 X OFFS]=R[124:W2 X OFFS]-2    ;
  36:   ;
  37:  R[21:WELDING2 Y OFFS]=R[125:W2 Y OFFS]    ;
  38:   ;
  39:  R[22:WELDING2 Z OFFS]=R[123:W2 PART HEIGHT]+20    ;
  40:   ;
  41:  CALL PR(94,R[20:WELDING2 X OFFS],R[21:WELDING2 Y OFFS],R[22:WELDING2 Z OFFS]) ;
  42:  CALL CHECK_SIGN(94,2) ;
  43:   ;
  44:J PR[46:WELDING_2_REF] 30% CNT20 Offset,PR[94:OFFSET W2]    ;
  45:   ;
  46:  R[40:Handling height]=R[122:W2 HANDLING]    ;
  47:   ;
  48:  R[19:WELDING1 Z OFFS]=R[40:Handling height]-R[71:W2 CHUCK DEPTH]    ;
  49:   ;
  50:   ;
  51:  CALL PR(94,R[20:WELDING2 X OFFS],R[21:WELDING2 Y OFFS],R[22:WELDING2 Z OFFS]) ;
  52:  CALL CHECK_SIGN(94,2) ;
  53:   ;
  54:L PR[46:WELDING_2_REF] 100mm/sec FINE Offset,PR[94:OFFSET W2]    ;
  55:   ;
  56:  CALL GRP_CLS    ;
  57:   ;
  58:  DO[52:PICK AND PLACE PLS]=PULSE,1.0sec ;
  59:   ;
  60:  R[22:WELDING2 Z OFFS]=R[123:W2 PART HEIGHT]+R[71:W2 CHUCK DEPTH]+20    ;
  61:   ;
  62:  CALL PR(94,R[20:WELDING2 X OFFS],R[21:WELDING2 Y OFFS],R[22:WELDING2 Z OFFS]) ;
  63:  CALL CHECK_SIGN(94,2) ;
  64:   ;
  65:L PR[46:WELDING_2_REF] 100mm/sec FINE Offset,PR[94:OFFSET W2]    ;
  66:   ;
  67:  R[20:WELDING2 X OFFS]=(-250)    ;
  68:   ;
  69:  CALL PR(94,R[20:WELDING2 X OFFS],R[21:WELDING2 Y OFFS],R[22:WELDING2 Z OFFS]) ;
  70:  CALL CHECK_SIGN(94,2) ;
  71:   ;
  72:L PR[46:WELDING_2_REF] 100mm/sec CNT20 Offset,PR[94:OFFSET W2]    ;
  73:   ;
  74:  R[40:Handling height]=R[122:W2 HANDLING]    ;
  75:  R[41:WP Height]=R[123:W2 PART HEIGHT]    ;
  76:   ;
  77:  R[122:W2 HANDLING]=0    ;
  78:  R[123:W2 PART HEIGHT]=0    ;
  79:  R[124:W2 X OFFS]=0    ;
  80:  R[125:W2 Y OFFS]=0    ;
  81:   ;
  82:  UFRAME_NUM=12 ;
  83:  UTOOL_NUM=1 ;
  84:   ;
  85:J PR[47:IN_WELDING_2 ] 30% CNT20    ;
  86:   ;
  87:J PR[45:V_WELDING_2] 30% CNT20    ;
  88:   ;
  89:J PR[6:V_MID_W2H3] 30% CNT20    ;
  90:   ;
  91:J PR[15:V_PAL2] 30% CNT20    ;
  92:   ;
  93:J PR[38:V_WELDING_1 ] 30% CNT20    ;
  94:   ;
  95:  !OUTPUT PALLET ;
  96:   ;
  97:  !Select active pallet ;
  98:  LBL[40] ;
  99:  IF DI[86:Pall3 In Pos]=ON AND DI[82:Pall3 Active]=ON,JMP LBL[10] ;
 100:  IF DI[94:Pall4 In Pos]=ON AND DI[90:Pall4 Active]=ON,JMP LBL[20] ;
 101:  MESSAGE[PALETE NISU SPREMNE ] ;
 102:  WAIT   1.00(sec) ;
 103:  JMP LBL[40] ;
 104:  END ;
 105:   ;
 106:  CALL CLR_SCR    ;
 107:  !Place on Pallet 3 ;
 108:  LBL[10] ;
 109:  CALL PLACE_PAL3    ;
 110:  JMP LBL[50] ;
 111:   ;
 112:  LBL[20] ;
 113:  !Place on Pallet 4 ;
 114:  CALL PLACE_PAL4    ;
 115:  JMP LBL[50] ;
 116:   ;
 117:  LBL[50] ;
 118:   ;
 119:  UFRAME_NUM=12 ;
 120:  UTOOL_NUM=1 ;
 121:   ;
 122:J PR[1:HOME] 100% FINE    ;
 123:   ;
 124:  LBL[1] ;
 125:  END ;
/POS
/END
