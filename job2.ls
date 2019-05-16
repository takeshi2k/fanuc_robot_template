/PROG  JOB2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1634;
CREATE		= DATE 19-03-21  TIME 15:07:00;
MODIFIED	= DATE 19-04-17  TIME 15:15:46;
FILE_NAME	= JOB1;
VERSION		= 0;
LINE_COUNT	= 99;
MEMORY_SIZE	= 2174;
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
   1:  !PALETA NA GRIJAC 2 ;
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
  21:  !Picking from Pallet 2 ;
  22:  LBL[20] ;
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
  35:J PR[5:V_MID_H1H2] 50% CNT100    ;
  36:   ;
  37:J PR[34:V_HEATER2] 50% CNT100    ;
  38:   ;
  39:  WAIT DI[14:PermissSpace7]=ON    ;
  40:   ;
  41:  UFRAME_NUM=7 ;
  42:  UTOOL_NUM=1 ;
  43:   ;
  44:  R[1:CHECK SIGN GI]=(GI[32:H2 POS OFFSET]-(GI[32:H2 POS OFFSET] DIV 32786)*65536) ;
  45:   ;
  46:  R[5:HEATER2 Y OFFS]=(135-R[43:Heater Pos]+R[1:CHECK SIGN GI]) ;
  47:   ;
  48:  R[5:HEATER2 Y OFFS]=R[5:HEATER2 Y OFFS]*(-1)    ;
  49:   ;
  50:  R[6:HEATER2 Z OFFS]=R[40:Handling height]+20    ;
  51:   ;
  52:  CALL PR(96,0,R[5:HEATER2 Y OFFS],R[6:HEATER2 Z OFFS]) ;
  53:   ;
  54:J PR[35:HEATER_2_REF] 50% CNT20 Offset,PR[96:OFFSET H2]    ;
  55:   ;
  56:  R[6:HEATER2 Z OFFS]=R[40:Handling height]+3    ;
  57:   ;
  58:  CALL PR(96,0,R[5:HEATER2 Y OFFS],R[6:HEATER2 Z OFFS]) ;
  59:   ;
  60:L PR[35:HEATER_2_REF] 100mm/sec FINE Offset,PR[96:OFFSET H2]    ;
  61:   ;
  62:  CALL GRP_OPN    ;
  63:   ;
  64:  DO[52:PICK AND PLACE PLS]=PULSE,1.0sec ;
  65:   ;
  66:  R[114:HEAT2 Y OFFS]=R[5:HEATER2 Y OFFS]    ;
  67:   ;
  68:  R[112:HEAT2 HANDLING]=R[40:Handling height]    ;
  69:   ;
  70:  R[113:HEAT2 HEIGHT]=R[41:WP Height]    ;
  71:   ;
  72:  R[40:Handling height]=0    ;
  73:  R[41:WP Height]=0    ;
  74:   ;
  75:  R[6:HEATER2 Z OFFS]=R[113:HEAT2 HEIGHT]+20    ;
  76:   ;
  77:  CALL PR(96,0,R[5:HEATER2 Y OFFS],R[6:HEATER2 Z OFFS]) ;
  78:   ;
  79:L PR[35:HEATER_2_REF] 100mm/sec FINE Offset,PR[96:OFFSET H2]    ;
  80:   ;
  81:   ;
  82:  !JOB DONE: GO HOME ;
  83:   ;
  84:  UFRAME_NUM=12 ;
  85:  UTOOL_NUM=1 ;
  86:   ;
  87:J PR[34:V_HEATER2] 50% CNT100    ;
  88:   ;
  89:  CALL H2_START    ;
  90:   ;
  91:J PR[5:V_MID_H1H2] 50% CNT100    ;
  92:   ;
  93:J PR[4:V_H1H2] 50% CNT100    ;
  94:   ;
  95:J PR[38:V_WELDING_1 ] 50% CNT100    ;
  96:   ;
  97:J PR[1:HOME] 50% FINE    ;
  98:   ;
  99:  END ;
/POS
/END
