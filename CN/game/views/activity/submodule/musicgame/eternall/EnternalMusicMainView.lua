LJ?   '  L 4UI/VersionUI/XuHeng1stUI/Music/XH1stMusicMainUI7   6  999L transformuiMainuimanagerJ   	  9  B  9 B) = K  pageIndexAddUIListenerInitUI�     9  B6 96   9 B9 6 B= 6	 9
9 ' B= K  	locktransform_GetControllerControllerUtillockControllerEnternalMusicMainItemm_listIndexItemhandlerNewLuaList
list_BindCfgUIH    6   9  ' B K  enternalMusicRewardOpenPageByJumpJumpToolsJ    6   9  ' B K  /enternalMusicSettingOpenPageByJumpJumpTools�  -   9   -  98  6 98 6  9  B 6 98BK   �	PlayMusicActionGetDifficultyIndexMusicDataget_id_list_by_activity_idActivityMusicCfgpageIndexmusics�    9  9 +  3 B  9  9 +  3 B  9  9 +  3 B9  96	   9
 B A2  �K  OnPageChangehandlerSetPageChangeHandler
list_ m_palyBtn m_settingBtn m_rewardBtnAddBtnListener�    6  9  X�6  99  X�4  6 9 94 6 >6 >6 >B6 9 9	5
 5 ==BK  params
pages   	viewgameHelpPro	type	jumpSetGameHelpKeyINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanager
valueenternal_music_describeGameSettingB   	-     9   B -     9  B K   �RefrenBGMRefrenTime�	 9�6   9B  X�9  X�6 9 9' 9 B9 9= 6 9 84  =	 6
 9BX�6 8  X		�6 9  X	�6 99		 
 BER�6  99 B= 9  99	  9 + + B9  99 B)  = 9	 9 86  9 B6 9 ) B 6  9  B  9 9 B  9 B6 93  ) )��B= 9  9!B6" 9#9 B6 9$ 9%9& 9'6( 9)'	* 6
+ 9
,
9 B A6- '. '/ B  X�60 91  X�60 9192  X�4  63 94'5 56 =7B68 '. '/ )	 B2  �K  saveData
pages  gameHelpProOpenPageByJumpJumpTools
valueenternal_music_describeGameSettingshowHelpEnternalMusicgetDataMUSIC_REWARDRedPointConst
%s_%sformatstringtransformm_rewardBtnbindUIandKeyredPointSetMusicReadMusicAction
Start New
Timer
timerRefrenTimeOnPageChangeSetDifficultIndexmin	mathGetDifficultyIndex
BGMIDSwitchToPageStartScroll
list_GetSelectIndexMusicDatapageIndexinsert
tableACTIVITY_MUSIC_GAMEActivityTemplateConstsub_activity_listipairsmusicsActivityCfgparams_activity_idSetVolume
audiomanager
musicGetSoundSettingDataSettingData��   6  9 9B9   X�9  9B+  = 6  9 99 96	 9
' 6 99 B AK  activity_idMUSIC_REWARDRedPointConst
%s_%sformatstringtransformm_rewardBtnunbindUIandKeyredPoint	Stop
timerHideBarwindowBarmanager� 
  D6   99 B  X� 9B  X	�9 6 9 99	B=X�9 6
 ' B=6 9999 9B9  9B6  BH�	 9BFR�9 9 86   9 B  X�9  9) BX�9  9)  BK  SetSelectedIndexlockControllerGetActivityIsOpenpageIndexmusicsRefrenTime
pairsGetItemList
list_transform ForceRebuildLayoutImmediateLayoutRebuilderUIUnityEngineTIME_OVERGetTipsstopTimeGetLostTimeStr	timemanager	textm_timeLabIsActivityingactivity_idGetActivityDataActivityData2   9  8 9 BK  SetDatamusics�  	 $9    X�9   = 6  99 B9  86  9 B  X�9  9) BX�9  9)  B  9 BK  PlayBgSetSelectedIndexlockControllerGetActivityIsOpenActivityDataSetSelectIndexMusicDatapageIndexmusics�  .6  9 9B9 9 8  X�K  6 986  9 B 8  X�:6 89	
 X�6  9 99	9	B= 6  9 999	9
BK  awbFilecueNamecueSheetNamePlayBGM
BGMIDaisacValueSetBgmAisacControlaisacKeyGetDifficultyIndexMusicDataget_id_list_by_activity_idActivityMusicCfgpageIndexmusicsClearBGMFlag
audiomanager�  9  9 8  X�K  6 986  9 B 8  X�:9  X�K    9 BK  PlayBg
BGMIDGetDifficultyIndexMusicDataget_id_list_by_activity_idActivityMusicCfgpageIndexmusicsE  
9   9B-  99  BK   �
superDispose
list_�   "6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 2  �L   Dispose RefrenBGM PlayBg OnPageChange IndexItem RefrenTime OnExit OnEnter 
OnTop AddUIListener InitUI 	Init UIParent UINameReduxViewEnternalMusicMainView
class 