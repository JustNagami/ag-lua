LJ�  -  )  = -  )  =-  )  =-  4  =-  4  =-  )  =-  )  =1 K  ��template_idis_expire_tipdaily_recordhave_signsign_daysis_signmonthly_card_timestamp�  -  9= -  9=-  9=-  9=-  9=-  9=  9	 9
BK  �daily_recordInitRecordtemplate_idis_expire_tiptotal_sign_receive_listhave_signtotal_sign_timessign_daysis_signbuy_timestampmonthly_card_timestamp  -  = K  �is_sign  -  = K  �sign_daysm 
 -  4  = 6  X�4  BX�-  9 99	<	ER�K  �
times
indexipairsdaily_record2 -  9   X�+ X�+ L �is_sign�  -  9 )   X�6 9B 9B  9 B  X�+ X�+ L �GetMonthCardDeadTimeGetServerTimeGetInstanceTimeMgrmonthly_card_timestamp@ 	-  ) = -  -  9 =K  �sign_daysis_sign<  6  9-  9 BK  �have_signinsert
table� 	"-  9 	  X�+ L + 6 986  BX�6	 8		-
  9

9	
 X

�6
 9

-  9 B
 
 X
�+ X�ER�L �have_signindexof
tableaccumulationsign_daysipairsget_id_list_by_template_id BigMonthCardAccumulationCfgtemplate_id !  -  )  = K  �is_sign� �+  -  9 6 6 9 9 ' B A 6 99:: X9�6 6 9 9 '	 B A 6 6 9 9 '	
 B A 6 6 9 9	 '
 B A 5 ===6 99::=6 99::=6 99::=6 9	 9
 B X8�6 6 9 9 '	 B A 6 6 9 9 '	
 B A 6 6 9 9	 '
 B A 5 ===6 99::=6 99::=6 99::=6 9	 9
 B 6 99:  L �big_monthly_card_duration  Table2ServerTimesecmin	hourday
month	year  !%d!%m!%Y
valuerefresh_time1GameSetting!%HSTimeDescS	timemanagertonumbermonthly_card_timestamp��
  -  9 L �sign_days  -  9 L �have_sign3     9  9BK  daily_recordInitRecord"  -  9 L �daily_record�   9  B6 9B 9B!6 9 B-  9!)   X�)  L �is_sign
floor	mathGetServerTimeGetInstanceTimeMgrGetMonthCardDeadTime��
)   -    X�1  -  L + L �#  -  9 L �is_expire_tip'  -  )  = K  �is_expire_tip!  -  9 L �template_id�  / 56   ' B 5 4  =4  =+ 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 2  �L   GetTemplateId SetIsExpireTip IsExpireTip LoginPopFlag GetMonthCardLastDay GetRecord SetRecord GetHaveSign GetSignDays GetMonthCardDeadTime ResetSign IsNeedAccumulatSign SignAccumulate SignToday HaveMonthCard IsSignToday InitRecord UpdateSignData UpdateIsSign InitData 	Initdaily_recordhave_sign sign_days is_expire_tip template_id monthly_card_timestamp is_sign BigMonthCardDatasingletonClass 