LJ     9  BK  OnCtor�   6  ' B6 9B=   9 BK  UpdateTimeInfoNewUnityTimerTimeUtil_Timer!initializing time manager...
printS  	  9 B=  9  -  != K  �deltaTimeZero_CalcTimeZonetimeZero_+   9   9BK  Schedule_Timer9  9   9  	 
 D SetTimer_Timer�G  
  X�	  X�K  9   9 BK  DeleteTimer_Timer      L x�U   	  X�L X�	 X�L X�	 X�L K  x�?   6  96 9D realtimeSinceStartup	Time	ceil	math�   9 B!=  = - 9 !.  -   =   9 BK  ��UpdateTimeInfo_AnchorDelta_sAnchorTimeRealtimeSinceStartup_serverUnitydelta����F     9  B9  L _serverUnitydeltaRealtimeSinceStartupe   9  B9 !6 9-  $ - #D ��	ceil	math_sAnchorTimeGetServerTime�   9  B9 !6 99:: !6 9-  $- #D ��	ceil	math
valuerefresh_time1GameSetting_sAnchorTimeGetServerTime�8a    9  B9 !6 9-  $- #D ��
floor	math_sAnchorTimeGetServerTime�   9  B9 !6 99:: !6 9-  $- #D ��	ceil	math
valuerefresh_time1GameSetting_sAnchorTimeGetServerTime�8�   + = 6 9'   9 B9 !B6 9 B6 9 B!  9 B!L 	time_AnchorDeltaGetServerTime!*t	dateos
isdst=     X�'  6 9  D 	dateos!%Y%m%d%H%M%SS   	  X�'  6 9 9 !D _AnchorDelta	dateos!%Y/%m/%d %H:%M:%S7     9    9 B C GetServerTimeDescCTime_    9  B-   6 9- #B- "-  !L ��	ceil	mathGetServerTime�   6  9'   9 B9 !B'  '  '	 
 &
  9  D ParseTimeEx: _AnchorDeltaGetServerTime!%Y-%m-%d	dateos`    9  B-   6 9- #B- "-  !L ��
floor	mathGetServerTimes   9  B-   !-  6 9B- !-    L ��	ceil	mathGetServerTime��I�   9  B-   !-  6 9B- !-    -  !L ��	ceil	mathGetServerTime��I�  
  9  B6 6 9'  B A 6 6 9'  B A  	 X�) 	  X� 6 95 ==	D 
month	year 	hour min sec day	time!%m!%Y	dateostonumberGetServerTime � 
  X�-    9  B- "   9  !6 9#			B"9   L ��
floor	math_sAnchorTimeGetServerTimex; 	  9     	 -
  D �GetNextTime0�  	6   B          	  9 5
 =
=
=
=
=
=
D secmin	hourday
month	year  Table2ServerTimetonumber��  
   X�'   9 B
  9	 5 ======	D	 secmin	hourday
month	year  Table2ServerTime
match-(%d+)%-(%d+)%-(%d+)%s(%d+)%:(%d+)%:(%d+)�     9  5 ::=::=::=::=::=::=D secmin	hourday
month	year  Table2ServerTimem  6  9 B !6  9B6 9'   D %02d:%02dformatstring
floor	math�8xz 
 6  9 B !6  9B6 9'   	 D %02d:%02d:%02dformatstring
floor	math�8x�  {'  6 9 B6 96 9B) B6 96 9B)< B6 9 )< B6 ' B6 '	 B6	 '
 B	6
 ' B
)   X�6	 4 >>6
 9'  B>>6
 9'  B>>	B X<�)   X�6	 4 6
 9'  B>>6
 9'  B>>	B X&�)   X�6	 4 6
 9'  B>>	6
 9'  B>>
B X�)   X�6	 4 6
 9'  B>>
B X�' L 
--/--	%02dformatstringSpliceI18NTextSECONDTIP_MINUTE	HOURDAYGetTips	fmod
floor	math��
�8x�  Z'  6 9 B6 96 9B) B6 96 9B)< B6 9 )< B6 ' B6 '	 B6	 '
 B	6
 ' B
)   X�6	 9
'      B X%�)   X	�6	 9
'    B X�)   X	�6	 9
'    B X�)   X	�6	 9
'    B X�' L 
--/--%d:%02d:%02d%s%s%02d:%02d:%02dformatstringSECONDMINUTE	HOURDAYGetTips	fmod
floor	math��
�8xW  6  9 B 6 9'   D %02d:%02dformatstring
floor	mathx� 
 6  9 B6  96  9B) B6  96  9B)< B6  9 )< B   	 J 	fmod
floor	math��
�8x�  ) 5  	  X�	 X�	 X�) X�) X�	 X�) X�) X�6 9  B  X�) L indexof
table  
� �B   
  X�'     X�6    D K  GetTipsFLEFT_TIMEA  -   G  A  - 9   - D  �  �WrapTimeStrWithTips 3  2  �L  � �  
V)   X�)    9  B!6 9 B6 96 9	B)	 B6 96	 9		
B	)
< B6	 9		
 )< B	)
  
 X
� 
6 ' B&

L
 X
*�)
  
 X
� 
6 ' B&

L
 X
 �)
  
 X
� 
6 ' B&

L
 X
�)
  
	 X
�
	 6 ' B&

L
 X
�  X
�)
 6 ' B&

L
 X
�6
 '	 D
 K  TIME_OUTSECONDMINUTE	HOURDAYGetTips	fmod
floor	mathGetServerTime��
�8x�  	V)   X�)    9  B!6 9 B6 96 9	B)	 B6 96	 9		
B	)
< B6	 9		
 )< B	)
  
 X
� 
6 ' B&

L
 X
*�)
  
 X
� 
6 ' B&

L
 X
 �)
  
 X
� 
6 ' B&

L
 X
�)
  
	 X
�)
 6 ' B&

L
 X
�  X
�)
 6 ' B&

L
 X
�6
 ' D
 K  TIME_OUTMINUTE	HOURDAYGetTips	fmod
floor	mathGetServerTime��
�8x�  z  X�K    9  B!6 9 B6 96 9B) B6 96 9B)< B6 9 )	< B' 6	 '
 B	6
 ' B
6 ' B6 '	 B)   X�)    X�	 X�)   X�)  X� 	  
 &X5�)   X�)   X�)<  X�	 X�) 	 )  
 &X!� 
   &X�)   X�    &X�)   X�  &X�  X�)  
 )  &X�6 '
 D L TIME_OUTSECONDMINUTE	HOURDAYGetTips	fmod
floor	mathGetServerTime��
�8x 0�  v  9  B!6 9 B6 96 9B) B6 96 9B)< B6 9 )< B' 6 '	 B6	 '
 B	6
 ' B
6 '	 B)   X�6
 4 >>6 9'  B>>	6 9'  B>>
B X3�)   X�6
 4 6 9'  B>>	6 9'  B>>
B X�)   X�6
 4 6 9'  B>>
B X�)   X�6 9' 
 B X�6 ' B L TIME_OUT1%s	%02dformatstringSpliceI18NTextSECONDMINUTE	HOURDAYGetTips	fmod
floor	mathGetServerTime��
�8x�  d  9  B!6 9 B6 96 9B) B6 96 9B)< B6 9 )< B)   X�6 4 	>	6	 '
 B	>	6	 '
 B	 ?	 D X5�)   X�6 4 	>	6	 '
 B	>	6	 '
 B	 ?	 D X$�)   X�6 4 	>	6	 '
	 B	>	6	 '
 B	 ?	 D X�)   X�6 4 >6	 '

 B	>	6	 '
 B	 ?	 D X�6 ' D K  
BLANKSECONDMINUTE	HOURBEFOREDAYGetTipsSpliceI18NText	fmod
floor	mathGetServerTime��
�8x�����  -   6  99:: !-   6  99:: !6 9B6 9B X�+ X�+ L �
floor	math
valuerefresh_time1GameSetting�8��
�    9  6 9 9B6 99:: !D 
valuerefresh_time1GameSettingGetServerTime	timemanagerGetToday�83    9  B-   L �GetTodayFreshTime� 
 .  9  B6   9  ' B A 6 99:: X�6 9 9	6 99::)  )  B-  !L X�6 9 9	6 99::)  )  D K  �GetTimeByHMS	timemanager
valuerefresh_time1GameSetting!%HSTimeDescStonumberGetServerTimei 	   X�  9  B  X�' 6   9   B C  STimeDescStonumber!%dGetServerTimey -     9  B-   6 9 B6 9 B X�+ X�+ L �
floor	mathGetServerTime��
a  6  99 !-  #B6  99 !-  #B!L �_sAnchorTime
floor	math�  5+  6  9 B6  96  9B) B6  96  9B)< B6  9 )	< B6  9	 B6	  9		6
  9

B
) B	6
  9

6  9B)< B
6  9 )< B!L 	fmod
floor	math��
�8xq  6  99 !-  #B6  99 !-  #B X�+ X�+ L �_sAnchorTime
floor	mathi 	   X�  9  B  X�' 6   9   B C  STimeDescStonumber!%mGetServerTime�  86  6 9'  B A 	  X�' L 	 X�' L 	 X�' L 	 X�' L 	 X�' L 	 X�'	 L 	 X�'
 L 	 X�' L 	 X�' L 		 X�' L 	
 X�' L 	 X�' L K  	Dec.	Nov.	Oct.	Sep.	Aug.	Jul.	Jun.	May.	Apr.	Mar.	Feb.	Jan.!%m	dateostonumber
� 	 	 ,6  6 9'  B A   9 B6  6 9'  B A  X�6 9'  D X�  9   B  X�6 9'  D X�6 9'  D K  
%H:%M%m/%d %H:%MIsSameDay%Y/%m/%d %H:%MGetServerTime!%Y	dateostonumber� 	 	 ,6  6 9'  B A   9 B6  6 9'  B A  X�6 9'  D X�  9   B  X�6 9'  D X�6 9'  D K  
%H:%M
%m/%dIsSameDay%Y/%m/%dGetServerTime!%Y	dateostonumber�  
.	  X�6  ' D   9 B!) X�6  ' D X�*  X�6  ' D X�*  X�6 96  ' B6 9	 B C X�6 96  ' B) D K  
floor	math#FRIEND_ONLINE_TIME_ONE_DAY_AGOformatstring"FRIEND_ONLINE_TIME_IN_ONE_DAY&FRIEND_ONLINE_TIME_WITHIN_AN_HOURGetServerTimeONLINEGetTips ��
���]   6  9B6  9 6  96  9'  B A  C !*t	datedifftime	timeos   9  L timeZero_   9  L deltaTimeZero_� 	 ��6   ' B +  = )  = )  = )  = )*  * )  * 3 = 3	 = 3 =
 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3! =  3" = 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3H =G 3J =I 3L =K 3N =M 3P =O 3Q =R 3T =S  9S B=U 3W =V  9V B=X 3Z =Y  9Y B=[ 3] =\  9\ B=^ 3` =_ 3b =a 3d =c 3f =e 3h =g 3j =i 3l =k 3n =m 3p =o 3r =q 3t =s 3v =u 3x =w 3z =y 3| ={ 3~ =} 3� = 3� =� 2  �L   GetDeltaTimeZone GetTimeZone CalcTimeZone GetOnLineText FormatChatTime FormatTime GetMonthEn GetMonth IsSameDay DiffDay2 DiffDay IsToday GetToday GetTodayFreshTime GetNextFreshTime GetDeltaToday CheckIsToday GetBeforeTimeStr!GetLostTimeLongStrWithPrefix GetLostTimeLongStr&GetLostTimeStrWith2UnitWithPrefix GetLostTimeStrWith2UnitGetLostTimeSt2WithPrefix GetLostTimeStr2GetLostTimeStrWithPrefix GetLostTimeStrWrapTimeStrFunc  WrapTimeStrWithTips CalcMonthDays parseTimeForm DescCDTime4 DescCdTime3 DescCdTime2 DescCDTime DescCDTimeEndMinute parseTimeFromConfig ParseTimeEx ParseTime GetNextWeekTime GetNextTime GetNextMonthStartTime GetWeekendStartTime GetNextWeekStartTime GetLastZeroTime GetTimeByHMS GetZeroTime ServerTimeDesc STimeDescS DescCTime Table2ServerTime  GetServerHour GetGameServerWeek GetServerWeek GetServerTime SetServerTime RealtimeSinceStartup GetHourInType GetHour RemoveTimer AddTimer Update UpdateTimeInfo OnCtor 	Ctor_serverUnitydelta_AnchorDelta_sAnchorTime_TimerTimeMgrsingletonClass��
��I��* 