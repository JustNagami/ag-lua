LJp   '  L eUI/VersionUI/JapanRegionUI_2_6/JapanRegionKagutsuchiUI/JapanRegionFishingUI/JapanRegionFishingUI7   6  999L transformuiMainuimanager   K  �     9  B6 9  9 4 6 99>6 99>B=   9	 B9
 6 ' 6 99:B=K  
value-activity_kagutsuchi_fatigue_fish_recoverGameSetting*ACTIVITY_KAGUTSUCHI_FISH_FATIGUE_TIPSGetTipsF	text
tips_InitBtnListeners+CURRENCY_TYPE_ACTIVITY_KAGUTSUCHI_COINitem_id.CURRENCY_TYPE_ACTIVITY_KAGUTSUCHI_FATIGUECurrencyIdMapCfgwinBar_New KagutsuchiSpecialWinBarItemwinBarBindCfgUIF  
-  9 9  B9  9BK   �winBarDispose
super�    6   B 6  9  B 6  9  6 9  BK  +JumpBackToActivityMainViewByActivityIDActivityToolsactivityIDKagutsuchiFishingEventDataGoToMainLuaExchangeHelperDestroyLua-   -     9   B K   �UpdateEventTime�  ,6  9 9B  9 B9  9' B9  93 B  9	 B  9
 B9 
  X�9  9B6 93 ) )��B= 9  9B2  �K  
Start New
Timer	Stop
timerUpdateFishingGameCountUpdateEventTime RegistBackCallBack&ACTIVITY_KAGUTSUCHI_FISH_DESCRIBESetGameHelpKeywinBarRegisterEventsHideBarwindowBarmanager�  
 6  99:9 6 9' 6  9	B B=K  GetRestGameCountKagutsuchiFishingEventData
%d/%dformatstring	textgameCountText_
value'activity_kagutsuchi_fish_times_maxGameSetting]   9  
  X�9   9B+  =    9 BK  RemoveAllEventListener	Stop
timer    K  �    9  9 +  -  9B  9  9 +  -  9BK   �GoToColloctionPagecollectionBtn_StartGamegameStartBtn_AddBtnListener�  
 
 +   6  9
  X�6  B  X�6 9 X�4   6  BH�6 9  	 BFR�6 9	  B8 L random	mathinsert
table
pairsallHanafudaCardCfg	nextfishRemainKagutsuchiFishingEventData�  	 -   B 6  9 96 B6 9' 5 = BK  �fishID  /kagutsuchiFishingGameOpenPageByJumpJumpTools(KAGUTSUCHI_FISHING_EVENT_GAME_STARTInvokenotifymanagerI    	6      X�6     9  D  )   L  GetStaminaKagutsuchiWorkData�   -6   9  6 99:6  9 X�-  B6 99: 6 99: X�6 9	'
 5 - =BX�6 9  + B  X�- BX�6 ' BK  ��+ACTIVITY_KAGUTSUCHI_FISH_NO_GAME_COUNTShowTipsGetActivityIsOpenWithTipActivityToolsOkCallback  )kagutsuchiFishingStaminaWillOverflowOpenPageByJumpJumpTools+activity_kagutsuchi_battle_fatigue_max-activity_kagutsuchi_fatigue_fish_recoverdailyGameCount
value'activity_kagutsuchi_fish_times_maxGameSettingactivityIDKagutsuchiFishingEventData�   6  96  9 B96 9 9B X�9 6
 ' B=	K  9 6 9 9 B=	K  GetLostTimeStr2TIME_OVERGetTips	texttimeText_GetServerTime	timemanagerstopTimeGetActivityDataActivityDataactivityIDKagutsuchiFishingEventDataU    6   9  ' B K  %/kagutsuchiFishingGameCollectionOpenPageByJumpJumpTools�    #6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 3 3 3 = 3 = 3 = 2  �L   GoToColloctionPage UpdateEventTime StartGame    InitBtnListeners RegisterEvents OnExit UpdateFishingGameCount OnEnter Dispose 	Init OnCtor UIParent UINameReduxViewFishingGameEnterView
class 