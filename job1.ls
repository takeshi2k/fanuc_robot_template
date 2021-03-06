/PROG  JOB1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1512;
CREATE		= DATE 19-03-15  TIME 14:28:42;
MODIFIED	= DATE 19-04-17  TIME 15:38:00;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 92;
MEMORY_SIZE	= 1952;
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
   1:  !PALETA NA GRIJAC 1 ;
   2:   ;
   3:  CALL CLR_SCR    ;
   4:  GO[1]=R[100:Job Number] ;
   5:   ;
   6:  !Select active pallet ;
   7:  LBL[40] ;
   8:  IF DI[70:Pall1 In Pos]=ON AND DI[66:Pall1 Active]=ON,JMP LBL[10] ;
   9:  IF DI[78:Pall2 In Pos]=ON AND DI[74:Pall2 Active]=ON,JMP LBL[20] ;
  10:  MESSAGE[PALETE NISU SPREMNE ] ;
  11:  WAIT   1.00(sec) ;
  12:  JMP LBL[40] ;
  13:  END ;
  14:   ;
  15:  CALL CLR_SCR    ;
  16:  !Picking from Pallet 1 ;
  17:  LBL[10] ;
  18:  CALL PICK_PAL1    ;
  19:  JMP LBL[50] ;
  20:   ;
  21:  LBL[20] ;
  22:  !Picking from Pallet 2 ;
  23:  CALL PICK_PAL2    ;
  24:  JMP LBL[50] ;
  25:   ;
  26:  LBL[50] ;
  27:   ;
  28:  UFRAME_NUM=12 ;
  29:  UTOOL_NUM=1 ;
  30:   ;
  31:J PR[38:V_WELDING_1 ] 50% CNT100    ;
  32:   ;
  33:J PR[4:V_H1H2] 50% CNT100    ;
  34:   ;
  35:J PR[30:V_HEATER_1 ] 30% FINE    ;
  36:   ;
  37:  WAIT DI[13:PermissSpace6]=ON    ;
  38:   ;
  39:  UFRAME_NUM=6 ;
  40:  UTOOL_NUM=1 ;
  41:   ;
  42:  R[1:CHECK SIGN GI]=(GI[31:H1 POS OFFSET]-(GI[31:H1 POS OFFSET] DIV 32786)*65536) ;
  43:   ;
  44:  R[10:HEATER1 X OFFS]=(135-R[43:Heater Pos]+R[1:CHECK SIGN GI]) ;
  45:   ;
  46:  R[12:HEATER1 Z OFFS]=R[40:Handling height]+20    ;
  47:   ;
  48:  CALL PR(98,R[10:HEATER1 X OFFS],0,R[12:HEATER1 Z OFFS]) ;
  49:   ;
  50:J PR[31:HEATER_1_REF] 20% FINE Offset,PR[98:OFFSET H1]    ;
  51:   ;
  52:  R[12:HEATER1 Z OFFS]=R[40:Handling height]+1    ;
  53:   ;
  54:  CALL PR(98,R[10:HEATER1 X OFFS],0,R[12:HEATER1 Z OFFS]) ;
  55:   ;
  56:L PR[31:HEATER_1_REF] 100mm/sec FINE Offset,PR[98:OFFSET H1]    ;
  57:   ;
  58:  CALL GRP_OPN    ;
  59:   ;
  60:  DO[52:PICK AND PLACE PLS]=PULSE,1.0sec ;
  61:   ;
  62:  R[109:HEAT1 X OFFS]=R[10:HEATER1 X OFFS]    ;
  63:   ;
  64:  R[110:HEAT1 HANDLING]=R[40:Handling height]    ;
  65:   ;
  66:  R[111:HEAT1 HEIGHT]=R[41:WP Height]    ;
  67:   ;
  68:  R[40:Handling height]=0    ;
  69:  R[41:WP Height]=0    ;
  70:   ;
  71:   ;
  72:  R[12:HEATER1 Z OFFS]=R[111:HEAT1 HEIGHT]+20    ;
  73:   ;
  74:  CALL PR(98,R[10:HEATER1 X OFFS],0,R[12:HEATER1 Z OFFS]) ;
  75:   ;
  76:L PR[31:HEATER_1_REF] 100mm/sec FINE Offset,PR[98:OFFSET H1]    ;
  77:   ;
  78:  !JOB DONE: GO HOME ;
  79:   ;
  80:  UFRAME_NUM=12 ;
  81:  UTOOL_NUM=1 ;
  82:   ;
  83:J PR[30:V_HEATER_1 ] 50% FINE    ;
  84:   ;
  85:  CALL H1_START    ;
  86:   ;
  87:J PR[4:V_H1H2] 50% CNT100    ;
  88:   ;
  89:J PR[38:V_WELDING_1 ] 50% CNT100    ;
  90:J PR[1:HOME] 50% FINE    ;
  91:   ;
  92:  END ;
/POS
/END
