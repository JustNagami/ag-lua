LJ9   6  99:L 
valueaction_timeGameSetting7   6  99:L 
valuetalk_timeGameSetting�   6  9B6 6 98:86 99B98:L quiz_zonelength
tableget_id_list_by_activity_idActivityQuizCfgGetCurActivityIDActivityQuizTools4    9  B L Cfg_GetMaxQuestionCount2   6  89L 
pointActivityQuizTableCfg    ) L �   6  9B6 6 98:89:L character_listget_id_list_by_activity_idActivityQuizCfgGetCurActivityIDActivityQuizTools�   6  9B6 6 98:89L punish_characterget_id_list_by_activity_idActivityQuizCfgGetCurActivityIDActivityQuizTools9   6  99:L 
valuemax_percentGameSetting9   6  99:L 
valueadd_percentGameSettingd   	6  9 96   BK  ACTIVITY_QUIZ_PLAY_STICKERCallUpdateFuncnotifymanager    K  ;   9  B0   9. K  ��timestampInitData� /6  9B6 6 98:86  BX�9	-
  8
	
 
 X
	�-
  4  <	
6
 9

-  9	 B
-
  5	 =	
9=<	
6
 	
 X
�9
	
  X
�)
<X�9
:

7
 ER�K  �curHeroID_character_listrole_idUSER_ID	nicknicknameid 
score allinsert
tableuidipairsget_id_list_by_activity_idActivityQuizCfgGetCurActivityIDActivityQuizTools y 
0   9 . 6 9 96 BK  ��!ACTIVITY_QUIZ_START_PROLOGUECallUpdateFuncnotifymanagertimestamp� 	0   9 . 9. 9. 97 6 9 96 BK  ����#ACTIVITY_QUIZ_QUESTION_REFRESHCallUpdateFuncnotifymanager
seed_	sendquestionseqtimestamp� &0   9 . 6  BH�-	 8		9
=
	FR�6  BX�9	6
 	
 X
�9
9 8

9
. 9
7	 ER�6
 9 96 BK  ����!ACTIVITY_QUIZ_ANSWER_REFRESHCallUpdateFuncnotifymanagercurChoose_chooseis_righthistoryUSER_IDuidipairs
score
pairstimestampb 0   6  9 96 BK  �ACTIVITY_QUIZ_FINISH_GAMECallUpdateFuncnotifymanager
� )�6  9' B9 9+ B6  9' B9 9' B6  B  X�9 9+ B6	 9
99 999	B4  6  BX

�-   9 B6 9  BE
R
�  9 B6 	 BX;�6  9'  &B6  B  X0�9 X�9'  ' &6 9 B9 99999B6 9' B 96 6 B A 9  *  B996! 9"   9#  9$89%BER�-  9&)	  9
'

) M	�8 9(BO	�K   �DestroyPlayerRoot
CountPlayerListisLocalPlayernickNameCreateResultNameUIupVector3CrossFadetypeofGetComponent	poseStringToHashAnimatorInstantiate
Asset_tposeCharDorm/quiz/lastRoleIdcurRoleIdGameEndObjs/posCfg_GetPigModelIdinsert
tableFindByPlayerIdipairsrotationpositionSetPositionAndRotation	mainCameraUnityEngine
isNilVCam_GameEndtransformGameEndObjsSetActivegameObjectvfx_scene	FindGameObject��̙�����̙�����[   6  9 96 BK  ACTIVITY_QUIZ_CHANGE_HEROCallUpdateFuncnotifymanager�  6  9-  9 B  X	�6  9-  9 B-  +  <6 9 96 BK  �ACTIVITY_QUIZ_QUIT_PLAYERCallUpdateFuncnotifymanagerremoveallindexof
table�  '-   9  B 9'  B9 9)  B6  B  X�6 99' B  X� 9	'	
 +
 BX� 9	'	 +
 BK   �
othermeSetSelectedState	nameGetControllerControllerUtil
isNilSetSiblingIndextransform<UI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/AnswerRoleNameUICreateNickNameFindByPlayerId�   E6  9' B9 96 999+	 B9 9'	 B 9
6 6	 B A=  9  B9 9)	  B9=96 9=6 99'	 B  X�	 9'
 + BX�	 9'
 + B6 99	'
 B
 9	 + B	K  	rank
othermeSetSelectedState	nameGetControllerControllerUtiloneVector3localScalelocalPositionSetSiblingIndexConvertWorldToUIPos	text	TexttypeofGetComponentnametext	FindcanvasuimanagerSetParenttransformBUI/VersionUI/IndiaUI_2_8/IndiaAnswerUI/AnswerResultRoleRankUIInstantiate
Asset� 
  6  996 99 9 B 96 6	 B A9
6 999  +	  B  X�6 ' BL #未找到对应的视口坐标
printtransform'ScreenPointToLocalPointInRectangleRectTransformUtilityworldCameraCanvastypeofGetComponentWorldToScreenPoint	mainCameraUnityEnginecanvasuimanager� -   9  B 9B996 9' B9 9 B96	 9
 =96	 9=K   �onelocalScaleupVector3localPositionSetParent$Effect/Battle/HeroIndicatorBaseInstantiate
AssetparenttransformGetPlayerModelGoFindByPlayerId��̙�����̙����   *  L ����y 0   4  . - 4  = 0  )  7 )  7 0  0  )  7 0 K  ������
seed_curChoose_curHeroID_all    -  L �  -  9 L �all   -  8L �   -  L �   -  L �   -  L �   -  L �   6  L curChoose_p   	7  6 9 96  BK   ACTIVITY_QUIZ_CHOOSE_CHANGECallUpdateFuncnotifymanagercurChoose_   7  K  curHeroID_   6  L curHeroID_,  -   9  D  �FindByPlayerId3  .  6  9 BK  	�ResetSeedDRandom� !4  .  )  ) M�6  9-   BO� ) )��M�6 9 B 6  9-  	 B6  9-	  
 BO�K  
�removeRandomDRandominsert
table   -  L 
�   6  L 
seed_S     9   ' ) BK  *Dorm/Effect/houzhai/fx_chunjie_yanhuaCreateVfxP     9   ' ) BK  'Dorm/Effect/houzhai/fx_chunjie_smkCreateVfx� 
  -   9  B 9B96 9 B9 9	 B96 9=96 9
=	6 9 	 BK   �DestroyOrReturnPooledAssetonelocalScale	zeroVector3localPositionSetParentInstantiate
AssettransformGetPlayerModelGoFindByPlayerId�	  b n6   9  9  9  4  )  4  )  )  )  )  ) 6	 9		B	4
  3 =3	 =3 =
3 =3 =3 =3 =3 =3 =3 =3 =3 =3 =3! = 3# ="3% =$3' =&3) =(3+ =*3- =,3/ =.31 =033 =235 =437 =639 =83; =:3= =<3? =>3A =@3C =B3E =D3G =F3I =H3K =J3M =L3O =N3Q =P3S =R3U =T3W =V3Y =X3[ =Z3] =\3_ =^3a =`2  �L  CreateVfx CreateVfx_AnswerError CreateVfx_AnswerRight GetRandSeed GetAnsList SetRandList ResetRandSeed GetPlyerModel GetCurHeroID SetCurHeroID SetCurChoose GetCurChoose GetState GetCurResult GetCurQuizIndex GetCurQuizID GetRankData GetPlayerList GetCurStateEndTime InitData GetSyncPosInterval CreatePlayerShadow ConvertWorldToUIPos CreateResultNameUI CreateQNickName OnPlayerRemoved OnModelChanged ShowModels OnEndGame OnQuestionResult ShowQuestion OnShowPrologue AddPlayers OnGameStart ShowScoreBonusEffect PlayEmoji Cfg_GetModelScaleMulti Cfg_GetMaxModelScale Cfg_GetPigModelId Cfg_GetDefaultModelId Cfg_GetScoreMulti Cfg_GetScore Cfg_GetSeqOfScoreBonus Cfg_GetMaxQuestionCount Cfg_GetEmojiCd Cfg_GetGestureCd	timeosInstancePlayerManager	QuizP08 