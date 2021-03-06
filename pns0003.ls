/PROG  PNS0003
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "TO M1 FROM H1";
PROG_SIZE	= 2084;
CREATE		= DATE 19-04-17  TIME 07:59:22;
MODIFIED	= DATE 19-04-18  TIME 15:34:16;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 132;
MEMORY_SIZE	= 2488;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/MN
   1:  !GRIJAC 1 NA STROJ 1 ;
   2:   ;
   3:  OVERRIDE=30% ;
   4:   ;
   5:  CALL CLR_SCR    ;
   6:  GO[1]=R[100:Job Number] ;
   7:   ;
   8:  UFRAME_NUM=12 ;
   9:  UTOOL_NUM=1 ;
  10:   ;
  11:J PR[38:V_WELDING_1 ] 100% CNT100    ;
  12:   ;
  13:J PR[4:V_H1H2] 100% CNT100    ;
  14:   ;
  15:J PR[30:V_HEATER_1 ] 100% CNT100    ;
  16:  WAIT   6.00(sec) ;
  17:   ;
  18:  WAIT DI[13:PermissSpace6]=ON    ;
  19:   ;
  20:  UFRAME_NUM=6 ;
  21:  UTOOL_NUM=1 ;
  22:   ;
  23:  R[12:HEATER1 Z OFFS]=R[111:HEAT1 HEIGHT]+20    ;
  24:  CALL PR(98,R[109:HEAT1 X OFFS],0,R[62]) ;
  25:   ;
  26:J PR[31:HEATER_1_REF] 20% CNT20 Offset,PR[98:OFFSET H1]    ;
  27:   ;
  28:  R[12:HEATER1 Z OFFS]=R[110:HEAT1 HANDLING]+4    ;
  29:   ;
  30:  CALL PR(98,R[10:HEATER1 X OFFS],0,R[12:HEATER1 Z OFFS]) ;
  31:   ;
  32:L PR[31:HEATER_1_REF] 100mm/sec FINE Offset,PR[98:OFFSET H1]    ;
  33:   ;
  34:  CALL GRP_CLS    ;
  35:   ;
  36:  DO[52:PICK AND PLACE PLS]=PULSE,1.0sec ;
  37:   ;
  38:  R[40:Handling height]=R[110:HEAT1 HANDLING]    ;
  39:  R[41:WP Height]=R[111:HEAT1 HEIGHT]    ;
  40:   ;
  41:  R[109:HEAT1 X OFFS]=0    ;
  42:  R[110:HEAT1 HANDLING]=0    ;
  43:  R[111:HEAT1 HEIGHT]=0    ;
  44:   ;
  45:  R[12:HEATER1 Z OFFS]=R[40:Handling height]+50    ;
  46:   ;
  47:  CALL PR(98,R[10:HEATER1 X OFFS],0,R[12:HEATER1 Z OFFS]) ;
  48:   ;
  49:L PR[31:HEATER_1_REF] 100mm/sec FINE Offset,PR[98:OFFSET H1]    ;
  50:   ;
  51:  UFRAME_NUM=12 ;
  52:  UTOOL_NUM=1 ;
  53:   ;
  54:J PR[30:V_HEATER_1 ] 30% CNT100    ;
  55:J PR[4:V_H1H2] 30% CNT100    ;
  56:   ;
  57:  !TO WELDING 1 ;
  58:  UFRAME_NUM=12 ;
  59:  UTOOL_NUM=1 ;
  60:   ;
  61:J PR[38:V_WELDING_1 ] 30% CNT20    ;
  62:  WAIT DI[12:PermissSpace5]=ON    ;
  63:   ;
  64:  UFRAME_NUM=12 ;
  65:  UTOOL_NUM=1 ;
  66:   ;
  67:J PR[40:IN_WELDING_1] 30% CNT20    ;
  68:   ;
  69:  CALL PR(97,0,0,(-250)) ;
  70:   ;
  71:J PR[40:IN_WELDING_1] 30% CNT20 Tool_Offset,PR[97:OFFSET W1]    ;
  72:   ;
  73:  UFRAME_NUM=5 ;
  74:  UTOOL_NUM=1 ;
  75:   ;
  76:  R[64:W1 CHUCK HEIGHT]=126-GI[24:M1_Chuck_Height]    ;
  77:  R[65:W1 CHUCK DEPTH]=GI[23:M1_Chuck_Depth]    ;
  78:   ;
  79:  R[17:WELDING1 X OFFS]=R[42:Pick TCP Offs]+12    ;
  80:   ;
  81:  !CORRECTION X OFFS ;
  82:  R[1:CHECK SIGN GI]=(GI[25:M1_Chuck_XOffs]-(GI[25:M1_Chuck_XOffs] DIV 32786)*65536) ;
  83:   ;
  84:  R[17:WELDING1 X OFFS]=R[17:WELDING1 X OFFS]+20+R[1:CHECK SIGN GI]    ;
  85:   ;
  86:  R[18:WELDING1 Y OFFS]=GI[26:M1_Chuck_YOffs ]    ;
  87:   ;
  88:  R[19:WELDING1 Z OFFS]=R[40:Handling height]+R[64:W1 CHUCK HEIGHT]+20    ;
  89:   ;
  90:  CALL PR(97,R[17:WELDING1 X OFFS],R[18:WELDING1 Y OFFS],R[19:WELDING1 Z OFFS]) ;
  91:  CALL CHECK_SIGN(97,2) ;
  92:   ;
  93:J PR[39:WELDING_1_REF] 30% FINE Offset,PR[97:OFFSET W1]    ;
  94:   ;
  95:  R[19:WELDING1 Z OFFS]=R[40:Handling height]-R[65:W1 CHUCK DEPTH]    ;
  96:  R[19:WELDING1 Z OFFS]=R[19:WELDING1 Z OFFS]+6    ;
  97:   ;
  98:  CALL PR(97,R[17:WELDING1 X OFFS],R[18:WELDING1 Y OFFS],R[19:WELDING1 Z OFFS]) ;
  99:  CALL CHECK_SIGN(97,2) ;
 100:   ;
 101:L PR[39:WELDING_1_REF] 100mm/sec FINE Offset,PR[97:OFFSET W1]    ;
 102:   ;
 103:  CALL GRP_OPN    ;
 104:   ;
 105:  DO[52:PICK AND PLACE PLS]=PULSE,1.0sec ;
 106:   ;
 107:  //CALL M1_CHUCK_CLS    ;
 108:   ;
 109:  R[115:W1 HANDLING]=R[40:Handling height]    ;
 110:  R[116:W1 PART HEIGHT]=R[41:WP Height]    ;
 111:  R[117:W1 X OFFS]=R[17:WELDING1 X OFFS]    ;
 112:  R[118:W1 Y OFFS]=R[18:WELDING1 Y OFFS]    ;
 113:   ;
 114:  R[40:Handling height]=0    ;
 115:  R[41:WP Height]=0    ;
 116:   ;
 117:  R[19:WELDING1 Z OFFS]=R[116:W1 PART HEIGHT]+R[65:W1 CHUCK DEPTH]+20    ;
 118:   ;
 119:  CALL PR(97,R[17:WELDING1 X OFFS],R[18:WELDING1 Y OFFS],R[19:WELDING1 Z OFFS]) ;
 120:   ;
 121:L PR[39:WELDING_1_REF] 100mm/sec FINE Offset,PR[97:OFFSET W1]    ;
 122:   ;
 123:  UFRAME_NUM=12 ;
 124:  UTOOL_NUM=1 ;
 125:   ;
 126:J PR[40:IN_WELDING_1] 100% CNT100    ;
 127:   ;
 128:J PR[38:V_WELDING_1 ] 100% CNT100    ;
 129:   ;
 130:J PR[1:HOME] 100% FINE    ;
 131:   ;
 132:  END ;
/POS
/END
