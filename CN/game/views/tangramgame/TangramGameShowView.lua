LJQ   '  L FWidget/System/Summer2024/Summer2024_Tangram/TangramInferencePopUI7   6  999L transformuiMainuimanagerc   
  9  B9  9' B= K  	pageGetControllercontrollerstepControllerInitUIb     9  B  9 B4  = 4  = K  titleItemListtipsListAddUIListenerBindCfgUI�  6-   9      X )�-   -  9 = -   9    9  6 9' -  96 -  9B A A -   9  -  9	   X 	�6 
 9  ' 5 -  9=B K  -     9  B X �-     9  B -     9  B K   �PlaycharacterMoveAni	BackRefreshText  chapterID/tangramGameMainViewOpenPageByJumpJumpToolstipsListtostringchapterIndex
%s_%sformatstringSetSelectedStatestepController	stepisWatch?    9  9 +  3 B2  �K   nextBtnAddBtnListener      9  BK  AddTween�  '6  6 9-  -   B- B- 9=- 9 9)  B9)  X�- 9 9'	 )��)  B6
 9 9' ' ' BK  ��� �)minigame_activity_3_5_key_guess_jumpminigame_activity_3_5PlayEffect
audiomanagercharacter_move	PlaynormalizedTime GetCurrentAnimatorStateInfocharacterAni_anchoredPositioncharacterTrs_	Lerp
MathfVector2k   -     9   B -   9    9  ' )��)  B K   �character_stop	PlaycharacterAni_RemoveTween�	  O  9  B9 999 999 999  9' )��)  B6	 9
 9' ' ' B!)   X�9 6 )��) ) B=X�9 6 ) ) ) B=6 9!B 6 9)  )  B 96 93 B A 96 93 B A 96 9B= 2  �K  linearLeanTweenTypesetEase VoidActionsetOnComplete FloatActionLuaHelpersetOnUpdate
valueLeanTweenmoveTweenabs	mathVector3localScale)minigame_activity_3_5_key_guess_jumpminigame_activity_3_5PlayEffect
audiomanagercharacter_move	PlaycharacterAni_ycharacterTrs_xanchoredPositioncharacterposTrs_RemoveTween��   9    X�9   9+  B 9+  B 9+  B6 99  9B+  =  K  idcancelLeanTweensetEasesetOnUpdatesetOnCompletemoveTween�   3) =  9 9= 6 99 8:= 6 96 9	9 B= 6 9 89=
   9 B  9 B  9 B9  9' )��)  B9 9 9=9 6 ) ) ) B=K  Vector3localScalecharacterposTrs_anchoredPositioncharacterTrs_character_stop	PlaycharacterAni_RefreshTitleTextRefreshBarRefreshViewconclusion ActivityTangramGameStageCfgtipsListall
keyof
tablechapterIndex(get_id_list_by_inference_stage_list"ActivityTangramGameChapterCfgchapterIDparams_stageID	step� 	  6  9 89)  ) M�  9  BO�K  RefreshTitleItemconclusion_liststageID ActivityTangramGameStageCfg�  I6  9' 9  B8 6 9 898) 9) M8�8	 	 X
,�6
 9
	
6 9 89
	 B
6  9' 9   B9 8  X� 9 B6  9 B9+ B6 9 B 9 < 9	 
 BX
�6
  9 B9+ B
O�K  RefreshUINewTangramGameShowTitleItemgameObjectSetActiveGetChildtitleItemList%s_%s_%sanswer
keyof
tablechildCountconclusion_liststageID ActivityTangramGameStageCfgchapterIndextitle%s_%sTrs_formatstring� 	  86   99 B  X0� 9B= 9   X�9   X&�9  96 9	'
 9 6 9  B A A9   9 B=6 99 BX�9  96 9	'
 9 6 9 B A A  9 BK  RefreshText	stepresultTrs_ ForceRebuildLayoutImmediateLayoutRebuilderGetTotalText	textresulttipsListtostring
%s_%sformatstringSetSelectedStatestepControllerchapterIndexGetInferenceStageWatchPlayisWatchstageIDGetStageInfoByStageIDTangramGameDataj   9  6 9 9 8B=9 6 9 9 8B=K  result	steptipsListGetTips	text	descx   '  6 9 BX	�6 9' 	 6
  B
 A ER�L GetTips
%s
%sformatstringtipsListipairsi   6  9 9B  9 B+  = K  	stepRemoveAllEventListenerHideBarwindowBarmanagerh   	6   9  ' 5 -  9=B K   �  chapterID/tangramGameMainViewOpenPageByJumpJumpTools�  9    X�6 9 94 6 >B6 9 93 B2  �K   RegistBackCallBackBACK_BARSwitchBarwindowBarmanagerisWatch�    9  B-  99  B6 9 BH� 9B+  FR�K   �titleItemList
pairsDispose
superRemoveTween�  % (6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 2  �L   Dispose RefreshBar OnExit GetTotalText RefreshText RefreshView RefreshTitleItem RefreshTitleText OnEnter RemoveTween AddTween PlaycharacterMoveAni AddUIListener InitUI 	Init UIParent UINameReduxViewTangramGameShowView
class 