LJ   9  L 
modeli   '    &6 6 9 9 B' D transformPickDatastorage	Dormnullablesim.pos.1  9    X�+  L -  9  D �spawnAt[  	-    X�'  L '   &L �sim.obstacle.level_sim.obstacle.never_removeR    6   9    9  ' 6 D  
pairssim.shelves.eidForeachDatastorage	DormA   5 9  =9 =9 =L maxremainhpid  
cfgID�   9  6 6  B6  ' B  X�)  6  ' B  X�)  5 =9 =9 =	=
=L specialEffectpreferencemaxhpremain
cfgID  special_effectlove_typeSimBusinessGuestCfgnullableid�  C6  99 B6 999 9 +  B9!=6 9	B 9
-   B A9)   X�6 999 ' ' ) B- 9' BX�- 9' B- 9	B 99 B6 9	B 9B  X�6 9	B 9+ BK  � �EndGameIsAllCustomerExitRemoveEntity%minigame_activity_3_5_shop_out01%minigame_activity_3_5_shop_out02PlaySoundEffect/Dorm/Effect/simBusiness/fx_business_kaixin	rootPlayEffectDetachedDormEntityManager	DormCollectCusotmerResultGetInstanceSimBusinessGamehptargetID
cfgIDApplyExitTraitSimBusinessCustomerTraitentityIDGetEntityDataDormUtils� 	 -  9 9 9 B6 99 B9)   X�6 999 BK   �StopAllCmdDormEntityManager	DormhpGetEntityDataDormUtilstargetIDentityIDProcessHpv    
6   6 ' ' ) B    X�)  L  
value-sim_business_customer_buy_vfx_threasholdGameDisplayCfgnullable� "\6  9  B6 986  9 B5 =9=9  XA�6 99B6	 989
9	)
  6 9999B 

6 -  9B9BX	�96 9    9B 

ER�6 99   9B 

6 9)    
B- B X�6 99  ' ' ) B9!==6 9 9 '! 	  
 BK   ��!SIM_BUSINESS_GUEST_HP_CHANGEInvokenotifymanagerbuyCounthp/Dorm/Effect/simBusiness/fx_business_canlan	rootPlayEffectDormEntityManager	Dormmax	mathApplyNormalTraitApplyGlobalTraitSimBusinessCustomerTraitidgenCustomerInfoGetInstanceipairs
ApplySimBusinessGoodsTraitlove_typesell_ability_additionSimBusinessGoodsCfgGetShelfSellAbilitySimBusinessTools
goodsshelfEID buyCount 
cfgIDSimBusinessGuestCfgGetEntityDataDormUtils >   6  99  BK  customerEndResultinsert
table%   -     9   B K   �resolve�
 -  9 6 9' 5 - ==- =3 =	B2  �K   �   callback 
guestisClear
stage  )/activitySummerSimBusinessGameResultOpenPageByJumpJumpToolsis_clear%   -     9   B K   �resolve�	 -  -  X�6  9' 5 - =-  =3 =BX�  9 B2  �K  ��resolvecallback curLevelbeforeLevel  simBusinessLevelUpViewOpenPageByJumpJumpTools%   -     9   B K   �resolven -  9  )   X�6 -  9 +  3 BX�  9 B2  �K   �resolve getRewarditem_list�   -   6  9  B  X�6  9B  X	�6 9 B6 9 BX�6 9BX�6 9  BK    	ExitDormMinigameGoToMainPageEnterLevelSimBusinessBridgeGetDefaultEnterDailyLevelIsDailyLevelSimBusinessTools�
 6  93 B6  93 B6  93 B6  94 >>>B 93	 B2  �K   �� 	nextall   newdeferredM  	6  9    3 B2  �K   SendGameFinishSimBusinessAction�  "9    X�K    9 B6 99  !+  =  9  9B)  =   X�-  9 9  BX�  9	 B6
 9BK  	�GoToMainPageSimBusinessBridgeAbortGameTaskcustomerEndResult
stagenextGuestIdx
ClearentityManager	time	TimeRestoreGameGlobalSpeedgameStart�   9 )  6 899  X�96 9 	 :
:BL GenerateShelfEntitySimBusinessMgr
modeltestModel	areaSimBusinessShelfCfg
cfgID�   6  9 B+   X�9 X�+ 6 9  BK  RemoveFurnitureDormLuaBridgenoOccupyGetEntityDataDormUtilsn    
6   6 ' ' ) B    X�)  L  
value%sim_business_customer_move_speedGameDisplayCfgnullable�   6  9 9  6   B 9+ BK  SetActiveShelfGoodsBubbleEmplaceBubblebubbleViewSimBusinessBridge~   6  9 9  6   B 9+ BK  SetActiveGuestHpBubbleEmplaceBubblebubbleViewSimBusinessBridge�  0-  '  B6 9 B6 99  ) B- 9 9 B- B6 99  B-  B6	 9
 9'  B- 9' B6 9 + BK    �   SendSafeMove"minigame_activity_3_5_shop_inPlaySoundEffectSIM_BUSINESS_GUEST_SPAWNInvokenotifymanagerSetEntitySpeedAddcustomerAIFadeOutNearPointDormEntityManager	DormSetupSimBusinessEntitySimBusinessMgr	exit�  %6  9 9'  B-  9 9 B6 9 9 B-  9	  X�6
 -  9	BX�9 X�+  =X�ER�K   �eidipairsgenCustomerInfoRemoveBubblebubbleViewSimBusinessBridgeRemovecustomerAISIM_BUSINESS_GUEST_EXITInvokenotifymanagerY  
9 6  9 B-   BK   ClaimUseShelfCostSimBusinessData
cfgID�   6  9 B6  99B6 9 9 BK  RemoveBubblebubbleViewSimBusinessBridge
cfgIDReleaseUseShelfCostSimBusinessDataGetEntityDataDormUtils� ,)  =  )  = 6 9B= 6 99-  - B6 9 B= 9 3	 =9 3 =
6 9- B= 9 3 =9 3 =
4 9 >9 >= 2  �K  ����� �
��entityMgrList  goodsManager OnRemove OnCreateentityManagerCreateModelEntityManagerNewSimBusinessCustomerAIcustomerAInextShelfIdxnextGuestIdx�  K  9   B4  = 9  9B-  ' B-  ' B6 99 9	 B6 9
 96 99 4	  B6 9
 9' ) 	 B6 9 B9  9' B6 9 6 96	 )
 )  ) B	 A A6 9 6 96	 )
 )  ) B	 A AK  �Vector3positionBoundsFillCustomOccupySimBusinessMgrsim.shelves.eidMapToDormStorageDatagoodsManagerSetupFurnitureTileEntityDormLuaBridgesim.entity.exitEntityDataNamespaceDormEnumRecordDatastorageMakeModelEntityInstanceDormEntityManager	Dorm	exit
spawn	InitcustomerAI
tasksResetStage�   .  9  B9  9B)  = 9  X�  9  B+   9 =   9 B= 6 9	 9
' 9  B6 9	 9' 9  B  9 B+  = K  customerEndResultUpdateBlockAreaOnSimBusinessStageChangedCallUpdateFuncSIM_BUSINESS_STAGE_CHANGEDInvokenotifymanagerPrepareCustomerGenInfogenCustomerInfoInitShelfLayout
stagenextGuestIdx
ClearentityManagerAbortGameTask�   1+  =  +  = +  =   9 B9  9B+  = 6 9 9	'
 ) B6 9 96 99 +  B6 99 9 B9  9B)  =   9 BK  ClearAllGoodsShelvesnextGuestIdx
ClearentityManagerRemoveEntityInstanceDormEntityManagerEntityDataNamespaceDormEnumRecordDatasim.entity.exitGetDatastorage	Dorm
tasks
ResetcustomerAIAbortGameTaskcustomerEndResultgenCustomerInfo
stage.   9  )    X�+ X�+ L remain�   6  8 4  6 9BX	�6 9	 5
 :=
:=
BER�L remainid  insert
table	waveipairsSimBusinessStageCfg�  6   99 B  X�-  9 B4  6  BX
�- 	 B  X	�6 9	 
 BER�L ��insert
tableipairs
stageGetLevelGuestInfoSimBusinessData�   4  9  B)  =   X�6 9 B  X&�6  X�6 9BH�	  9 9
B6		 9	
	
 B	9
=
	6
 9

9

 99B
6
 9

 6 99+ B
6
 9

 B
FR�K  $RecoverRoomFurnitureOccupyByLuaPlacedFurnitureStateDormFurnitureManagerChangeFurnitureStateDormLuaBridgeforwardposPutEntityLookToDirDormEntityManager	Dorm
goodsGetEntityDataDormUtils
cfgIDGenerateGoodsShelflayoutSimBusinessData
pairsIsDailyLevelSimBusinessToolsnextShelfIdxClearAllGoodsShelvesQ   
9   9   X�+ X�+ L genCustomerInfocustomerEndResult� 
 	9  5 =6 6  ' B=5 =9  9  	 B  X�9   =  L CreategoodsManager noOccupy
goods 
modelSimBusinessShelfCfgnullable
cfgID  nextShelfIdx�   6  9 B+ =+ =6 9 B6 9 6 99	+ B6
 9 9 + BK  SetShelfIsCanPlaceinstanceSimBusinessMgrEditingFurnitureStateDormFurnitureManagerChangeFurnitureState$ReleaseRoomFurnitureOccupyByLuaDormLuaBridge	editnoOccupyGetEntityDataDormUtils�  	 6  9 B6 9B  X�+  =6 9 B  X�6 ' BL 2SIM_BUSINESS_SHELF_NO_INTERACT_AREA_AVAILABLEShowTips'CheckShelfAnyInteractAreaAvailableSimBusinessMgrnoOccupySaveChangeDormLuaBridgeGetEntityDataDormUtils�   (6  9 B6  9 B  X�  9  BX�+  =+  =6 99	 9
9B6 9 6 99+ B6 9 BK  $RecoverRoomFurnitureOccupyByLuaPlacedFurnitureStateDormFurnitureManagerChangeFurnitureStateDormLuaBridgeforwardposPutEntityLookToDirDormEntityManager	DormnoOccupy	editRemoveEntityGetPrevCachedShelfInfoSimBusinessDataGetEntityDataDormUtils�   /  9  B6 9  X'�4  6 6 9BH�9	  9 
 B6	 9		
 B	+
  =
	9
	=
		6

 9

9

 99B
6
 9

 B
+
  =
<FR�6  +  =K  removed$RecoverRoomFurnitureOccupyByLuaDormLuaBridgeforwardposPutEntityLookToDirDormEntityManager	Dorm
goodsnoOccupyGetEntityDataDormUtilsGenerateGoodsShelf
cfgID
pairscacheEditShelfInfoSimBusinessDataClearAllGoodsShelves�   6  9 B=6 9 9'   BK  SIM_BUSINESS_SET_GOODSInvokenotifymanager
goodsGetEntityDataDormUtils�  -  9 BX�6 9	 B9		 X	�
  9	   B	ER�K   �SetShelfGoods
cfgIDGetEntityDataDormUtilsEnumerateShelves�  	 4   -  9 BX�6 9 B+  =+  =6 9  6	 9		
  B	 AER�L   � EntityDataToLocalLayoutInfoSimBusinessDatainsert
tablenoOccupy	editGetEntityDataDormUtilsEnumerateShelvesC   9   9B)  = K  nextShelfIdx
CleargoodsManager� (9  6 6 9' B5 
  X� X�6 9'	 9B'
 =X�'  &=-   B9  9 	 
 B  X�9   =  =L �eidCreateentityManager#CharDorm/activity/simBusiness/CharDorm/9084_tpose,SimBusinessGame Guest model not definedLogWarning
Debug spawnAt
spawncomplex
modelidSimBusinessGuestCfgnullablenextGuestIdxO   6  99  BK  entityMgrListFindAndRemoveEntityEntityManager[   
6   9  9  -    X�-    BK  �previewPathPointsinstanceSimBusinessMgr�		 -  '  B9-  ' B9+    X�6 93 B 6 9   B2  �K  �CalcPreviewPathToTargetSimBusinessMgr ActionSystemtransform	exitposition
spawn�  	   X�) L 6  6 ' ' ) B  X�) L 
value'sim_business_gen_customer_intervalGameDisplayCfgnullable4   -     9   - B K   ��GenerateCustomer� /  9  B6 9= 6 9 9B4  = 6 9	 BX�9
6 9	 B	 9-
   B
 A	 93
 B2 �ER�  9  B6 9 9' B2  �K  �OnSimBusinessGameStartCallUpdateFuncnotifymanagerAddGameTask 	ThenWaitForSecMarkGuestShownSimBusinessToolsidgenCustomerInfoipairscustomerEndResultNewTasktaskRunnerDormCharacterActionManager	time	TimegameStartRestoreLastGameGlobalSpeedH   
6  99  B 9+ BK  
Start
tasksinsert
tableN   9    X	�6 9  BX� 9BER�K  
Abortipairs
tasks� 6   9B6   9B)  ) M� X�+ X�+ 	  9 
  BO�  9 -  + BK  �UpdateObstacleActiveGetSimBusinessMaxLevelGetSimBusinessLevelSimBusinessData�  #-   B6  9 9 6 BX�
 9	' B	 	 X
�  X
�6
 9

	 B
X
�6
 9

	 B
6
	 9
 B
ER�K  �gameObjectSetActiveRemoveObstacleOccupyFillObstacleOccupySimBusinessMgrColliderGetComponent
pairsForeachDatastorage	Dorm[  -   B6  9 9 B  X�+ X�+ L �PickDatastorage	Dorm�  6  9	  X
�6 9' ) B6 9) BX	�6 9' ) B6 9) BK  SetGlobalTimeScaleDormMinigamegameSpeedSetFlagSimBusinessToolstimeScale	Timez   6  9' B  X�) 6 9 BK  SetGlobalTimeScaleDormMinigamegameSpeedGetFlagSimBusinessTools;   6  9) BK  SetGlobalTimeScaleDormMinigame;   6  9)  BK  SetGlobalTimeScaleDormMinigameV   6  9 9'   BK  minigame_activity_3_5PlayEffect
audiomanager�  ^ b6   ' B 3 3 3 6 93 3	 = 3
 3 3 = 3 = 3 3	 =	 3	 =	 3	 3
 =
 4
  3 =
3 =
3 3 3 3  = 3" =! 3$ =# 3& =% 3' 3( 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3G 3I =H 3K =J 3M =L 3O =N 3Q =P 3S =R 3U =T 3W =V 3Y =X 3[ =Z 3] =\ 2  �L   PlaySoundEffect PauseGame RestoreGameGlobalSpeed RestoreLastGameGlobalSpeed SwitchGameGlobalSpeed HasObstacle UpdateObstacleActive UpdateBlockArea AbortGameTask AddGameTask StartGame  UpdatePreviewPath RemoveEntity GenerateCustomer ClearAllGoodsShelves CalcShelfLayout BatchSetShelfGoods SetShelfGoods RestoreAllEditShelf RevokeEditGoodsShelf PlaceGoodsShelf EditExistingGoodsShelf GenerateGoodsShelf IsAllCustomerExit InitShelfLayout PrepareCustomerGenInfo   
Reset ResetStage 	Init 	Ctor    OnRemove OnSpawn EndGame  CollectCusotmerResult ProcessHp  settlementAction exitAction   EnumerateShelves 	huge	math   SimBusinessGamesingletonClass 