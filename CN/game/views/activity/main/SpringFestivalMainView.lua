LJ+   '  L  UI/EmptyDream/NewyearMainUI�   6   96 9B6 96 9BK  SPRING_CANTEENActivityConstJumpToSubmodulePageActivityToolsCANTEEN_BUSINESS_STOPPEDRedPointConstConsumeNotificationDormRedPointTools�   "6   9  9  :     X�6 9 9  B  X�6 9 9  3 BX�6  9	6
 9B6 96 9BK  SPRING_CANTEENActivityConstJumpToSubmodulePageActivityToolsCANTEEN_BUSINESS_STOPPEDRedPointConstConsumeNotificationDormRedPointTools StartStoryByIdIsStoryPlayed
storymanager
value#activity_festival_canteen_plotGameSetting�    6   9  9  :  6 9 9  B  X�6 8 6 6 9	6
 ' B9B A K  6 96 9BK  FIRE_WORKActivityConstJumpToSubmodulePageActivityTools	nameFIRE_WORK_LOCK_STORYGetTipsformatstringShowTipsStoryCfgIsStoryPlayed
storymanager
value'activity_firework_unlock_pre_storyGameSetting�    6   9  9  :  6 9 9  B  X�6 8 6 6 9	6
 ' B9B A K  6 96 9BK  NIEN_WORLD_BOSSActivityConstJumpToSubmodulePageActivityTools	name#ACTIVITY_WORLD_BOSS_LOCK_STORYGetTipsformatstringShowTipsStoryCfgIsStoryPlayed
storymanager
valueactivity_firework_storyGameSetting� 74 6 99 6 9B>6 99 6 9B>6 99	 6 9
B>6 99 6 9B>6 99 6 93 B>6 99 6 93 B>6 99 6 93 B ?  =  K   NIEN_WORLD_BOSS
btn4_ FIRE_WORK
btn5_ SPRING_CANTEENcanteenGo_SPRING_FESTIVAL_RIDDLEriddleGo_ SPRING_ANTITHETICAL_COUPLET
btn2_PAPER_CUT_GAMEpaperCutGo_#ActivitySubmoduleWithSpineItemSPRING_FESTIVAL_GREETINGActivityConstspringFestivalGreetingGo_New(SpringFestivalGreetingSubmoduleItemsubmoduleBtnList_����:   6  9L SPRING_FESTIVAL_ACTIVITYActivityConst�   
6  9 99 96 9BK  CANTEEN_DISPATCHRedPointConsttransformcanteenGo_bindUIandKeyredPointmanager�   
6  9 99 96 9BK  CANTEEN_DISPATCHRedPointConsttransformcanteenGo_unbindUIandKeyredPointmanager�   6   9    9  B    X�-   9  9  )p�= -  9= K   �xlocalPositionscrollContent_IsPlaying
guidemanager�-  9 9  B  9 B  9 B6 9*  3 4  B2  �K   � StartAfterSecondsTimeToolsAddTimerBindRedPointOnEnter
super��ɘ�ʃ�_  -  9 9  B  9 B  9 BK   �StopTimerUnbindRedPointOnExit
super    K      K  �  
 6   9    9  B -  9  X �-     9  B -   9  6 ' B= K  -   9  6  9 9	-  9B= K   �GetLostTimeStrTIME_OVERGetTips	texttextTime_StopTimerstopTime_GetServerTime	timemanager�  1  9  B6  9 B9=   9 B6 9 9B9  X�9	 6 ' B=
2 �9	 6 9 99 B=
6 93 ) )��B= 9  9B2  �K  K  
Start New
Timertimer_GetLostTimeStrTIME_OVERGetTips	texttextTime_GetServerTime	timemanagerStopTimerstopTimestopTime_GetActivityDataActivityDataGetActivityID;   
9    X�9   9B+  =  K  	Stoptimer_�    6   ' B 7  6  ' 6 B 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   StopTimer AddTimer AddListeners RefreshUI OnExit OnEnter UnbindRedPoint BindRedPoint GetActivityID InitSubmoduleButton UINameSpringFestivalMainView
classActivityMainBaseView2game.views.activity.Main.ActivityMainBaseViewimport 