LJd   	6  9 9'   ' BK  #minigame_activity_2_6_snowballPlayEffect
audiomanager   9  L 
model   9  L spawnAtM    X�)  6     8  X�6  8 L SnowballGameUnitCfg�+   6  9  B8 L random	mathR   6   9    9  G  C  NewTaskframeTaskRunnerDormCharacterActionManagers   6   9  9  -  B    X�6   9  9  -  ) B K  �SetFadeCMDIsValidEntityIDDormEntityManager	Dorm�
6  99 ' -  ' ) B6  99 )  B- B 9*  B 93 B 9	B2  �K    
Start 	ThenWaitForSecSetFadeCMD.Dorm/Effect/snowball/fx_snow_effect_spawn	rootPlayEffectDormEntityManager	Dorm����� 
 6  9 B9  X�6 99 -  BX�6 99 )  B6 99 ' '	 ) BK   .Dorm/Effect/snowball/fx_snow_effect_death	rootPlayEffectDetachedSetFadeCMDStartFadeOutCMDDormEntityManager	DormisHumanoidTargetGetEntityDataDormUtilsT   6  9 96  BK  DORM_CHARACTER_DISPOSEInvokenotifymanager� +6  99-  - - B6  9 B= 6  99-  - B9 3 =9 3 =6  9 B=	 9	 3
 =4 9 >9	 >= 6 9B= K  ���
��EventListenerlistenermanagers playerManager OnRemove OnCreateCreatePlayerentityManagerNewCreateModelEntityManager�  M)  =  ) = 6 9 9' B9= 6 9 9'	 B9= 9
  96 6   9 B A9
  96 6   9 B A9
  96 6   9 -  B A9
  96 6   9 - B A9
  96 6   9 B A9
  96 6   9 B AK  ��OnFinishStoryON_FINISH_STORYOnBeginStoryON_BEGIN_STORY*SNOWBALL_GAME_INFINITY_POOL_CLICK_ICEPlayerPlayActionhandlerArg1,SNOWBALL_GAME_INFINITY_POOL_CLICK_MODELSpawnTarget"SNOWBALL_GAME_TARGET_NEW_WAVEOnSnowballAimFinishhandlerSNOWBALL_GAME_AIM_FINISHRegisterlistenersnowball.pos.guestguestSpawnPostransformsnowball.pos.playerPickDatastorage	DormplayerSpawnPosshootSpeedFactortargetIdx�   9   9B9  9+ B9  9+ B+  = K  targetIdxplayerManager
ClearentityManagerRemoveAlllistener�   6  9 6  99B  X�9  9+ BK  
ClearplayerManagerHideCharacterBeginStoryFlagHasFlagDormEnum�   6  9 6  99B  X�  9 9 B  9 9 BK  
guestSetGuestplayerSetPlayerHideCharacterBeginStoryFlagHasFlagDormEnum�     9  B  X�6 99 B6 99  + BK  SendDoActionCMDStopAllCmdDormEntityManager	DormGetPlayerEID{   6  99   B6 9  B=K  
speedGetEntityDataDormUtilsSetEntitySpeedDormEntityManager	Dorm�  ~  X{�  Xy�-    B9 - 9 X�+ X�+ 9 9 9 9	 8	  X	�)  <9 9 8  X�)  <9  99 5	 9
=
	=		5
 9
=
=
=
B9 = 6 99 '	 B  X�6 999 B6 999 +	 B6 999 B6 999 
  9	 B	 AX�6 999 +	 B6 999 B6 999 6	 )
  )  ) B	 A6 9B 9	 
 B-  9	BL K  ���
speedAddEntityToRowGetInstanceSnowballGameTargetAIVector3SetMoveLookAtDirGetPlayerEIDSetMoveLookAtEntityInitMoveControllerSetEntityIgnoreBeamcastInitDefaultEntityColliderMiniGameBridgeLuaBridgesnowball_target_move_LChangeEntityAnimeSchemeDormEntityManager	DormrowisHumanoidTarget
cfgID 	typetargetidspawnAt complex	typetarget
modeltargetIdxCreateentityManagertargetCountByRowtargetCountByTypePanishTargetunit_type � )6  9 B9 X�6 9B 9 B6  9 B-  9B9 9	9 9	8 <9
 99
 98 <6 99  BK  �managersFindAndRemoveEntityEntityManagerrowtargetCountByRowunit_typetargetCountByType
cfgIDRemoveGetInstanceSnowballGameTargetAItarget	typeGetEntityDataDormUtilsU  	6  9 -  9B  X�)  L �NormalTargettargetCountByTypenullableU  	6  9 -  9B  X�)  L �RewardTargettargetCountByTypenullableU  	6  9 -  9B  X�)  L �PanishTargettargetCountByTypenullable�  K  9  B  X	�-  9 B9  9- B=   X�K  -  B9  9- 5 9=9 =	5 9	
=	B6 996 99   X�99  X	�6 )	  )
  )��BB6 999 + B6 99 ' B-  9B-  9 BK   ����CreateHoldSnowballVfx
speedsnowball_move_LChangeEntityAnimeSchemeSetEntityIgnoreBeamcastMiniGameBridgeLuaBridgeVector3forwardtransformPlayerControlEntityDormEntityManager	Dorm	mainCameraUnityEngine
cfgID 	typeplayeridspawnAtplayerSpawnPos complex
modelCreateplayerRemoveplayerManagerClearVfxOnEntityGetPlayerEID�  $=    X�K  9  9-  B-  B9  9-  5 9=9 =5 =	B6
 999 + B-  9BK  ���
speedSetEntityIgnoreBeamcastMiniGameBridgeLuaBridge	Dorm
cfgID row 	type
guestspawnAtguestSpawnPos complex
modelCreateRemoveplayerManager
guestD  +  =  9  9-  BK  �RemoveplayerManager
guest�   6  9B 9B9  9+ B4  = 4  = K  targetCountByRowtargetCountByTypeentityManager
ClearGetInstanceSnowballGameTargetAI�  "  9  B= 6 84  = 6 9BX	�-  89	 5
 :=
:=
<
	ER�99=
 =	   9 - 9B AK  ��hero_idSetGuestlevel_debufflevel_buffdebuffListbuffListweight
total  enemy_setipairstargetsSnowballGameCfg
levelClearAllTargets�  6  8 -  9 X�9L X�-  9 X�9L X�-  9 X�9L K  �enemy_punishPanishTargetenemy_rewardRewardTargetenemy_normalNormalTargetSnowballGameCfg� 
 &)  6  9 BH�9)   X�9 FR�	  X�+  L 6 9B"6  9 BH
�9)	  	 X�9!)   X�L FR�K  random	mathweight
totaltargets
pairs �  6  9  B96 -   B' B- 9 X�+ X�+ L ��PanishTargetunit_typenullable
cfgIDGetEntityDataDormUtils�  6  9  B96 -   B' B- 9 X�+ X�+ L ��RewardTargetunit_typenullable
cfgIDGetEntityDataDormUtilsr   6  9 86 9  B  X�6 9L 	huge	mathrefresh_enemynullable
levelSnowballGameCfgJ   6  99:L 
value!activity_snowball_maxsnowmanGameSetting<   6  9'   D snowball.pos.row%dformatstring� 
  4  6  9 9  6 BX�6 9 	 BER�)  ) M	�6 9 B88<<O�L random	mathinsert
table
pairsForeachDatastorage	Dorm� �+ 	  X,�6  9 896  BX!�6
 	 B
X�6 6 9 9-   B:B' B  X�-    : B  X�  X�+ X�+ ER�ER�X[�9	   X�K  ) - ) MS�)  - -	  
 B	 A 6	 
 B	XF�96 9
999B9 8  X�)    X8�  9   B X1�  9 B X,�-   B  X�9	 86 9)  9	 89B=-    - - 9  B A  B  X�  X�+ X�+ X�	  X�6 9 96 BER�O�  X�- ' BK  #���$� ����+minigame_activity_2_6_snowball_refresh%SNOWBALL_GAME_ALL_TARGET_SPAWNEDInvokenotifymanagermax	math
totalGetTotalGenLimitGetEachWaveGenLimitPerRowtargetCountByRowpositionCheckPosBlockedMiniGameBridgeLuaBridgetargetstransformGetDatastorage	Dormnullableipairssnowman_pos
levelSnowballGameCfg 7  9   9-  D �GetEntityIDplayerManager   9  L player7  9   9-  D �GetEntityIDplayerManager   9  L 
guestK  6  99  -  BK  
�ClearAllEffectDormEntityManager	DormK  6  99  -  BK  �ClearAllEffectDormEntityManager	Dorm�  
6  99  ' -  ' )��BK  
�6Dorm/Effect/snowball/fx_snow_effect_xueqiu_staticgua_R_hand_bonePlayEffectDormEntityManager	Dorm� 
 -  9 9 B9 = 6 999 - B- ' B6 999  X�- '	 BK   ���)minigame_activity_2_6_snowball_hit03INVALID_ENTITY_ID*minigame_activity_2_6_snowball_attackPlayAnimeDuringInteractDormEntityManager	Dorm_targetIDtargetIDentityIDCreateHoldSnowballVfx� b-  9 9 B- 9 B+  6 999  X5�6 999 ' - ' 6	 *	  *
 )  B6	
 9		)
  )  )< B	6
	 9

* B	9  9B6 9 X�6
 99 !B X�6
 9- 9 B A  -   6	 9' ) BX�- 9 B6 - 6 99 B9B  X�)  9 =6
 9!B -   6	 9'	 *
 BK   ��
���%�/Dorm/Effect/snowball/fx_snow_effect_xueqiuyrowGetEntityDataDormUtilsnullable0Dorm/Effect/snowball/fx_snow_effect_xueqiu2LookRotation	huge	mathMagnitudehitPosone
EulerQuaternionVector3)Dorm/Effect/tongyong/fx_jingxia_0501gua_biaoqing_bonePlayEffecttargetIDINVALID_ENTITY_IDDormEntityManager	DormentityIDClearVfxOnEntity����������������� &6  9B9  9B X�9  9B X�6 999 ' -  '	 6
 *  *	 )
  B6 9)	  )
  )< B6	
 9		*
 B	K  
�one
EulerQuaternionVector3)Dorm/Effect/tongyong/fx_jingxia_0501gua_biaoqing_bonePlayEffectDormEntityManager	DormGetGuestEIDGetPlayerEIDtargetIDGetInstanceSnowballGameMgr��������)   9    X�9  BK  hitAction[   6  999 BK  entityID SetCurInteractToLowPriorityDormEntityManager	Dorm� 	 !6  99  B6 9    5 ===B6 9
-   B=	6 9   B6  99    + BK  &�SendInteractToEntityCMDSetEntityInteractContextDormUtilsMakeInteractTaskcurActionTask_targetIDhitPoshitAction  MakeCtx#DormCharacterInteractBehaviourStopAllCmdDormEntityManager	Dorm� 	
&6  99  B6  99  -  +  + )  + B6  99  ' - ' *  B- B 9- B 9 B 9	BK  �
���
Start	ThenWaitForSec-Dorm/Effect/snowball/fx_snow_effect_liwugua_R_hand_bonePlayEffectSendDoActionCMDStopAllCmdDormEntityManager	Dorm�����Ӛ��   6   B 6 9 96   9 B BK  GetGuestEID!DORM_CHARACTER_PLAY_SUBTITLEInvokenotifymanagerGetTips�  -6  99 X�K  -   ' ) B6 9 B9 X�  9  	 
  BX�	 X�- '
 B6 9 96 B  9 ' B  9 BK  ��GuestBeatPlayer%ACTIVITY_SNOWBALL_HIT_NPC_TALK01GuestPlaySubtitle#SNOWBALL_GAME_PLAYER_HIT_GUESTInvokenotifymanager)minigame_activity_2_6_snowball_hit04
guestOnSnowballHitTargettarget	typeGetEntityDataDormUtils0Dorm/Effect/snowball/fx_snow_effect_snowhitINVALID_ENTITY_IDDormEntityManager	Dorm�   -   9   - B -   9  - B -    9  B 6 9  X �-  - - - - B K    ��  ���	huge	mathMagnitudeCreateHoldSnowballVfxClearVfxOnEntity�
   9  B6 9+ B-  9 B-    3	 B2  �K   �'�)� ClearVfxOnEntityResetJoystickDormLuaBridgeGetPlayerEID�  G9 9   X� X�+ X�+ 6 9 B9  X�6 99 '		 )
 B  X�'
 X�' -  	 B- 	 B  X	�	  9 '
 B	  9 BX�- 	 B  X	�	  9 BX�	  9 
 B6 9	 96
    B- 	  
 BK  �!�"��SNOWBALL_GAME_HITInvokenotifymanagerGuestLiftSignGuestSendGiftGuestBeatPlayer(ACTIVITY_SNOWBALL_HIT_PUNISH_TALK01GuestPlaySubtitle)minigame_activity_2_6_snowball_hit02)minigame_activity_2_6_snowball_hit01Effect/Dorm/faint01 PlaySpacialFacileExpressionDormEntityManager	DormisHumanoidTargetGetEntityDataDormUtils	headlockHeadShot
cfgIDD   6  9 898L buff_intensity
levelSnowballGameCfg�   6  9 8986  B X�:::!6 9B" L X�L K  random	math
table	typebuff_duration
levelSnowballGameCfg�   -     9   - B -   9- B6 9 96 -    BK   ��"SNOWBALL_GAME_PLAYER_GET_BUFFInvokenotifymanagerGetBuffFactorGetBuffDuration�&  9  B  9 B-  9 B-  B6 99 9 9 B6 99 '	 *  B-   - 	 '

 B3	 B2  �K  ��'�� gua_HitEffect/Dorm/anger03 PlaySpacialFacileExpressionpositionguestSpawnPosPutEntityLookAtDormEntityManager	DormdebuffListGetGuestEIDGetPlayerEID�����   6   9  9  -  ' ' ) B -    9  - B -  9- B6 9 9	6
 -    BK  � ��"SNOWBALL_GAME_PLAYER_GET_BUFFInvokenotifymanagerGetBuffFactorGetBuffDuration2Dorm/Effect/snowball/fx_snow_effect_liwu_boomgua_R_hand_bonePlayEffectDetachedDormEntityManager	Dorm�	*-  '  B  9 B  9 B- 9 B-  B6 99 ' B6 99 9	 9
 B6 99 ' *  B-  3 B2  �K  ���(� Effect/Dorm/laugh02 PlaySpacialFacileExpressionpositionguestSpawnPosPutEntityLookAtgua_R_hand_bone ClearAllEffectOnAttachPointDormEntityManager	DormbuffListGetGuestEIDGetPlayerEID+minigame_activity_2_6_snowball_present����� =  X�'  X�'   9 B  9 B-   B6 99 9 9	 B6 99	 B6 99
 - +	  +
 )  + B6 99 ' B6 99 ' -	 
 *  B  9   X�' X	�' BK  �	�
�ACTIVITY_SNOWBALL_HIT_BODYACTIVITY_SNOWBALL_HIT_HEADGuestPlaySubtitlePlayEffectgua_R_hand_bone ClearAllEffectOnAttachPointSendDoActionCMDStopAllCmdpositionguestSpawnPosPutEntityLookAtDormEntityManager	DormGetGuestEIDGetPlayerEID.Dorm/Effect/snowball/fx_snowball_hit_sign8Dorm/Effect/snowball/fx_snowball_hit_sign_head_shot����� + o�6   ' B 3 3 3 3 3 ) ' ' '		 '

 ' *  * * * ) ' ' 3 6 9996 996 996 993 = 3 = 3 = 3 = 3  = 3" =! 3# 5$ 3% 3& 3( =' 3* =) 3, =+ )��)��3. =- 30 =/ 32 =1 34 =3 4 95>96>97>39 =8 3: 3 ; 3!< 3"= 3#? =#> 3#A =#@ 3#B 3$C 3%E =%D 3%G =%F 3%I =%H 3%K =%J 3%M =%L 3%O =%N 3%Q =%P 3%S =%R 5%T 5&Z 4'3(U >( '3(V *) <()'!(3)W <)('3(X <('3(Y *) <()'='[&3'\ 3(] 3)_ =)^ 3)` 3*b =*a 3*d =*c 3*f =*e 3*h =*g 3*j =*i 3*l =*k 3*n =*m 2  �L   GuestLiftSign GuestSendGift GuestBeatPlayer GetBuffDuration GetBuffFactor OnSnowballHitTarget OnSnowballAimFinish  GuestPlaySubtitle  sequence duration��������       ���� ���� CreateHoldSnowballVfx ClearBuffVfxOnEntity ClearVfxOnEntity GetGuestCfgID GetGuestEID GetPlayerCfgID GetPlayerEID SpawnTarget   GetTotalGenLimit GetEachWaveGenLimitPerRow     SetLevelPanishTargetRewardTargetNormalTarget ClearAllTargets RemoveGuest SetGuest SetPlayer GetPanishTargetCount GetRewardTargetCount GetNormalTargetCount   
GuestPlayer RewardTargetNormalTargetPanishTarget  PlayerPlayAction OnFinishStory OnBeginStory Dispose 	Init 	Ctor#QueryEntityAttachPointWorldPosQueryForwardDirQueryPositionDormEntityManagerPlayEffectMiniGameBridgeLuaBridge	Dorm 
happy	idleminigame_snowball_buffminigame_snowballsnowball_get_signsnowball_giftsnowball_fight     SnowballGameMgrsingletonClass��̙������̙����͙���̙���̙����͙�������������� 