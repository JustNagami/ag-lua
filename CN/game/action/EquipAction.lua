LJ>   6   99 BK  equip_listEquipInitEquipData�   /6    BX�9)   X�6  9	 B6 96 9	8	96	 9
8	
	9			BX�6  9
	 BER�6  9B  )   X�6 9 96 BK  EQUIP_LIST_UPDATEInvokenotifymanagerResetEquipSortRemoveEquippos	suitprefab_idEquipCfgModifyEquipInfoIllustratedActionAddEquipEquipDatanumipairs� 

 4  6    BH�6 9 9	BFR�6 9 9)�25 =)�2-  9	BK   �OnEquipDecomposeequip_id_list  SendWithLoadingNewnetmanagerequip_idinsert
table
pairsb   	6  9 96    BK  EQUIP_DECOMPOSE_CALLBACKCallUpdateFuncnotifymanager� 
	 6   9  B9 X�K    X�) X�)  6 9 9)�25 = =)�2-	  9		BK   �OnApplyLockEquipCallBackequip_id  SendWithLoadingNewnetmanageris_lockGetEquipDataEquipData�  '6  9 B  X�9  X�+ X�+ 6  99 B6 9 96	  B6 9 9
6	 5 9==BX�6 9 BK  ShowTips	lockequipID  InvokeEQUIP_LOCKCallUpdateFuncnotifymanagerequip_idApplyLockEquipSuccessEquipDatais_lockresultisSuccess�  6  9 B  X	�-  9  - - - - BX�6 9 BK     ����ShowTipsOnStrengthEquipresultisSuccess� 6   B  X�2 �-  9  B6 9 9)	�25
 = 
=
=
)�2B 9	3	
 2  �D K   � 	nextmat_listequip_listequip_id  SendWithLoadingnetmanagerTurnMatListcheckGoldF   6   6 -  9B A  K   �mat_listmergeReward2getReward2�  D6   9 B6  B6 96 99:#B6  	 96
	  B
   B	 9
B
 9	B	6
 98

 9
B 9
B X�+ X�+ 5 ====3 =6 9 96 	 X�+ X�+   B2  �K  EQUIP_STRENGTH_SUCCESSInvokenotifymanagercallback newEquipoldEquip
equipequipId 	typelevelupprefab_idEquipCfgGetMaxLvGetLeveltonumberApplyEquipStrengthSuccess
valueequip_strengthen_gold_costGameSetting
floor	mathdeepCloneGetEquipDataEquipDatal  6  9 B  X�-  9- BX�6 9 BK     �ShowTipsOnUpgrateEquipresultisSuccess   6    BK  
print�F6   9  B 9B6 999 86  9B9	 X�6
 ' B2 *�6 9B  X�2 %�) 9 ) M�6
 9

98	:B
98	:
 X�6
 ' B2 �O�6 9 9)�25	 = 	)
�2B 93 3	 2  �D K  K  K   �  	nextequip_id  SendWithLoadingnetmanager#ERROR_ITEM_NOT_ENOUGH_MATERIALgetItemNumItemToolsitem_list
moneycheckGoldERROR_USER_LEVEL_LIMITShowTipsuserLevelGetPlayerInfoPlayerDatanow_break_level
valueequip_break_user_levelGameSettingGetUpgradeCostGetEquipDataEquipData�   6   9  B6  B6   96   B A5 = ==6	 9
 96  BK  EQUIP_UPGRADE_SUCCESSInvokenotifymanagernewEquipoldEquipequipId pageIndex	typeupgradetonumberApplyUpgradeEquipSuccessdeepCloneGetEquipDataEquipDataF   6   6 -  9B A  K   �mat_listmergeReward2getReward2b   
6   9    9  6 -  - - B K  ���EQUIP_STRENGTH_SUCCESSInvokenotifymanager�  s6  9 B  Xi�6 6  9-  B A - )  X�6  96 -  B- B6 9- 6	 9
9:#B6  96 -  B- -  B6  9-  B 9B 9B X�+ X�+ 6 98 9B 9B X�+ X�+ 5 -  ====3 =- )	 	 X�5 -	  =	==3	 =	6	 9		
	 9		6  B	X	�6 9	 96
    B2�6 9 B2  �K   �����ShowTipsEQUIP_STRENGTH_SUCCESSEQUIP_UPGRADE_SUCCESSInvokenotifymanager  pageIndex	typeupgradecallback newEquipoldEquip
equipequipId 	typelevelupprefab_idEquipCfgGetMaxLvGetLevelApplyEquipStrengthSuccess
valueequip_strengthen_gold_costGameSetting
floor	mathtonumberApplyUpgradeEquipSuccessGetEquipDataEquipDatadeepCloneresultisSuccess� 6   B  X�2 �-  9  B6 9	 9)
35 = ===	=
)3B	 93
 2  �D K   � 	nextbreak_timestarget_levelmat_listequip_listequip_id  SendWithLoadingnetmanagerTurnMatListcheckGold�   4  6    BH�6 9	 9
BFR�4  6   BH�6	 9		
 5 ==B	FR�  J numid  equip_idinsert
table
pairs�  6  9 9)�25 = =)�2-  9D  �OnEquipQuickDressOnuse_equip_listhero_id  SendWithLoadingNewnetmanager� 
 
 + 6  9 BX�6 9	B  X�+ ER�  X�6 6 ' B A X�6 9 96	    BK  EQUIP_QUICK_DRESS_ONCallUpdateFuncnotifymanagerEQUIP_DRESS_FAILGetTipsShowTipsisSuccessresultipairs� 
 6  9 B  X�6  9-  - 9 B6 9 96 BX�6	 9 BK   ��ShowTipsEQUIP_ENCHANTCallUpdateFuncnotifymanagerenchant_previewAddPreEnchantEquipDataresultisSuccess�  =9 996  B  X�2 1�6 9 B X�6 6	 4
 >
>
B2 %�6 8  X		�6 89	  X	�6 89	:  X	�
 X	�2 �6	 9		
	 9		)�25 = ===)�2B	
	 9		3 B	2  �K  K  K  K   	nextlock_typepool_idenchant_slot_idequip_id  SendWithLoadingnetmanager
paramItemCfgPOP_SOURCE_ITEMShowPopItemgetItemNumItemToolscheckGoldnumber
moneyid� 	 6  9 B  X�6  9-  - - - B6 9 96 - BX�6 9 BK   ����ShowTipsEQUIP_ENCHANT_CONFIRMCallUpdateFuncnotifymanagerConfirmEnchantEquipDataresultisSuccess�	 
 6  9 9)�25 = ===)�2B 93	 2  �D  	nextpreview_indexconfirmenchant_slot_idequip_id  SendWithLoadingnetmanager� 	 6  9 B  X�6  9-  - B6 9 96 BX�6 9 BK   ��ShowTipsEQUIP_ENCHANT_GIVE_UPCallUpdateFuncnotifymanagerGiveUpAllEnchantEquipDataresultisSuccess�  6  9 9)�25 = =)�2B 93 2  �D  	nextenchant_slot_idequip_id  SendWithLoadingnetmanagerL    6   9    9  6 B K  EQUIP_RACECallUpdateFuncnotifymanager�H6  9 B  X?�-  	  X&�6  9- - B6  9- + B6  9- B9  X�6 9- + B6	 '
 B6 9' 5 - =3 =BX�6  9- 9 B6 9' 5 - =- =B6 9 96 BX�6	 9 BK  � ��EQUIP_RACECallUpdateFuncnotifymanagerequipId  /equipRaceConfirmViewrace_previewcallback heroId 	type
resetequipCulturePopViewOpenPageByJumpJumpToolsEQUIP_HERO_SUCCESSShowTipsApplyLockEquipEquipActionis_lockGetEquipDataConfirmRaceSetPreRaceEquipDataresultisSuccess� 66   9 B9996  B  X�2 &�6 9 B X�6 6		 4
 >
>
B2 �,	 5

 = 
	  X�)�2)	�2X�)�2)	�2=
6 9 9 
 	 B 93 B2  �K  K  K   	nextSendWithLoadingnetmanagerhero_idequip_id  POP_SOURCE_ITEMShowPopItemgetItemNumItemToolscheckGoldnumber
moneyidGetRaceMaterialEquipData� 	 6  9 B  X�6  9-  - B6 9 96 BX�6 9 BK   ��ShowTipsEQUIP_RACE_CONFIRMCallUpdateFuncnotifymanagerConfirmRaceEquipDataresultisSuccess}  6  9 9)�25 = =)�2B 93 B2  �K   	nextconfirmequip_id  SendWithLoadingnetmanager6   6   9  BK  EquipBagFullEquipData�  .  6  9 9)�25 == )�2- 9BK  � �OnInheritEquipnew_equip_idinherit_equip_prefab_id  SendWithLoadingNewnetmanager�   6  9 B  X�6 ' B6 9 96 9BX�6 9 BK  new_equip_idCallUpdateFuncnotifymanagerEQUIP_INHERIT_SUCCESSShowTipsresultisSuccess;   6   9  BK  InitAutoDecomposeEquipData�  6  9 B  X
�6  9-  - B-   BX�6 9 BK   ���ShowTipsUpdateAutoDecomposeEquipDataresultisSuccess|	  6  9 9)�25 =   X�) X�)  =)�23 B2  �K   	sign	type  SendWithLoadingNewnetmanager� 
 -6  9 B  X$�6  9-  B 9B4  6 - BX�5 9	=	9	=		=
<ER�6  9-  -  B6 9 96 BX�6 9 BK   ���ShowTips DIRECTIONAL_ENCHANT_SUCCESSInvokenotifymanagerDirectionalEnchantequipLevelnum
level  idipairsGetLevelGetEquipDataEquipDataresultisSuccess�	  6  9 9)35 = ==)33 B2  �K   effect_listenchant_slot_idequip_id  SendWithLoadingNewnetmanager�  3 @4   6  9 9)�23 B3 = 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3# =" 3% =$ 3' =& 3) =( +  3+ =* 3- =, 6  9 9)33. B30 =/ 32 =1 2  �L   DirectionalEnchant SetAutoDecomposeState  OnInheritEquip InheritEquip EquipBagFull QueryEquipRaceConfirm QueryEquipRace QueryEquipGiveUpAllEnchant QueryEquipEnchantConfirm QueryEquipEnchant OnEquipQuickDressOn EquipQuickDressOn TurnMatList OneKeyStrength OnUpgrateEquip ApplyUpgradeEquip OnStrengthEquip ApplyStrengthEquip OnApplyLockEquipCallBack ApplyLockEquip OnEquipDecompose EquipDecompose ModifyEquipList 	Bindnetmanager 