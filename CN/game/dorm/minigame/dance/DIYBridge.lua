LJ|   6   9  B6 89'  &L CharDorm/dance/
modelBackHomeHeroSkinCfgGetCurSkinIDDormHeroTools{      X�+  L '    &6 6 9 9 B' D transformPickDatastorage	Dormnullabledance.pos.  -  9  D �heroID2  -  6    ' B C  �spawnAtnullable� 
  ' X�9  =  6 9 9B6 9  8  X�6 9 9B X�)  =6 9 999	9	
B6 9 9' 9  BK  IDOL_DANCE_CHANGE_MUSICInvokenotifyawb_namecue_namecue_sheetPlayBGMstartTimeGetBgmPlayerIdolStageMusicCfgStopBGM
audiomanager
music� / i6   96 99B4  = 6 9 9'	 B6 9
 9' B6 9 9B6 99-  - B6 9 B= 6  ' B  X�6 9:6  ' B  X�6 9:=   9  B6  9B  9 	 B9  X�6  9'	  5
! 4  ="
B6  9'	# 5
% 5$ ="
B6& 9''( 5	) 9
 =
	9
=
*	BX�6  9+'	, 5
- =.
BK  ��heroID  /idolDanceDIYGo	load loadSceneFromSaveData/idolDanceEditOpenPageByJumpJumpTools   	back	back/dormVisitViewparams  /dormChooseRoomViewUpdateUrlHistorygameContextloadInfoSetCharacterGetCurAttackHeroInfoIdolTraineeDataSetSceneIdolStageMusicCfg
musicallIdolStageSceneCfg
scenenullableentityManagerNewCreateModelEntityManagerStopAll
audio
danceSetMainCamerauidanceGameSetWhereTagwindowBarmanagerpreviewTasks
TRAINROOM_TYPEBackHomeCricketConstGotoBackHomeCricketStageBackHomeDataManagery     9  B  9 +  B6 9BK  RemoveAddedCueSheetsDanceGameControllerSetSceneStopAllPreviewTasks� 	 09    X�6 99  B+  9 =  6 8  X�6 9' 9&B=  6	 9
B6 9B6	 9B9   X�-  99 ) B6 9 9'   BK  � IDOL_DANCE_DIY_CHANGE_SCENEInvokenotifymanagerUpdateCharaEntityPoscharaEIDMapSceneItemTagInfoRecordInfoFromDormTagDormLuaBridgeClearSceneItemInfoDormUtilsdiy_scene_prefab IdolTrainee/DanceEditStage/LoadSceneObjDanceGameControllerIdolStageSceneCfg
sceneDestroyImmediateGameObjectsceneLoadedw   9  9) 5 =5 =B=  K  
cfgID  heroID complexspawnAtUpdateentityManagercharaEID\  -   B  X�6  99   BK  �PutEntityAtDormEntityManager	Dorma     9  B9  X�)   +  9  X�9   J endTimestartTimeNow;   -     9   B -   X �+  X�+  L  ��Now�  8-  9   X�-   9 B- 9- B-  96 9- -  B  X!�-   X�9. - -  . X�6 9 - B - 9  B=6	 9
-  B- 9- - + BK  �  ���� SendInteractToEntityCMDSetEntityInteractContextDormUtilsMakeInteractTaskcurActionTask!GetSeqAlignedToRoundDurationdurationMakeCtxForActionDanceGameactionStopAllCmdonStart�   %-   )    X �-  9      X�-    9  B - !  -  #  -  9   - - B-  
   X 	�-    9  B -   X �+  X�+  L  �����NowonUpdates   6   9  -  ) B -  9     X�-    9  B K   ��onAbortSetEntityAnimeSpeedDanceGameControllerv   6   9  -  ) B -  9     X�-    9  B K   ��onCompleteSetEntityAnimeSpeedDanceGameController�
 '6  9-    B+    X�! 9B 93	 B 93	 B 93	 B 9+	 B 9	3	
 B 93	 B2  �L ��� SetOnComplete SetOnAbort
Start  	Then WaitUntilNewTaskframeTaskRunnerDormCharacterActionManager9   6  99  BK  previewTasksinsert
table� 	  +  =  9 6 99 B6 9 BH� 9BFR�4  = K  
AbortpreviewTasks
pairsStopAllCmdDormEntityManager	DormcharaEIDpreviewPriority}    9  B) = 9   9 -    B AK  	�AddPreviewTaskcharaEIDpreviewPriorityStopAllPreviewTasksK   6   9    9  B -      X�-   B K  �StopBGM
audiomanagerK   6   9    9  B -      X�-   B K  �StopBGM
audiomanager�8  X�)    9  9  B  9 B) = 9 6  BH	�  9 -   
 B AF	R	�6 9 9	B 9
6	 9
 B	 A 93	 B 93	 B 9+	 B  9 	 B2  �K  	�
Start SetOnAbort SetOnCompletepreviewTasksunpackWaitTaskNewTasktaskRunnerDormCharacterActionManagerAddPreviewTask
pairscharaEIDpreviewPriorityStopAllPreviewTasks
musicRestartBGM�E   -     9   - - B K   ��� PreviewSequenceActionLoopedB	  	  9   )  3  B2  �K   PreviewSequenceAction�   6  9 BH� 9B  X� 9B  X� 9B  X�9 L FR�)  L previewPriorityIsCancelledIsFinishedIsAbortedpreviewTasks
pairs     K  � !6  93 B6 9B6  ' ' B-   X
�6 9	'
 5 -  9== BX�= 6 9' -   BK  �WT_DIYLaunchloadInfo	load loadSceneFromSaveData
music/idolDanceEditOpenPageByJumpJumpToolsminigameClassbackTonullableLaterBackDormMinigame "GetMySharedDanceDIYStatisticsIdolTraineeAction�  % )6   ' B 4  6 6 93 3 3 3 3
 =	3 =3 =3 =3 =3 =3 3	 3
 =
3
 =
3
 =
3
 =
3
  =
3
" =
!3
$ =
#2  �L  EnterDIY GetCurPreviewPriority  PreviewSequenceActionLooped PreviewSequenceAction PreviewSingleAction StopAllPreviewTasks AddPreviewTask   UpdateCharaEntityPos SetCharacter SetScene 	Exit 
Enter RestartBGM    DormEntityManager	Dorm#DormCharacterInteractBehaviourgame.GameContextrequire 