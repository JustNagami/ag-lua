LJ<   '  L 1Widget/System/Polyhedron/PolyhedronPrepareUI    ) L 7   6  999L transformuiMainuimanager8     9  B  9 BK  AddUIListenerInitUI!     9  BK  BindCfgUIL    6   9  ' B K  /polyhedronPolicyRewardOpenPageByJumpJumpTools�    6   9  ' 5 6 99=6  9	B=
B K  tempHeroListGetHeroIDListPolyhedronData	type isEnterPOLYHEDRONHERO_DATA_TYPEHeroConst/polyhedronHeroGoToSystemJumpToolsC    6   9  ' B K  polyhedronTaskOpenPageByJumpJumpToolsM    6   9  ' +  B K  /polyhedronArtifactAtlasGoToSystemJumpTools:    6   9  B K  QueryOpenRankViewPolyhedronActionr    
6   9  ' 5 6 99=B K  shopId  NEW_DUO_WEISHOP_IDShopConst
/shopGoToSystemJumpToolsM    6   9  ' B K  /polyhedronBeaconOperateOpenPageByJumpJumpToolsH    6   9  ' B K  /polyhedronTerminalOpenPageByJumpJumpTools     K       K  ?    6   9  B K  LaunchPolyhedronBattlePolyhedronAction     K  �   !6  9 B  X�6  9B 9B6 99 X�6 9	'
 +  BX	�6 9	' +  BX�6 9 BK  ShowTips%/polyhedronBlank/polyhedronLobby$/polyhedronBlank/polyhedronOverGoToSystemJumpToolsSETTLEMENTSTATE_TYPEPolyhedronConstGetStateGetPolyhedronInfoPolyhedronDataresultisSuccessC   6   9  3 B K   QueryPolyhedronGiveUpPolyhedronAction�  (t6     9  B   9 B6 99:6   9B X�6 5
 6 '	 B=6 ' B=3 =B2  �K  6 99:6   9B X�6 5 6 '		 B=6 '	 B=3 =B2  �K  6 99 X�6   94  B6   9)  B6 9' 4  BX%�6 99 X�6 ' 4  BX�6 5 6 '		 B=6 '	 B=5 6	 '
  B	>	6	 '
! B	 ?	  ="3# =3$ =%3& ='BK  CancelCallback MaskCallback  BtnText%POLYHEDRON_LOBBY_BUTTON_CONTINUE POLYHEDRON_LOBBY_SETTLEMENT  POLYHEDRON_LOBBY_START_TIP  $/polyhedronBlank/polyhedronOverOpenPageUntilLoadedSETTLEMENT/polyhedronDifficultyOpenPageByJumpJumpToolsSetCacheSelectHeroSetCacheBeaconListNOTSTARTEDSTATE_TYPEPolyhedronConst  ButtonTypeSingleBtnOkCallback content&POLYHEDRON_EXCEED_CHALLENGE_TIMES
title ButtonTypeSingleBtnPROMPTGetTipsShowMessageBoxGetAlreadyChallengeTimes
value#polyhedron_max_challenge_timesGameSettingGetStateGetPolyhedronInfoPolyhedronData�����  7  9  9 +  3 B  9  9 +  3 B  9  9 +  3 B  9  9 +  3 B  9  9	 +  3
 B  9  9 +  3 B  9  9 +  3 B  9  9 +  3 B  9  9 +  3 BK   m_challengeBtn m_terminalBtn m_beaconBtn m_shopBtn m_rankBtn m_altasBtn m_taskBtn m_heroBtn m_policyBtnAddBtnListeneri   6   9  ' 5 -  =B K  �
pages isPrefabhideBggameHelpProOpenPageByJumpJumpTools�  %6  9  X�6  99  X�4  6 9 94 6 >6 >6 >B6 9 9	3
 B6  96 99B2  �K  filter_idHero_Filter_ListFilter_Root_DefineClearFilterCommonFilterData RegistInfoCallBackINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager
valuepolyhedron_describeGameSetting)   -     9   B K   �RefreshTime�  ?9  ' =9 ' =6  9B 9B6 99	 X�9
 6 ' B=X�9
 6 ' B=9  6 9B=  9 B  9 B6 93 ) )��B= 9  9B6 9B6  96 99B2  �K  filter_idHero_Filter_ListFilter_Root_DefineClearFilterCommonFilterDataUpdatePolyhedronNewRedPolyhedronAction
Start New
Timer
timerRefreshTimeBindRedPointPolyhedronPolicyExpToLevelPolyhedronTools%POLYHEDRON_LOBBY_BUTTON_CONTINUE"POLYHEDRON_LOBBY_BUTTON_STARTGetTipsm_btnLabNOTSTARTEDSTATE_TYPEPolyhedronConstGetStateGetPolyhedronInfoPolyhedronDatam_timeLab	textm_policyLvLab�   6  9 9B  9 B9   X�9  9B+  = K  	Stop
timerUnbindRedPointHideBarwindowBarmanager�   "6   9B6  9 B  X�6 9 9B9 X	�9 6 9 9
9B=	K  9 6 ' B=	K  TIME_OVERGetTipsGetLostTimeStr	textm_timeLabstopTimeGetServerTime	timemanagerGetActivityDataActivityDataGetActivityIDPolyhedronData/  -  9 9  BK   �Dispose
super�   16  9 99 96 9B6  9 99 96 9B6  9 99	 9
96 9B6  9 99 9
96 9B6  9 99 9
96 9BK  POLYHEDRON_HERO_UNLOCKm_heroBtnPOLYHEDRON_TERMINAL_GIFTm_terminalBtnPOLYHEDRON_BEACON_UNLOCKgameObjectm_beaconBtn#POLYHEDRON_POLICY_LEVEL_REWARDm_policyBtnPOLYHEDRON_RESIDENT_TASKRedPointConsttransformm_taskBtnbindUIandKeyredPointmanager�   16  9 99 96 9B6  9 99 96 9B6  9 99	 9
96 9B6  9 99 9
96 9B6  9 99 9
96 9BK  POLYHEDRON_HERO_UNLOCKm_heroBtnPOLYHEDRON_TERMINAL_GIFTm_terminalBtnPOLYHEDRON_BEACON_UNLOCKgameObjectm_beaconBtn#POLYHEDRON_POLICY_LEVEL_REWARDm_policyBtnPOLYHEDRON_RESIDENT_TASKRedPointConsttransformm_taskBtnunbindUIandKeyredPointmanager�    6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   UnbindRedPoint BindRedPoint Dispose RefreshTime OnExit OnEnter 
OnTop AddUIListener InitUI 	Init UIParent UIBackCount UINameReduxViewPolyhedronLobbyView
class 