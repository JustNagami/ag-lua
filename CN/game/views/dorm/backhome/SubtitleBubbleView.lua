LJ?   '  L 4Widget/BackHouseUI/Dorm/item/SubtitleBubbleViewF   
   X�6  9    X�  8 L K  subtitleViewStack	Dorm�     X�6  9  X� )   X� 8 9B6 9   BK  insert
tableOnDisablesubtitleViewStack	Dormp     X�6  9  X�)   X�8  X�8 9B< K  OnDisablesubtitleViewStack	Dorm�     X�6  9  X� 8  X�6 9 B )   X� 8 9BK  OnEnableremove
tablesubtitleViewStack	Dorm�  )-  9 9  B  X�6 96 9  9 B A 6 9	9
9B= + = + = X�= 6 9 ' B= = 4  = 4  =   9 BK   �BindCfgUIcurPlayingbubblesstaticModenullabletransform_globalneedDisposeGotransformuiMainuimanagerUIName	Load
AssetInstantiateGameObjectgameObject_	Ctor
super~  9    X�-  9  BX�-  9  B  9 BK   �OnEnablePushSubtitleViewReplaceSubtitleViewglobal�  	   9  6 9 B  9  6 9 B  9  6 9 B  9  6 9 BK  CustomPlayVisitSubtitleSeq$DORM_VISIT_CHARACTER_FIRST_TALKOnEntityDisposeDORM_CHARACTER_DISPOSEOnPlaySubtitle!DORM_CHARACTER_PLAY_SUBTITLEOnPlaySubtitleSeq%DORM_CHARACTER_PLAY_SUBTITLE_SEQRegistEventListenerC    9  B-  9  BK   �PopSubtitleViewOnDisable�   6  9 BH� 9BFR�6  9 BH� 9BFR�4  = 4  =   9 BK  RemoveAllEventListenerDisposebubbles
AbortcurPlaying
pairs   =  K  filter�  
 !9  8  X�9 
  X�9 8  X�6 99 9 B6 9 B 9 9	+ B9  < 9	+ BL SetActivecontentNewBubbleItembubbleRootbubblePrefabInstantiateGameObjectfilterbubblesC   
   X�   X�6   BX�+ X�+ L IsAllSpace� 
 %6  96 99B6 9 9   B6 6	   B-   B  X�6 6
  ' B X�6 6	  	 B L �hero_idBackHomeHeroSkinCfgDormHeroVoiceDescCfgnullableGetDatastorage	DormDormNormalHeroCharacterTypeDormEnumIdxNamespaceDormUtils    L    6   D GetTips�   $-   9      X�6  9     X�-  ' -   X�-   9B X�  - - 9B -  9- B-  9 BK  � � ���SetDataShowSubtitlesubtitleIDGetVisitContent#overrideSubtitleGetContentFunc	DormgetContentFunc�D-  9 B  X�2 <�6  9  B6 9 9B 9  B  X�2 ,�9  X�6 9	9
  '	 B98   X�98  9B)  9  	 )
 M�8 99B 93 B2 �O�9< 	 9B2  �K  K  K   ��
Start 	Then	timeWaitForSecLength
AbortcurPlayinggua_Hptransform_SetUIFollowDormLuaBridgestaticModeGetBubbleNewTaskframeTaskRunnerDormCharacterActionManagerCheckIsVisitHeroDormHeroToolsGetTopSubtitleView�   -   9      X�6  9     X�-  - -  9- B-  9 BK  � �� �SetDataShowSubtitle#overrideSubtitleGetContentFunc	DormgetContentFunc�	 =-  9 B  X�2 5�6  9  B6 9 9B 9  B  X�2 %�9  X�6 9	9
  ' B98   X�98  9B 9B 9) B 93 B9<  9B2  �K  K  K   ��
Start 	ThenWaitForSecGetVisitContent
AbortcurPlayinggua_Hptransform_SetUIFollowDormLuaBridgestaticModeGetBubbleNewTaskframeTaskRunnerDormCharacterActionManagerCheckIsVisitHeroDormHeroToolsGetTopSubtitleView� 
 >-  9 B  X�K   9  B
  X�  X� 9B  X�K  9  X�6 99  ' B98   X�98  9	B9+  < 9
  X�6 9  X�-     B 9	  B 9	 BK   ��SetDataShowSubtitle#overrideSubtitleGetContentFunc	DormgetContentFunc
AbortcurPlayinggua_Hptransform_SetUIFollowDormLuaBridgestaticModeIsPlayingGetBubbleGetTopSubtitleView�  	 6  9  X�6  99  X�4   )   X�6 6 6 9 B889D X�' L X�' L K  definerandom	mathTipsCfgGetTips
valuedorm_player_greetingsGameDisplayCfgp  -  9 B  X�K  98   X� 9B9+  < K   �DisposebubblesGetTopSubtitleViewC  
-  9 9  +  + B+ = K  �global	Ctor
super    +  L T   9    X�6 99 BK  gameObject_DestroyGameObjectneedDisposeGo�  3 <6   ' 6 ' B A 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 6- '.   B3/ =30 =32 =1 =. 2  �L   Dispose  MuteBubbleSubViewsingletonClass OnEntityDispose GetVisitContent OnPlaySubtitle CustomPlayVisitSubtitleSeq OnPlaySubtitleSeq UseTips UseRawContentUseDormHeroSubtitle   GetBubble SetEntityFilter OnDisable OnExit OnEnable OnEnter 	Ctor PopSubtitleView ReplaceSubtitleView PushSubtitleView GetTopSubtitleView UINamegame.extend.BaseViewimportSubtitleBubble
class 