LJt   '  L iUI/VersionUI/JapanRegionUI_2_6/JapanRegionKagutsuchiUI/JapanRegionFishingUI/JapanRegionFishingHomeUI7   6  999L transformuiMainuimanager�     9  B6 99 ' B= 6 9  9	 B=   9
 BK  InitBtnListenerswinBar_New KagutsuchiSpecialWinBarItemwinBar	modetransform_GetControllerControllerUtilmodeControllerBindCfgUI�  9    X�6 9 99  B+  =  -  99  B9  9BK   �winBarDispose
superRemoveFuncTimer	instFuncTimerManagergameTicker    -   - +  < K  � �A    -   - 8     X �-   - + < -  - B K  � ��  3  3 2  �L   l 
 4    9  9 +  -  6   -	 9		B B AK  � �
OnQTEhandlerqteBtn_AddBtnListener�  6  8 96 6 998B   J 
value!activity_kagutsuchi_fish_qteGameDisplayCfgunpackqte_typeHanafudaCardCfg��   -      X�-   B -     X�6   9  ' 5 - =- =- =B X �6   9  ' B K  �� ���kagutsuchiFishingGetFailedlastRaritystaminaRecoverfishID  kagutsuchiFishingGetOpenPageByJumpJumpTools�	  3  6 99 X	�6 9' 5 = =	=
BX� B2  �K  callbackstaminaRecoverfishID  kagutsuchiFishingGetNewOpenPageByJumpJumpToolsBEnumFishRarityKagutsuchiFishingEventData �  9    X�6 9 99  B+  =  + = 
  X	�-     	 6
 9

BX�6 9BK  �	BackJumpToolsgameStartedRemoveFuncTimer	instFuncTimerManagergameTicker�   6   9  -  ! .  -  )   X�- 9  X�6 9 9- 9B- +  =-  9- - - BK  � ����InitGamegameTickerRemoveFuncTimer	instFuncTimerManager
pausedeltaTime	Time�
 #9 9 =  )  = -  9  B+ = + = - 6 9 93	 )��+	 B= 9
  9' B  9 B  9 B2  �K  ��ResetWindowBarRegisterEvents	waitSetSelectedStatemodeController CreateFuncFrameTimer	instFuncTimerManagergameTickergameStarted
pausefactorparams_fishID.     9  BK  RemoveAllEventListener    K  �  	 -   + =  -   9    9  ' B 6  9    9  6 -  9+  B K    fishID(KAGUTSUCHI_FISHING_EVENT_QTE_FINISHInvokenotifymanagerwaitResultSetSelectedStatemodeControllergameStarted   -   + =  K    
pause   -   + =  K    
pause�  -   + =  6  5 6 ' B=6 ' B=3 =	3
 =3 =B K   �MaskCallback CancelCallback OkCallback content"ACTIVITY_KAGUTSUCHI_FISH_EXIT
title  PROMPTGetTipsShowMessageBox
pause�  6  9 9B9   X�3 = 9  99 B2  �K  RegistBackCallBackwinBar backFuncHideBarwindowBarmanager�  -   9      X�)   X�6  9  -   9  -  B-   9B-   9  BK   ��UpdateTimeCountdownUpdateDrawGameBarUpdateFactorValuedeltaTime	Time
pause� =9    X�2 8�)  ) = = 6 96 9 )  B) B = = 6 9B "5
 = ==	 +  = 3 6 9 9 )	��+
 B= 9  9' B  9 B B6 9 96 B2  �K  K  'KAGUTSUCHI_FISHING_EVENT_QTE_STARTInvokenotifymanagerResetWindowBar	gameSetSelectedStatemodeControllerCreateFuncFrameTimer	instFuncTimerManagergameTicker pointerInRange
right	left  
rangerandomgameTimeqteSpanmaxmin	math	signfactorgameStartedd  9  "9 " )  X�)��=  X�)   X�) =  =  K  	signfactorm    9  B9  9 B= K  localPositionInverseTransformPointparentTransformPoint:   
9   X�9  X�+ X�+ L 
right	left� 
 3-  9  9 B9  X	�9  9  X�' X�' B= 9 9- 9	 9 6
 9 99")  B A9	 6
 9 9"9B=9 9- 9 9 6
 99	  "	)	  B AK  ��pointer_heightqteSpansizeDelta
width	leftVector2
area_	rectqteIndicator_$JapanRegionFishingHomeUI_glow02"JapanRegionFishingHomeUI_glow	PlaysuccessAreaAnimator_pointerInRange
rangefactor�   '9  !=  9 6 96 99  )  B A =9   X�9  )   X�9   X�+ = 9  9	'
 B6 9 96 9 + BK  fishID(KAGUTSUCHI_FISHING_EVENT_QTE_FINISHInvokenotifymanagerwaitResultSetSelectedStatemodeController
pausegameStartedmax
floor	math	textcountdown_gameTime�   + =  9  9' B+ = -  9 9 B  X�6 99	  BX
�6
 9 96 9	 + B BK  �(KAGUTSUCHI_FISHING_EVENT_QTE_FINISHInvokenotifymanagerfishIDSendFishingSuccess!KagutsuchiFishingEventAction
rangefactorgameStartedwaitResultSetSelectedStatemodeController
pause�  & *6   ' 6 B 3 = 3 = 3 = 3
 =	 3 3 = 3 3 3 = ) 3 = 3 = 3 = 3 = 3 = 3 = 3 3 3! =  3# =" 3% =$ 2  �L   
OnQTE UpdateTimeCountdown UpdateDrawGameBar   UpdateFactorValue InitGame ResetWindowBar RegisterEvents OnExit OnEnter EndFishingGame   InitBtnListeners  Dispose 	Init UIParent UINameReduxViewFishingGameQteView
class 