LJ�  	 6 9B=  6 9B= 6 9B=   9 BK  ResetAllDataNewEventListenerlistenerCanteenItemManagerdormItemManagerGetInstanceCanteenCharacterManagercharacterManager'   '    &L restaurant.pos.�   	 6   9  6 99  9 B6  9 9B  9  B  9  BK  StartGenCustomer	Initstorage
ResetRestaurantAutoRestaurantModeDormEnumrestaurant	Dorm�    6   9  6 99  9 B6  9 9B  9  B  9  B6	 9
B 9BK  DisposeGetInstanceCookAIStartGenCustomer	Initstorage
ResetRestaurantManualRestaurantModeDormEnumrestaurant	Dorm�   6  99  X�6  9 B+ =K  availableGetEntityDataCanteenAIFunctionDinningTableItemTypeDormEnum� 4 6  -  9<6 -  9<6 3 <6 -  9<6  BH�9	  9
	 
 BFR�K   �Registerlistener
pairsOnClickEntityDORM_CLICK_ENTITY DORM_RESTAURANT_NEW_ITEMStartManualRestaurant!DORM_RESTAURANT_START_MANUALStartAutoRestaurantDORM_RESTAURANT_START_AUTO.   9   9BK  RemoveAlllistener�   4  =  9  9 <9  9 4  <6 9 96 999  B6	 9
BK  MapSceneItemTagInfoDormUtilsRestaurantBusinessNamespaceDormEnumMapToDatastorage	DormorderFoodListFieldbusinessModeFieldbusinessInfo�   /  9   B9  9B6 9B 9B6 9B 9B6 9B 9B6 9B 9B9  9B6	  9B6
 9B 9BK  DormCharacterActionExecuteDormCharacterActionManagercharacterManagerWaiterAINormalCustomerAICashierAIGetInstanceCookAI	InitdormItemManagerResetAllData�   66  9B 9B6 9B 9B6 9B 9B6 9B 9B6  9B6 9B 9B6	 9
 9' ' ' B9  9B9  9B  9 BK  ResetAllDatadormItemManagercharacterManager+minigame_activity_spring_festival_stop&minigame_activity_spring_festivalPlayEffect
audiomanagerDormCharacterActionExecute
ResetDormCharacterActionManagerWaiterAINormalCustomerAICashierAIDisposeGetInstanceCookAI�  
 $)   6  96 99B6 9 9 6 BX�6	  9
	 B9  X	�9)	   	 X�+ X	�+   X	�   ER�L  
levelGetEntityDataCanteenAIFunction
pairsForeachDatastorage	DormDinningTableItemTypeDormEnumItemEIdNamespaceCanteenItemManager� 	-  B6  99  9 B9 # 5 6  BX�:
	
 X
�X�	 ER�6 9 :D �min	mathipairs    durationQueryTime
valuecanteen_customer_limitedGameDisplayCfg�    -   - D    �    -   D   � 6  99 X	�  9 B9  93 B2�9  93 BK  ��  StartGenCustomerTaskcharacterManagerStartManualBusinessTimerRestaurantManualRestaurantModeDormEnum�  6   9  9  -  9 9  B  X�+ X�+ L   GetCharacterCountcharacterManagerRestaurantNormalCustomerCharacterTypeDormEnum j    6     9  6 99B K  RestaurantAutoRestaurantModeDormEnumSetCanteenStateCanteenData�  -   9     9  B -    9  B   9  3 B   9  3 B   9  B K   ��
Start 	Then WaitUntilNewTaskStopGenCustomerTaskcharacterManager�
 
 6  93 6 99: 9  + +	 B 9B9 =	2  �L 
timerbusinessInfo
StartNewTimer
valuedorm_operate_timeGameSetting taskRunnerDormCharacterActionManager    K  4   6   9D GetPopularityNumCanteenData�   6   9B  9 ' B6  BX�	  9 '
   BER�K  RecordDataipairsrestaurant.foodListClearDataGetChooseFoodListCanteenFoodData?   6  99  D GetGridIndexDormEntityManager	Dorm� 
 -  9   B6 9 9-  9 B  X�4   X�' <6 9 9-  9 	 BK   �RecordDataInteractPointMapGetDatastorage	DormPointToGridKey�  6  9 9-  96 BX
�6  BH	�	  X�+  <	F	R	�ER�K   �
pairsInteractPointMapForeachDatastorage	Dormz  6  9 9-  9-  9  B A  X�4  L  �PointToGridKeyInteractPointMapGetDatastorage	Dorm:   9  9  X�)  L customerGroupbusinessInfoU    9  B9  =K  customerGroupbusinessInfoGetCustomerGroupCountj    6     9  6 99B K  RestaurantAutoRestaurantModeDormEnumSetCanteenStateCanteenData�(  9  B 9 =-  9 B	 X�6  9B6 99 X�6	 9
B  X�6 5 6 ' B=6 ' B=3 =BK   �OkCallback content!CANTEEN_MANNUALLY_FOOD_EMPTY
title  PROMPTGetTipsShowMessageBoxCheckFoodEnoughGenCustomerCanteenCharacterManagerRestaurantManualRestaurantModeDormEnumGetCurCanteenModeCanteenAIFunction$ReleaseDinningTableFromCustomercustomerGroupbusinessInfoGetCustomerGroupCount k   6   9  B6   99B+  =K  bookedtableEidGetEntityDataCanteenAIFunction�    16   9  6 99B 4  6 9 9  6 BX�6	  9
	 B9  X	�9)	   	 X�+ X	�+   X	�9	 	 X	�6	 9		
  B	ER�6 9)  B8L random	mathinsert
tablebooked
levelGetEntityDataCanteenAIFunction
pairsForeachDatastorage	DormDinningTableItemTypeDormEnumItemEIdNamespaceCanteenItemManager�     X�4  6   9  B9  X�6 9BH�6  	 9
 B9	+
 <
	FR�L 
cfgID
pairsfoodListGetEntityDataCanteenAIFunction�     X�4  6   9  B9  X�6   99B9+ <L 
cfgID	pickGetEntityDataCanteenAIFunction�   @4   6  6  9B A X�+ < ER�6  9B6 99 X*�6 9	6 9
9B6 96 99B6 9 9 6 BX�-  	 
  B  ER�6 9 9 6 BX�- 	 
  B  ER�L  ��
pairsForeachDatastorage	DormRestaurantCookCharacterTypeEIdNamespaceCanteenCharacterManagerPassTableItemTypeItemEIdNamespaceCanteenItemManagerRestaurantManualRestaurantModeDormEnumGetCurCanteenModeCanteenAIFunctionGetCanOrderFoodListCanteenFoodDataipairs   
6   9    9  6 99-  9D   �orderFoodListFieldRestaurantBusinessNamespaceDormEnumGetDatastorage	Dorm�  6 99=  6 9-  9B  B6 9 9	6
 BL   �#CANTEEN_ORDER_FOOD_LIST_CHANGEInvokenotifymanagerGetRestaurantOrderListinsert
table	WaitFoodStateDormEnumstatus�   9  6 99 X�9  6 99 X�9  6 99 X�+ X�+ L CanceledHasServerTimeOutFoodStateDormEnumstatus  	 -   9   B   ) )��M�8 -  B  X�6 9   BO�K   ��remove
tableGetRestaurantOrderList�  
 6   9  B6   9  B6 98  X
�9  X�6 9 96	 9BK  CANTEEN_FUR_LEVELInvokenotifymanagergroupIDItemTypeDormEnumGetEntityDataGetEntityTypeCanteenAIFunction    K  �  G J6   ' B 3 = 3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = ' = ' = 3 3 3 = 3 = 3 = 3! =  3# =" '% =$ 3' =& 3) =( 3+ =* 3- =, 3/ =. 31 =0 33 =2 35 =4 37 =6 38 39 3; =: 3= =< 3? => 3@ 3B =A 3D =C 3F =E 2  �L   SetGroupItemLocked OnClickEntity RefreshOrder  AddOrder GetRestaurantOrderList CalcCanOrderFoodList   #ArrangeDinningTableForCustomer $ReleaseDinningTableFromCustomer OnCustomerLeave OnCustomerCome GetCustomerGroupCount  GetItemInteractPointsOnGrid RemoveInteractPointInfo RecordInteractPointInfo PointToGridKey restaurant.interactPointMapInteractPointMap OnChooseFood GetCurPopularity FinishManualRestaurant StartManualBusinessTimer StartGenCustomer  orderFoodListorderFoodListFieldbusinessModebusinessModeField 
Reset 	Init ResetAllData RemoveEvent RegisterEvent StartManualRestaurant StartAutoRestaurant PosNamespace 	CtorRestaurantManagersingletonClass 