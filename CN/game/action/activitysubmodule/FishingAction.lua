LJ2  -  9 BK   �CheckGroupRewardRedPoint�    6     9  B    )     X �+  X�+  6 9 96 9   X�) X�)  BK  FISHING_RECEIVE_REWARDRedPointConstsetTipredPointmanagerGetFishReceiveInfoFishingData�    4+   6   9B  X�9 + 6 6 96 98BX�6 89		  X	�6	  
	 9		B	9			6

 9

	 9B
 
 X�X�+ X�ER�6 9 96 9  X�) X�)  BK  FISHING_SCORE_REWARDRedPointConstsetTipredPointmanageridindexof
tablereceived_award_list	needSUMMER_FISHINGActivityConstget_id_list_by_activity_idActivityPointRewardCfgipairs
scoreGetActivityDataFishingData�    D+  6  6 9BX/�+ 6 86  9	:		BX�+  6  9B98  X�9)   X�+ X�+   X�+ X�ER�6 	 9B96		 9	
	
 9B	 	 X
�X
�  X
�+  X�ER�6 9 96 9   X�) X�)  BK  FISHING_GROUP_REWARDRedPointConstsetTipredPointmanageridindexof
tablereceived_constitute_listnumfish_infosGetActivityDataFishingData
groupallActivitySummerFishGroupCfgipairs�   6   ' ' 6 9 9B A -   9  B K   �CheckUnFinishRedPointGetNextDayFreshTimegameTimer_GunfinishfishingsaveData�    T6   ' ' B , )  6  9B  X�96  9B96 96	 9
8    X�+ X�+ 6  9B9 6	 9				  	 X�+ X�+ 
   X�6 9	 9B  X	�6 9	 96
 9

)  BX�  X�  X	�6 9	 96
 9

) BX�6 9	 96
 9

)  BK  FISHING_NOT_FINISHRedPointConstsetTipredPointGetServerTime	timemanagerallActivitySummerFishGroupCfgreceived_constitute_listSUMMER_FISHINGActivityConstget_id_list_by_activity_idActivityPointRewardCfgreceived_award_list
scoreGetActivityDataFishingDataunfinishfishinggetData�  6   9B6   99 B-  9B-  9B-  9BK   CheckUnFinishRedPointCheckGroupRewardRedPointCheckScoreRewardRedPoint	infoInitFromServer
ResetFishingData� #-      X�2 �6   9    9  6 9' 6 9&4 6 9>6 9	>6 9
>B 6   9    9  *  3 B 1  K  K  � � 	BindnetFISHING_NOT_FINISHFISHING_GROUP_REWARDFISHING_SCORE_REWARDSUMMER_FISHINGActivityConst_FISHINGRedPointConstaddGroupredPointmanager©� 	  6  9 B  X�9 9 6  9  99B-  9B- 
  X
�-   BX�6	 6
 9 B A K    �GetTipsShowTipsCheckScoreRewardRedPointtreasure	infoOnFishingResultFishingDatafish_inforesult_scoreresultisSuccess�
5 5  ==== 6 9 9*   *	 3
	 B2  �K   � SendWithLoadingNewnetmanageractivity_id	info  treasure
score  ĩƩ� 	5  == 6 9 9*   * -  9BK   �OnUpdateRequestCallbackSendWithLoadingNewnetmanageractivity_idrequest_info  ȩʩ�   6  9 B  X�6  99BX�6 6 9 B A K  GetTipsShowTipsrequest_infoUpdateRequestFishingDataresultisSuccess�  6  9 B  X�9 6  9 B-  9B- 
  X�- BX�6 9 BK    �ShowTipsCheckReceiveRedPointOnReceiveInfoGetFishingDatafish_receiveresultisSuccessr	5  = 6 9 9*   * 3 B2  �K   � SendWithLoadingNewnetmanageractivity_id  ̩Ω� 
5  = ==6 9 9*   * -	  9		BK   �OnGetFriendsFishCallbackSendWithLoadingNewnetmanagertimestampsender_idactivity_id  Щҩ� 
 6  9 B  X�6  9999 B-  9B6 '	 BX�6 9 BK   �FISHING_RECEIVE_SUCCESSShowTipsCheckReceiveRedPointfish_infotimestampsender_idOnReceiveFriendsFishFishingDataresultisSuccess� 	 6  9 B  X�6 ' B6  999) B-  
  X�-  BX�6 6 9 B A K  �GetTipsfish_idreceiver_idOnGiveCompleteFishingDataFISHING_GIVE_SUCCESSShowTipsresultisSuccess� 5  = ==6 9 9*   *	 3
 B2  �K   SendWithLoadingNewnetmanagerreceiver_idfish_idactivity_id  ԩ֩� 	5  = =6 9 9*   * -  9BK   �OnGetBonusCallbackSendWithLoadingNewnetmanageraward_idactivity_id  ةک�  6  9 B  X�6  99B-  9B6 6 9 B A X�6	 6
 9 B A K   �GetTipsShowTipsreward_listmergeReward2getReward2CheckScoreRewardRedPointaward_idOnGetScoreRewardFishingDataresultisSuccess� 	5  = =6 9 9*   * -  9BK   �OnConstituteFishCallbackSendWithLoadingNewnetmanagerconstitute_idactivity_id  ܩީ�  6  9 B  X�6  99B-  9B6 6 6 989	B A X�6
 6 9 B A K   �GetTipsShowTipsreward_item_listActivitySummerFishGroupCfgformatRewardCfgListgetRewardCheckGroupRewardRedPointconstitute_idOnGetGroupRewardFishingDataresultisSuccess�  6  9 B  X�6  99 B-  
  X�-  BX�6 9 BK  �ShowTipsfriend_need_listOnFriendRequestFishInfoGetFishingDataresultisSuccessp	 5  = 6 9 9*   * 3 B2  �K   SendWithLoadingNewnetmanageractivity_id  ��� 
5  = ==6 9 9*   * -	  9		BK   �OnFishingBuyFishCallbackSendWithLoadingNewnetmanagernumgoods_idactivity_id  ���   6  9 B  X�6 ' B6  9999 :B6	 9
 96 9BX�6 9 BK  FISHING_BUY_SUCCESSInvokenotifymanager	infonumgoods_idOnBuySuccessFishingDataTRANSACTION_SUCCESSShowTipsresultisSuccess�  - 34   + 6  9 96 3 B3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 2  �L   OnFishingBuyFishCallback FishingBuyFish GetFriendNeedFish OnConstituteFishCallback GetConstituteFishBonus OnGetBonusCallback GetBonus GiveRareFish OnGetFriendsFishCallback GetFriendsFish GetReceiveInfo OnUpdateRequestCallback UpdateRequest EndingFishing 	Init CheckUnFinishRedPoint ReadUnFinishRedPoint CheckGroupRewardRedPoint CheckScoreRewardRedPoint CheckReceiveRedPoint RARE_FISH_CHANGERegistListenernotifymanager 