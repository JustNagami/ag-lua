LJ@   '  L 5Widget/System/Challenge_Boss/BossAdvanceSwitchUI7   6  999L transformuiMainuimanager�     9  B  9 B4  = 6   9 B= 6   9 B= K  RefreshUIchallengeInitHandler_UpdateBossChallengehandlerchallengeUpdateHandler_bossItemList_AddListenersBindCfgUI�   C6  9 94 6 >6 >6 >B6  9 9' B6 9	B  9
 B6  9 99 6 9B6  9 96 9 B6  9 96 9 B6 9 BX� 9BER�6  9 9B  X�  9 9 BK  CheckRewardPreviewCheckMailIsPlaying
guideOnEnterbossItemList_ipairschallengeInitHandler_BOSS_CHALLENGE_UPDATEchallengeUpdateHandler_ BOSS_CHALLENGE_BACK_ENTRACERegistListenernotifyBOSS_CHALLENGE_ADVANCERedPointConsttransformStar_bindUIandKeyredPointRefreshUICheckTimeoutBossTools BOSS_CHALLENGE_ADVANCE_DESCSetGameHelpKeyINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager_     9  B6 9 BH� 9 BFR�K  bossItemList_
pairsRefreshResetBtn{   	6   9  6 99B -   B K  �	BOSS!MAIL_CHALLENGE_COMPENSATE_IDMailConstReadUnclaimedMessagePlayerAction�  6   96 99B
  X�6 5 6 ' B=	6 '
 B=3 =BX� B2  �K  OkCallback contentUNCLAIMED_BONUS_MAIL_TIP
titlePROMPTGetTips ButtonTypeSingleBtnShowMessageBox	BOSS!MAIL_CHALLENGE_COMPENSATE_IDMailConstGetUnclaimedPlayerData�   (6  9 9B  9 B6  9 99 6 9B6  9	 9
6 9 B6  9	 9
6 9 B6 9 BX� 9BER�K  OnExitbossItemList_ipairschallengeInitHandler_BOSS_CHALLENGE_UPDATEchallengeUpdateHandler_ BOSS_CHALLENGE_BACK_ENTRACERemoveListenernotifyBOSS_CHALLENGE_ADVANCERedPointConsttransformStar_unbindUIandKeyredPointRemoveUpdateTimerHideBarwindowBarmanager�  -  9 9  B+  = +  = 6 9 BH� 9BFR�+  = K   �bossItemList_
pairschallengeInitHandler_challengeUpdateHandler_Dispose
super�    6   9  ' 5 6 99=6 9	9
B K  	SHOPSYSTEM_IDViewConstshopId  DREAM_SHOPSHOP_IDShopConst
/shopGoToSystemJumpToolsF    6   9  ' B K  bossAdvanceRewardOpenPageByJumpJumpTools�  
 6  9 B  X�6  9' ' +  ' B6  9' ' +  ' B6  9' BX�6	 9 BK  ShowTipsGo/bossAdvanceSwitch	home/bossMode/bossSwitchOverrideUrlgameContextresultisSuccessD   6   9  3 B K   ResetHardModeBattleBossChallengeAction�  	 6   5 6 ' B=6 ' B=3 =B K  OkCallback contentBOSS_CHALLENGE_RESET_MODE
title  PROMPTGetTipsShowMessageBox�    9  9 +  3 B  9  9 +  3 B  9  9 +  3 BK   resetBtn_ buttonExchange_ buttonShop_AddBtnListener�   6   9B6 89 6 9B=  9 B  9 B  9	 B  9
 BK  RefreshResetBtnClacuteScrollWidthAddUpdateTimerRefreshBossBtnList
name2GetI18NText	textnameText_BossChallengeAdvanceCfgGetChooseModeID#BattleBossChallengeAdvanceData�   B6  96 9B  X�K  6 6  9B8)  4  6 9BX	�:6		 
 6
 :+ B A		 ER�6  B 6  B 6 9' 9B6 ' B6 9  B6 9' 5	 =	=	=	B6  96 9BK  SaveFirstEnterUIValuerewardListtargetTexttitleText  bossChallengeRewardPreviewOpenPageByJumpJumpTools#BOSS_CHALLENGE_REWARD_TARGET_2GetTips
name2%sformatstringsortRewardformatRewardCfgListgetRewardFromDropCfgmergeRewardListrewardipairsGetChooseModeID#BattleBossChallengeAdvanceDataBossChallengeAdvanceCfgMODE_HARDBossConstIsFirstEnterUIBossTools�   6   9B )   X�+ X�+ 6 9  BK  resetGo_SetActiveGetReceiveRewardList#BattleBossChallengeAdvanceDataJ   6  9BK  BossChallengeBackEntraceBattleBossChallengeAction�  16   9B6  BX�9 8  X�9 8 9BX�9 6 99	 9
  B<ER�9    )��M�9 8 9	B9 8 9
B9 +  <O�K  DisposeOnExititemParent_goItem_NewBossAdvanceSwitchItemRefreshUIbossItemList_ipairsGetBossList#BattleBossChallengeAdvanceData�   6     9  B -    X�-  9B- 96 9 9  B=K  � �GetLostTimeStrWith2Unit	timemanager	texttextTime_RemoveUpdateTimerGetNextRefreshTimeBattleBossChallengeData�    9  B6  9B9 6 9 9 B=6	 9
3 ) )��B= 9  9B2  �K  
Start New
TimerupdateTimer_GetLostTimeStrWith2Unit	timemanager	texttextTime_GetNextRefreshTimeBattleBossChallengeDataRemoveUpdateTimerA   
9    X�9   9B+  =  K  	StopupdateTimer_�  
6   9B6  899 6 :9 99	!9 99	  )�B=K  
width	rectviewportRect_Vector2sizeDeltaparentRect_positionBossChallengeAdvancePosCfgGetBossList#BattleBossChallengeAdvanceData�  % (6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 2  �L   ClacuteScrollWidth RemoveUpdateTimer AddUpdateTimer RefreshBossBtnList UpdateBossChallenge RefreshResetBtn CheckRewardPreview RefreshUI AddListeners Dispose OnExit CheckMail OnUpdate OnEnter 	Init UIParent UINameReduxViewBossAdvanceSwitchView
class 