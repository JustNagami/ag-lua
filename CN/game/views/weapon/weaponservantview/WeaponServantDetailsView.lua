LJ�   6  9 96 995 6 99>6 9	9
>B6  9 9' BK  
LightPlayServantAnimservantHeroServantType   weaponHeroRaiseTypeheroRaiseCommonViewTypeHeroRaiseTrackConstSetViewStateheroRaiseTrackmanager�   6  9 96 995 6 99>6 9	9
>B6  9 9' BK  
LightPlayServantAnimservantHeroServantType   weaponHeroRaiseTypeheroRaiseCommonViewTypeHeroRaiseTrackConstSetViewStateheroRaiseTrackmanager>   '  L 3Widget/System/Hero_servant/HeroServantDetailUI7   6  999L transformuiMainuimanager�	  + ?5 9  9' B=5 5 =5	 =
5 =5 ===  4 5 6   9 B=>5 6   9 B=>5 6   9 B=>= 5 5 6 ==5 6  ==!5" 6# ==$= 5& 6' 9(9) B=*=% K  avatarViewscaleImageObj_NewServantAvatarViewModule tabPrefixtabObj%d_constVarstoryViewWeaponServantStoryModule 	namestoryViewuiRootPath4Widget/System/Hero_servant/Module/MainStoryViewpageIdxstateName
StorybeyondViewWeaponServantBeyondModule 	namebeyondViewbarCurrencyuiRootPath5Widget/System/Hero_servant/Module/MainBeyondViewpageIdxstateNamebeyonddetailView  viewPathWeaponServantDetailModule 	namedetailViewuiRootPath>Widget/System/Hero_servant/Module/MainServantDetailModulepageIdxstateNameDetail	pageSwitchToStory btnStatetabStorySwitchToBeyondPage btnStatetabBeyondOnEnterSwitchToDetailPagehandler btnStatetabDetailstabGroup
stateavatarShow 
False
false	nameavatarShow	True	truetabStory 
False
False	nametabStory	True	TruetabBeyond 
False
False	nametabBeyond	True	TruetabDetails   
False
False	nametabDetails	True	True
comps  ControllerExCollectionGetComponentgameObject_controllere   5 4  ==  K  servantData isInAvatarShowViewcurPageIdx servantId heroId 	datar     9  B  9 B  9 B  9 BK  AddEventListenersAddUIListenerBuildContextBindCfgUI;  	   X�-   9 - + BK   ��SwitchToTab,   -     9   B K   �OnShowBtnClick-   -     9   B K   �OnGachaBtnClick1   -     9   + B K   �EnterAvatarShow�
  1) ) ) M�  9  6 9' 	 B8 3 B2 �O�  9 9 +  3 B  9 9 +  3	 B9
 9 93 B5 6   9 B==   9 6 9 9B2  �K  SERVANT_PROMOTERegistEventListenerpromoteHandler  OnBeyondSuccesshandlereventHandler RegisterCloseCallbackavatarViewconstVar gachaBtn_ showBtn_AddBtnListener tabToggle%d_formatstringAddToggleListener    K  !     9  BK  ChangeBar�   *  9    9 B A 4 6 >6 >  X�6 9 6 9B6 9	 9
 B6 9	 96 9+ BX�6 9	 9
 BK  SetBarCanAddSwitchBarwindowBarmanagerCURRENCY_TYPE_GOLDCurrencyConstinsert
tableHOME_BARBACK_BARGetServantDataCheckIsArriveMax�  9 6 9896 998  X�+ X�+ L 
valueweapon_promote_maxGameSettingstarlevelidWeaponServantCfg
stage� 	 49  9  X'�  X�6 9 BH
�9  X�99 9 X� X�FR�  X�9	  X�  9 BX�4 6	 >6
 >6 9 9 BX�6 9 94 6	 >BK  SwitchBarwindowBarmanagerHOME_BARBACK_BARChangeBeyondBarShowcurPageIdx	datapageIdx	view	page
pairsidparams_�  
   9  B9 9  X�5 9 9=9 9  X�) = 9 =9 9 9=  9 B  9	 BK  RenderViewPreOpenLogicheroId	data
stage lockedidservantDataparams_InitContext�   s9  99 99
  X�+ X�+   X@�9  X�) ) ) M�6 99	 9			
 B8   X	�6	
 
 8 B	O�X�) ) ) M�6 99	 9			
 B8   X	�6	
 
 + B	O�  9 9  X�) + B9  X�6
 9 9+ BX(�6
 9 9+ BX"�  X�6 99 9	) B8   X�6
  + BX�6 99 9	) B8   X�6
  + B  9 ) + B  9 + BK  EnterAvatarShowgameObjectgachaBtn_disableOrigintabIndexSwitchToTabSetActivetabPrefixconstVarformatstringdisableTabListuidservantData	dataopenContextparams_�   6  9 BH	�  X�9  X�9 9BFR�  9 BK  RemoveAllEventListenerOnExit	view	page
pairs� 
 '  9  B  9 B6 9 BH�  X�9  X�+  =9 9B+  =FR�9 9 9B9 +  =-  9	9  BK   �
superavatarViewconstVarDisposeviewObj	view	page
pairsRemoveAllListenersRemoveAllEventListener�  	 6  9 99 99B9 9 99 99BK  SetAvatarSpriteavatarViewconstVaridservantData	dataSetWeaponServantIDheroRaiseTrackmanager�   9  6  BH� X	�
  9	 89' B	  X	�8	9		+
 B	X	�
  9	 89' B	FR�K  
FalseOnEnter	TruebtnStateSwitchControllerState
pairstabGroup@     9  9 9 BK  beyondView	pageSwitchToView?     9  9 9 BK  storyView	pageSwitchToView@     9  9 9 BK  detailView	pageSwitchToView�   '  X$�9  9  9  B9 X�9  9=  9  + B  9 9BX�  X�9  9=  9  + B  9 9BK  	viewRefreshPageViewEnterViewOrInstpageIdxChangeBarcurPageIdx	datay    9 5   9 B=  9 B=BK  heroIdGetHeroIdservantData  GetServantDataOnRenderModule�   <9   X�6 99B6 9 9 B=99	9B=   X"�6
 9 BH�9   X	�99	 9			 X
�9 	 9B9	 9+
 BX	�9 	 9B9	 9+
 BFR�X�9 9+ BK  OnEnterSetActiveOnExitcurPageIdx	datapageIdx	page
pairsNewviewPathpageContainer_InstantiateObjectviewObjuiRootPath	Load
Asset	viewk   9  9 9 B  X� 9 BK  SetSelectedStateGetController
compscontroller$   9  9L servantData	data   9  9L heroId	data+     9  + BK  EnterAvatarShowz     9  B  X�K  96 6 5 >BK     servantPOP_SOURCE_ITEMShowPopItemOnlyidGetServantData�   E9  =  X�6 9 9B6 9 9' B9 9	 9
+ B  9 9 9999 999BX#�  9 B6 9 9  9 B9B6 9 9' B9 9	 9
+ B  9 9 9999 999BK  
False
LightidGetServantDataSetWeaponServantIDChangeBar	True	nameavatarShow
statecontrollerSwitchControllerStateEnterAvatarViewavatarViewconstVar	FadePlayServantAnimheroRaiseTrackHideBarwindowBarmanagerisInAvatarShowView	data�  A D6   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3$ =# 3& =% 3( =' 3* =) 3, =+ 3. =- 30 =/ 32 =1 34 =3 36 =5 38 =7 3: =9 3< =; 3> == 3@ =? 2  �L   EnterAvatarShow OnGachaBtnClick OnShowBtnClick GetHeroId GetServantData SwitchControllerState EnterViewOrInst RefreshPageView SwitchToView SwitchToDetailPage SwitchToStory SwitchToBeyondPage SwitchToTab RenderView Dispose OnExit PreOpenLogic OnEnter ChangeBar CheckIsArriveMax ChangeBeyondBarShow OnBeyondSuccess AddEventListeners AddUIListener 	Init InitContext BuildContext UIParent UIName 
OnTop CameraEnterReduxViewWeaponServantDetailsView
class 