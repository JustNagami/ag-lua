LJ9   '  L .UI/VersionUI/HellaUI/Slayer/HellaSlayerUI7   6  999L transformuiMainuimanager8     9  B  9 BK  AddUIListenerInitUI�     9  B6 96   9 B9 6 B= K  HellaSlayerItemm_listIndexItemhandlerNewLuaList	listBindCfgUI�  
 6   9  -  9B 6 9  B  X�6 9' 5 =	BK   �activityId  /talentTreeOpenPageByJumpJumpToolsGetActivityIdByThemeTalentTreeToolsslayer_activity_idGetActivityThemeActivityToolsn   	6   9  ' 5 -  9=B K   �  slayer_activity_idhellaSlayerRewardOpenPageByJumpJumpToolsu   -     9   B    X�-     9  )  B 6  9  B K   �	BackJumpToolsSetSelectIndexIsOpenSectionInfou  -   9 B  X�-   9)  B6 9BK   �	BackJumpToolsSetSelectIndexIsOpenSectionInfo�     9  9 +  3 B  9  9 +  3 B  9  9 +  3 B9  96	 9
996 93 B A2  �K   EventTriggerAction1LuaHelperPointerDownEventTriggerTypeEventSystemsUnityEngineAddListenerType1m_scrollEvent m_bgBtn m_rewardBtn m_talentBtnAddBtnListeneru   -     9   B    X�-     9  )  B 6  9  B K   �	BackJumpToolsSetSelectIndexIsOpenSectionInfo� 
 6  9 94 6 >6 >6 >B6  9 9' B6  9 93	 B2  �K   RegistBackCallBack#ACTIVITY_HELLA_SLAYER_DESCRIPESetGameHelpKeyINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager*   -     9   B K   �OnTimerEvent�	 M9 9   X�)  =  6 9  8  X�9  X�4  = 6  99  B  X�)  = 9  9	9  9 )   X�9    X�)  B  9
 )  B  9 B6 9 99 96 9' 6 99  B A  9 B6 93 ) )��B= 9  9B2  �K  
Start New
Timer
timerRefrenTimeSLYAER_REWARDRedPointConst
%s_%sformatstringtransformm_rewardBtnbindUIandKeyredPointmanagerRefreshSelecteRedPointSetSelectIndexStartScroll	listGetSelectIndexSlayerDataselectIndexsub_activity_listregionListActivityCfgparams_slayer_activity_id�      9  B6 9 99 96 9' 6	 9
9 B A6 9 9B9   X�9  9B+  = K  	Stop
timerHideBarwindowBarslayer_activity_idSLYAER_REWARDRedPointConst
%s_%sformatstringtransformm_rewardBtnunbindUIandKeyredPointmanagerRemoveTweenz 	    9  B9  9B6  BX� 9BER�K  RefreshTimeipairsGetItemList	listRefrenTime�   6   99 B  X� 9B  X	�9 6 9 99	B=X�9 6
 ' B=K  TIME_OVERGetTipsstopTimeGetLostTimeStr	timemanager	textm_timeLabIsActivityingslayer_activity_idGetActivityDataActivityData�   9  8+ 9    X�+  9 9 	 
 B 99 B 96   9	 B AK  SetSelectIndexhandlerRegistCallBackselectIndexSetSelectedIndexslayer_activity_idSetDataregionLista  
-  9 96   )  )  B=K   �Vector3localPositiontransformm_scrollContent�	 4�9   X�2 ��  X1�9 86  9 B  X"�6  9 B6 9 9B  X�9 X�6	 6
 96 ' B6 9	 99
B A A X�6	 ' B2 a�6  99  B=  9  9B9  8  X'�999 9 99 999!9 + =  9 B6 9 9! 9! 9"99	 *
 B 9#6$ 9%3	& B A= X�9 + =6'  BH�
 9	(9  B	FR�9    X�9 9  8  X�9 9  86) 89*  9+ '	, 5
0 6- 9.9/=1
=2
=3
9 =
B2  �K  K  K  region_activity_idsectionsectionType  SLAYERSTAGE_TYPE_NEWBattleConstslayerSctionInfoGostage_idActivitySlayerCfgSetSelectedIndex
pairs FloatActionLuaHelpersetOnUpdatetransformm_scrollContent
valueLeanTweentween_RemoveTweenhorizontalm_scrollCom
width	rectm_scrollViewTransxlocalPositiontransform_GetItemList	listslayer_activity_idSetSelectIndexSlayerDataTIME_OVERGetLostTimeStrSLAYER_TIME_TO_STARTGetTipsformatstringShowTipsstartTimeGetServerTime	timemanagerGetActivityDataGetActivityIsOpenActivityDataregionListselectIndex ��̙����w   9    X�9   9+  B6 99 B+  =  K  m_scrollContentcancelLeanTweensetOnUpdatetween_4     9  ' D slayerSctionInfoIsOpenRouteD  
9   9B-  99  BK   �
superDispose	list� 	  6  9 96 9' 6 99 B A  X�6	 9 89
6  BX�6 9 BER�K  SetSlayerReadSlayerActionipairssub_activity_listActivityCfgslayer_activity_idSLYAER_REGIONSRedPointConst
%s_%sformatstringgetTipBooleanredPointmanager�  # &6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 2  �L   RefreshSelecteRedPoint Dispose IsOpenSectionInfo RemoveTween SetSelectIndex IndexItem RefrenTime OnTimerEvent OnExit OnEnter 
OnTop AddUIListener InitUI 	Init UIParent UINameReduxViewHellaSlayerView
class 