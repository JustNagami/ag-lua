LJY   '  L NWidget/Version/SummerUI_3_3/SummerUI_3_3_PreheatUI/SummerUI_3_3_PreheatUI7   6  999L transformuiMainuimanager8     9  B  9 BK  AddUIListenerInitUI� 	    9  B4  = ) ) ) M�6 9'  &8 B6 99  BO�9  9	'
 B= K  
stateGetControllerconEx_stateController_insert
tablestageItemGo_New+ActivitySummerSwimsuitPreheatStageItemstageItemList_BindCfgUI4  -   9 -   BK   ��OnClickStageb	  6  9 BX� 93 B2 �ER�2  �K   SetClickHandlerstageItemList_ipairs� 
  9 9=  6  99  B9= 9=   9	 B6
 9 BX� 9+	 BER�K  BindRedPointstageItemList_ipairsRefreshUIstopTimestopTime_startTimestartTime_GetActivityDataActivityDataactivityIDparams_activityID_�   6  9 94 6 >6 >B  9 B  9 BK  AddTimerRefreshUIHOME_BARBACK_BARSwitchBarwindowBarmanagerO   	6  9 9B  9 BK  StopTimerHideBarwindowBarmanagerV 	  6  9 BX� 9+ BER�K  BindRedPointstageItemList_ipairsl 	    9  B6 9 BX� 9+ BER�K  BindRedPointstageItemList_ipairsRefreshUI�   =6  99 B 6 9 BX�+   X	�86	 9		6
 9

'	 9  B
 A	 X	�8
 9	
  B	
 9	B	ER�9 + 6  BX	�6
 9

 	 B
 
 X�+ X�ER�9  9  X�' X�' BK  normalallClearSetSelectedStatestateController_IsStageClear&ActivitySummerSwimsuitPreheatDataRefreshUISetDataCActivitySummerSwimsuitPreheatCfg(%d) has no config of index %dformatstringLogError
DebugstageItemList_ipairsactivityID_GetCfgIdList'ActivitySummerSwimsuitPreheatTools�   (6  99 B X�K  6 86 9 B 6 9 B &6 9	'	
 6
 9

9 B6	 9		
  B	6	 9		'
 5 =B	K  
cfgId  'activitySummerSwimsuitPreheatStageGoToSystemJumpToolsBanRedPoint(ActivitySummerSwimsuitPreheatActionid+ACTIVITY_SUMMER_SWIMSUIT_PREHEAT_STAGERedPointConst%s_%d_%sformatstringGetRedPointKeyActivityToolsGetCfgMainActivityId'ActivitySummerSwimsuitPreheatTools%ActivitySummerSwimsuitPreheatCfgactivityID_GetDay&ActivitySummerSwimsuitPreheatDataz   6   9    9  B -  9  X �K  -     9  B K   �RefreshTimeTextstopTime_GetServerTime	timemanager�    9  B  9 B6 93 ) )��B= 9  9B2  �K  
Start New
Timertimer_RefreshTimeTextStopTimer;   
9    X�9   9B+  =  K  	Stoptimer_�   9    X�6  99 B  X�9  6 ' B=X	�9  6 9 9	9
 + B=K  stopTime_GetLostTimeStrWith2Unit	timemanagerTIME_OUTGetTips	textactivityID_GetActivityIsOpenActivityDatatimeText_    9  B6 9 BX� 9BER�-  99  BK   �
superDisposestageItemList_ipairsStopTimer�  # &6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 2  �L   Dispose RefreshTimeText StopTimer AddTimer OnClickStage RefreshUI (OnActivitySummerSwimsuitPreheatInit OnExit OnBehind 
OnTop OnEnter AddUIListener InitUI 	Init UIParent UINameReduxView*ActivitySummerSwimsuitPreheatMainView
class 