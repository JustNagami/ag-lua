LJ�  # N6  9B 9B6  9B  X	�6 99 9B X�K  6	 B6 99 9B X�6
 4  =6 9   B 9B 9B6 996 99 X�6 996 9+ B6
  9'	 5
 =
=
= 
=
=
=
B6 9 '! '	" BK  combat_pauseBattleCallLuaRecordOperationRecorderstageDatanewbiestarMissionDataresultsectionsetType  /settingGoSwitchCursorLuaForCursorBATTLE_MAINSTAGE_TYPE_PLOTBATTLE_OTHERSETTING_TYPESettingConstGetStageIdCaculateStarMissionBattleInstanceoldRoutes_gameContextCheckManagersGetTypePOLYHEDRONSTAGE_TYPE_NEWBattleConstIsInBattleBattleFieldDataGetBattleStageDataGetInstanceBattleController�   6  9B 9B6 9 + BK  QuitBattleBattleInstanceGetBattleStageDataGetInstanceBattleController�   6     9  B 6    9  B 6 93   BK   LeaveCooperationBattleCooperationActionGetServerBattleIDBattleFieldDataDestroyCurRoutesgameContext`    6   ' B K  G与战斗服连接出现错误，玩家白打，返回登录界面
print�*6     B-    X�6 9B6 B6 5 6 ' B=3	 =
B2  �K  -   X�6 B3 7 6 6 9 =6 9  6 9BK  ��OnBattleServerConnectErrorConnectionHelperBATTLE_SERVER_ERROR_TIME_GBattleCallLuaCallBack OkCallback content,COOPERATION_NOT_JOIN_AFTER_OTHERS_READYGetTips ButtonTypeSingleBtn
isTopShowMessageBoxCheckManagersEndWaitReadyAckLuaExchangeHelper BattleServerConnectErrorLog�	    `6     9  B    X�)   -    X�)  .  6 9' - '   ' -  &B6   9B6 9	'
 6 - B6   B6 9  X�' 6 6	 B6	 -
  B	6
  B
6  B6 996 6 9 9B A 6 996 996 996 996 996 6 9B A 6 6 9B A  A6  B6 9 BK  � �SendMessageGameToSDK
printGetResourceVersionGetClientVersionLuaForUtil#carrier#os_version#manufacturer#device_model#zone_offsetGetServerTime	timemanager#osAnalyticsPresetPropertiesUSER_IDTMP_MAC_ADDRESS_Gtostring�{"messageType" : "SubmitEvent", "eventId" : "battle_server_connect_error", "errorCode" : "%s", "battle_id_str" : "%s", "#device_id" : "%s", "#account_id" : "%s", "localConn" : "%s", "battle_server_ip" : "%s", "battle_server_port" : "%s", "#os" : "%s", "#server_time" : "%s", "#zone_offset" : "%s", "#device_model" : "%s", "#manufacturer" : "%s", "#os_version" : "%s", "#carrier" : "%s", "client_vs" : "%s", "resource_vs" : "%s"}formatstringGetBattleServerIPAndPort  localConn :   serverBattleID : -BattleServerConnectError by errorCode : LogError
DebugGetServerBattleIDBattleFieldData"  6  3 B2  �K   
pcall�  	 6     9  B 6  9  -  B 6  9    9  B 6  9  B K  �UnloadUnusedAssetsResourcesCollectgcmanagerActionInvokeLuaExchangeHelperDestroyCurRoutesgameContext�  6  B6 4  =6 9 9B6 9B6 9 9	  3
  B2  �K   StartBattleStory
storyUnloadUnusedAssetsResourcesCollectgcmanageroldRoutes_gameContextCheckManagers4    6     9  D  GetCanUsePlaneTowerGameData�  6   9  B6  9B6 9-  9 9 - BK  ��resultbattle_resultGotoTeamBattleCooperationCallLuaDestroyCurRoutesgameContextFishCooperationBattleBattleFieldData�  6   9  B6  9B6 -  9 9 - BK  ��resultbattle_resultGotoTeamDestroyCurRoutesgameContextFinishBattleBattleFieldData�   6   -  B H�6 9 BFR�+  7  6     X�6     X �6  B +   7  K  �BattleCallLuaCallBackWaitBattleCallLuaCallBackBattleCallLuaWaitLoadingPreLoadAtlasLuaForUtil
pairs�<�.  6  9B6 4  =6 ' B6 9B 9B6	 9
9 9B X�6 9B6  9' B6 + =6 ' B6 ' 6 96 99 X�+ X�+ B6 ' 6 96 99 X�+ X�+ B6  9B 9B9 6  9!'" 5# =$=%=&6	' 9	(	B	=	)B6  9* 9+4 6	, 9	-	9	.	>	6	, 9	-	9	/	>	B60 B 91B  X�6  92 93*	  5
4 =%
* 35 BX
�6  92 93*	 5
6 =%
* 37 B+ 78 59 6: 	 )
  3; + B2  �K  � PreLoadAsset Atlas/BattleSettlementAtlas/NewBattleSettlementBattleCallLuaWaitLoading      SendWithLoadingNewnetGetIsCooperationGetOldPlayerExpBATTLEMISSIONAchievementTypeAchievementConstFliteAchievementTypeachievementTipsbattle_versionGetBattleVersionLuaForUtiluse_millisecondsbattle_idcombat_id  load_time_before_battleSendMessageToSDKSDKToolsloadMillisecondsGetStageIdGetServerBattleIDBattleFieldData!ReachableViaLocalAreaNetwork,网络连接状态是否为局域网：NotReachableNetworkReachabilityUnityEngineinternetReachabilityApplication&网络连接状态是否可用：5开启心跳包打印，用于监测网络状态PrintAllOpen__GbattleResultSetSystemLayerhideBattlePanelBattleInstanceGetTypePOLYHEDRONSTAGE_TYPE_NEWBattleConstGetBattleStageDataGetInstanceBattleControllerA客户端战斗结束，准备向服务端请求战斗结果
printoldRoutes_gameContextuiInitmanager��������� ?6  ' B6  ' 9B96 99 X1�96 99 X+�6 9	B 9
B6  '  9B&B6  B6 9 B  X�-    X�6 B6 9 9	5
 9=
9=
=
=
=
 B6 BK  �"GetBattleResultNeedAddHeroExperrorCodeheroDataCollectoldPlayerEXPInfochallengedNumber  clear_timesstar_listgoToResult$CheckBattleResultNeedAddHeroExpisSuccessCollectHeroExpChangeGetType,BattleCallLua.进入目标结算stage: GetBattleStageDataGetInstanceBattleController	QUITUNFINISHEDBATTLE_RESULTBattleConstresultr收到服务器的消息，获取到新的战斗结果(0:战斗进行中,1:胜利,2:失败,3：主动退出): 服务端战斗数据返回
print�  ,6  + =6 ' B6 + B6  9  X�6  9 9B6  +  =6 + =-   9	    	 -
 B6
   X�6   X�6 B+  7 K   ��BattleCallLuaCallBackBattleCallLuaWaitLoadingBattleCallLuaCallBackWaitGotoResultisReturnFromBattleViewAnimationManager	StopCannotConnectTimerSetForceShowQuanquan5关闭心跳包打印，用于监测网络状态
printPrintAllOpen__Gf    6   B +   7   6  9    9  + B K  	HideachievementTipsmanagerBattleCallLuaCallBack=    6   9  B K  ShowReturnToLoginTipConnectionHelper�  S6   ' B 6  9     X�6  9    9  B 6  +  = +  7  6     X'�6     X $�6  9 	   9 
 + B -     9  B -   9     X�-   9    9  B -   +  = -   6 93 ) ) B= -   9    9  B X �6  B 6  9  B    X �6  + B 6  6 93 )X) B= 6  9    9  B K   � 
TimerSetForceShowQuanquanGetIsDealWithErrorConnectionHelperCheckManagers
Start NewFrameTimershotTimerSnapShot	HideachievementTipsmanagerBattleCallLuaWaitLoadingBattleCallLuaCallBackBattleCallLuaCallBackWait	StopCannotConnectTimer_GS收到允许弹出结算界面通知（因为可能在播放胜利动作中）
print�    ]4   4  4  6  6  9B9BXL�94	  <	94	  <	6  9	BX�6 6 9'	 9B9
' 9B6 9984 9
>9>B6 9  4 9
>9>BER�6  9	BX�6 6 9'	 9B9
' 9B6 9984 9
>9>B6 9  4 9
>9>BER�ER�    J extraRewardinsert
tablenum	num:id+服务端发下第%s次物品数据id:formatstring
printrewardItemsbattleTimesdropListGetBattleResultDataBattleFieldDataipairs}   6  9 9  B6  9 94  BK  FliteAchievementTypeachievementTipsOnBattleFinish
guidemanager5    6     9  D  GetCurrentBossPhaseAbyssDataM    6   9    9  6 B K  BULLETIN_QUITBATTLEInvokenotifymanager�    6     9  B    X�5 9   X�)  =9   X�)  =9   X�)  =L X�5 L K   userLevel total_exp remain_exp total_expremain_exp  userLevelGetPlayerInfoPlayerData�
 !(�  9  B  9 B  9 B4  4  :	  X�6 9 )	 B6 9 )	 B6 9 )	  B6 9 )	  B) ) )	 M��4  <
8
  X�8
	  X�+  <
X��  9 
 B8
  X�8
  X�6 9 B  X�  X�8
 X�8
 X�8
6	  9
B9 X�6 9 BX�+ X�+   Xp�  Xn�6   B  Xi�996 9 ' B!6 9' B9!)   X�)    9 B  9 B"  9 B6  9 B  X�  X� 9B  X�)  6 9  B6 9 B6 9 9  B!5 9== 9 =!6 9  B6 96 9"6# 89#B* B6 96 9"6 # 8  9  #    B*  B5$ =%= =&='<
X�+  <
OX.   X�4  L �newPersentoldPersent
oldLv  GameLevelSetting
floornewExp
newLv  idCheckHeroExpGetHeroCurrentMaxLevelHeroToolsmin	mathIsActivityingGetActivityDataActivityDataGetActivityIDGetAddHeroExpGetMultipleGetMaxTotalExphero_level_exp1LevelToExpLvToolsexp
levelNeedAddExpWithoutBlackuserIDGetPlayerInfoPlayerData0isEmptyGetHeroDataByPosinsertremove
tableGetAssistHeroOwnerListGetSystemHeroTeamGetHeroTeam ���Ŏ	�����  	 -      X�6   -  B X�6 9999BER�1   K  �newExp
newLvidAddHeroExpSuccessHeroActionipairs    -   1   L  ��      X�+ L   9  B6 99 X�+ L 6 99 X�6 99 X�6 9  D + L NeedAddExpBattleInstanceSTAGE_TYPE_SUB_PLOTSTAGE_TYPE_PLOTCHALLENGE_ROGUE_TEAMSTAGE_TYPE_NEWBattleConstGetType%   -     9   D   �GetSnapShot9   -   
   X �-     9   B K    ReleaseSnapShot   6   3 B K   � 
pcall�  /;6   ' B 7  6   ' B   9 B+ +  3 7 *  * 6 )  =3	 7
 3 7 3 7 3 7 3 7 3 7 3 7 3 7 3 7 3 7 3 7 3 7  3! 7" 3# 7$ 3% 7& 3' 7( 3) 7* 3+ 7, 3- 7. 2  �K   ReleaseBattleResultSnapshot GetBattleResultSnapShot NeedAddExpWithoutBlack "GetBattleResultNeedAddHeroExp $CheckBattleResultNeedAddHeroExp CollectHeroExpChange GetOldPlayerExp OnQuitBattleSuccess GetAbyssBossPhase EndBattleLogic GetResultReward ShowSettlement goToResult GotoTeam SendQuitBattle GetMardukePlane ShowStory  BattleServerConnectErrorLog BattleServerConnectError BATTLE_SERVER_ERROR_TIME_GShowBattlePausePage 	InitAgame/bridge/BattleSettlementStrategy/BattleResultGotoHandlerBattleCooperationCallLua)game/bridge/BattleCooperationCallLuarequire���� 