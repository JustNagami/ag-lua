LJ8   '  L -UI/EmptyDream/WorldBoss/EDream_WorldBoss7   6  999L transformuiMainuimanager8     9  B  9 BK  AddUIListenerInitUIn     9  B4  = 6 99 B= K  m_coinItemNewCommonItemcommonItemrewardItemsBindCfgUI�   6     9  -  9B -   9' 5 = 6 99	=
-  9=BK   �activityIDsectionTypeACTIVITY_WORLD_BOSSSTAGE_TYPE_NEWBattleConstsection  /sectionSelectHeroGoactivity_idGetStageIdActivityWorldBossData�   5   6 9: B  X�6 9' 5 : == 6	 9
9BX�	  X�6 ' BX�	 X�6 ' BK  SHOP_NOT_OPENSHOP_EXPIREDShowTips	SHOPSYSTEM_IDViewConstshowShopsshopId  
/shopGoToSystemJumpToolsIsShopOpenShopTools   �   6   -  98  6 9' 5 9 :=BK   �bossID  boss_idActivityWorldBossSkillOpenPageByJumpJumpToolsactivity_idActivityWorldBossCfg�   -   6 9=  6  -  9 8  6 6 5 9 >BK   �   coin_idPOP_SOURCE_ITEMShowPopItemActivityWorldBossCfgNIEN_WORLD_BOSSActivityConstactivity_id� 	   9  9 +  3 B  9  9 +  3 B  9  9 +  3 B  9  9 +  3 B2  �K   m_itemBtn m_skillBtn m_shopBtn m_startBtnAddBtnListener�   6  9 94 6 >6 >6 >B6  9 9' BK  .ACTIVITY_SPRING_FESTIVAL_MONSTER_DESCRIPESetGameHelpKeyINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager    K  (   -     9   B K   �RefrenTime�  56  9 9' B6 9= 6 9 86 9	9 B  9
 B9  X�6  9 9 B  X�6  9 9 3 B  9 B6 93 ) )��B= 9  9B2  �K  
Start New
Timer
timerRefrenTime StartStoryByIdIsStoryPlayed
storypre_story_idRefreshUIQueryBossDataActivityWorldBossActionActivityWorldBossCfgNIEN_WORLD_BOSSActivityConstactivity_idactivityWorldBossSetMainCamerauimanagerh   6  9 9B9   X�9  9B+  = K  	Stop
timerHideBarwindowBarmanager�   6   99 B  X� 9B  X	�9 6 9 99	B=X�9 6
 ' B=K  TIME_OVERGetTipsstopTimeGetLostTimeStr	timemanager	textm_timeLabIsActivityingactivity_idGetActivityDataActivityData>   6   6 -  9B K  �coin_idPOP_ITEMShowPopItem� /�6  9 86  99 B9  =9:9 6	 4 >B'
 6 9B' &=9 9 99)  ) M�9
 8
	
 
 X
�6
 9

9 9 B
9 6 9
  B<	9
 8
	

 9

9 	 B
9
 8
	

 9

+ B
O�9  ) M�9
 8
	

 9

+ B
O�9  95 9	=	B9  93  B6  9!9 B6  9"9	 B9# '	$ 
 &	
	=	9% =6 	 9&9
 B  X	�6	 9
' 9
(
+ B	9	) 6
* 6+  B A
 =
	9	' 6
-  B
=
,	X	�9	) '
. =
	6	 9
' 9
(
+ B	2  �K  getAffixSpritespritegetAffixDescGetI18NTextm_affixDesgameObjectm_affixImgGetAffixm_coinCount/m_coinMaxGetCointCountGetMaxCoinNum RegistCallBackid numbercoin_idRefreshDatacommonItemSetActiveSetDataNewNiewWorldBossRewardItemm_rewardItemInstantiateObjectrewardItems
width	rectm_rewardContenthealth_reward_list%	ceil	math GetMonsterName	textm_bossNameboss_id
valuem_healthSliderGetLeftHealthPointActivityWorldBossDataactivity_idActivityWorldBossCfg��  6  9 BX� 9BER�4  = 9  9B-  99  BK   �
supercommonItemDisposerewardItemsipairs!     9  BK  RefreshUI�   6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   OnActivityWorldBossUpdate Dispose RefreshUI RefrenTime OnExit OnEnter 
OnTop AddUIListener InitUI 	Init UIParent UINameReduxViewNianBeastBossView
class 