LJ9   '  L .Widget/System/Challenge_Boss/BossSwitchUI7   6  999L transformuiMainuimanager�     9  B  9 B4  = 4 9 >9 >9 >= K  goItem3_goItem2_goItem1_bossGoList_bossItemList_AddListenersBindCfgUI�   F6  9 94 6 >6 >6 >B6  9 9' B6 9	B  9
 B6  9 99 6 9B6   9 B= 6  9 96 9 B6   9
 B= 6  9 96 9 B6 9 BX� 9BER�  9 9 BK  CheckRewardPreviewCheckMailOnEnterbossItemList_ipairsBOSS_CHALLENGE_UPDATEchallengeInitHandler_ BOSS_CHALLENGE_BACK_ENTRACERegistListenernotifyUpdateBossChallengehandlerchallengeUpdateHandler_BOSS_CHALLENGE_NORMALRedPointConsttransformStar_bindUIandKeyredPointRefreshUICheckTimeoutBossToolsBOSS_CHALLENGE_DESCSetGameHelpKeyINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager{   	6   9  6 99B -   B K  �	BOSS!MAIL_CHALLENGE_COMPENSATE_IDMailConstReadUnclaimedMessagePlayerAction�  6   96 99B
  X�6 5 6 ' B=	6 '
 B=3 =BX� B2  �K  OkCallback contentUNCLAIMED_BONUS_MAIL_TIP
titlePROMPTGetTips ButtonTypeSingleBtnShowMessageBox	BOSS!MAIL_CHALLENGE_COMPENSATE_IDMailConstGetUnclaimedPlayerData!     9  BK  RefreshUI�   *6  9 9B  9 B6  9 99 B6  9 96	 9
 B6  9 96 9 B+  =
 +  = 6 9 BX� 9BER�K  OnExitbossItemList_ipairschallengeInitHandler_BOSS_CHALLENGE_UPDATEchallengeUpdateHandler_ BOSS_CHALLENGE_BACK_ENTRACERemoveListenernotifytransformStar_unbindUIandKeyredPointRemoveUpdateTimerHideBarwindowBarmanagero  -  9 9  B6 9 BH� 9BFR�+  = K   �bossItemList_
pairsDispose
super�    6   9  ' 5 6 99=6 9	9
B K  	SHOPSYSTEM_IDViewConstshopId  DREAM_SHOPSHOP_IDShopConst
/shopGoToSystemJumpToolsE    6   9  ' B K  bossStarExchangeOpenPageByJumpJumpTools�  
 6  9 B  X�6  9' ' +  ' B6  9' ' +  ' B6  9' BX�6	 9 BK  ShowTipsGo/bossAdvanceSwitch	home/bossMode/bossSwitchOverrideUrlgameContextresultisSuccessD   6   9  3 B K   ResetHardModeBattleBossChallengeAction�  	 6   5 6 ' B=6 ' B=3 =B K  OkCallback contentBOSS_CHALLENGE_RESET_MODE
title  PROMPTGetTipsShowMessageBox�    9  9 +  3 B  9  9 +  3 B  9  9 +  3 BK   resetBtn_ buttonExchange_ buttonShop_AddBtnListener�     9  B  9 B  9 B  9 B  9 BK  RefreshResetBtnRefreshStarAddUpdateTimerRefreshBossBtnListRefreshText�   K6   9)B  X�K  6 96 9B  X�K  6  9B)  4  6 9	BX	�:6	
 
 6 :+ B A		 ER�6  B 6  B 6 9' 6 :99B6 ' B6 9  B6 9' 5	 =	=	=	B6 96 9BK  SaveFirstEnterUIValuerewardListtargetTexttitleText  bossChallengeRewardPreviewOpenPageByJumpJumpTools!BOSS_CHALLENGE_REWARD_TARGETGetTips	nameBossChallengeAdvanceCfg%s·%sformatstringsortRewardformatRewardCfgListgetRewardFromDropCfgmergeRewardListrewardipairsGetBossChallengeCfg"BattleBossChallengeNormalDataMODE_NORMALBossConstIsFirstEnterUIBossToolsIsFinishGuideData�   6   9B6 96  9B A )   X� )    X�+ X�+ 6 9  BK  resetGo_SetActiveGetReceiveStarList"BattleBossChallengeNormalDatalength
tableGetOpenModeListBattleBossChallengeDataJ   6  9BK  BossChallengeBackEntraceBattleBossChallengeAction� 	  6   9B6 ' B9 6 9'  9	:9	:B=9
 6 9B=K  	nameGetI18NTexttextName_
level(%s%s~%s)formatstring	texttextLv_
LEVELGetTipsGetBossChallengeCfg"BattleBossChallengeNormalData�   -6   9B99 8:6   9B) 9 ) M�6 9	 9
8

:

B  X�98:X�O�9 6 9	B=9
 6 9'  B=K  /%sformatstringtextTotalStar_CalcBossChallengeStarStageTools	texttextCurStar_
keyof
tableGetReceiveStarListrewardGetBossChallengeCfg"BattleBossChallengeNormalData�  
16   9B6  BX�9 8  X�9 8 9BX�9 6 99	 8		
 B<ER�9    )��M�9 8 9B9 8 9	B9 +  <O�K  DisposeOnExitbossGoList_New BattleBossChallengeBossItemRefreshUIbossItemList_ipairsGetBossList"BattleBossChallengeNormalData�   6     9  B -    X�-  9B- 96 9 9  B=K  � �GetLostTimeStrWith2Unit	timemanager	texttextTime_RemoveUpdateTimerGetNextRefreshTimeBattleBossChallengeData�    9  B6  9B9 6 9 9 B=6	 9
3 ) )��B= 9  9B2  �K  
Start New
TimerupdateTimer_GetLostTimeStrWith2Unit	timemanager	texttextTime_GetNextRefreshTimeBattleBossChallengeDataRemoveUpdateTimerA   
9    X�9   9B+  =  K  	StopupdateTimer_�  ' *6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 2  �L   RemoveUpdateTimer AddUpdateTimer RefreshBossBtnList RefreshStar RefreshText UpdateBossChallenge RefreshResetBtn CheckRewardPreview RefreshUI AddListeners Dispose OnExit 
OnTop CheckMail OnEnter 	Init UIParent UINameReduxViewBossSwitchView
class 