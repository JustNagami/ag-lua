LJl   =  = 9=   9 B  9 BK  	InitInitCfgDatatransformtransform_gameObject_parent�   6  9' B:= := := := K  perfectValuewinValuemaxExistCountgameTime"summer_chessboard_balloon_qteGetChessBoardGameSettingChessBoardTools� 
 >  9  B4  = 4  = 4  = 6   9 B= ) 9 ) M�9 6 9	6
 9' 	 B8  B<9 8 99 BO�) 9 9) M�9   9  B<O�9 999 = 9 999 = K  yballHeightxsizeDeltatransformbubbles1Go_ballWidthCreateEffectItemchildCountbubbleeffectlistTrs_SetBtnClickbubbles%sGo_formatstringNewChessBoardQTEBallonItemmaxExistCountHitBalloonItemhandlerclickHandle_effectListusePosListballoonListBindCfgUI�  4  9  9 B= 9  9' B=L AnimatorGetComponentanimatorGetChildbubbleeffectlistTrs_transformr  6  9!B6  9!B9  X�9    X�+ X�+ L ballHeightballWidthabs	mathd� M  X�-  L 9  99 9  9  9 ! 9	  	9	 !		9
 8

9
9
)d )   X-�U,�6	 9
  B6	 9
 	 B+ 6 9 BH�9  X�)'9  X�)'  9     B  X�+ X�FR�  X�   X�X�6   D �Vector2CheckIsNotMeetPos
pairsrandom	math	posY	posXballoonListballHeightballWidthheight
width	rectbubblecontentTrs_�  
9    X�K  9 X�K  9  = + =  9 99B  9 B 9B  9 9	BK  
indexShowBalloonClickEffectRefreshScorelocalPositiontransform_ShowEffecthitCounthitStategameStart�   9  8  9 +  B 9 B+ =9=9=K  y	posYx	posXhitStateSetPosCalculateBalloonPosballoonList�  	 6  9 BH�9 9)	  B9)	 	 X
�9	 9'
 )  )  B9=X�FR�K  localPositiontransformui_bloom_cx	PlaynormalizedTime GetCurrentAnimatorStateInfoanimatoreffectList
pairsm   9   9' )  )  B9 9 =K  hitCount	textscoreText_Fx_scoretext_cx	PlaytextnumAni_�  	-      .   -   	  X �6   - 9+ B -  9    9  B X �-  9  -  = -  9    9  ' )  )  B K  � �ui_CountDownTime_cx	PlaycountAni_	textcountTimeText_ChangeStageparentcountDownGo_SetActive � 
   9  B6 9 + B) 9 =6 93 ) ) B= 9  9	B2  �K  
Start New
TimercountDownTimer	textcountTimeText_countDownGo_SetActiveStopCountDownTimer�   + =  6 9 + B  9 B9 6 ' B=K  CHESSBOARD_GAME_TIPS_3GetTips	texttipsText_InitDatagameObject_SetActivegameStart6     9  B+ = K  gameStartAddGameTimer�   9 =  )  = ) 9 ) M�  9  BO�  9 B9 6 9	'
 9  B=K  %ssformatstring	textremaintimeText_RefreshScoreShowBalloonmaxExistCounthitCountgameTimenowTimesV   
  9  B9  9B+ = K  gameStartChangeStageparentStopTimer�   +  9  9  X�6 99X�9  9  X�6 99X�6 99 9  J PerfectWinperfectValue	LoseQTEGameResultChessBoardQTEGameConstwinValuehitCount-   -     9   B K   �UpdateTimerShow�    9  B9 6 9' 9 B=6 9	3
 ) 9 B= 9  9B2  �K  
StartgameTime New
TimergameTimernowTimes%ssformatstring	textremaintimeText_StopTimer�  9   =  9 6 9' 9  B=9  	 X�  9 BK  OverGame%ssformatstring	textremaintimeText_nowTimes >   
9    X�9   9B+  =  K  	StopgameTimerC   
9    X�9   9B+  =  K  	StopcountDownTimer�  	 6  9 BH�9 9' )	  )
  BFR�  9 B  9 B6 9 + BK  gameObject_SetActiveStopTimerStopCountDownTimerui_bloom_yc	PlayanimatoreffectList
pairsi  6  9 BH� 9B+  FR�-  99  BK   �
superDisposeballoonList
pairs�  0 66   ' 6 B 3 = 3 = 6 )')'B3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 2  �L   Dispose OnExit StopCountDownTimer StopTimer UpdateTimerShow AddGameTimer GetScore OverGame InitData OpenGame InitGame CountDown RefreshScore ShowEffect ShowBalloon HitBalloonItem CalculateBalloonPos CheckIsNotMeetPos CreateEffectItem 	InitVector2 InitCfgData OnCtorReduxViewChessBoardQTEHitBalloon
class 