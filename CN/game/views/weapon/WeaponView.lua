LJ7   '  L ,Widget/System/Hero_key/HeroKeyDetailsUI7   6  999L transformuiMainuimanager�	  % <5 5 9  9' B=5 5 =5	 =
==4 5 6   9 B=>5 6   9 B=>=5 4  ==6   9 B==  5 5 =5 4 6 9 >=!="5# 4 6 9 >=!=$= K  breakView viewPath7game.views.weapon.WeaponSubView.WeaponBreakSubView	namebreakViewuiRootPath*Widget/System/Hero_key/HeroKeyBreakUIpageIdxstateName
BreaklvupViewbarCurrencyCURRENCY_TYPE_GOLDCurrencyConst viewPath3game.views.weapon.WeaponSubView.WeaponLvupView	namelvupViewuiRootPath,Widget/System/Hero_key/HeroKeyLevelUpUIpageIdxstateName	LvUpdetailView   viewPath5game.views.weapon.WeaponSubView.WeaponDetailView	namedetailViewuiRootPath,Widget/System/Hero_key/HeroKeyMessageUIpageIdxstateNameDetailpageViewsyntheiseHandleOnSynthesiseSuccess	dataweaponInfo heroId curPageIdx proxyTag tabGroupSwitchToLvUpTab btnStateselectUpOnEnterSwitchToDetailTabhandler btnStateselectDetailcontrollerWrap  
stateselectUp 
False
false	nameselectUp	True	trueselectDetail   
False
false	nameselectDetail	True	true
comps  ControllerExCollectionGetComponentgameObject_context�   9  9  X�6 995 4  ==6 9	 B=
= K  dataPorxyNewHeroViewDataProxyweaponInfo heroId curPageIdx proxyTag curTabIdx����	dataDEFAULTHERO_DATA_TYPEHeroConst	typeparams_r     9  B  9 B  9 B  9 BK  AddEventListenersAddUIListenerbuildContextBindCfgUI�   66  9 96 9 9B6 9 BH�9  X�9 9	BFR�) 9
 9  X�9
 9 X�)   9 B  9 9
 9B  9 B  9 B  9 B  9  + BK  SwitchToTabBuildTabDescResetWeaponViewUpdateWeaponInfoHeroIDSetHeroIdInitContextstrength
stateparams_OnEnter	viewpageView
pairssyntheiseHandlecontext#ON_SYNTHESISE_USE_ITEM_SUCCESSRegistListenernotifymanager�   6  9 96 995 6 99>6 9	9>9
 BK  displayGo_HeroServantType   weaponHeroRaiseTypeheroRaiseCommonViewTypeHeroRaiseTrackConstSetViewStateheroRaiseTrackmanager�   6  9 96 9 9B6 9 BH�9  X�9 9	BFR�6  9
 9BK  HideBarwindowBarOnExit	viewpageView
pairssyntheiseHandlecontext#ON_SYNTHESISE_USE_ITEM_SUCCESSRemoveListenernotifymanager�   9  9+  =6 9 BH�+  =9  X�9 9B+  =FR�K  Dispose	viewviewObjpageView
pairs
compscontrollerWrapcontexti    9  B  9 B-  99  BK   �Dispose
superRemoveAllListenersDisposeContext[  	6  9  X�-   9BK   �OnGoldChangeCURRENCY_TYPE_GOLDCurrencyConstK   	-     9   B -     9  B K   �ChangeWindowBarOnWeaponBreakJ   	-     9   B -     9  B K   �ChangeWindowBarOnWeaponLvUp[ 
 -   9     	 B-   9BK   �ChangeWindowBarOnWeaponQuick� 	   9  6 3 B  9  6 3 B  9  6 3 B  9  6 3 B2  �K   WEAPON_QUICK WEAPON_STR WEAPON_BREAK CURRENCY_UPDATERegistEventListener^  -  9 9-  X�K  -   9-   BK   ��OnTabSwitchcurTabIdx	data}
  ) ) ) M�  9  6 9' 	 B8 3 B2 �O�2  �K   tabToggle%d_formatstringAddToggleListener�     X�  9   + B6 9' 6 9'  B AK  weaponPage2%dformatstring	heroRecordOperationRecorderSwitchToTab�  
  9  =9 96  BH� X	�
  9	 89' B	  X	�8	9		+
 B	X	�
  9	 89'	 B	FR�K  
falseOnEnter	truebtnStateSwitchControllerState
pairstabGroupcontextcurTabIdx	data�     9  B  9 B  9 ) + B  9 9 9+ B  9 BK  BuildTabDesclvupViewpageViewSwitchToViewSwitchToTabUpdateWeaponInfoShowBreakTips� 	 -  9  B9 996 99 896 9	 X�+ X�+   X�  9
 ) + BX�9 X�  9
 ) + B  9 9 9+ B  9 BK  BuildTabDescbreakViewpageViewSwitchToViewSwitchToTabWEAPON_LV_MAXHeroConst
level
valueweapon_exp_limitGameSettingbreakthroughweaponInfo	dataUpdateWeaponInfo�  L9 )   X�  9   	 
 BX�  9   	 
 B  9 B9 996 99	 89
6	 9			 X�+ X	�+   X	�
  9	 ) + B	X	�9	
	 X	�
  9	 ) + B	
  9	 9 9+ B	X	�
  9	 ) + B	
  9	 9 9+ B	
  9	 B	K  BuildTabDesclvupViewbreakViewpageViewSwitchToViewSwitchToTabWEAPON_LV_MAXHeroConst
level
valueweapon_exp_limitGameSettingbreakthroughweaponInfo	dataUpdateWeaponInfoOpenLvUpPopShowQuickBreakTipsbreakthrough_timesA   	-     9   - - - - B K   �����OpenLvUpPop�  9  99 6 9' 5	 =	=	=		=
	9
=
	3
 =
	B2  �K  callback afterLeveltarget_levelbeforeLevelafterBreakbeforeBreakheroID  weaponOneKeyBreakOpenPageByJumpJumpToolsbreakthrough_timesheroId	dataP   -   9   6 6   B A K  �formatRewardCfgListgetRewardmat_list�   9 9 6 9'	 5
 =
9 =
=
=	
3
 =
B2  �K  callback afterBreakbeforeBreakafterLv
oriLv  weaponOneKeyStrOpenPageByJumpJumpToolsbreakthrough_timestarget_level�  	 9  99  96 9' 5 =9=BK  breakthroughheroID  weaponBreakOpenPageByJumpJumpToolsheroIdweaponInfo	data$     9  BK  OnGoldChange{   9  99 9 B  X� 9 BK  SetSelectedStateGetController
compscontrollerWrapcontext�    9  B  X�  X
�6 9 96 9 B9BK  idHeroUsingSkinInfoHeroToolsSetModelStateheroRaiseTrackmanagerGetHeroId �     9  B  X�9 6 ' B=X�9 6 ' B=K  TIP_STRENGTHTIP_BREAKGetTips	texttab2Txt_CheckWeaponCanBreakUp�   9  99 99 X�9 99 9BX�9  99 99 X�9 99 9BK  breakViewOnGoldChange	viewpageIdxlvupViewpageViewcurPageIdx	dataD     9  9 9 BK  detailViewpageViewSwitchToView�     9  B  X�  9 9 9 BX�  9 9 9 BK  lvupViewbreakViewpageViewSwitchToViewCheckWeaponCanBreakUp�    X�9   X�+ L 9	  X�  9 B  X
�96 9 X�+ X�+ L X�+ L + L WEAPON_LV_MAXHeroConst
levelGetWeaponInfopageIdxbarCurrency'     9  BK  ChangeWindowBar�   C  X�6  9 BH
�9  X�99 9 X� X�FR�4 6 >6 >  9  B  X�6  9	BH�6
 9	 
 BFR�6 9 9 B6  9	BH�6 9	 9
 + BFR�X�6 9 9 BK  SetBarCanAddSwitchBarwindowBarmanagerinsert
tablebarCurrencyIsMeetShowBarHOME_BARBACK_BARcurPageIdx	datapageIdx	viewpageView
pairs�   '  X$�9  9  9  B9 X�9  9=  9  + B  9 9BX�  X�9  9=  9  + B  9 9BK  	viewRefreshPageViewEnterViewOrInstpageIdxChangeWindowBarcurPageIdx	datah    9   9 B  9 B9 9BK  	type	dataGetWeaponInfoGetHeroIdShowWeaponInfo�   :9   X�6 99B6 9 9 B=6 9	B9
9B= 9  9B  X�6 9 BH�9   X	�99	 9			 X�9	 9+
 BX�9	 9+
 BFR�X�9 9+ BK  SetActivecurPageIdx	datapageIdxpageView
pairsOnEnterNewviewPathimportpageContainer_InstantiateObjectviewObjuiRootPath	Load
Asset	view�    9  B  X�  X
�6 9 9 9 B A 9 =K  weaponInfoGetHeroWeaponInfodataPorxy	datadeepCloneGetHeroId #   9  9L weaponInfo	data   9  =K  heroId	data   9  9L heroId	data4   9  99L 
statecontrollerWrapcontext�    9  B  X�6 999 89 X
�96 9 X�+ L X�+ L + L WEAPON_LV_MAXHeroConst
levelbreakthrough
valueweapon_exp_limitGameSettingGetWeaponInfo�  Q T6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 3B =A 3D =C 3F =E 3H =G 3J =I 3L =K 3N =M 3P =O 2  �L   CheckWeaponCanBreakUp GetControllerState GetHeroId SetHeroId GetWeaponInfo UpdateWeaponInfo EnterViewOrInst RefreshPageView SwitchToView ChangeWindowBar 
OnTop IsMeetShowBar SwitchToLvUpTab SwitchToDetailTab OnGoldChange BuildTabDesc ResetWeaponView SwitchControllerState OnSynthesiseSuccess ShowBreakTips OpenLvUpPop ShowQuickBreakTips OnWeaponQuick OnWeaponLvUp OnWeaponBreak SwitchToTab OnTabSwitch AddUIListener AddEventListeners Dispose DisposeContext OnExit CameraEnter OnEnter 	Init InitContext buildContext UIParent UINameReduxViewWeaponView
class 