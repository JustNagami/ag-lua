LJ;   '  L 0Widget/System/MatrixlUI/MatrixProcessShopUI7   6  999L transformuiMainuimanager8     9  B  9 BK  AddUIListenerInitUI�     9  B6 96   9 B9 6 B= 6	 9
9 ' B= K  
emptytransform_GetControllerControllerUtilemptyControllerMatrixProcessShopItemm_listindexItemhandlerNewLuaListmatrixShopList_BindCfgUI.   -     9   ) B K   �RandomDialog9    6   9  B K  QueryRefreshShopItemMatrixAction     K  �  6   5 6 ' B=4 6 ' B>4 6 9>-  9>>6 '	 B>=
3 =3 =B K   �CancelCallback OkCallback contentMATRIX_SHOP_REFRESHrefreshCostCURRENCY_TYPE_MATRIX_COINCurrencyConstWHETHER_TO_CONSUME
title  PROMPTGetTipsShowMessageBoxi    9  9 +  3 B  9  9 +  3 B2  �K   m_refreshBtn m_sellerBtnAddBtnListener-    9 9 8BK  
shopsRefresh�  u  9  B 9B= = 9  99  B  X�9  99   BX�9  99  B9  	  X�9  9) BX�9  9)  B  9	 B  9
 B9  X:�6 9 + B)  = 9 6 9' 9 	 B=6 999  X�9 !6 9	 B8:	=	 9	 6
 9

  9 :B A
 =
	X�:9 6 9
  9	 :B	 A =)  = 9 ' 9 &=X�6 9 + BK  xm_refreshCostGetSwitchItemIcongetItemLittleSpriteItemToolsspritem_refreshIconmin	math
value'matrix_shop_refresh_cost_item_listGameSetting
%d/%dformatstring	textm_refreshTimesrefreshCostm_refreshContentSetActiveGetShopFressRefreshTimesGetShoRefreshTimesSetSelectedIndexemptyControllerStartScrollByPositionStartScrollmatrixShopList_GetData
shopsrefreshCountGetMatrixPhaseData *   -     9   B K   �RemoveDialog� N6  98  X�2 G�6 9 + B  	  X�) = X�6 9)  B9  X�) X� = 9 86  89 6	 9
B=99
  X� X�
  X
� X�6 9	 9
  ' B9   X�6 93	 )
 ) B= 9 	 9BX�9 	 9B2  �K  K  
Reset
Start New
Timertimer_PlayVoice
audiomanagervoice_namevoice_sheetcontentGetI18NText	textm_dialogTextrandom	mathcurRandomIndex_m_bubbleGoSetActiveget_id_list_by_typeMatrixShopDialogCfg`   6  9 + B9   X�9  9B+  = K  	Stoptimer_m_bubbleGoSetActive?     9  B  9 ) BK  RandomDialogUpdateView�  	 -     9   B 6 99  X �6  9  B 6  9  ' B K    /matrixBlank/matrixOriginOpenPageByJumpJumpToolsQueryNextProgressMatrixActionSTARTEDSTATE_TYPEMatrixConstGetGameState  
6   5 6 ' B=3 =B K   �OkCallback contentMATRIX_SURE_GET_OUT_SHOPGetTips 
isTopShowMessageBox�  %6  9 94 6 >6 >6 >6 9>B6  9 96 9+ B6  9 9	'
 B6  9 93 B2  �K   RegistBackCallBackMATRIX_DESCRIPESetGameHelpKeySetBarCanAddCURRENCY_TYPE_MATRIX_COINCurrencyConstINFO_BARHOME_BARBACK_BARSwitchBarwindowBarmanagerR   	  9  B6 9 9BK  HideBarwindowBarmanagerRemoveDialogc  9    X�9   9B+  =  -  99  BK   �
superDisposematrixShopList_�  
   9  B6 99 X�  9 BX
�6 99 X�6 9' 5	 BK   isTimeOut/matrixBlank/matrixPrepareOpenPageByJumpJumpToolsNOTSTARTEDUpdateViewSTARTEDSTATE_TYPEMatrixConstGetGameState(     9  ) BK  RandomDialogZ   	9   9B  9  BK  UpdateViewGetScrolledPositionmatrixShopList_Z   	9   9B  9  BK  UpdateViewGetScrolledPositionmatrixShopList_/   6   9D GetGameStateMatrixData5   6   9D GetMatrixPhaseDataMatrixData5   6   9D GetShoRefreshTimesMatrixData;   6   9D GetShopFressRefreshTimesMatrixData    L �  . 26   ' 6 B 3 = 3 = 3 = 3
 =	 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3 = 3  = 3" =! 3# = 3% =$ 3' =& 3) =( 3+ =* 3- =, 2  �L   GetSwitchItemIcon GetShopFressRefreshTimes GetShoRefreshTimes GetMatrixPhaseData GetGameState  OnMatrixSystemUpdate OnMatrixShopBuySuccess OnMatrixUserUpdate Dispose OnExit 
OnTop OnEnter RemoveDialog RandomDialog UpdateView indexItem AddUIListener InitUI 	Init UIParent UINameReduxViewMatrixProcessShopView
class 