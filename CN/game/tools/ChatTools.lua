LJ� 
 -  9   B6 9 9 B4  )  9 ) M	�6 9	 -
 9

8B
 AO�6  9	   BK   ��InitFriendContnentChatFriendDatadecodeinsert
table
CountReadlAllLine	instFileStreamMgrGetFriendChatFile�  6  9' -  96  9B9  D  �userIDGetPlayerInfoPlayerDatadefaultDirectory%s/chat/%s/friend/%s.txtformatstringP  6    BX�-  9 BER�K   �SaveFriendChatCacheipairs�  &6   9  B-  9  B4  6  BX�6	 9		
 - 9 B A	ER�6 9 9	  B6   9
  4  BK   ��SetSaveRecordListAppendLines	instFileStreamMgrencodeinsert
tableipairsGetFriendChatFileGetSaveRecordListChatFriendData�  *6   9  B-  9  B 6 99:4   ) )��M�6
 9

 ) - 98	B A

 
 X
�X�O�6	 9
 9 	 +
 BK   ��AppendLines	instFileStreamMgrencodeinsert
table
valuechat_length_maxGameSettingGetFriendChatFileGetFriendContentChatFriendDatae  -  9   B6 9 9 BK   �DeleteFile	instFileStreamMgrGetFriendChatFile� 6  99:6  9  B   X�-  9  BK   �ResaveFriendChatCacheGetFriendContentChatFriendData
valuechat_length_maxGameSetting(� 
-  9   B6 9 9 B4  )  9 ) M	�6 9	 -
 9

8B
 AO�6  9	 BK   ��InitGuildContnentChatGuildDatadecodeinsert
table
CountReadlAllLine	instFileStreamMgrGetGuildChatFile�  6  9' -  96  9B9  D  �userIDGetPlayerInfoPlayerDatadefaultDirectory%s/chat/%s/guild/%s.txtformatstring�  $6   9B-  9  B4  6  BX�6	 9		
 - 9 B A	ER�6 9 9	  B6   9
4  BK   ��SetSaveRecordListAppendLines	instFileStreamMgrencodeinsert
tableipairsGetGuildChatFileGetSaveRecordListChatGuildData�   16     9  B 9     X�K  6  9B-  9  B 6 99:4   ) )��M�6
	 9


 ) - 98	B A

 
 X
�X�O�6 9 9 	 +
 BK   ��AppendLines	instFileStreamMgrencodeinsert
table
valuechat_length_maxGameSettingGetGuildChatFileGetContentChatGuildDataidGetGuildInfoGuildData�  
 6   9  ' -  96  9B9B 6 9 9	  BK   �DeleteDirectory	instFileStreamMgruserIDGetPlayerInfoPlayerDatadefaultDirectory%s/chat/%s/guildformatstring� 6  99:6  9B   X�-  9  BK   �ResaveGuildChatCacheGetContentChatGuildData
valuechat_length_maxGameSetting(� 
 -  9   B6 9 9 B4  )  9 ) M	�6 9	 -
 9

8B
 AO�6  9	   BK   ��InitChannelContnentChatChannelDatadecodeinsert
table
CountReadlAllLine	instFileStreamMgrGetChannelChatFile�  6  9' -  96  9B9  D  �userIDGetPlayerInfoPlayerDatadefaultDirectory%s/chat/%s/channel/%s.txtformatstring�  &6   9  B-  9  B4  6  BX�6	 9		
 - 9 B A	ER�6 9 9	  B6   9
  4  BK   ��SetSaveRecordListAppendLines	instFileStreamMgrencodeinsert
tableipairsGetChannelChatFileGetSaveRecordListChatChannelData�  *6   9  B-  9  B 6 99:4   ) )��M�6
 9

 ) - 98	B A

 
 X
�X�O�6	 9
 9 	 +
 BK   ��AppendLines	instFileStreamMgrencodeinsert
table
valuechat_length_maxGameSettingGetChannelChatFileGetContentChatChannelDataf  -  9   B6 9 9 BK   �DeleteFile	instFileStreamMgrGetChannelChatFile� 6  99:6  9  B   X�-  9  BK   �ResaveChannelChatCacheGetContentChatChannelData
valuechat_length_maxGameSetting(� 
 6  8 96  BX	�6 9	 B   X	�+	 L	 ER�6 99B  X�+ X�+ L activity_idGetActivityStatusActivityToolsIsConditionLockedJumpToolsipairsopen_conditionChatToggleCfg�     X�'   4  6 9  ' B6  BX�  6	 
 B	<	ER�L tonumberipairs_
splitstring�   :99=  99= 999= 999= 999= 99	=	 99=
 99= + = 99  X�6 ' B= 99  X�6 99:= 99  X�6 999B= + L ParseJumpLinkChatToolsjumpLinkjump_link
value profile_chat_bubble_defaultGameSettingchat_bubblebubbleIDIP_UNKNOWNGetTipsip_locationiprecallcontent	typecontentTypetimestampicon_frameiconFrame	iconuser_profile_base	nickidmsg_idmsg
msgID�  1 54   6  ' B6 9= 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 2  �L   ParseChat ParseJumpLink IsOpenChatChannel DeleteChannelChatRecord DeleteChannelChatCache ResaveChannelChatCache SaveChannelChatCache GetChannelChatFile LoadLocalChatCache DeleteGuildChatRecord DeleteGuildChatCache ResaveGuildChatCache SaveGuildChatCache GetGuildChatFile LoadGuildLocalChatCache DeleteFriendChatRecord DeleteFriendChatCache ResaveFriendChatCache SaveFriendChatCache SaveFriendsCache GetFriendChatFile LoadFriendLocalChatCachepersistentDataPathApplicationdefaultDirectory
cjsonrequire 