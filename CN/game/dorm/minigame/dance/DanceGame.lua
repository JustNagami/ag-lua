LJ�   9 6 '  ' B6 9 96  BK  !BACKHOME_CRICKET_ROUND_STARTInvokenotifymanager
StartRound:
print
round�   9 6 '  ' B6 9 96  BK  BACKHOME_CRICKET_ROUND_ENDInvokenotifymanagerEndRound:
print
round?       X�+  L : )   ) M� 8 &O�L M    6   9  ' +  ' B K  idolTraineeCamp
WT_RKLaunchDormMinigamea   6  9 96 9BK  
round"BACKHOME_CRICKET_REFRESH_BUFFInvokenotifymanager(   
   X�	   X�+ X�+ L  � 	 (9  99 96 9B-   B-   B,   X�  X�6 X�  X�- 6 X�  X�- 6 X�- 6   X�)   X�+  L L 
���!ADVANCE_NORMAL_ACTION_CHANCEONE_USING_SKILL_CHANCEBOTH_USING_SKILL_CHANCErandom	mathenemyActionskillIDmyAction� 	  X�-  9     ' D X�-  9    ' B  $ 8L K  �GetSequenceGroupgame.dorm.interacts.danceGetSequence�  "4  6  6 9  B' B6  6 9 B' B ==-  9  	 
  B- 9	  
  B	 
 J	  ��MakeCtxGetSequencetargetCfgentityCfg
cfgIDGetEntityDataDormUtilsnullableR  6  99 -  BK  �entityIDSetEntityAnimeSpeedDanceGameController� 
 9  X�2 5�9  #5 = 4 4 3 >> =6 9 BH#�#	9
8
	
 
 X�4
  6  B X�6 9
  BX�6  B X�6	  BX�6 9
  BER�9<
	FR�2  �L L  ipairsinsert
tablefunction	type
pairssequence   duration�  5  X�6  '   B+  L -  9    	 B  X�-  9 	 B - 9 	 B=X�-  9 	 B=- 9  B6 9	  	 B- 9
  	 +
 B9L  ���SendInteractToEntityCMDSetEntityInteractContextDormUtilsStopAllCmdDebugActionMakeInteractTaskcurActionTask!GetSeqAlignedToRoundDurationMakeCtxForActionNo action, no wait
printf   -   9      X�-   9    9  B -   X �+  X�+  L   ��NowtaskRunnerbgmPlayback�   -      X�-    9   -  B -  - = -  - - B -  - - - - - 6 - B A== K  
� �� 	����unpackopponentTaskplayerTaskcurRoundActiveShootToCharaCamJ   -   9     9  B -   X �+  X�+  L   ��NowtaskRunner�    -      X�-    9   B -  - - - 6 - B A -  - - B 6  9  - 9) B 6  9  - 9) B K  
� ��	��� opponentplayerSetEntityAnimeSpeedDanceGameControllerunpackRestoreCam�74 G ?  -  9 -  99 8995	 =	  9
 B
=
	  9
	 B
=

	=	!
=
	4
  =
	-
  B
9  9B 93 B 93 B 93 B 93 B 9+ B2  �L  ����
Start   	Then WaitUntilNewTasktaskRunnerremovedBuffdurationroundMusicInfoopponentGetOpponentCharaEIDplayerGetPlayerCharaEID
round  finish
startactionRoundTurnSettlementStartActionTurn����   -     BK   R    6   9    9  ' B K  OnDanceGameStartCallUpdateFuncnotifymanagerJ    6   9    9  ' ' D  
startdance.flagsGetDatastorage	Dormx   -   - =  -  -  - B -  - - -  - - B== K   �� ���opponentTaskplayerTaskcurRound�   -   9      X	�-   9     9  B    X �+  L  -   9     X	�-   9    9  B    X �+  L  +  L  �opponentTaskIsFinishedplayerTask�   %-   - - - B -  - - B 6   ' B -  - 9 9B= -  9    9  - 9B -    9  B 6  9 	   9 
 ' B K  � ��� OnStartCountDownTimerCallUpdateFuncnotifymanagerStartMainCamDirectorSetPlaybacktaskRunner	PlaybgmPlayerbgmPlayback准备阶段结束
print� 7-  9 3 6 9 9B)  5 =  9 B=  9	 B=
4  =6 9 9'	 '
 + B 93	 B 93	 B 93	 B 93	 B 93	 B 9+	 B2  �L  �	���
Start    WaitUntil 	Then
startdance.flagsRecordDatastorage	DormremovedBuffopponentGetOpponentCharaEIDplayerGetPlayerCharaEID
round  NewTaskframeTaskRunnerDormCharacterActionManager StartPrepareTurn�    6   9    9  ' B 6   9    9  ' ' B K  ui_battle_stopbgmui_battlePlayEffect
audioOnDanceGameFinishCallUpdateFuncnotifymanager� 	 ?9    X�-  9 9B=  -  9 9B9   X�9  !-  X�+ = -   X�- B9 9 9 
  X�9  9B  X�-   - B= 9 
  X�9  9B  X�-   - B= + L ���  �opponentTaskIsFinishedplayerTaskopponentplayeralreadyShowResultNowtaskRunnerstartTime�&6  9 9B5   9 B=  9 B=4  ='	 *   9
	 B 93	 B 93	 +
  B 9+	 B2  �K  �
Start WaitUntil 	ThenWaitTaskcurtain_call_removedBuffopponentGetOpponentCharaEIDplayer  GetPlayerCharaEIDNewTaskframeTaskRunnerDormCharacterActionManager����e   6  9' 5 =BK  	data  %/backHomeCricketBattleResuleViewOpenPageByJumpJumpTools�  9    X�+ =  6  9B96 99 X�6 9'	 5
 =BX�6 99 3 BK   battleTypeSendBattleCompleteBackHomeCricketAction	data  %/backHomeCricketBattleResuleViewOpenPageByJumpJumpTools
VideoROOM_TYPEBackHomeCricketConstsettleTypeGetSingleBattleDataBackHomeCricketBattleDataisGotoResult*   -   +  =  K   �prepareRoundTask,   -     9   B K   �GotoResultView�
 6  9  B  9 B6 9 ) B6 9 ) B9   X�9  9B-     B= 9  93 B+  = )  )	 M�8
-   
  B O�-   	 3
	 B2  �K  ��� totalRound SetOnComplete
AbortprepareRoundTaskSetEntityAnimeSpeedDanceGameControllerGetOpponentCharaEIDGetPlayerCharaEID&     9  BK  GotoResultView4   6   ' -  )  B K   �普通动作
printI  6   ' -  *  ' B K   �InProgress普通动作
print����?   6   ' -  ) ' B K   �Finish普通动作
printv-  9 5 43 > 3 *  <3 >= 2  �D �sequence duration   MakeInteractTask����G     X
�   X�6   B X�+ X�+ L IsAllSpace<  6  8 9-   D �actionIdolTraineeSkillCfgD  6  8 9-   D �counter_actionIdolTraineeSkillCfg�  6  6 9  B' B+  6  BX
�
  X	� X	�-	  
 B	 	 X
� ER�6  6  ' D �actionIdolTraineeSkillCfgipairs
cfgIDGetEntityDataDormUtilsnullable�  <6  6 9  B' B,   X�-  9B  X�9  X�-  9B  X�9+    X�6 89X�  X�6 89+ -	 
 B	 	 X	�-	 9
8
	+ -	 9
	9


8	
	6
 9

'  	 B

 
  J
 
����%s_%s_formatstring	typeroundMusicInfoactionIDcounter_actionactionIdolTraineeSkillCfgskillID
cfgIDGetEntityDataDormUtilsnullable� (6  8 ,	 9
-  
 X
� 	 X
�9
- 
 X
� 	 9
	
  X�)
 6 99	5 = =9=	9	 X�+ X�+ =
9 
=BK  ��triggerRoundtrigger_timeshowDurationduration
skillid  	buffinsert
table
roundobjectIdolTraineeSkillEffectCfg ����� 
 46  9  B6  9 B9  X�96 9BX
�6 6 9'  B  X	�-   9      BE
R
�X�6 9	BX		�-  
 +        BE	R	�K  �passiveskill_effectskillIDIdolTraineeSkillCfgnullableeffectListipairsactionGetEntityDataDormUtils�   (4  6  6   ' B  X�6  BX�6 9	 :
BER�X�6  6   ' B   X�6  BX�6 9	 
 BER�L IdolPveNpcCfginsert
tableipairsidol_passive_skill_listBackHomeHeroCfgnullable� 
 ;9 96 9 B96 9 B9-   B-  	 B5	 9
=
	5
	 9=
-    	 B-    
 B-    B-   -    B A-   -    B A I ��	���  enemyActiveBuffListpassive  myActiveBuffListheroIDGetEntityDataDormUtilsopponentplayer� �6  ' 9B995 9=9=	5 9
=9=	-   	 
  B-   	 
  B-   	 B6 6 9	 B'	 B6 6	 9		
 B	'
 B,	 9	  X%�, -   99B 	 -   99B 
   XI�  XG�
	 - 9  	 ' B6 9 B   X7�99  X%�, -   99B 	 -   99B 
   X �  X�	
 - 9  
 ' B6 9 B   X�-   99B	 -   99B
 -   	  9B-   
  9B I �	����durationtotalRoundrandom	mathgame.dorm.interacts.danceGetSequenceGroup
cfgIDGetEntityDataDormUtilsnullableenemyScore  enemyAction
scoremyScoreaction  myActionopponentplayer
round回合开始：
print�  <6  9  B4  6 9BH"�9	9
99 X�9  X�9	  X�+ =	X�)  
 X�9	  X�+ =	 
=9)   X�6
 9  BFR� ) )��M�6
 99	8
B9<O�9< K  removedBuffremoveinsert
tableactivatedshowDuration
roundtriggerRounddurationid	buff
pairsGetEntityDataDormUtilsW  9 9-    B-    B-    BK  �	�opponentplayer-   '  9 &L 
modelCharDorm/dance/i   '  9 &6 9 9 ) B9L transformGetDatastorage	DormspawnAtdance.pos.�  6  99-  - B6  9 B= 6 9B= K  � �DanceGameTaskRunnertaskRunnercharaMgrNewCreateModelEntityManager� 
  (  9   B996 99 X�+ X�+   X�6 8  X�6 8  9  B6	  9
9 ) )	 B  9 999	BK  lastRoundroundListprepareInfoProcessDanceSeqtaskRunnerRegisterTaskRunnerDormCharacterActionManagerInitSceneIdolTraineePvpBattleCfgIdolTraineePveBattleCfgPVE_STAGEROOM_TYPEBackHomeCricketConstbattleTypestageIDInitGame� 	 9 99=   9 -   B  9 -  B+  = 6 9 9- 9BK  �� �actionCountNamespaceClearDatastorage	DormisGotoResultSetCharacterbattleTypeenemySkinIDmySkinID�    6  8  X�6 86  ' B6  ' B  X� 5 ==9  9	 
 5	 =
=4  =BK  	buffheroID
cfgID  UpdatecharaMgrspawnAt complexhero_id
modelnullableIdolPveNpcCfgBackHomeHeroSkinCfg2  9   9-  D �GetEntityIDcharaMgr2  9   9-  D �GetEntityIDcharaMgr�  
 9   9+ B9  9B+  = +  =   X�+  =   X�+  = +  = +  =	 K  cinemachineBrainshootCamdanceGameControlleractionRoundtotalRoundbgmPlayback
ResettaskRunner
ClearcharaMgr�  	 6  9' B 9' B6 9  B=== K  cueNamecueSheetAddCueDanceGameControllerCriAtomSourceGetComponentbgmPlayer	FindGameObject-   9  9   X�+ X�+ L 
start�K9    X�6 9896 9'  &B=    9 B6 9	89
   X-�96 9 B6 ' B9 B4  ) -  )	 M�' 
 &86  BH�6 9 5 =
: =: =BFR�O�6 9 3	 B=
   9 999BK  !�awb_namecue_namecue_sheetInitBgmPlayer 	sortfinish
start	type  insert
table
pairs
trackdecode
cjsonrequireLoadTextAssetExmusic_jsonactionRoundbgmIdolStageMusicCfgInitCamIdolTrainee/Stage/	LoadDanceGameControllercam_director_prefabscene_idIdolStageSceneCfgdanceGameController��  X9   9B9  9= 9 6 9=6 9	'
 B 9' B=   9 B  9 B9   9'  B9   9'  B9 + =-  5 - =B-  5 - =B4 - 5 9  	 9'
 B  X	� =	 9	'
 B=<- 5 9  	 9'
 B  X	� =	 9	'
 B=<= K   ���  posshootPoslookAt  GetDummyshootCamCfg  spawnAt  enabledplayer2player1SetDummyFollowEntityGetOpponentCharaEIDGetPlayerCharaEIDCinemachineVirtualCameraGetComponent
shoot	FindGameObjectshootCamcutDanceGameControllerm_DefaultBlend
braincinemachineBrainInitCinemachineBraindanceGameControlleru   9  8  X	�9 9=9 9=9 + =K  enabledlookAtLookAtposFollowshootCamshootCamCfg(   9  + =K  enabledshootCamI   9  9  X� 9BK  	PlaydirectordanceGameControllerw   9  9  X� 9B9= 9BK  EvaluateinitialTime	time	StopdirectordanceGameController�     9  + + B  9  B9  9B6  99 ) ) B  9 99	9
BK  lastRoundroundListprepareInfoProcessDanceSeqtaskRunnerRegisterTaskRunnerDormCharacterActionManager	StopbgmPlayerInitGame
Reset� # Q [6   ' B ) ) 6 6 93 3 3 3 3		 3

 3 3 = 3 = 3 = 3 3 3 3 3 = 3 = 3 = 3 = 3 3 3  )  ) 5! 5" 3# 3$ ) ) 3% 3& 3' 3) =( 3+ =* 3, 3. =- 3/ 3 0 3!2 =!1 3!4 =!3 '!6 =!5 3!8 =!7 3!: =!9 3!< =!; 3!> =!= 3!@ =!? 3!B =!A )! 3"D ="C 3"F ="E 3"H ="G 3"J ="I 3"L ="K 3"N ="M 3"P ="O 2  �L   Restart StopMainCamDirector StartMainCamDirector RestoreCam ActiveShootToCharaCam InitCam InitScene InitBgmPlayer 
Reset GetOpponentCharaEID GetPlayerCharaEID SetCharacter InitGamedance.action.cntactionCountNamespace 	Init 	Ctor   TurnSettlement  StartActionTurn StartPrepareTurn       b8b16  
type1
type2
type3
type4
type5    DebugAction SkipShow ProcessDanceSeq GotoResultView     !GetSeqAlignedToRoundDuration MakeCtxForAction GetSequence       DormEntityManager	Dorm#DormCharacterInteractBehaviourDanceGamesingletonClass 