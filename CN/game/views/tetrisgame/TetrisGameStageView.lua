LJ>   '  L 3Widget/BackHouseUI/TetrisGame/TetrisGamePlayUI7   6  999L transformuiMainuimanager     9  BK  InitUI� 	 (c  9  B  9 B9  9' B= 9  9' B= 9  9'	 B= 9  9' B=
 9  9' B= 9  9' B= 9  9' B= 9  9' B= 9  9' B= 9  9' B= 6 96   9 B9 6 B= 4  = 4  =  ) 9! 9") M�9  9!  9# B<O�) =$ 9& 9'=% K  localPositiontilespaceTrs_tilespacePosscoreItemIndexGetChildchildCounteffectposnodeTrs_effectPosListeffectListTetrisGameSkillIconItemuilistGo_indexSkillhandlerNewLuaListskillListGameObjectivegameDescControllergameOveroverController
combocomboController
scoreaddNumController
countcountControllermachineLizimachineLiziControllermachinemachineController
roundroundController
skillskillControllercanRotateGetControllercontrollerrotateControllerAddUIListenerBindCfgUI�  	 9 9 =  6  9B= 9 9=   9 B9   X�9 9 B+  =   9 BK  RefreshViewstageGoRegisterEventscallBackGetCurActivityIDTetrisGameDataactivityIDparams_stageIDE   6     9  -  B K  �RotateChipTetrisGameRunTimeManagerd
  ) ) ) M�  9  '  '	 &	8 +  3	 B2 �O�K   	Btn_btnAddBtnListener�   9   X�9  9+  B 9+  B 9+  B6 99 9B+  = K  idcancelLeanTweensetEasesetOnUpdatesetOnComplete
tween�  !4  6 9  X�9   X�9 9 B= 6 9 + B9 9=+ ==	9 =
6 99  B9  = L effectListinsert
tablescoreItemIndex
indexisHighScoreisCanUsetransformSetActiveeffectnodeTrs_ui_trail_blueGo_ui_trail_yellowGo_InstantiateObjectgameObject�  M)
  X�K  )2  X�+ X�+ +    X�6  9 B6  9 ) B X�6  9B4  6 9   X�4  BH	�9
 X�9
 X�6 9 
 B  X�X�F	R	� !)  )	 M	�6 9   9	  B AO�  9
 	 
 BK  PlayScoreTweenCreateEffectIteminsert
tableisHighScoreisCanUseeffectList
pairsmin
floor	mathd(� C)    X>�    "  "    ""   " " "  " -  9 "- 9 " - 9 " - 9 " -  9"- 9" - 9" - 9" 6  	 B- 9=- )	  	 X�6 -	 9		+
 B.  K  ������gameObjectSetActivelocalPositiontransformVector2yx�  -   	   X �-  9     9  ' )  )  B 6  - 9+ B -  + = K  � ��isCanUsegameObjectSetActive#UI_TetrisGameMachineUI_special	PlayscorenumAni_� 9   99 99B6  BXp�6	 9		)
  B	9
 8
	
9

9
	
6 9)��) B6 9)��) B6
   )  B 
6 99
B6 9 )� B 6 9   B9
)   X� 6 9) )2 B6 9996 9)2 )d BB6
   )  B 6
   )  B 6 9* * B + =6 9)  B 96 93 B A 96 93 B A 96 9B=2	 �2 �ER�2  �K  easeOutCubicLeanTweenTypesetEase VoidActionsetOnComplete FloatActionLuaHelpersetOnUpdate
valueLeanTween
tweenisCanUsex	LerpMaxyAbs
MathfVector3localPositioneffectPosListrandom	mathipairspositiontransformscoreTextInverseTransformPointeffectnodeTrs_���̙������̙������̙������̙�����   9    X�9   9+  B 9+  B 9+  B6 99  9B+  =  K  idcancelLeanTweensetEasesetOnUpdatesetOnCompleteshakeTween� 

06  9  B6 9-  9 8  X�)  -  98! B- "6 9-  9 8  X�)  -  98! B- "- 9- 96	   )	  B =K  �� �Vector3tilespacePoslocalPositiontilespaceTrs_yx	Lerp
Mathf
floor	mathJ   -   9   -  9= K   �tilespacePoslocalPositiontilespaceTrs_�
 7)
  X�2 2�5 5  =5 =, )d  X�) *  X�)2  X�) ) X�) * 9 6 9) 	 B 96	 9
3	 B A 96	 93	 B A 96 9B= 2  �K  K  easeOutCubicLeanTweenTypesetEase VoidActionsetOnComplete FloatActionLuaHelpersetOnUpdate
valueLeanTweenshakeTweeny  �������� ����  x     �������� ���� ������̙����T   6   -  9+ B 6   -  9+ B K   �addmarksGo_comboGo_SetActive� *6   9B6   9B9  9 99B  9 9B  9 B6 9	 + B9
 =9 6 =6 93 *  B= 9  9B2  �K  
Start New
TimerscoreTimerplaceScoretextcombo01Text_	texttextaddmarksText_addmarksGo_SetActiveDelScoreTimerPlayShakeTweencurRoundDisposeNumShowScoreTweenaddScoreGetSkillEffectBlackBoardGetCurRoundBoardTetrisGameRunTimeManager����~   6  9 + B6  9 + B9   X�9  9B+  = K  	StopscoreTimeraddmarksGo_comboGo_SetActive3   -     9   B K   �RefreshBlackBoardData�  6   9B9)   X�6 999!B6 9)   B -  96	 '
 B &=K   �REMAINING_TIMEGetTips	textroundTextmaxusedTime	ceil	mathtotalTimeGetBlackBoardTetrisGameRunTimeManager)   -     9   B K   �OnStartGame�    9  6 3 B  9  6 3 B  9  6 3 B2  �K   TETRIS_GAME_START_GAME TETRIS_GAME_TIMER_UPDATE TETRIS_GAME_ROUND_ENDRegistEventListener�   &6   9B+ 6 9896 9 896 99 X	�)   X�9	!)   X�+ 9

 X� X�+ L X�+ L K  resultFlagusedTimeendLessstageTypeTetrisGameConst	type	timestageIDActivityTetrisGameStageCfgGetBlackBoardTetrisGameRunTimeManagerh   	6   9  ' 5 -  9=B K   �  stageIDtetrisGameScorePopViewOpenPageByJumpJumpTools� '  9  B  9 B  9 B  X�9  9' B6 93	 *  B= 9  9
B6 9BX�6 9' 5 9 =B2  �K    stageIDtetrisGameScorePopViewOpenPageByJumpJumpToolsOverGameEndTetrisGameBridge
Start New
TimergameOverTimer	trueSetSelectedStateoverControllerCheckIsLoseDelOverTimerDisposeComboTimer��̙����B   
9    X�9   9B+  =  K  	StopgameOverTimer�   6  9 9B  9 B  9 B  9 B  9 BK  DelScoreTimerDelOverTimerStopTimerRemoveAllEventListenerHideBarwindowBarmanager"     9  BK  RefreshBar�   -6   9B  X�K  6   9B4  6  X�4  BH�6	 9		
  B	FR�6 9' 5 6	  9
B=9=9=9=9==BK  skill_listbattle_timesusedRounduse_secondsusedTime
scoretotalScorestage_idstageIDactivity_id resultGetCurActivityIDTetrisGameDataactivity_combat_overSendMessageToSDKSDKToolsinsert
table
pairsGetSkillBlackBoardGetBlackBoardTetrisGameRunTimeManagert   6     9  + + B 6     9  B -     9  B K    	BackExitGameEndGameTetrisGameRunTimeManagerB    6     9  + B K  PauseGameTetrisGameRunTimeManager�   -     9   B 6    9  + B 6    9  B 6  9  ' 5
 6 9-  9	8:=-  9	=	B K    chapterID  stageID%get_id_list_by_tetris_stage_list!ActivityTetrisGameChapterCfg/tetrisGameChooseStageViewOpenPageByJumpJumpToolsExitGameEndGameTetrisGameRunTimeManagerSendCancelSDKB    6     9  + B K  PauseGameTetrisGameRunTimeManager�  ?-   9      X�2 7�6  9  B    X�2 2�6  9B  X�9  X�2 )�6  9+ B6 -  989	6
 99 X�6 5 6 ' B=3 =3 =BX�6 5 6 ' B=3 =3 =BK  K  K  K   �    $ACTIVITY_TETRIS_GAME_NOEMAL_ENDCancelCallback OkCallback content  %ACTIVITY_TETRIS_GAME_SPECIAL_ENDGetTipsShowMessageBoxendLessstageTypeTetrisGameConst	typestageIDActivityTetrisGameStageCfgPauseGameisGameEndGetBlackBoardTetrisGameRunTimeManagerCheckIsHaveDraggingTetrisGameBridgestartTimer�  6  9 94 6 >B6  9 93 B2  �K   RegistBackCallBackBACK_BARSwitchBarwindowBarmanager�   "6   9  -  ! - !. - 96 9- B=- )   X�-  9B6  9B- 9	 9
' B.   K  �� �
falseSetSelectedStatecountControllerStartGameTetrisGameRunTimeManagerStopTimer	ceil	math	textstartTimerealtimeSinceStartup	Time� C  9  B  9 B  9 B9 )  =6  99 9)  X�+ X�+ B  9 B9  9	'
 )  )  B9  9' B9  9' B9  9' B) 9 =6 96 93 *  )��B= 9  9B2  �K  
Start NewFrameTimerstartTimerrealtimeSinceStartup	Time	textstartTime
falseoverController	truecountController	hideSetSelectedStatemachineLiziController"UI_TetrisGameMachineUI_normal	PlaymachinenodeAni_RefreshViewSetMachineInfoStateTetrisGameRunTimeManager
valuemachineSliderDelScoreTimerDisposeComboTimerStopTimer��̙����I     9  B  9 BK  RefreshBlackBoardDataUpdataViewState�  %6  9-  -   B- 9=- -  X	�-  X�- 9 9' B- -  X	�-  X�- 9 9' B. K  �� ���	show	hideSetSelectedStatemachineLiziController
valuemachineSlider	Lerp
MathfO   	-     9   B -   9  - = K   ��
valuemachineSliderRemoveTween� /  9  B*  9 9 * 6 99 )  )	 
 B 96 93		 B A 9
6 93	 B A 96 9B= 6  9)  X�+ X	�+ B2  �K  SetMachineInfoStateTetrisGameRunTimeManagerlinearLeanTweenTypesetEase VoidActionsetOnComplete FloatActionLuaHelpersetOnUpdatemachineGo_LeanTweenmachineTween
valuemachineSliderRemoveTween���������ׇ��  96   9B6   9B6 99 8:	  X�9 ' =X�9 '	  &= X�)  X�9
  9)  B  X�: 99 X�9
  9' )	  )
  BX�9
  9' )  )	  BK  "UI_TetrisGameMachineUI_normal	Play#UI_TetrisGameMachineUI_special	name	clipGetCurrentAnimatorClipInfomachinenodeAni_x	textmachineTextstageID%get_id_list_by_tetris_stage_list!ActivityTetrisGameChapterCfgGetCurScoreRateGetSkillEffectBlackBoardTetrisGameRunTimeManager�   9    X�9   9+  B 9+  B 9+  B6 99 B+  =  K  machineGo_cancelLeanTweensetEasesetOnUpdatesetOnCompletemachineTween� 	 ,�6   9B6   9B6   9B  X{�9 9=9  9'	 B9
)   X�9  9' B9  9' BX�9  9' B9
)   X�6 99
9!B6 9)   B 9 6 ' B &=X
�9 6 96 ' B99B=  X�9)   X�  9 B  9 B9  X.�9  X+�9  9!  X�9"9# X�6$ 9% 9&'' '( ') B9  9!)   X�9"	 X�6$ 9% 9&'' '* ') B  9+ 9#	 X�)  X�9"9##BK  RefreshMachineSlider+minigame_activity_3_6_block_ratio_down)minigame_activity_3_6_block_ratio_upminigame_activity_3_6PlayEffect
audiomanagerchargeNumMaxchargeNum
valuemachineSliderchargeFlagchargeTimerRefreshMachineTextUpdateScoreaddScoretotalRoundusedRoundACTIVITY_COMBINE_GAME_TURNformatstringREMAINING_TIMEGetTipsroundTextmaxusedTime	ceil	mathnormalinfinitegameDescControllerredtotalTime	blueSetSelectedStateroundControllertotalScore	textscoreTextGetSkillEffectBlackBoardGetCurRoundBoardGetBlackBoardTetrisGameRunTimeManager �  ,-   9      X '�-     .  -   - = -    9  6 9- - #)  B A -  )    X �-    9  B -   )  = -   )  = 6    9 	 B -    9 
 B K  �� ��RefreshMachineText UpdateComboScoreRateComputeTetrisGameRunTimeManagerchargeNumcomboCountDisposeComboTimermax	mathRefreshMachineSlidercomboTimepauseGameFlag��̙�����	 %  9  B6 6 9989: 6  9B6  9B=	6 93 *  )��B=
 9
  9B6 9 + B2  �K  machinenEffectObj_SetActive
Start New
TimercomboTimercomboTimeGetCurRoundBoardGetBlackBoardTetrisGameRunTimeManagerparams_2combomskillTypeTetrisGameConstActivityTetrisGameSkillCfgDisposeComboTimer��̙�����   9    X�9   9B+  =  6 9 + B9   X�9  9B+  = K  comboEffectTimermachinenEffectObj_SetActive	StopcomboTimer�   J6   9B6   9B  X?�9  9' B9  X�9  9' B6   9B6	  B  X�9
  9' BX�9
  9' B  9 B6   9B9  X�9  9' BX�9  9' B9)   X�9 6 ' B=K  TETRIS_GAME_UNLIMITE_TIMEGetTips	textroundTexttotalTime
false	truerotateControllercanRotateRefreshSkillListskillController	nextGetSkillBlackBoardonchargeFlagoffSetSelectedStatemachineControllerGetSkillEffectBlackBoardGetBlackBoardTetrisGameRunTimeManager?   
9    X�9   9B+  =  K  	StopstartTimer�   4  =  6 9 896 99 X�6  9B=  X�6 9 89	=  9
  99   BK  StartScrollskillListskill_listGetSkillListTetrisGameDataendLessstageTypeTetrisGameConst	typestageIDActivityTetrisGameStageCfgskillIDListz    9 9 8B 96   9 B AK  ClickSkillItemhandlerRegisterClickFuncskillIDListRefreshUI�   6  9B  X�K  6 9' 5 9 ==BK  skillID  stageIDtetrisGameGetSkillViewOpenPageByJumpJumpToolsCheckIsHaveDraggingTetrisGameBridge� 	 (  9  B  9 B  9 B  9 B  9 B6 9 BX�  9  BER�9   X�9  9	B+  = -  9
9	  BK   �
superDisposeskillListRemoveScoreTweeneffectListipairsRemoveShakeTweenRemoveTweenDelScoreTimerDisposeComboTimerStopTimer�  K N6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3H =G 3J =I 2  �L   Dispose ClickSkillItem indexSkill RefreshSkillList StopTimer UpdataViewState DisposeComboTimer OnComboTimerUpdate RefreshBlackBoardData RemoveTween RefreshMachineText RefreshMachineSlider RefreshView OnStartGame RefreshBar SendCancelSDK 
OnTop OnExit DelOverTimer OnGameEndUpdate CheckIsLose RegisterEvents DelScoreTimer UpdateScore PlayShakeTween RemoveShakeTween PlayScoreTween ShowScoreTween CreateEffectItem RemoveScoreTween AddUIListener OnEnter InitUI 	Init UIParent UINameReduxViewTetrisGameStageView
class 