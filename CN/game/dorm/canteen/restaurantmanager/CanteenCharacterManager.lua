LJU  '  6 -  6   ' B' B&L  �
modelheroIDnullableCharDorm/  3  2  �L  � 
 '6   9B )   X�6 9)  B6   98B' 6 6 8' B&L X�' 6 -  6   '	 B' B&L K   �heroID
modelBackHomeHeroSkinCfgnullableCharDorm/SetVisitedHerorandom	mathGetCanteenVisitorCanteenData  3  2  �L  �  
 6  99 B9   X�) 6 9 9  B  X�6 9 9 B6  '	 D transformnullablePickDataGetDatastorage	DormjobCharaIndex
jobIDPosNamespaceCanteenManager=  9    X�-    D X�-   D K     
isNpc�   -   6  99  X �6  9  - 6 9B K   �charaVfxActiveType	DormShowCharaSpecialVfxDormUtilsRestaurantNormalCustomerCharacterTypeDormEnum� 6  99 -  3 B-  9  B6 9 9- - 8 B2  �K   � � InvokenotifymanagerRecordEntityInfo StartFadeInCMDDormEntityManager	Dorm�  -   9  B6 9 96  - BK   ��DORM_CHARACTER_DISPOSEInvokenotifymanagerRemoveEntityInfo� /6  993 - B6  99- - B4  = 6 6 9BH� 6	 9		9			 X	� 6	  9		
 B	3

 =
		3
 =
	9
 <	
2 �FR�6 9B= ) = 2  �K  ������nextCustomerIdxEventListenerlistener OnRemove OnCreateRestaurantNormalCustomerCharacterTypeDormEnum
pairsworkingCharaManagers NewCreateModelEntityManager�   4 6  6   9 B<6 6   9 B<6  BH�9  9	 
 BFR�K  Registerlistener
pairsUpdateJobCharacter-DORM_RESTAURANT_UPDATE_CHARACTER_BY_TYPE	InithandlerDORM_RESTAURANT_START_INIT.   9   9BK  RemoveAlllistener�   )   6  6 9B A H�   FR�+  6  9B6 99 X�6 9	X�6 9
  X�+ X�+ L ORDER_FOOD_AUTO_NUMORDER_FOOD_NUMDormConstRestaurantManualRestaurantModeDormEnumGetCurCanteenModeCanteenAIFunctionCalcCanOrderFoodListCanteenManager
pairs�  6  9B 9B  X�-  9BX�+ X�+ L  �CheckFoodEnoughGenCustomerGetCustomerGroupCountGetInstanceCanteenManager�   96   9  B   9  B -    X�4  6 99+   ) )��M�8:6	 9		
 5 =	=
8:=B	 O�.  6 -  BX�9	  X�9

  X�9
  X�9L ER�6 6 9' B A K  
�[人气值%d不在有效区间内，无法找到对应的客人生成间隔时间信息formatstring
erroripairscdrl  insert
table
valuedorm_canteen_customer_timeGameSettingGetCurPopularityGetInstanceCanteenManager� 
 .9    X� 9B X�+ X�+ -  B6  9B  X�  X�-  B  X�-  9+  - B+ +	 B=  9   9B-  9B+ L �  �  �GenCustomer
StartNewTimerAutoModeReadyForBusinessCanteenToolsIsRunning
timer�	 9    X�  9 B6 9 9B 93 5 B=  9   9B2  �K  	��
Start   WaitUntilNewTasktaskRunnerDormCharacterActionManagerStopGenCustomerTaskgenCustomerTaskE   
9    X�9   9B+  =  K  
AbortgenCustomerTask�    )4   4  6  6 9BH�6 86 9	B  X	�6  9	BH
�8   X�4  < 6 98  BFR�X�6 9	 
 BFR�   J insert
tablefood_list	nextallBackHomeCustomerCfg
pairs�   !)  4  6    BH�6 89 <FR�6 9)  B+  6   BH�)
  
 X
�!	 X
�X�FR�L random	mathweightBackHomeCustomerCfg
pairs� Y6  9B4  -  B  XO�UN�   X�6  B  X�6 9B*   X�X?�+  4  6 	 BH�6 9  BFR�6 	 B  X	�6 9	 B88
  X�6 	 B
  X� 		 X	� )	 	 X� 4  X�6 9	- 	 B6	 9		
  B	6	 6
 8

9


B	H�+  <FR�X�L ��food_listallBackHomeCustomerCfginsert
table
pairsrandom	math	nextCalcCanOrderFoodListCanteenManager����� 'p6  996 9B6  9 B96 9	6  9
9 B-  )  B 6 9)	 
 B4	  )
  ) M
<�6 9)  B  88<<6 9 B5 8=== X�+ X�+ =  9  9 5 8=== B6 9	  B9  = 6  9B6  99 X�6   9!) BO
�6
" 	 B
X�9  B=	#ER�=	$6
 9
%
B

 9
&
B
K  �OnCustomerComeGetInstancebooked	peeripairsRecordManualGenCustomerNumCanteenManualDataRestaurantManualRestaurantModeGetCanteenStateCanteenDatainsertjobCharaIndex
jobIDheroID complexnextCustomerIdxGenerateCharacterEntitypaychairEidtableEid
cfgID  remove
tablerandom	mathDinningChairItemTypeGetItemsInItemGroupCanteenItemManager
groupGetEntityDataCanteenAIFunction#ArrangeDinningTableForCustomerCanteenManagerRestaurantNormalCustomerCharacterTypeDormEnum�    9  B6 9 BH� 9B 9-  9	 B-	  9		
 B	 AFR�  9 - BK   ��GenerateJobCharacterIdxNamespaceEIdNamespaceMapToDormStorageData
ClearworkingCharaManagers
pairsRegisterEventsk   9  8  X� 9B  9 4 >BK  GenerateJobCharacter
ClearworkingCharaManagers�   16   9B6  BH&�6 9889	9
 
 X�6 6 	 B5	 =
=
=  9  )  5 =
=	B  X�6   X�6 6 99 8	9BFR�K  
speedSetEntitySpeedDormEntityManager	DormBackHomeHeroCfg
cfgID  GenerateCharacterEntity
jobID
isNpc complexBackHomeNpcCfgnullableskinIDheroIDRestaurantJobToServerMapDormEnum
pairsGetCanteenJobListCanteenHeroToolsg   9  8  X�4   9 	 
 B+ = 	 J eidCreateworkingCharaManagers�   6  96 99 9  6	 
 ' B	 AK  
jobIDnullableRecordDataEntityTypeNamespaceDormEnumstorage	Dormm 	  6  96 99 9  +  BK  RecordDataEntityTypeNamespaceDormEnumstorage	Dorm�     9  B  9 B6 9 BH� 9BFR�K  
ClearworkingCharaManagers
pairsStopGenCustomerTaskRemoveEvents:   9  8 9D EntityNumworkingCharaManagersp  	-  9 B6 99  BK   �workingCharaManagersFindAndRemoveEntityEntityManagerGetInstance^   	6  9 96 99  D EntityDataNamespaceDormEnumGetDatastorage	Dorm�  =W6   ' B 3 3  6 B 6 B 6 B3 *  4 6	 9			9	
	6
 <
	6	 9			9		6
 <
	6	 9			9		6
 <
	6	 9			9		6
 <
	3	 =	 3	 =	 3	 =	 3	 =	 3	 +
  3 3 = 3 = 3  3! 3" 3$ =# 6 9%6' 9&=& 6' 9(=( 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 2  �L   GetEntityData FindAndRemoveEntity GetCharacterCount 
Reset RemoveEntityInfo RecordEntityInfo GenerateCharacterEntity GenerateJobCharacter UpdateJobCharacter 	InitIdxNamespaceDormUtilsEIdNamespaceRestaurantJobToClientMap GenCustomer    StopGenCustomerTask StartGenCustomerTask   CheckFoodEnoughGenCustomer RemoveEvents RegisterEvents 	Ctor!DORM_RESTAURANT_NEW_CUSTOMERRestaurantNormalCustomer DORM_RESTAURANT_NEW_CASHIERRestaurantCashierDORM_RESTAURANT_NEW_WAITERRestaurantWaiterDORM_RESTAURANT_NEW_COOKRestaurantCookCharacterTypeDormEnum BackHomeCustomerCfgBackHomeNpcCfgBackHomeHeroSkinCfg  CanteenCharacterManagersingletonClass���� 